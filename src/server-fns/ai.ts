// AI itinerary-engine + contextual assistant — server only.
//
// LLM keys (NVIDIA_API_KEY with OpenAI-compatible NIM fallback to
// OPENAI_API_KEY) are read exclusively on the server. Never export them or
// embed prompts in client bundles. If no key is set the RPC returns a typed
// { ok:false, code:"NO_KEY" } so the UI degrades gracefully.

import { createServerFn } from "@tanstack/react-start";

import type { AIPlanRequest, AITripPlan, AssistantResult, PlanResult } from "../lib/ai-types";

const NVIDIA_CHAT_URL = "https://integrate.api.nvidia.com/v1/chat/completions";
const NVIDIA_MODEL = process.env["NVIDIA_LLM_MODEL"] || "minimaxai/minimax-m3";
const OPENAI_CHAT_URL = "https://api.openai.com/v1/chat/completions";
const OPENAI_MODEL = "gpt-4o-mini";

function nvidiaKey(): string | null {
  return process.env["NVIDIA_API_KEY"] || null;
}

function openaiKey(): string | null {
  return process.env["OPENAI_API_KEY"] || null;
}

function llmKey(): { url: string; model: string; bearer: string; name: string } | null {
  const nv = nvidiaKey();
  if (nv) return { url: NVIDIA_CHAT_URL, model: NVIDIA_MODEL, bearer: nv, name: "NVIDIA" };
  const oa = openaiKey();
  if (oa) return { url: OPENAI_CHAT_URL, model: OPENAI_MODEL, bearer: oa, name: "OpenAI" };
  return null;
}

function travelersLabel(t: string): string {
  switch (t) {
    case "solo":
      return "a solo traveler";
    case "couple":
      return "a couple";
    case "family":
      return "a family with children";
    case "group":
      return "a group of friends";
    default:
      return "travelers";
  }
}

const MONTH_NAMES = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

function monthOf(iso?: string): number {
  return iso ? new Date(iso + "T00:00:00").getMonth() : new Date().getMonth();
}

// Server-side enrichment: seasonal hint + (when coords are present) real
// forecast telemetry, so the planner reasons on live conditions without the
// client ever handling weather APIs.
async function buildClimateContext(data: AIPlanRequest): Promise<string | null> {
  const parts: string[] = [];
  const month = monthOf(data.startDate);
  parts.push(`Month: ${MONTH_NAMES[month]}.`);

  const lat = data.latitude;
  const lng = data.longitude;
  if (lat != null && lng != null && Number.isFinite(lat) && Number.isFinite(lng)) {
    try {
      const params = new URLSearchParams({
        latitude: String(lat),
        longitude: String(lng),
        daily: "temperature_2m_max,temperature_2m_min,precipitation_probability_max,snowfall_sum",
        timezone: "auto",
        forecast_days: "14",
      });
      const res = await fetch(`https://api.open-meteo.com/v1/forecast?${params}`, {
        signal: AbortSignal.timeout(12_000),
      });
      if (res.ok) {
        const j = (await res.json()) as {
          daily?: {
            temperature_2m_max?: number[];
            temperature_2m_min?: number[];
            precipitation_probability_max?: number[];
            snowfall_sum?: number[];
          };
        };
        const d = j.daily;
        if (d?.temperature_2m_max?.length) {
          const maxs = d.temperature_2m_max.slice(0, 14);
          const mins = d.temperature_2m_min ?? [];
          const pops = d.precipitation_probability_max ?? [];
          const snow = d.snowfall_sum ?? [];
          const hi = Math.round(Math.max(...maxs));
          const lo = Math.round(Math.min(...(mins.length ? mins : maxs)));
          const wetDays = pops.filter((p) => p >= 50).length;
          const snowDays = snow.filter((s) => s > 0).length;
          parts.push(
            `14-day forecast near this destination: highs ${hi}°C, lows ${lo}°C, ` +
              (snowDays > 0
                ? `${snowDays} snowfall day(s) expected.`
                : `${wetDays} high-precip day(s) expected.`),
          );
        }
      }
    } catch {
      // telemetry unreachable → still produce seasonal-grade plan
    }
  }
  return parts.length ? parts.join(" ") : null;
}

const PLAN_SYSTEM_PROMPT = `You are the itinerary architect for GlobeTrotter, a premium India travel-intelligence platform.
You convert travel parameters plus REAL weather/month context into vivid, practical day-by-day itineraries.
Rules:
- Use only real, well-known places in the requested destination.
- Each day has exactly 3 blocks (morning, afternoon, evening); keep timings sane and travel times honest.
- Budget costs in INR per person. Stay/transit/activities/food must be plausible for the stated budget tier
  (budget=cheap hotels/bus/metro, moderate=middle hotels/AC taxi when useful, luxury=premium stays/flights).
- If weather context says rain/heavy snow/heat, automatically swap outdoor stretch for indoor alternatives that day.
- Respond with STRICT JSON only, no markdown fences, no commentary, matching the JSON shape exactly:
{
  "destination": string,
  "state": string,
  "totalDays": number,
  "travelerSummary": string,
  "budgetTier": "budget"|"moderate"|"luxury",
  "note": string,
  "costBreakdown": {"stay":number,"transit":number,"activities":number,"food":number},
  "days": [
    {
      "dayNumber":number,"title":string,"location":string,"transportNotes":string,"budget":number,
      "blocks":[
        {"timeOfDay":"morning"|"afternoon"|"evening","title":string,"description":string,"category":string,"indoor":boolean,"cost":number}
      ]
    }
  ]
}`;

