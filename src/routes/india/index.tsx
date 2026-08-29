import { useMemo, useState } from "react";
import { useQueryClient } from "@tanstack/react-query";
import { createFileRoute } from "@tanstack/react-router";
import {
  ArrowLeftRight,
  Compass,
  Mountain,
  Search,
  Thermometer,
  Waves,
  MapPin,
} from "lucide-react";

import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Skeleton } from "@/components/ui/skeleton";
import { Switch } from "@/components/ui/switch";
import { ToggleGroup, ToggleGroupItem } from "@/components/ui/toggle-group";

import { ClientOnly } from "@/components/ClientOnly";
import { DestinationCardView } from "@/components/explore/DestinationCardView";
import { IndiaMap } from "@/components/explore/IndiaMap";
import { CompareModal } from "@/components/explore/CompareModal";
import { useDestinations, useIndiaStates } from "@/hooks/use-catalog";
import { useLiveTelemetry } from "@/hooks/use-live-weather";
import { monthLabel, deriveTerrain } from "@/lib/compare";
import { cn } from "@/lib/utils";
import type { DestinationCard } from "@/lib/catalog";

export const Route = createFileRoute("/india/")({
  component: ExploreIndiaPage,
  head: () => ({
    title: "Explore India — GlobeTrotter",
    meta: [
      {
        name: "description",
        content:
          "Compare 50+ curated Indian destinations by live conditions, seasonality, budget and vibe.",
      },
    ],
  }),
});

const BUDGETS = ["Budget", "Moderate", "Luxury"] as const;
const TERRAINS = [
  "Hill Station",
  "Beach",
  "Desert",
  "Heritage",
  "Urban",
  "Forest",
  "Island",
  "Backwaters",
] as const;
const VIBES = [
  "Adventure",
  "Trekking",
  "Skiing",
  "Water Sports",
  "River Rafting",
  "Luxury",
  "Weekend Getaway",
  "Wildlife",
  "Food",
  "Spiritual",
  "Leisure",
  "Solo Friendly",
] as const;

function nowMonth(): number {
  return new Date().getMonth() + 1;
}

