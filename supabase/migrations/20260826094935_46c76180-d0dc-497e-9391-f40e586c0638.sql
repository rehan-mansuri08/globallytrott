CREATE TABLE public.regions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  parent_id uuid REFERENCES public.regions(id) ON DELETE CASCADE,
  kind text NOT NULL CHECK (kind IN ('world','continent','country','state','union_territory','region','city')),
  name text NOT NULL,
  slug text NOT NULL,
  code text,
  capital text,
  summary text,
  best_seasons text[] NOT NULL DEFAULT '{}',
  tags text[] NOT NULL DEFAULT '{}',
  latitude numeric,
  longitude numeric,
  sort integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (kind, slug)
);

CREATE TABLE public.destinations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  region_id uuid NOT NULL REFERENCES public.regions(id) ON DELETE CASCADE,
  name text NOT NULL,
  slug text NOT NULL,
  kind text NOT NULL DEFAULT 'destination',
  summary text,
  description text,
  latitude numeric NOT NULL,
  longitude numeric NOT NULL,
  altitude_m integer,
  wikipedia_title text,
  experience_tags text[] NOT NULL DEFAULT '{}',
  season_tags text[] NOT NULL DEFAULT '{}',
  best_months integer[] NOT NULL DEFAULT '{}',
  recommended_days text,
  budget_level text,
  popularity integer NOT NULL DEFAULT 50,
  is_hidden_gem boolean NOT NULL DEFAULT false,
  famous_food text[] NOT NULL DEFAULT '{}',
  festivals text[] NOT NULL DEFAULT '{}',
  local_experiences text[] NOT NULL DEFAULT '{}',
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (region_id, slug)
);

CREATE TABLE public.destination_seasons (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  destination_id uuid NOT NULL REFERENCES public.destinations(id) ON DELETE CASCADE,
  label text NOT NULL,
  months integer[] NOT NULL,
  weather text,
  activities text[] NOT NULL DEFAULT '{}',
  crowd text,
  budget text,
  rating text,
  notes text,
  sort integer NOT NULL DEFAULT 0
);

CREATE TABLE public.destination_activities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  destination_id uuid NOT NULL REFERENCES public.destinations(id) ON DELETE CASCADE,
  title text NOT NULL,
  description text,
  icon text,
  experience_tag text,
  season_tags text[] NOT NULL DEFAULT '{}',
  months integer[] NOT NULL DEFAULT '{}',
  is_indoor boolean NOT NULL DEFAULT false,
  weather_conditions text[] NOT NULL DEFAULT '{}',
  sort integer NOT NULL DEFAULT 0
);

CREATE TABLE public.destination_images (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  destination_id uuid NOT NULL REFERENCES public.destinations(id) ON DELETE CASCADE,
  url text NOT NULL,
  thumb_url text,
  alt text,
  credit text,
  license text,
  source_url text,
  season_tag text,
  category text,
  sort integer NOT NULL DEFAULT 0
);

CREATE TABLE public.weather_cache (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cache_key text NOT NULL UNIQUE,
  payload jsonb NOT NULL,
  fetched_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE public.media_cache (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cache_key text NOT NULL UNIQUE,
  payload jsonb NOT NULL,
  fetched_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX regions_parent_idx ON public.regions(parent_id);
CREATE INDEX destinations_region_idx ON public.destinations(region_id);
CREATE INDEX destinations_slug_idx ON public.destinations(slug);
CREATE INDEX destination_seasons_dest_idx ON public.destination_seasons(destination_id);
CREATE INDEX destination_activities_dest_idx ON public.destination_activities(destination_id);
CREATE INDEX destination_images_dest_idx ON public.destination_images(destination_id);

GRANT SELECT ON public.regions TO anon, authenticated;
GRANT SELECT ON public.destinations TO anon, authenticated;
GRANT SELECT ON public.destination_seasons TO anon, authenticated;
GRANT SELECT ON public.destination_activities TO anon, authenticated;
GRANT SELECT ON public.destination_images TO anon, authenticated;
GRANT SELECT ON public.weather_cache TO anon, authenticated;
GRANT SELECT ON public.media_cache TO anon, authenticated;
GRANT ALL ON public.regions TO service_role;
GRANT ALL ON public.destinations TO service_role;
GRANT ALL ON public.destination_seasons TO service_role;
GRANT ALL ON public.destination_activities TO service_role;
GRANT ALL ON public.destination_images TO service_role;
GRANT ALL ON public.weather_cache TO service_role;
GRANT ALL ON public.media_cache TO service_role;

ALTER TABLE public.regions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.destinations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.destination_seasons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.destination_activities ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.destination_images ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.weather_cache ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.media_cache ENABLE ROW LEVEL SECURITY;

CREATE POLICY "regions are public" ON public.regions FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "destinations are public" ON public.destinations FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "destination_seasons are public" ON public.destination_seasons FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "destination_activities are public" ON public.destination_activities FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "destination_images are public" ON public.destination_images FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "weather_cache is public" ON public.weather_cache FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "media_cache is public" ON public.media_cache FOR SELECT TO anon, authenticated USING (true);

CREATE TRIGGER regions_updated_at BEFORE UPDATE ON public.regions FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
CREATE TRIGGER destinations_updated_at BEFORE UPDATE ON public.destinations FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

INSERT INTO public.regions (kind, name, slug, code, summary, best_seasons, tags, latitude, longitude, sort)
VALUES ('country', 'India', 'india', 'IN', 'A subcontinent of snow peaks, deserts, backwaters, beaches and living history — with a different season worth chasing every month of the year.', ARRAY['winter','spring','monsoon','autumn','summer'], ARRAY['mountains','beaches','wildlife','history','culture','spiritual','food'], 22.5937, 78.9629, 1);