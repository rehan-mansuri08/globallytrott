// Client-side catalog: reads the public Supabase destination tables.
// Content is public-read (RLS), so browsers can query directly — no proxy needed.

import { supabase } from "@/integrations/supabase/client";
import type { Tables } from "@/integrations/supabase/types";

export type StateRow = Tables<"regions">;
export type DestinationRow = Tables<"destinations">;
export type SeasonRow = Tables<"destination_seasons">;
export type ActivityRow = Tables<"destination_activities">;
export type ImageRow = Tables<"destination_images">;

export interface DestinationCard {
  id: string;
  name: string;
  slug: string;
  summary: string | null;
  description: string | null;
  latitude: number;
  longitude: number;
  altitude_m: number | null;
  experience_tags: string[];
  season_tags: string[];
  best_months: number[];
  recommended_days: string | null;
  budget_level: string | null;
  popularity: number;
  is_hidden_gem: boolean;
  famous_food: string[];
  festivals: string[];
  local_experiences: string[];
  stateName: string | null;
  stateSlug: string | null;
}

export interface DestinationDetail extends DestinationCard {
  coverImage: string | null;
  seasons: SeasonRow[];
  activities: ActivityRow[];
  images: ImageRow[];
}

function toCard(
  d: DestinationRow,
  state: Pick<StateRow, "name" | "slug"> | null,
): DestinationCard {
  return {
    id: d.id,
    name: d.name,
    slug: d.slug,
    summary: d.summary,
    description: d.description,
    latitude: Number(d.latitude),
    longitude: Number(d.longitude),
    altitude_m: d.altitude_m != null ? Number(d.altitude_m) : null,
    experience_tags: d.experience_tags,
    season_tags: d.season_tags,
    best_months: d.best_months,
    recommended_days: d.recommended_days,
    budget_level: d.budget_level,
    popularity: d.popularity,
    is_hidden_gem: d.is_hidden_gem,
    famous_food: d.famous_food,
    festivals: d.festivals,
    local_experiences: d.local_experiences,
    stateName: state?.name ?? null,
    stateSlug: state?.slug ?? null,
  };
}

export async function fetchIndiaStates(): Promise<StateRow[]> {
  const { data, error } = await supabase
    .from("regions")
    .select("*")
    .in("kind", ["state", "union_territory"])
    .order("name", { ascending: true });
  if (error) throw error;
  return data ?? [];
}

export async function fetchDestinationCards(): Promise<DestinationCard[]> {
  const { data, error } = await supabase
    .from("destinations")
    .select("*, region:regions(name, slug)")
    .order("popularity", { ascending: false });
  if (error) throw error;
  return (data ?? []).map((row) => {
    const region = row.region
      ? Array.isArray(row.region)
        ? row.region[0] ?? null
        : row.region
      : null;
    return toCard(row as DestinationRow, region);
  });
}

export async function fetchDestinationDetail(slug: string): Promise<DestinationDetail | null> {
  const { data: dest, error } = await supabase
    .from("destinations")
    .select("*, region:regions(name, slug)")
    .eq("slug", slug)
    .single();
  if (error || !dest) throw error ?? new Error("Destination not found");

  const region = dest.region
    ? Array.isArray(dest.region)
      ? dest.region[0] ?? null
      : dest.region
    : null;
  const card = toCard(dest as DestinationRow, region);

  const [seasonsRes, activitiesRes, imagesRes] = await Promise.all([
    supabase
      .from("destination_seasons")
      .select("*")
      .eq("destination_id", card.id)
      .order("sort", { ascending: true }),
    supabase
      .from("destination_activities")
      .select("*")
      .eq("destination_id", card.id)
      .order("sort", { ascending: true }),
    supabase
      .from("destination_images")
      .select("*")
      .eq("destination_id", card.id)
      .order("sort", { ascending: true }),
  ]);

  if (seasonsRes.error) throw seasonsRes.error;
  if (activitiesRes.error) throw activitiesRes.error;
  if (imagesRes.error) throw imagesRes.error;

  const images = imagesRes.data ?? [];
  return {
    ...card,
    coverImage: images[0]?.url ?? null,
    seasons: seasonsRes.data ?? [],
    activities: activitiesRes.data ?? [],
    images,
  };
}

export async function fetchDestinationBySlug(slug: string): Promise<DestinationCard | null> {
  const { data, error } = await supabase
    .from("destinations")
    .select("*, region:regions(name, slug)")
    .eq("slug", slug)
    .single();
  if (error || !data) return null;
  const region = (data as { region?: unknown }).region;
  return toCard(
    data as DestinationRow,
    (Array.isArray(region) ? region[0] : region) as Pick<StateRow, "name" | "slug"> | null,
  );
}