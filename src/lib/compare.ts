// Side-by-side destination comparison metrics.
// Estimates stay transparent — built from catalog fields + a fixed cost model.

import type { DestinationCard } from "./catalog";

export interface CompareMetrics {
  dailyCost: number;
  costTier: "Budget" | "Moderate" | "Luxury";
  transitComplexity: 1 | 2 | 3 | 4 | 5;
  crowdLevel: string;
  familyFriendliness: number; // 0-100
  snowLikelihood: number; // 0-100
  bestMonthsLabel: string;
  hiddenGem: boolean;
}

const BASE_DAILY = {
  Budget: 2200,
  Moderate: 4200,
  Luxury: 9500,
} as const;

// Subjective per-destination transit complexity keyed by slug (1=trivial, 5=hard).
const TRANSIT: Record<string, 1 | 2 | 3 | 4 | 5> = {
  gulmarg: 4,
  srinagar: 3,
  leh: 4,
  nubra_valley: 5,
  spiti: 5,
  tawang: 5,
  manali: 3,
  shimla: 3,
  dharamshala: 3,
  rishikesh: 2,
  mussoorie: 3,
  nainital: 3,
  auli: 4,
  munnar: 3,
  ooty: 3,
  kodaikanal: 4,
  coorg: 4,
  mysuru: 2,
  jaipur: 1,
  jodhpur: 2,
  udaipur: 2,
  jaisalmer: 3,
  pushkar: 2,
  agra: 1,
  varanasi: 1,
  darjeeling: 3,
  gangtok: 4,
  kaziranga: 3,
  majuli: 4,
  cherrapunji: 4,
  shillong: 3,
  kochi: 1,
  alleppey: 1,
  varkala: 2,
  goa: 1,
  gokarna: 4,
  mumbai: 1,
  lonavala: 1,
  delhi: 1,
  amritsar: 1,
  chandigarh: 1,
  ahmedabad: 1,
  rann_of_kutch: 4,
  gir: 3,
  hampi: 3,
  pondicherry: 3,
  rameswaram: 4,
  puri: 2,
  khajuraho: 3,
  pachmarhi: 4,
  bhimbetka: 2,
  mathura_vrindavan: 2,
  sundarbans: 4,
};

/** 0-5 snow intensity per duration of snow-relevant average daily low in Jan. */
const SNOWY_SLUGS = new Set([
  "gulmarg",
  "pahalgam",
  "srinagar",
  "manali",
  "shimla",
  "dharamshala",
  "spiti",
  "leh",
  "nubra_valley",
  "auli",
  "mussoorie",
  "nainital",
  "gangtok",
  "cherrapunji",
]);

const SNOW_WEIGHT: Record<string, number> = {
  gulmarg: 0.95,
  pahalgam: 0.6,
  srinagar: 0.55,
  manali: 0.6,
  shimla: 0.45,
  dharamshala: 0.35,
  spiti: 0.85,
  leh: 0.9,
  nubra_valley: 0.8,
  auli: 0.85,
  mussoorie: 0.3,
  nainital: 0.35,
  gangtok: 0.4,
  cherrapunji: 0.15,
};

export function computeMetrics(d: DestinationCard): CompareMetrics {
  const tier = (d.budget_level ?? "Moderate") as keyof typeof BASE_DAILY;
  const base = BASE_DAILY[tier] ?? BASE_DAILY.Moderate;
  const popularityFactor = 1 + (d.popularity - 50) / 500;
  const transit = TRANSIT[d.slug] ?? 3;

  const crowdName = popularCrowd(d.popularity);
  const snow = SNOWY_SLUGS.has(d.slug) ? Math.round((SNOW_WEIGHT[d.slug] ?? 0.5) * 100) : 0;

  const adventureWeight = d.experience_tags.filter((t) =>
    [
      "Adventure",
      "Skiing",
      "Trekking",
      "Offbeat",
      "Desert",
      "Water Sports",
      "River Rafting",
    ].includes(t),
  ).length;
  const family = Math.max(
    25,
    Math.min(
      98,
      96 -
        adventureWeight * 18 -
        (transit >= 4 ? 18 : 0) +
        (["Beach", "Park", "Leisure", "Hill Station"].some((t) => d.experience_tags.includes(t))
          ? 10
          : 0),
    ),
  );

  return {
    dailyCost: Math.round((base * popularityFactor) / 10) * 10,
    costTier: tier,
    transitComplexity: transit,
    crowdLevel: crowdName,
    familyFriendliness: Math.round(family),
    snowLikelihood: snow,
    bestMonthsLabel: monthLabel(d.best_months),
    hiddenGem: d.is_hidden_gem,
  };
}

