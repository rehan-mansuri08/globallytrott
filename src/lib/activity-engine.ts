// "What can I do right now?" — dynamic activity feasibility engine.
// Combines calendar month + live weather condition + indoor/outdoor + rules.

import type { WeatherCondition } from "./weather";
import type { ActivityRow } from "./catalog";

export type FeasibilityStatus = "active" | "restricted" | "offseason" | "weather_off";

export interface FeasibilityContext {
  /** 1-12 current month, dest local time */
  month: number;
  condition: WeatherCondition | null;
  isDay?: boolean;
  /** °C current temp if known */
  temperatureC?: number | null;
  showOffSeason?: boolean;
}

export interface FeasibilityVerdict {
  status: FeasibilityStatus;
  label: string;
  reason: string;
}

const WMO_NOTES: Partial<Record<WeatherCondition, string>> = {
  thunderstorm: "Thunderstorm — outdoor activity risky right now.",
  snow: "Active snow — ideal for snow sports, slippery decking elsewhere.",
  rain: "Rain in progress — trails may be muddy or restricted.",
  showers: "Showers passing — carry rain gear.",
  drizzle: "Light drizzle — mostly fine outdoors.",
  fog: "Low visibility from mist/fog.",
};

const CONDITION_SYNONYMS: Record<string, string[]> = {
  "partly-cloudy": ["clear", "partly-cloudy", "cloudy"],
  cloudy: ["partly-cloudy", "cloudy"],
  rain: ["rain", "drizzle", "showers", "thunderstorm", "fog"],
  showers: ["rain", "showers", "drizzle"],
  drizzle: ["rain", "drizzle", "showers"],
  fog: ["fog", "drizzle", "rain"],
  snow: ["snow", "fog", "cloudy"],
  thunderstorm: ["thunderstorm", "rain", "showers"],
  clear: ["clear", "partly-cloudy"],
  unknown: [],
};

function conditionMatches(activityConditions: string[], condition: WeatherCondition): boolean {
  if (!condition) return true;
  if (activityConditions.includes("any")) return true;
  const wanted = activityConditions.map((c) => c.trim());
  if (wanted.includes(condition)) return true;
  const synonyms = CONDITION_SYNONYMS[condition] ?? [];
  return synonyms.some((s) => wanted.includes(s));
}

/**
 * Verdict for one activity given today's month + live condition.
 * - off-season: months don't include current month (and showOffSeason enabled)
 * - weather_off: in-season but current condition blocks it (with a reserve note)
 * - restricted: thunderstorm/heat etc. — needs caution or alternate half
 * - active: good to go right now
 */
export function assessActivity(
  activity: ActivityRow,
  ctx: FeasibilityContext,
): FeasibilityVerdict {
  const inSeason = activity.months.includes(ctx.month);
  if (!inSeason) {
    return {
      status: "offseason",
      label: "Out of season",
      reason: `Primarily ${seasonMonthsLabel(activity.months)} — not this month.`,
    };
  }

  if (activity.is_indoor) {
    return {
      status: "active",
      label: "Indoor reserve",
      reason: "Indoor — great fallback on adverse days.",
    };
  }

  if (ctx.condition && (ctx.condition === "thunderstorm" || ctx.condition === "snow")) {
    if (!conditionMatches(activity.weather_conditions, ctx.condition)) {
      return {
        status: "restricted",
        label: "Weather caution",
        reason: WMO_NOTES[ctx.condition] ?? "Check before heading out.",
      };
    }
  }

  if (ctx.condition && !conditionMatches(activity.weather_conditions, ctx.condition)) {
    return {
      status: "weather_off",
      label: "Weather blocked",
      reason: `Current ${ctx.condition.replace("-", " ")} isn't suited — considered an indoor day.`,
    };
  }

  return {
    status: "active",
    label: "Active now",
    reason: "Conditions are currently suited to this experience.",
  };
}

export function seasonMonthsLabel(months: number[]): string {
  const names = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
  ];
  if (months.length === 0) return "year-round";
  const compact: string[] = [];
  let runStart = months[0] ?? 0;
  let prev = runStart;
  const isConsecutive = (a: number, b: number) => (b === a + 1) || (a === 12 && b === 1);
  for (let i = 1; i <= months.length; i += 1) {
    const cur = months[i];
    if (cur === undefined || !isConsecutive(prev, cur)) {
      compact.push(
        runStart === prev ? `${names[runStart - 1] ?? ""}` : `${names[runStart - 1] ?? ""}-${names[prev - 1] ?? ""}`,
      );
      runStart = cur ?? 0;
    }
    prev = cur ?? prev;
  }
  return compact.join(", ");
}

/** Is the current month inside the destination's best_months window? */
export function isBestSeason(bestMonths: number[], month: number): boolean {
  return bestMonths.includes(month);
}