export default function ExploreIndiaPage() {
  const queryClient = useQueryClient();
  const { data: destinations, isLoading } = useDestinations();
  const { data: states } = useIndiaStates();

  const [search, setSearch] = useState("");
  const [region, setRegion] = useState("all");
  const [terrain, setTerrain] = useState("all");
  const [budget, setBudget] = useState("all");
  const [vibe, setVibe] = useState("all");
  const [hiddenOnly, setHiddenOnly] = useState(false);
  const [monthFit, setMonthFit] = useState(true);
  const [mapOpen, setMapOpen] = useState(true);
  const [compareIds, setCompareIds] = useState<string[]>([]);
  const [compareOpen, setCompareOpen] = useState(false);
  const [selectedMapSlug, setSelectedMapSlug] = useState<string | null>(null);

  const month = nowMonth();

  const filtered = useMemo(() => {
    if (!destinations) return [];
    const q = search.trim().toLowerCase();
    return destinations.filter((d) => {
      if (region !== "all" && d.stateSlug !== region) return false;
      if (terrain !== "all" && deriveTerrain(d) !== terrain) return false;
      if (budget !== "all" && d.budget_level?.toLowerCase() !== budget.toLowerCase()) return false;
      if (hiddenOnly && !d.is_hidden_gem) return false;
      if (
        q &&
        !`${d.name} ${d.stateName} ${d.experience_tags.join(" ")} ${d.summary}`
          .toLowerCase()
          .includes(q)
      )
        return false;
      if (monthFit && d.best_months.length > 0 && !d.best_months.includes(month)) return false;
      if (vibe !== "all" && !d.experience_tags.includes(vibe)) return false;
      return true;
    });
  }, [destinations, search, region, terrain, budget, hiddenOnly, monthFit, vibe, month]);

  const liveStrip = useMemo(
    () =>
      (destinations ?? [])
        .slice()
        .sort((a, b) => b.popularity - a.popularity)
        .slice(0, 8),
    [destinations],
  );

  const compareToggle = (id: string) => {
    setCompareIds((prev) => {
      if (prev.includes(id)) return prev.filter((x) => x !== id);
      if (prev.length >= 2) return [...prev.slice(1), id];
      return [...prev, id];
    });
  };

  const compareDestinations = useMemo(() => {
    const map = new Map((destinations ?? []).map((d) => [d.id, d]));
    return compareIds.map((id) => map.get(id)).filter(Boolean) as DestinationCard[];
  }, [destinations, compareIds]);

  const scrollTo = (id: string) => {
    queryClient.setQueryData(
      ["india", "destinations"],
      (old: DestinationCard[] | undefined) => old,
    );
    document.getElementById(id)?.scrollIntoView({ behavior: "smooth", block: "start" });
  };

  return (
    <div className="mx-auto max-w-7xl space-y-8 px-4 py-10 lg:px-8">
      <header className="space-y-3">
        <div className="flex flex-wrap items-end justify-between gap-4">
          <div>
            <p className="mono-label flex items-center gap-2 text-primary">
              <Compass className="h-4 w-4" /> INDIA · {states?.length ?? 36} STATES & UT
            </p>
            <h1 className="mt-1 font-display text-3xl font-semibold tracking-tight sm:text-4xl">
              Explore <span className="text-gradient">India</span>
            </h1>
            <p className="mt-2 max-w-2xl text-sm leading-relaxed text-muted-foreground">
              Live-tuned destination intelligence — 54 curated places, weighed against{" "}
              {monthLabel([month])} conditions, your budget and the vibe you chase.
            </p>
          </div>
          <Button
            variant="outline"
            onClick={() => setCompareOpen(true)}
            disabled={compareDestinations.length < 2}
          >
            <ArrowLeftRight className="mr-2 h-4 w-4" />
            Compare {compareDestinations.length}/2
          </Button>
        </div>
      </header>

      <ClientOnly
        fallback={
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {Array.from({ length: 6 }).map((_, i) => (
              <Skeleton key={i} className="h-80 rounded-2xl" />
            ))}
          </div>
        }
      >
        {mapOpen && (
          <section className="grid gap-4 lg:grid-cols-[1.25fr_0.75fr]">
            <IndiaMap
              destinations={filtered}
              selectedSlug={selectedMapSlug}
              onSelect={(slug) => {
                setSelectedMapSlug(slug);
                const dest = filtered.find((d) => d.slug === slug);
                if (dest) scrollTo(`card-${dest.id}`);
              }}
            />
            <div className="rounded-2xl border border-border/70 bg-foreground/[0.03] p-4">
              <div className="mono-label mb-3 flex items-center gap-2">
                <Thermometer className="h-4 w-4 text-teal-300" /> LIVE TEMPERATURES · TOP PICKS
              </div>
              <div className="space-y-2">
                {liveStrip.slice(0, 6).map((d) => (
                  <LiveTempRow key={d.id} dest={d} onFocus={() => scrollTo(`card-${d.id}`)} />
                ))}
              </div>
              <p className="mt-3 text-[11px] text-muted-foreground">
                Live from Open-Meteo via our server proxy, refreshed every 8 min. Click to jump to
                the card.
              </p>
            </div>
          </section>
        )}

        <section className="flex flex-wrap items-center gap-x-3 gap-y-2">
          <div className="relative">
            <Search className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
            <Input
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Search places…"
              className="w-56 pl-9"
            />
          </div>

          <Select value={region} onValueChange={setRegion}>
            <SelectTrigger className="w-40">
              <SelectValue placeholder="All regions" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All regions</SelectItem>
              {states?.map((s) => (
                <SelectItem key={s.slug} value={s.slug}>
                  {s.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>

          <Select value={terrain} onValueChange={setTerrain}>
            <SelectTrigger className="w-36">
              <SelectValue placeholder="Terrain" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All terrain</SelectItem>
              {TERRAINS.map((t) => (
                <SelectItem key={t} value={t}>
                  {t}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>

          <Select value={budget} onValueChange={setBudget}>
            <SelectTrigger className="w-32">
              <SelectValue placeholder="Budget" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">Any budget</SelectItem>
              {BUDGETS.map((b) => (
                <SelectItem key={b} value={b}>
                  {b}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>

          <Select value={vibe} onValueChange={setVibe}>
            <SelectTrigger className="w-36">
              <SelectValue placeholder="Vibe" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All vibes</SelectItem>
              {VIBES.map((v) => (
                <SelectItem key={v} value={v}>
                  {v}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>

          <ToggleGroup type="multiple" variant="outline" size="sm">
            <ToggleGroupItem
              value="month"
              aria-pressed={monthFit}
              className="gap-1 text-[11px]"
              onClick={() => setMonthFit((v) => !v)}
            >
              <CalendarHint />
              In season now
            </ToggleGroupItem>
            <ToggleGroupItem
              value="hidden"
              aria-pressed={hiddenOnly}
              className="gap-1 text-[11px]"
              onClick={() => setHiddenOnly((v) => !v)}
            >
              <GemIcon />
              Hidden gems
            </ToggleGroupItem>
          </ToggleGroup>

          <Button
            variant="ghost"
            size="sm"
            className="ml-auto text-xs"
            onClick={() => setMapOpen((v) => !v)}
          >
            {mapOpen ? "Hide" : "Show"} map
          </Button>
        </section>

        {isLoading ? null : (
          <p className="mono-label">
            {filtered.length} {filtered.length === 1 ? "destination" : "destinations"} · month{" "}
            {month}
          </p>
        )}

        <section className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {filtered.map((d) => (
            <div key={d.id} id={`card-${d.id}`} className="relative">
              <DestinationCardView destination={d} showChip />
              <Button
                variant="outline"
                size="sm"
                className="absolute right-3 top-3 z-10 h-7 gap-1 border-background/40 bg-background/70 px-2 text-[11px] backdrop-blur"
                onClick={() => compareToggle(d.id)}
              >
                <ArrowLeftRight className="h-3 w-3" />
                {compareIds.includes(d.id) ? "Selected" : "Compare"}
              </Button>
            </div>
          ))}
          {filtered.length === 0 && !isLoading && (
            <div className="col-span-full rounded-2xl border border-border/70 p-10 text-center text-sm text-muted-foreground">
              No destinations match those filters — try relaxing the season or vibe constraint.
            </div>
          )}
        </section>
      </ClientOnly>

      <CompareModal
        open={compareOpen}
        onOpenChange={setCompareOpen}
        destinations={compareDestinations}
      />
    </div>
  );
}

function LiveTempRow({ dest, onFocus }: { dest: DestinationCard; onFocus: () => void }) {
  const { weather } = useLiveTelemetry(dest.latitude, dest.longitude);
  const temp = weather?.status === "live" ? weather.data.temperatureC : null;
  return (
    <button
      type="button"
      onClick={onFocus}
      className="flex w-full items-center justify-between gap-3 rounded-lg border border-border/50 px-3 py-2 text-left transition-colors hover:border-primary/40"
    >
      <div className="flex items-center gap-2">
        <TerrainIcon terrain={deriveTerrain(dest)} />
        <span className="text-sm">{dest.name}</span>
      </div>
      <span
        className={cn(
          "text-sm tabular-nums",
          temp == null ? "text-muted-foreground" : "text-teal-300",
        )}
      >
        {temp != null ? `${Math.round(temp)}°C` : "…"}
      </span>
    </button>
  );
}

function TerrainIcon({ terrain }: { terrain: string }) {
  const cls = "h-3.5 w-3.5 text-muted-foreground";
  if (terrain === "Beach" || terrain === "Backwaters") return <Waves className={cls} />;
  if (terrain === "Desert") return <Mountain className={cls} />;
  if (terrain === "Urban") return <Compass className={cls} />;
  return <MapPin className={cls} />;
}

function CalendarHint() {
  return <MapPin className="hidden" />;
}
function GemIcon() {
  return <Badge className="h-3 w-3 p-0 text-[8px]">G</Badge>;
}
