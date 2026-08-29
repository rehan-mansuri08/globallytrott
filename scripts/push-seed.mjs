// Pushes the India seed (regions + destinations + seasons/activities/images) to
// the live Supabase project using the service-role key (bypasses RLS).
// Idempotent-ish: uses upserts keyed on the schema's unique constraints; child
// rows ignore duplicate-key errors. Usage:  node scripts/push-seed.mjs
import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

// ---- env (prefer real env, else parse .env manually stripping quotes)
const envFile = readFileSync(new URL("../.env", import.meta.url), "utf8");
const parse = (k) => {
  if (process.env[k]) return process.env[k];
  for (const line of envFile.split("\n")) {
    const m = line.trim().match(new RegExp(`^${k}\\s*=\\s*(.*)$`));
    if (m) return m[1].replace(/^"|"$/g, "").trim();
  }
  return undefined;
};

const SUPABASE_URL = parse("SUPABASE_URL");
const SERVICE_KEY = parse("SUPABASE_SERVICE_ROLE_KEY");
if (!SUPABASE_URL || !SERVICE_KEY) {
  console.error("Missing SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY");
  process.exit(1);
}

const sb = createClient(SUPABASE_URL, SERVICE_KEY, {
  auth: { persistSession: false, autoRefreshToken: false },
});

const unwrap = (v) =>
  v && typeof v === "object" && "value" in v ? v.value : v;

const isDup = (e) =>
  e && typeof e === "object" && /23505|duplicate key value/i.test(String((e && e.message) || e.details || ""));

let regions = 0, destinations = 0, seasons = 0, activities = 0, images = 0;

async function upsertRegion(sb, indiaId, [kind, name, slug, code, capital, summary], idx) {
  const row = {
    parent_id: indiaId,
    kind,
    name,
    slug,
    code,
    capital,
    summary,
    best_seasons: ["winter", "spring", "summer", "monsoon", "autumn"],
    tags: ["travel", kind === "state" ? "state" : "india"],
    latitude: null,
    longitude: null,
    sort: idx,
  };
  const { data, error } = await sb
    .from("regions")
    .upsert(row, { onConflict: "kind,slug" })
    .select("id,slug")
    .single();
  if (error) throw error;
  regions += 1;
  return unwrap(data);
}

async function upsertDestination(sb, regionId, d) {
  const row = {
    region_id: regionId,
    name: d.name,
    slug: d.slug,
    kind: "destination",
    summary: d.summary,
    description: d.description,
    latitude: d.lat,
    longitude: d.lng,
    altitude_m: d.alt,
    experience_tags: d.experience,
    season_tags: d.season,
    best_months: d.months,
    recommended_days: d.recommended_days || "2-3 days",
    budget_level: d.budget,
    popularity: d.popularity,
    is_hidden_gem: !!d.hidden,
    famous_food: d.food,
    festivals: d.festivals,
    local_experiences: d.local,
  };
  const { data, error } = await sb
    .from("destinations")
    .upsert(row, { onConflict: "region_id,slug" })
    .select("id,slug")
    .single();
  if (error) throw error;
  destinations += 1;
  return unwrap(data);
}

async function insertRows(sb, table, rows, key) {
  for (const row of rows) {
    const { error } = await sb.from(table).insert(row);
    if (error && !isDup(error)) {
      console.error(`  [${table}] insert failed:`, error.message || error);
      throw error;
    }
  }
}

async function main() {
  console.log("Pushing seed to", SUPABASE_URL, "...");

  // 1. India country parent
  const { data: country } = await sb.from("regions").select("id").eq("kind", "country").eq("slug", "india").single();
  const indiaRow = unwrap(country);
  if (!indiaRow) throw new Error("India country row not found in live DB");
  const indiaId = indiaRow.id;

  // 2. States / UTs
  const payload = JSON.parse(readFileSync(new URL("../scripts/india-seed.json", import.meta.url), "utf8"));
  const regionIds = {};
  payload.regions.forEach((r, i) => { regionIds[r[2]] = r; });
  for (const [i, r] of payload.regions.entries()) {
    const { slug } = await upsertRegion(sb, indiaId, r, i + 1);
    regionIds[slug] = r;
  }
  console.log(`+ regions: ${regions}`);

  // 3. Destinations (needs resolved region ids)
  const destIds = {};
  for (const d of payload.destinations) {
    const region = regionIds[d.state];
    if (!region) throw new Error(`State '${d.state}' not found for destination '${d.slug}'`);
    const { data: regionRow } = await sb.from("regions").select("id").eq("slug", d.state).single();
    const rr = unwrap(regionRow);
    const { slug, id } = await upsertDestination(sb, rr.id, d);
    destIds[slug] = id;
  }
  console.log(`+ destinations: ${destinations}`);

  // 4. Seasons / activities / images
  for (const d of payload.destinations) {
    const destId = destIds[d.slug];
    const seasonRows = (d.seasons || []).map((s, si) => ({
      destination_id: destId,
      label: s[0], months: s[1], weather: s[2], activities: s[3],
      crowd: s[4], budget: s[5], rating: s[6], notes: s[7] || "", sort: si + 1,
    }));
    const activityRows = (d.activities || []).map((a, i) => ({
      destination_id: destId,
      title: a[0], description: a[1], icon: a[2], experience_tag: a[3],
      season_tags: ["any"], months: a[4], is_indoor: a[5], weather_conditions: a[6], sort: i + 1,
    }));
    const imageRows = (d.images || []).map((img, i) => ({
      destination_id: destId,
      url: img[0], thumb_url: img[0], alt: img[1],
      credit: "Placeholder", license: "CC0", source_url: null,
      season_tag: null, category: img[2], sort: i + 1,
    }));
    await insertRows(sb, "destination_seasons", seasonRows);
    await insertRows(sb, "destination_activities", activityRows);
    await insertRows(sb, "destination_images", imageRows);
    seasons += seasonRows.length;
    activities += activityRows.length;
    images += imageRows.length;
  }
  console.log(`+ seasons: ${seasons}, activities: ${activities}, images: ${images}`);

  // 5. Verify
  const counts = {};
  for (const t of ["regions", "destinations", "destination_seasons", "destination_activities", "destination_images"]) {
    const { count } = await sb.from(t).select("id", { count: "exact", head: true });
    counts[t] = count;
  }
  console.log("VERIFY:", JSON.stringify(counts));
  console.log("Done.");
}

main().catch((e) => {
  console.error("FAILED:", e && e.message ? e.message : e);
  process.exit(1);
});