function popularCrowd(popularity: number): string {
  if (popularity >= 88) return "Very high";
  if (popularity >= 75) return "High";
  if (popularity >= 60) return "Moderate";
  return "Low";
}

export function monthLabel(months: number[]): string {
  const names = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  if (months.length === 0) return "Year-round";
  return months.map((m) => names[m - 1] ?? "").join(", ");
}

export const TERRAINS = [
  "Hill Station",
  "Beach",
  "Desert",
  "Heritage",
  "Urban",
  "Forest",
  "Island",
  "Backwaters",
] as const;

export type TerrainKey = (typeof TERRAINS)[number];

const TERRAIN_RULES: Array<{ terrain: TerrainKey; hints: string[] }> = [
  {
    terrain: "Hill Station",
    hints: [
      "ski",
      "snow",
      "alpine",
      "him",
      "hill",
      "mountain",
      "meadow",
      "trek",
      "peak",
      "valley",
      "lake",
      "gangtok",
      "shimla",
      "manali",
      "munnar",
      "ooty",
      "darjeeling",
      "dharam",
    ],
  },
  {
    terrain: "Beach",
    hints: ["beach", "coastal", "sea", "shore", "goa", "kerala coast", "littoral"],
  },
  { terrain: "Desert", hints: ["desert", "dune", "arid", "thar", "sands", "jaisalmer", "kutch"] },
  { terrain: "Backwaters", hints: ["backwater", "canal", "houseboat", "alleppey"] },
  { terrain: "Island", hints: ["island", "archipelag", "andaman", "lakshadweep", "havelock"] },
  {
    terrain: "Forest",
    hints: [
      "forest",
      "jungle",
      "rainforest",
      "tiger",
      "wildlife",
      "safari",
      "national park",
      "corbett",
      "kaziranga",
      "gir",
      "sundarban",
    ],
  },
  {
    terrain: "Heritage",
    hints: [
      "heritage",
      "fort",
      "palace",
      "temple",
      "monument",
      "hampi",
      "khajuraho",
      "jaipur",
      "udaipur",
      "jodhpur",
      "agra",
      "varanasi",
      "mathura",
      "bhimbetka",
    ],
  },
  {
    terrain: "Urban",
    hints: [
      "city",
      "urban",
      "metropolitan",
      "metro",
      "delhi",
      "mumbai",
      "bangalore",
      "ahmedabad",
      "chandigarh",
      "kochi",
      "pondicherry",
      "mysuru",
    ],
  },
];

/**
 * Best-effort terrain derived from catalog tags + name (the DB has no terrain column).
 * First rule whose hint appears in the haystack wins; falls back to "Heritage".
 */
export function deriveTerrain(
  d: Pick<DestinationCard, "name" | "summary" | "experience_tags" | "season_tags">,
): TerrainKey {
  const hay =
    `${d.name} ${d.summary ?? ""} ${d.experience_tags.join(" ")} ${d.season_tags.join(" ")}`.toLowerCase();
  for (const rule of TERRAIN_RULES) {
    if (rule.hints.some((h) => hay.includes(h))) return rule.terrain;
  }
  return "Heritage";
}
