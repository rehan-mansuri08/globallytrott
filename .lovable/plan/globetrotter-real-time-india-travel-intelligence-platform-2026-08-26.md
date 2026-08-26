# GlobeTrotter → Real-Time India Travel Intelligence Platform

## What exists today (audit)

- **Stack**: TanStack Start v1 (React 19, Vite 7), TanStack Router file routes, TanStack Query, Tailwind v4 tokens in `src/styles.css`, shadcn/ui (full set installed), Supabase auth + DB with RLS.
- **Routes**: `/` (glass auth card over 3D video background), `/_authenticated/dashboard` (bento grid), `/_authenticated/itinerary` (drag-and-drop trip builder).
- **Data**: `profiles`, `trips`, `stops`, `activities` — all RLS-scoped to the owner.
- **Visual**: deep dark oklch theme, glassmorphism `.glass`, Space Grotesk / DM Sans / JetBrains Mono, R3F rotating video plane.

All of the above stays. Nothing is rebuilt; the new platform is layered around it and the existing trip tables become the sink for AI-generated itineraries.

## Decisions (from your answers)

- **Light-first theme with a dark toggle.** New public discovery pages are bright and airy; the existing auth + dashboard + itinerary screens keep working and adopt the toggle.
- **Keyless live data**: Open-Meteo for current weather, forecast, AQI, sunrise/sunset (no API key, no rate-limit risk), called from server functions with caching. Imagery: curated licensed photo URLs per destination plus generated seasonal art — no fabricated "live" claims anywhere.
- **Phased delivery.** Phase 1 below is what I build now; later phases follow on your go-ahead.

## Data architecture (global-ready, India populated first)

```text
regions (world → country → state → city/destination, self-referencing tree)
  destinations
    ├── destination_seasons   (month ranges, weather profile, crowd, budget, activities)
    ├── destination_activities(experience tags, season tags, indoor/outdoor)
    ├── destination_images    (url, credit, license, season tag, sort)
    └── destination_facts     (best duration, food, festivals, local experiences)
weather_cache (destination_id, payload jsonb, fetched_at)  -- server-written only
```

- Reference tables are public-read (`GRANT SELECT TO anon, authenticated`), write-restricted to `service_role`; user tables keep existing owner-scoped RLS.
- Nothing India-specific in the schema: `regions.kind` = country/state/city, so Asia and the world just add rows.
- Seeded via migration with literal INSERTs: all 28 states + 8 UTs (name, capital, best seasons, tags) and a deep first tranche of destinations (Kashmir, Himachal, Rajasthan, Kerala, Goa, Gujarat, Uttarakhand, Northeast, Tamil Nadu, Maharashtra…) with coordinates, seasons, activities and attributed imagery.

## Phase 1 (this build)

1. **Design system**: light-first tokens + `.dark` overrides, persisted theme toggle, refined glass/elevation/seasonal accent tokens. Existing components keep semantic tokens, so both modes work.
2. **Live data layer**: `createServerFn` weather service (current + 7-day forecast + AQI + sunrise/sunset + local time), cached in `weather_cache` with a freshness window, graceful "Live data currently unavailable" state, and an explicit `updated_at` + source label on every live widget. Live / forecast / general data are visually distinguished.
3. **Explore India dashboard** (`/india`): hero with the current season, filter rail (state, region, experience, season, current condition), destination cards with live temperature chips, skeletons, pagination, mobile-first layout.
4. **Destination detail** (`/india/$state/$destination`): image hero with live conditions strip, "What can I do right now?" (rules over live weather + season + activity tags, indoor fallback on bad weather), Best Time to Visit as a visual month band (weather / activities / crowd / budget), seasonal gallery, nearby & similar destinations, "Plan this trip" hand-off into the existing itinerary builder.
5. **Seasonal homepage section**: "Where should you travel right now?" ranked by current month, live weather fit, activity match and popularity — recomputed server-side, changes through the year.
6. **Performance & resilience**: lazy images with sizing, route-level code splitting, Query caching, loading skeletons, error boundaries, no secrets in client code.

## Later phases (after Phase 1 lands)

- **Phase 2**: interactive India map (clickable states → destinations, live weather popovers), destination comparison, smart natural-language search ("snow places in December").
- **Phase 3**: AI assistant + trip planner via Lovable AI — conversational intake (dates, party, budget, interests, style), day-by-day itinerary with timings, transport, food, costs, rest and weather-aware alternatives, saved into `trips`/`stops`/`activities` so the existing builder can edit it.
- **Phase 4**: personalization (saved preferences, revisit ranking), expansion beyond India.

## Technical notes

- Weather fetches live only in server functions; the client never calls third-party APIs directly.
- Every route gets its own `head()` metadata (title, description, og/twitter) for SEO; destination pages emit JSON-LD `TouristDestination`.
- The 3D video background is retained on auth/dashboard but not loaded on the new content-heavy discovery pages, for performance.
