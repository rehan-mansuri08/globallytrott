import { useEffect, useMemo } from "react";
import { createFileRoute, Link } from "@tanstack/react-router";
import {
  ArrowLeft,
  CalendarDays,
  Camera,
  Gem,
  Leaf,
  MapPin,
  Mountain,
  Sparkles,
  Users,
  Utensils,
  Wallet,
  Waves,
} from "lucide-react";

import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";

import { ClientOnly } from "@/components/ClientOnly";
import { ActivityFeasibilityList } from "@/components/weather/ActivityFeasibilityList";
import { TelemetryPanel } from "@/components/weather/TelemetryPanel";
import { WeatherCanvas } from "@/components/weather/WeatherCanvas";
import { TravelAssistant } from "@/components/ai/TravelAssistant";

import { useDestinationDetail } from "@/hooks/use-catalog";
import { useLiveTelemetry } from "@/hooks/use-live-weather";
import { monthLabel, deriveTerrain } from "@/lib/compare";
import { conditionLabel, type TelemetryResult } from "@/lib/weather";
import type { FeasibilityContext } from "@/lib/activity-engine";
import type { SeasonRow } from "@/lib/catalog";

export const Route = createFileRoute("/india/$state/$destination")({
  component: DestinationPage,
  head: () => ({
    title: "Destination — GlobeTrotter",
    meta: [
      {
        name: "description",
        content:
          "Live conditions, season feasibility and local intelligence for a curated Indian destination.",
      },
    ],
  }),
});

export default function DestinationPage() {
  const { destination: slug, state: stateSlug } = Route.useParams();
  const { data: dest, isLoading } = useDestinationDetail(slug);

  useEffect(() => {
    if (dest?.name) document.title = `${dest.name} — GlobeTrotter`;
  }, [dest?.name]);

  return (
    <ClientOnly
      fallback={
        <div className="space-y-6">
          <Skeleton className="h-72 rounded-3xl" />
          <div className="grid gap-6 lg:grid-cols-[1fr_360px]">
            <Skeleton className="h-96 rounded-3xl" />
            <Skeleton className="h-96 rounded-3xl" />
          </div>
        </div>
      }
    >
      {isLoading ? (
        <div className="space-y-6">
          <Skeleton className="h-72 rounded-3xl" />
          <div className="grid gap-6 lg:grid-cols-[1fr_360px]">
            <Skeleton className="h-96 rounded-3xl" />
            <Skeleton className="h-96 rounded-3xl" />
          </div>
        </div>
      ) : dest ? (
        <DestinationView dest={dest} stateSlug={stateSlug} />
      ) : (
        <div className="mx-auto max-w-3xl rounded-2xl border border-border/70 p-12 text-center">
          <p className="font-display text-lg font-semibold">Destination not found</p>
          <p className="mt-2 text-sm text-muted-foreground">
            It may not be seeded yet. Head back to the explorer.
          </p>
          <Button asChild className="mt-6" variant="outline">
            <Link to="/india">Explore India</Link>
          </Button>
        </div>
      )}
    </ClientOnly>
  );
}

