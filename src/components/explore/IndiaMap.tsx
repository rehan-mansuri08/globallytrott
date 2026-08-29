// Google Maps empowered India explorer map.
// Dark-styled basemap + runtime state boundaries + destination markers + info popup.
// Requires VITE_GOOGLE_MAPS_API_KEY (a public, referrer-restricted key); Renders a
// guarded message otherwise.

import { useEffect, useMemo, useRef, useState } from "react";
import { AdvancedMarker, APIProvider, InfoWindow, Map, useMap } from "@vis.gl/react-google-maps";

import { Link } from "@tanstack/react-router";
import { AlertTriangle, MapPin } from "lucide-react";

import type { DestinationCard } from "@/lib/catalog";
import { cn } from "@/lib/utils";

const KEY = ((import.meta.env["VITE_GOOGLE_MAPS_API_KEY"] as string | undefined) ?? "").replace(
  /"/g,
  "",
);

const INITIAL_CENTER = { lat: 22.5, lng: 79 };
const INITIAL_ZOOM = 4.4;

const STATE_GEOJSON_URL =
  "https://raw.githubusercontent.com/geohacker/india/master/state/india.geojson";

const DARK_STYLE: google.maps.MapTypeStyle[] = [
  { elementType: "geometry", stylers: [{ color: "#0f172a" }] },
  { elementType: "labels.text.stroke", stylers: [{ color: "#1e293b" }] },
  { elementType: "labels.text.fill", stylers: [{ color: "#64748b" }] },
  {
    featureType: "administrative",
    elementType: "geometry.stroke",
    stylers: [{ color: "#334155" }],
  },
  { featureType: "poi", elementType: "geometry", stylers: [{ color: "#1e293b" }] },
  { featureType: "road", elementType: "geometry.stroke", stylers: [{ color: "#334155" }] },
  { featureType: "road", elementType: "geometry.fill", stylers: [{ color: "#1e293b" }] },
  { featureType: "water", elementType: "geometry", stylers: [{ color: "#0c4a6e" }] },
  { featureType: "water", elementType: "labels.text.fill", stylers: [{ color: "#38bdf8" }] },
];

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
  const [popup, setPopup] = useState<DestinationCard | null>(null);

  const markers = useMemo(() => (markersHidden ? [] : destinations), [destinations, markersHidden]);

  if (!KEY) {
    return (
      <div
        className={cn(
          "flex h-full min-h-72 flex-col items-center justify-center gap-3 rounded-2xl border border-border/70 bg-muted/20 p-8 text-center",
          className,
        )}
      >
        <AlertTriangle className="h-8 w-8 text-amber-400" />
        <div>
          <p className="font-display text-sm font-semibold">Live map needs a Google Maps key</p>
          <p className="mt-1 max-w-sm text-xs leading-relaxed text-muted-foreground">
            Add a public, referrer-restricted{" "}
            <code className="text-primary">VITE_GOOGLE_MAPS_API_KEY</code> to{" "}
            <code className="text-primary">.env</code> then restart the dev server. Enable the Maps
            JavaScript API and billing in Google Cloud Console first.
          </p>
        </div>
      </div>
    );
  }

  return (
    <div
      className={cn("overflow-hidden rounded-2xl border border-border/70 bg-[#0f172a]", className)}
    >
      <APIProvider apiKey={KEY} libraries={["marker"]}>
        <Map
          mapId="globe-trotter-india-dark"
          defaultCenter={INITIAL_CENTER}
          defaultZoom={INITIAL_ZOOM}
          disableDefaultUI
          gestureHandling="greedy"
          styles={DARK_STYLE}
          backgroundColor="#0f172a"
          className="h-full w-full min-h-[22rem]"
        >
          <StateBoundaryLayer onError={null} />
          {markers.map((d) => (
            <AdvancedMarker
              key={d.slug}
              position={{ lat: d.latitude, lng: d.longitude }}
              onClick={() => {
                setPopup(d);
                onSelect?.(d.slug);
              }}
            >
              <div
                className={cn(
                  "grid h-6 w-6 place-items-center rounded-full border shadow-lg transition-transform hover:scale-125",
                  selectedSlug === d.slug
                    ? "border-primary bg-primary text-white"
                    : "border-teal-300/60 bg-teal-950/80 text-teal-200",
                )}
              >
                <MapPin className="h-3.5 w-3.5" />
              </div>
            </AdvancedMarker>
          ))}

          {popup && (
            <InfoWindow
              position={{ lat: popup.latitude, lng: popup.longitude }}
              onCloseClick={() => setPopup(null)}
              shouldFocus={false}
            >
              <div className="w-52 space-y-1.5 font-sans">
                <div className="flex items-center justify-between gap-2">
                  <span className="font-semibold text-foreground">{popup.name}</span>
                  <span className="text-[10px] text-muted-foreground">{popup.popularity}%</span>
                </div>
                <p className="text-[11px] capitalize text-muted-foreground">{popup.stateName}</p>
                <Link
                  to="/india/$state/$destination"
                  params={{ state: popup.stateSlug ?? "", destination: popup.slug }}
                  className="block rounded-md bg-primary px-2 py-1 text-center text-xs font-medium text-white hover:bg-primary/80"
                >
                  Explore details
                </Link>
              </div>
            </InfoWindow>
          )}
        </Map>
      </APIProvider>
    </div>
  );
}

function StateBoundaryLayer({ onError }: { onError: ((failed: boolean) => void) | null }) {
  const map = useMap();
  const loaded = useRef(false);

  useEffect(() => {
    if (!map || loaded.current) return;
    loaded.current = true;
    let cancelled = false;

    fetch(STATE_GEOJSON_URL)
      .then((r) => {
        if (!r.ok) throw new Error("geojson fetch failed");
        return r.json();
      })
      .then((gj) => {
        if (cancelled) return;
        map.data.addGeoJson(gj);
        map.data.setStyle(() => ({
          fillColor: "#0f766e",
          fillOpacity: 0.05,
          strokeColor: "#14b8a6",
          strokeWeight: 0.6,
        }));
      })
      .catch(() => {
        if (!cancelled) onError?.(true);
      });

    return () => {
      cancelled = true;
    };
  }, [map, onError]);

  return null;
}
