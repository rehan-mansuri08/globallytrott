// Server-only weather/AQI proxies.
//
// Open-Meteo is keyless (no secrets to leak), so these RPCs proxy outbound
// calls from the server, cache aggressively, rate-limit per IP, and write
// through to the weather_cache table when a service-role key is available.
// Any failure degrades to { status: "offline" } so the client can fall back
// to seasonal averages — live metrics are never invented.

import { createServerFn } from "@tanstack/react-start";

import {
  weatherCodeToCondition,
  type LiveAirQualityReading,
  type LiveWeatherReading,
  type TelemetryResult,
} from "../lib/weather";

export const CACHE_TTL_MS = 15 * 60 * 1000;
export const OPEN_METEO_FORECAST_URL = "https://api.open-meteo.com/v1/forecast";
export const OPEN_METEO_AIR_QUALITY_URL = "https://air-quality-api.open-meteo.com/v1/air-quality";

const memoryCache = new Map<string, { cachedAt: number; payload: unknown }>();

const rateBuckets = new Map<string, { count: number; resetAt: number }>();
const RATE_LIMIT = { max: 30, windowMs: 60_000 };

function cacheKey(lat: number, lng: number): string {
  return `${lat.toFixed(2)},${lng.toFixed(2)}`;
}

function cacheGet<T>(key: string): T | undefined {
  const entry = memoryCache.get(key);
  if (!entry) return undefined;
  if (Date.now() - entry.cachedAt > CACHE_TTL_MS) {
    memoryCache.delete(key);
    return undefined;
  }
  return entry.payload as T;
}

function cacheSet(key: string, payload: unknown): void {
  memoryCache.set(key, { cachedAt: Date.now(), payload });
}

function ipFromRequest(request: Request): string {
  const fwd = request.headers.get("x-forwarded-for");
  if (fwd) return fwd.split(",")[0]?.trim() ?? "unknown";
  return "unknown";
}

function allowRequest(ip: string): boolean {
  const now = Date.now();
  const bucket = rateBuckets.get(ip);
  if (!bucket || now > bucket.resetAt) {
    rateBuckets.set(ip, { count: 1, resetAt: now + RATE_LIMIT.windowMs });
    return true;
  }
  bucket.count += 1;
  return bucket.count <= RATE_LIMIT.max;
}

function normalize(lat: number, lng: number): { latitude: number; longitude: number } {
  const latitude = Math.max(-90, Math.min(90, Number(lat) || 0));
  const longitude = Math.max(-180, Math.min(180, Number(lng) || 0));
  return { latitude, longitude };
}

async function persistToCache(
  cacheKeyValue: string,
  payload: unknown,
): Promise<void> {
  try {
    const { supabaseAdmin } = await import("../integrations/supabase/client.server");
    await supabaseAdmin
      .from("weather_cache")
      .upsert(
        { cache_key: cacheKeyValue, payload: payload as object, fetched_at: new Date().toISOString() },
        { onConflict: "cache_key" },
      );
  } catch {
    // Service-role key absent, DB unreachable, etc. — never block the live path.
  }
}

