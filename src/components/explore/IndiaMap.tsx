// Keyless India explorer map — Leaflet + OpenStreetMap (CARTO dark basemap).
// No API key required. The Leaflet module is browser-only, so it is lazy-loaded
// and this wrapper stays SSR-safe.

import { Suspense, lazy } from "react";

import { Skeleton } from "@/components/ui/skeleton";
import type { DestinationCard } from "@/lib/catalog";
import { cn } from "@/lib/utils";

const LeafletMap = lazy(() => import("./IndiaMapLeaflet"));

export function IndiaMap({
  destinations,
  markersHidden,
  className,
  selectedSlug,
  onSelect,
}: {
  destinations: DestinationCard[];
  markersHidden?: boolean;
  className?: string;
  selectedSlug?: string | null;
  onSelect?: (slug: string) => void;
}) {
  return (
    <div className={cn("overflow-hidden rounded-2xl border border-border/70", className)}>
      <Suspense fallback={<Skeleton className="h-full min-h-[22rem] w-full rounded-none" />}>
        <LeafletMap
          destinations={destinations}
          markersHidden={markersHidden}
          selectedSlug={selectedSlug}
          onSelect={onSelect}
        />
      </Suspense>
    </div>
  );
}