function DestinationView({
  dest,
  stateSlug,
}: {
  dest: NonNullable<ReturnType<typeof useDestinationDetail>["data"]>;
  stateSlug: string;
}) {
  const telemetry = useLiveTelemetry(dest.latitude, dest.longitude);
  const weatherResult = telemetry.weather;
  const liveWeather = weatherResult?.status === "live" ? (weatherResult.data ?? null) : null;

  const feasibilityContext: FeasibilityContext = useMemo(
    () => ({
      month: new Date().getMonth() + 1,
      condition: liveWeather?.condition ?? null,
      temperatureC: liveWeather?.temperatureC ?? null,
    }),
    [liveWeather],
  );

  const cover = dest.coverImage ?? dest.images[0]?.url ?? "";

  return (
    <article className="space-y-10">
      {/* Hero */}
      <header className="relative overflow-hidden rounded-3xl border border-border/60">
        <div className="relative h-72 w-full sm:h-96">
          {cover ? (
            <img src={cover} alt={dest.name} className="h-full w-full object-cover" />
          ) : (
            <div className="h-full w-full bg-gradient-to-br from-primary/15 to-primary/5" />
          )}
          <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-black/30" />

          <div className="absolute left-4 top-4 flex items-center gap-2">
            <Button
              asChild
              variant="ghost"
              size="sm"
              className="bg-black/30 text-white backdrop-blur hover:bg-black/40"
            >
              <Link to="/india">
                <ArrowLeft className="mr-1.5 h-4 w-4" /> All India
              </Link>
            </Button>
          </div>

          <div className="absolute inset-x-4 bottom-4 sm:inset-x-6 sm:bottom-6">
            <div className="flex flex-wrap items-center gap-2">
              <Badge className="glass border-primary/30 px-2.5 py-1 text-primary">
                {deriveTerrain(dest)}
              </Badge>
              <Badge className="glass px-2.5 py-1 capitalize">{dest.budget_level}</Badge>
              {dest.is_hidden_gem && (
                <Badge className="glass border-amber-400/40 text-amber-300">
                  <Gem className="mr-1 h-3 w-3" /> Hidden gem
                </Badge>
              )}
              <Badge className="glass">
                <span className="text-rose-300">{dest.popularity}% popularity</span>
              </Badge>
            </div>
            <h1 className="mt-2.5 font-display text-3xl font-bold tracking-tight text-white drop-shadow sm:text-5xl">
              {dest.name}
            </h1>
            <p className="mt-1.5 flex flex-wrap items-center gap-x-3 gap-y-1 text-sm text-white/85">
              <span className="inline-flex items-center capitalize">
                <MapPin className="mr-1.5 h-4 w-4 text-teal-300" /> {dest.stateName}
              </span>
              {dest.latitude != null && (
                <span className="inline-flex items-center">
                  <Mountain className="mr-1.5 h-4 w-4 text-teal-300" />{" "}
                  {dest.altitude_m != null
                    ? `${Number(dest.altitude_m).toLocaleString()} m`
                    : "Lat/Lng pinned"}
                </span>
              )}
            </p>
          </div>
        </div>
      </header>

      {/* Weather console */}
      <section className="grid gap-6 lg:grid-cols-[1.4fr_1fr]">
        <div className="relative min-h-80 overflow-hidden rounded-3xl border border-border/60">
          <WeatherCanvas
            condition={liveWeather?.condition ?? "clear"}
            isDay={liveWeather?.isDay ?? true}
            className="absolute inset-0 h-full w-full"
          />
          <div className="relative flex h-full min-h-80 flex-col justify-end p-6 sm:p-8">
            <div className="flex flex-wrap items-end gap-3">
              <div>
                <p className="mono-label text-teal-200">CURRENT CONDITIONS</p>
                <div className="mt-1 flex items-end gap-2">
                  <span className="font-display text-7xl font-semibold leading-none tracking-tight text-white drop-shadow-lg">
                    {liveWeather?.temperatureC != null
                      ? `${Math.round(liveWeather.temperatureC)}°`
                      : "—"}
                  </span>
                  <span className="mb-2 text-lg text-white/75">C</span>
                </div>
                <p className="mt-2 text-sm capitalize text-white/80">
                  {liveWeather
                    ? conditionLabel(liveWeather.condition, liveWeather.isDay)
                    : "Waiting for live telemetry…"}
                </p>
              </div>
              {liveWeather && (
                <div className="ml-auto hidden flex-col items-end gap-1 text-right text-xs text-white/70 sm:flex">
                  <span>
                    Wind{" "}
                    {liveWeather.windSpeedKmh != null
                      ? `${Math.round(liveWeather.windSpeedKmh)} km/h`
                      : "—"}
                  </span>
                  <span>
                    Humidity{" "}
                    {liveWeather.humidityPct != null
                      ? `${Math.round(liveWeather.humidityPct)}%`
                      : "—"}
                  </span>
                  <span>
                    {dest.latitude != null && dest.longitude != null
                      ? `${Number(dest.latitude).toFixed(2)}, ${Number(dest.longitude).toFixed(2)}`
                      : ""}
                  </span>
                </div>
              )}
            </div>
          </div>
        </div>

        <div className="rounded-3xl border border-border/60 bg-foreground/[0.03] p-5 sm:p-6">
          <TelemetryPanel
            weather={liveWeather}
            air={telemetry.air?.status === "live" ? (telemetry.air.data ?? null) : null}
            fetchedAt={weatherResult?.fetchedAt ?? null}
          />
        </div>
      </section>

      {/* Plan CTA + AI assistant */}
      <section className="flex flex-wrap items-center justify-between gap-4 rounded-3xl border border-primary/20 bg-primary/[0.06] p-6">
        <div className="space-y-1">
          <h2 className="font-display text-lg font-semibold">Turn this into a trip</h2>
          <p className="max-w-xl text-sm leading-relaxed text-muted-foreground">
            The travel AI plans daily routes in {dest.name} with {dest.famous_food.length} signature
            eats, feasibility-checked activities and real-time weather guardrails.
          </p>
        </div>
        <div className="flex gap-3">
          <Button asChild>
            <Link to="/ai-builder" search={{ dest: dest.slug, state: stateSlug }}>
              <Sparkles className="mr-2 h-4 w-4" /> Plan with AI
            </Link>
          </Button>
          <Button asChild variant="outline">
            <Link to="/itinerary">Manual studio</Link>
          </Button>
        </div>
      </section>

      {/* Feasible now */}
      {(dest.activities?.length ?? 0) > 0 && (
        <section className="space-y-4">
          <SectionHeading
            icon={<Leaf className="h-4 w-4" />}
            title="What can I do right now?"
            subtitle="Feasibility computed from today's conditions + season — weather-aware, honest labels."
          />
          <ActivityFeasibilityList activities={dest.activities} context={feasibilityContext} />
        </section>
      )}

      {/* Seasons */}
      <section className="space-y-4">
        <SectionHeading
          icon={<CalendarDays className="h-4 w-4" />}
          title="Season rhythm"
          subtitle="When this place is at its best — plan around the weather, not around crowds."
        />
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {dest.seasons.map((s) => (
            <SeasonCard key={s.id} season={s} />
          ))}
        </div>
      </section>

      {/* Identity */}
      <section className="grid gap-6 lg:grid-cols-3">
        <div className="space-y-3 rounded-3xl border border-border/60 bg-foreground/[0.03] p-6">
          <SectionHeading icon={<Utensils className="h-4 w-4" />} title="Food" />
          {dest.famous_food.length > 0 ? (
            <div className="flex flex-wrap gap-2">
              {dest.famous_food.map((f) => (
                <Badge key={f} variant="outline" className="px-2.5 py-1">
                  {f}
                </Badge>
              ))}
            </div>
          ) : (
            <p className="text-xs text-muted-foreground">Not catalogued yet.</p>
          )}
        </div>
        <div className="space-y-3 rounded-3xl border border-border/60 bg-foreground/[0.03] p-6">
          <SectionHeading icon={<Waves className="h-4 w-4" />} title="Local experiences" />
          {dest.local_experiences.length > 0 ? (
            <ul className="space-y-2 text-sm">
              {dest.local_experiences.map((e) => (
                <li key={e} className="flex items-start gap-2 text-muted-foreground">
                  <span className="mt-1 h-1.5 w-1.5 shrink-0 rounded-full bg-primary" /> {e}
                </li>
              ))}
            </ul>
          ) : (
            <p className="text-xs text-muted-foreground">Not catalogued yet.</p>
          )}
        </div>
        <div className="space-y-3 rounded-3xl border border-border/60 bg-foreground/[0.03] p-6">
          <SectionHeading icon={<Camera className="h-4 w-4" />} title="Festivals & moments" />
          {dest.festivals.length > 0 ? (
            <ul className="space-y-2 text-sm">
              {dest.festivals.map((f) => (
                <li key={f} className="flex items-start gap-2 text-muted-foreground">
                  <span className="mt-1 h-1.5 w-1.5 shrink-0 rounded-full bg-amber-400" /> {f}
                </li>
              ))}
            </ul>
          ) : (
            <p className="text-xs text-muted-foreground">Not catalogued yet.</p>
          )}
        </div>
      </section>

      {/* Best months summary */}
      {dest.best_months.length > 0 && (
        <section className="rounded-3xl border border-border/60 bg-foreground/[0.03] p-6 text-sm">
          <span className="font-medium">Optimal window:</span>{" "}
          <span className="text-muted-foreground">{monthLabel(dest.best_months)}</span>
          {dest.recommended_days && (
            <>
              {" "}
              · <span className="font-medium">Ideal stay:</span>{" "}
              <span className="text-muted-foreground">{dest.recommended_days}</span>
            </>
          )}
          {dest.summary && (
            <p className="mt-3 leading-relaxed text-muted-foreground">{dest.summary}</p>
          )}
        </section>
      )}

      {/* Gallery */}
      {dest.images.length > 1 && (
        <section className="space-y-4">
          <SectionHeading
            icon={<Camera className="h-4 w-4" />}
            title="Moments"
            subtitle="Scenes from the region."
          />
          <div className="flex gap-3 overflow-x-auto pb-2">
            {dest.images.map((img) => (
              <img
                key={img.id ?? img.url}
                src={img.url}
                alt={img.alt ?? dest.name}
                loading="lazy"
                className="h-44 w-64 shrink-0 rounded-2xl border border-border/60 object-cover"
              />
            ))}
          </div>
        </section>
      )}

      <TravelAssistant
        context={{
          destinationName: dest.name,
          stateName: dest.stateName ?? stateSlug,
          latitude: dest.latitude,
          longitude: dest.longitude,
        }}
      />
    </article>
  );
}