export const getLiveWeather = createServerFn({ method: "GET", proxyHeaders: true }).handler(
  async ({ request, data }: { request: Request; data: { latitude: number; longitude: number } }) => {
    const ip = ipFromRequest(request);
    if (!allowRequest(ip)) {
      return {
        status: "offline",
        error: "Rate limited — try again shortly.",
        fetchedAt: new Date().toISOString(),
      } as TelemetryResult<LiveWeatherReading>;
    }

    const { latitude, longitude } = normalize(data.latitude, data.longitude);
    const key = `ow:${cacheKey(latitude, longitude)}`;
    const cached = cacheGet<TelemetryResult<LiveWeatherReading>>(key);
    if (cached) return cached;

    try {
      const params = new URLSearchParams({
        latitude: String(latitude),
        longitude: String(longitude),
        current:
          "temperature_2m,apparent_temperature,relative_humidity_2m,is_day,weather_code,precipitation_probability,wind_speed_10m,wind_direction_10m,uv_index",
        hourly: "temperature_2m,precipitation_probability,weather_code",
        daily: "temperature_2m_max,temperature_2m_min,precipitation_probability_max,weather_code,sunrise,sunset",
        timezone: "auto",
        forecast_days: "7",
      });

      const res = await fetch(`${OPEN_METEO_FORECAST_URL}?${params}`, {
        signal: AbortSignal.timeout(6_000),
      });
      if (!res.ok) throw new Error(`Open-Meteo forecast ${res.status}`);

      const json = (await res.json()) as Record<string, unknown>;

      const current = (json.current ?? {}) as Record<string, number | string>;
      const hourlyRaw = (json.hourly ?? {}) as Record<string, unknown>;
      const dailyRaw = (json.daily ?? {}) as Record<string, unknown>;

      const hourTimes = (hourlyRaw.time ?? []) as string[];
      const hourTemps = (hourlyRaw.temperature_2m ?? []) as number[];
      const hourPcp = (hourlyRaw.precipitation_probability ?? []) as number[];
      const hourCodes = (hourlyRaw.weather_code ?? []) as number[];

      const hourly = hourTimes.slice(0, 24).map((time, i) => ({
        time,
        temperatureC: hourTemps[i] ?? null,
        precipitationProbPct: hourPcp[i] ?? null,
        weatherCode: hourCodes[i] ?? null,
      }));

      const dayDates = (dailyRaw.time ?? []) as string[];
      const dayMax = (dailyRaw.temperature_2m_max ?? []) as number[];
      const dayMin = (dailyRaw.temperature_2m_min ?? []) as number[];
      const dayPcp = (dailyRaw.precipitation_probability_max ?? []) as number[];
      const dayCodes = (dailyRaw.weather_code ?? []) as number[];
      const daySunrise = (dailyRaw.sunrise ?? []) as string[];
      const daySunset = (dailyRaw.sunset ?? []) as string[];

      const daily = dayDates.map((date, i) => ({
        date,
        tempMaxC: dayMax[i] ?? null,
        tempMinC: dayMin[i] ?? null,
        precipitationProbPct: dayPcp[i] ?? null,
        weatherCode: dayCodes[i] ?? null,
      }));

      const weatherCode = typeof current.weather_code === "number" ? current.weather_code : null;

      const reading: LiveWeatherReading = {
        temperatureC:
          typeof current.temperature_2m === "number" ? current.temperature_2m : null,
        apparentTemperatureC:
          typeof current.apparent_temperature === "number"
            ? current.apparent_temperature
            : null,
        humidityPct:
          typeof current.relative_humidity_2m === "number"
            ? current.relative_humidity_2m
            : null,
        windSpeedKmh:
          typeof current.wind_speed_10m === "number" ? current.wind_speed_10m : null,
        windDirectionDeg:
          typeof current.wind_direction_10m === "number"
            ? current.wind_direction_10m
            : null,
        precipitationProbabilityPct:
          typeof current.precipitation_probability === "number"
            ? current.precipitation_probability
            : null,
        uvIndex: typeof current.uv_index === "number" ? current.uv_index : null,
        condition: weatherCodeToCondition(weatherCode ?? -1),
        isDay: typeof current.is_day === "number" ? current.is_day === 1 : true,
        sunrise: daySunrise[0] ?? null,
        sunset: daySunset[0] ?? null,
        timezone:
          typeof json.timezone === "string"
            ? (json.timezone as string)
            : null,
        localTime:
          typeof json.time === "string" ? (json.time as string) : null,
        weatherCode,
        hourly,
        daily,
      };

      const result: TelemetryResult<LiveWeatherReading> = {
        status: "live",
        data: reading,
        fetchedAt: new Date().toISOString(),
      };

      cacheSet(key, result);
      void persistToCache(`ow:${cacheKey(latitude, longitude)}`, reading);
      return result;
    } catch (error) {
      const message = error instanceof Error ? error.message : "Telemetry fetch failed";
      const result: TelemetryResult<LiveWeatherReading> = {
        status: "offline",
        error: message,
        fetchedAt: new Date().toISOString(),
      };
      cacheSet(key, result);
      return result;
    }
  },
);

export const getLiveAirQuality = createServerFn({
  method: "GET",
  proxyHeaders: true,
}).handler(
  async ({ request, data }: { request: Request; data: { latitude: number; longitude: number } }) => {
    const ip = ipFromRequest(request);
    if (!allowRequest(ip)) {
      return {
        status: "offline",
        error: "Rate limited — try again shortly.",
        fetchedAt: new Date().toISOString(),
      } as TelemetryResult<LiveAirQualityReading>;
    }

    const { latitude, longitude } = normalize(data.latitude, data.longitude);
    const key = `aqi:${cacheKey(latitude, longitude)}`;
    const cached = cacheGet<TelemetryResult<LiveAirQualityReading>>(key);
    if (cached) return cached;

    try {
      const params = new URLSearchParams({
        latitude: String(latitude),
        longitude: String(longitude),
        current: "us_aqi,pm2_5,pm10",
        timezone: "auto",
      });

      const res = await fetch(`${OPEN_METEO_AIR_QUALITY_URL}?${params}`, {
        signal: AbortSignal.timeout(6_000),
      });
      if (!res.ok) throw new Error(`Open-Meteo air quality ${res.status}`);

      const json = (await res.json()) as { current?: Record<string, number> };
      const current = json.current ?? {};

      const reading: LiveAirQualityReading = {
        usAqi: typeof current.us_aqi === "number" ? current.us_aqi : null,
        pm25: typeof current.pm2_5 === "number" ? current.pm2_5 : null,
        pm10: typeof current.pm10 === "number" ? current.pm10 : null,
        category: "Good",
      };

      const { aqiCategory } = await import("../lib/weather");
      reading.category = aqiCategory(reading.usAqi);

      const result: TelemetryResult<LiveAirQualityReading> = {
        status: "live",
        data: reading,
        fetchedAt: new Date().toISOString(),
      };

      cacheSet(key, result);
      void persistToCache(`aqi:${cacheKey(latitude, longitude)}`, reading);
      return result;
    } catch (error) {
      const message = error instanceof Error ? error.message : "AQI fetch failed";
      const result: TelemetryResult<LiveAirQualityReading> = {
        status: "offline",
        error: message,
        fetchedAt: new Date().toISOString(),
      };
      cacheSet(key, result);
      return result;
    }
  },
);