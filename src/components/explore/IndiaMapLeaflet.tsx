// Browser-only Leaflet implementation of the India map.
// Imported lazily from IndiaMap.tsx so it never runs during SSR.

import { useEffect, useMemo, useState } from "react";

import { Link } from "@tanstack/react-router";
import L from "leaflet";
import "leaflet/dist/leaflet.css";
import type { FeatureCollection } from "geojson";
import { GeoJSON, MapContainer, Marker, Popup, TileLayer } from "react-leaflet";

import type { DestinationCard } from "@/lib/catalog";

const INDIA_CENTER: [number, number] = [22.5, 79.5];
const INDIA_ZOOM = 4.6;

const STATE_GEOJSON_URL =
  "https://raw.githubusercontent.com/geohacker/india/master/state/india.geojson";

function useStateBoundaries() {
  const [geojson, setGeojson] = useState<FeatureCollection | null>(null);
  useEffect(() => {
    let cancelled = false;
    fetch(STATE_GEOJSON_URL)
      .then((r) => (r.ok ? r.json() : Promise.reject(new Error("geojson fetch failed"))))
      .then((gj) => {
        if (!cancelled) setGeojson(gj);
      })
      .catch(() => {
        /* boundaries are decorative — skip silently */
      });
    return () => {
      cancelled = true;
    };
  }, []);
  return geojson;
}

function markerIcon(selected: boolean) {
  const size = selected ? 30 : 24;
  return L.divIcon({
    className: "",
    iconSize: [size, size],
    iconAnchor: [size / 2, size / 2],
    popupAnchor: [0, -size / 2],
    html: `<div style="
      width:${size}px;height:${size}px;border-radius:9999px;
      display:flex;align-items:center;justify-content:center;
      background:${selected ? "#2dd4bf" : "rgba(19, 78, 74, 0.9)"};
      border:2px solid ${selected ? "#5eead4" : "rgba(94, 234, 212, 0.6)"};
      box-shadow:0 4px 14px rgba(0,0,0,0.5);
      transition:transform 120ms ease;
    ">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
        stroke="${selected ? "#042f2e" : "#5eead4"}" stroke-width="2.2"
        stroke-linecap="round" stroke-linejoin="round" style="width:${Math.round(size * 0.58)}px;height:${Math.round(size * 0.58)}px">
        <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/>
      </svg>
    </div>`,
  });
}

export default function IndiaMapLeaflet({
  destinations,
  markersHidden,
  selectedSlug,
  onSelect,
}: {
  destinations: DestinationCard[];
  markersHidden?: boolean;
  selectedSlug?: string | null;
  onSelect?: (slug: string) => void;
}) {
  const markers = useMemo(() => (markersHidden ? [] : destinations), [destinations, markersHidden]);
  const stateBoundaries = useStateBoundaries();

  return (
    <MapContainer
      center={INDIA_CENTER}
      zoom={INDIA_ZOOM}
      minZoom={3.5}
      maxBounds={[
        [4, 60],
        [40, 102],
      ]}
      zoomControl={true}
      attributionControl={true}
      className="h-full min-h-[22rem] w-full"
      style={{ background: "#0f172a" }}
    >
      <TileLayer
        url="https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png"
        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>'
        maxZoom={18}
      />
      {stateBoundaries && (
        <GeoJSON
          key="india-states"
          data={stateBoundaries}
          style={() => ({
            color: "#14b8a6",
            weight: 0.7,
            fillColor: "#0f766e",
            fillOpacity: 0.05,
          })}
          interactive={false}
        />
      )}
      {markers.map((d) => {
        const selected = selectedSlug === d.slug;
        return (
          <Marker
            key={d.slug}
            position={[d.latitude, d.longitude]}
            icon={markerIcon(selected)}
            zIndexOffset={selected ? 1000 : 0}
            eventHandlers={{ click: () => onSelect?.(d.slug) }}
          >
            <Popup className="gt-map-popup">
              <div className="w-52 space-y-1.5">
                <div className="flex items-center justify-between gap-2">
                  <span className="font-semibold text-slate-900">{d.name}</span>
                  <span className="text-[10px] text-slate-500">{d.popularity}%</span>
                </div>
                <p className="text-[11px] capitalize text-slate-500">{d.stateName}</p>
                <Link
                  to="/india/$state/$destination"
                  params={{ state: d.stateSlug ?? "", destination: d.slug }}
                  className="block rounded-md bg-teal-600 px-2 py-1 text-center text-xs font-medium text-white hover:bg-teal-500"
                >
                  Explore details
                </Link>
              </div>
            </Popup>
          </Marker>
        );
      })}
    </MapContainer>
  );
}