function SectionHeading({
  icon,
  title,
  subtitle,
}: {
  icon: React.ReactNode;
  title: string;
  subtitle?: string;
}) {
  return (
    <div>
      <h2 className="flex items-center gap-2 font-display text-lg font-semibold">
        <span className="text-primary">{icon}</span> {title}
      </h2>
      {subtitle && <p className="mt-0.5 text-xs text-muted-foreground">{subtitle}</p>}
    </div>
  );
}

export function SeasonCard({ season }: { season: SeasonRow }) {
  return (
    <div className="space-y-2 rounded-2xl border border-border/60 bg-foreground/[0.03] p-5 transition-colors hover:border-primary/30">
      <div className="flex items-center justify-between gap-2">
        <h3 className="font-display text-sm font-semibold capitalize">{season.label}</h3>
        <Badge variant="outline" className="text-[10px]">
          {monthLabel(season.months)}
        </Badge>
      </div>
      {season.weather && (
        <p className="text-[11px] capitalize text-muted-foreground">{season.weather}</p>
      )}
      {(season.crowd || season.budget) && (
        <div className="flex flex-wrap gap-1.5 pt-1">
          {season.crowd && (
            <Badge variant="outline" className="text-[10px]">
              <Users className="mr-1 h-3 w-3" /> {season.crowd}
            </Badge>
          )}
          {season.budget && (
            <Badge variant="outline" className="text-[10px]">
              <Wallet className="mr-1 h-3 w-3" /> {season.budget}
            </Badge>
          )}
        </div>
      )}
      <p className="text-xs leading-relaxed text-muted-foreground">{season.notes}</p>
      {(season.activities?.length ?? 0) > 0 && (
        <div className="flex flex-wrap gap-1.5 pt-1">
          {season.activities.map((a) => (
            <span
              key={a}
              className="rounded-full border border-border/60 px-2 py-0.5 text-[10px] text-primary/80"
            >
              {a}
            </span>
          ))}
        </div>
      )}
    </div>
  );
}