async function callLLM(
  system: string,
  user: string,
  opts: { temperature?: number; maxTokens?: number } = {},
): Promise<string> {
  const provider = llmKey();
  if (!provider) throw new Error("NO_KEY");
  const res = await fetch(provider.url, {
    method: "POST",
    headers: {
      "content-type": "application/json",
      authorization: `Bearer ${provider.bearer}`,
    },
    body: JSON.stringify({
      model: provider.model,
      temperature: opts.temperature ?? 0.4,
      max_tokens: opts.maxTokens ?? 2600,
      messages: [
        { role: "system", content: system },
        { role: "user", content: user },
      ],
    }),
    signal: AbortSignal.timeout(60_000),
  });
  if (!res.ok) throw new Error(`${provider.name} ${res.status}`);
  const json = (await res.json()) as {
    choices?: { message?: { content?: string } }[];
  };
  const content = json.choices?.[0]?.message?.content;
  if (!content) throw new Error(`Empty ${provider.name} response`);
  return content;
}

function stripFence(text: string): string {
  const trimmed = text.trim();
  const fenced = trimmed.match(/^```(?:json)?\s*([\s\S]*?)\s*```$/);
  return fenced ? (fenced[1] ?? trimmed) : trimmed;
}

function extractJson(text: string): string {
  const cleaned = stripFence(text);
  const first = cleaned.indexOf("{");
  const last = cleaned.lastIndexOf("}");
  if (first === -1 || last <= first) return cleaned;
  return cleaned.slice(first, last + 1);
}

export const buildItinerary = createServerFn({ method: "POST", proxyHeaders: true }).handler(
  async ({ data }: { data: AIPlanRequest }): Promise<PlanResult> => {
    if (!llmKey()) {
      return {
        ok: false,
        code: "NO_KEY",
        message:
          "No LLM key is configured. Add NVIDIA_API_KEY (or OPENAI_API_KEY) to the server environment to enable the AI trip builder.",
      };
    }

    const dates =
      data.startDate && data.endDate ? `${data.startDate} to ${data.endDate}` : "dates flexible";
    const climate = (await buildClimateContext(data)) ?? data.climateContext;
    const climateBlock = climate ? `\nLIVE climate/month context:\n${climate}` : "";

    const user = `Plan a ${data.budgetTier}-tier trip for ${travelersLabel(data.travelers)} to ${
      data.destination
    }${data.state ? `, ${data.state}` : ""}, India.
Travel dates: ${dates}.
Primary interests: ${data.vibes.join(", ") || "general sightseeing"}.
${data.notes ? `Extra notes: ${data.notes}` : ""}
${climateBlock}

Return the strict JSON itinerary.`;

    let lastError: string | null = null;
    for (let attempt = 0; attempt < 2; attempt += 1) {
      try {
        const raw = await callLLM(PLAN_SYSTEM_PROMPT, user, {
          temperature: attempt === 0 ? 0.4 : 0.2,
          maxTokens: 3200,
        });
        let parsed: AITripPlan;
        try {
          parsed = JSON.parse(stripFence(raw)) as AITripPlan;
        } catch {
          parsed = JSON.parse(extractJson(raw)) as AITripPlan;
        }
        if (!parsed || !Array.isArray(parsed.days) || parsed.days.length < 1) {
          throw new Error("Plan missing days array");
        }
        return { ok: true, plan: parsed };
      } catch (error) {
        lastError =
          error instanceof Error
            ? error.message === "NO_KEY"
              ? ""
              : error.message
            : "AI request failed";
        if (error instanceof Error && error.message === "NO_KEY") break;
      }
    }

    return {
      ok: false,
      code: lastError ? "AI_ERROR" : "NO_KEY",
      message:
        lastError ||
        "No LLM key is configured. Add NVIDIA_API_KEY (or OPENAI_API_KEY) to the server environment to enable the AI trip builder.",
    };
  },
);

export const askTravelAssistant = createServerFn({ method: "POST", proxyHeaders: true }).handler(
  async ({ data }: { data: { question: string; context?: string } }): Promise<AssistantResult> => {
    if (!llmKey()) {
      return {
        ok: false,
        code: "NO_KEY",
        message:
          "The AI assistant needs an LLM key (NVIDIA_API_KEY or OPENAI_API_KEY) in the server environment — add one to enable answers.",
      };
    }
    try {
      const system = `You are the GlobeTrotter travel co-pilot — knowledgeable about Indian travel, weather seasons, permits, routes and etiquette. Answer concisely (under 140 words), warmly, in the app's voice. Use the destination context supplied. Never invent specific live conditions; if uncertain, suggest checking current telemetry and say so.`;
      const answer = await callLLM(system, `${data.context ?? ""}\n\nQuestion: ${data.question}`, {
        temperature: 0.5,
        maxTokens: 500,
      });
      return { ok: true, answer };
    } catch (error) {
      return {
        ok: false,
        code: "AI_ERROR",
        message: error instanceof Error ? error.message : "Assistant request failed",
      };
    }
  },
);
