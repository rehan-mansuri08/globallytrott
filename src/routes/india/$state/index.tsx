import { useMemo } from "react";
import { createFileRoute, Link } from "@tanstack/react-router";
import { MapPin, Building2 } from "lucide-react";

import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";

import { ClientOnly } from "@/components/ClientOnly";
import { DestinationCardView } from "@/components/explore/DestinationCardView";
import { useDestinations, useIndiaStates } from "@/hooks/use-catalog";

export const Route = createFileRoute("/india/$state/")({
  component: StatePage,
  head: () => ({
    title: "State destinations",
    meta: [{ name: "description", content: "Destinations across a curated Indian state." }],
  }),
});

export default function StatePage() {
  const { state: stateSlug } = Route.useParams();
  const { data: destinations, isLoading } = useDestinations();
  const { data: states } = useIndiaStates();

  const stateName = useMemo(
    () => states?.find((s) => s.slug === stateSlug)?.name ?? stateSlug,
    [states, stateSlug],
  );

  const inState = useMemo(
    () => (destinations ?? []).filter((d) => d.stateSlug === stateSlug),
    [destinations, stateSlug],
  );

  return (
    <div className="mx-auto max-w-7xl space-y-8 px-4 py-10 lg:px-8">
      <header className="flex flex-wrap items-end justify-between gap-4">
        <div>
          <Link to="/india" className="mono-label text-primary hover:underline">
            ← ALL INDIA
          </Link>
          <h1 className="mt-1 flex items-center gap-2 font-display text-3xl font-semibold tracking-tight capitalize">
            <Building2 className="h-7 w-7 text-primary" /> {stateName}
          </h1>
          <p className="mt-2 max-w-2xl text-sm leading-relaxed text-muted-foreground">
            {inState.length} curated {inState.length === 1 ? "destination" : "destinations"} in{" "}
            {stateName} — tap a card for live conditions, season-by-season feasibility and an
            AI-ready quick glance.
          </p>
        </div>
        <Button asChild variant="outline">
          <Link to="/india">
            <MapPin className="mr-2 h-4 w-4" /> Back to map
          </Link>
        </Button>
      </header>

      <ClientOnly
        fallback={
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {Array.from({ length: 3 }).map((_, i) => (
              <Skeleton key={i} className="h-80 rounded-2xl" />
            ))}
          </div>
        }
      >
        <section className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {inState.map((d) => (
            <DestinationCardView key={d.id} destination={d} showChip />
          ))}
          {!isLoading && inState.length === 0 && (
            <div className="col-span-full rounded-2xl border border-border/70 p-10 text-center text-sm text-muted-foreground">
              No destinations seeded for {stateName} yet.
            </div>
          )}
        </section>
      </ClientOnly>
    </div>
  );
}
