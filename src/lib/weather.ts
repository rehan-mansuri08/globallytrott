// Shared types + formatters for the real-time weather/AQI layer.
// Safe to import from both client and server bundles.

export type WeatherCondition =
  | "clear"
  | "partly-cloudy"
  | "cloudy"
  | "fog"
  | "drizzle"
  | "rain"
  | "showers"
  | "snow"
  | "thunderstorm"
  | "unknown";

export interface HourlyReading {
  time: string;
  temperatureC: number | null;
  precipitationProbPct: number | null;
  weatherCode: number | null;
}

export interface DailyReading {
  date: string;
  tempMaxC: number | null;
  tempMinC: number | null;
  precipitationProbPct: number | null;
  weatherCode: number | null;
}

export interface LiveWeatherReading {
  temperatureC: number | null;
  apparentTemperatureC: number | null;
  humidityPct: number | null;
  windSpeedKmh: number | null;
  windDirectionDeg: number | null;
  precipitationProbabilityPct: number | null;
  uvIndex: number | null;
  condition: WeatherCondition;
  isDay: boolean;
  sunrise: string | null;
  sunset: string | null;
  timezone: string | null;
  localTime: string | null;
  weatherCode: number | null;
  hourly: HourlyReading[];
  daily: DailyReading[];
}

export interface LiveAirQualityReading {
  usAqi: number | null;
  pm25: number | null;
  pm10: number | null;
  category: string;
}

export type TelemetryResult<T> =
  | { status: "live"; data: T; fetchedAt: string }
  | { status: "offline"; error: string; fetchedAt: string };

export const TELEMETRY_OFFLINE_LABEL =
  "Live telemetry temporarily offline — displaying seasonal historical average.";

/** WMO weather-interpretation-codes → normalized condition. */
export function weatherCodeToCondition(code: number): WeatherCondition {
  if (code === 0) return "clear";
  if (code === 1) return "partly-cloudy";
  if (code === 2) return "partly-cloudy";
  if (code === 3) return "cloudy";
  if (code === 45 || code === 48) return "fog";
  if (code >= 51 && code <= 57) return "drizzle";
  if (code >= 61 && code <= 67) return "rain";
  if (code >= 71 && code <= 77) return "snow";
  if (code >= 80 && code <= 82) return "showers";
  if (code >= 85 && code <= 86) return "snow";
  if (code >= 95) return "thunderstorm";
  return "unknown";
}

export function conditionLabel(
  condition: WeatherCondition,
  isDay = true,
): string {
  switch (condition) {
    case "clear":
      return isDay ? "Clear Sky" : "Clear Night";
    case "partly-cloudy":
      return isDay ? "Partly Cloudy" : "Partly Cloudy Night";
    case "cloudy":
      return "Overcast";
    case "fog":
      return "Mist & Fog";
    case "drizzle":
      return "Drizzle";
    case "rain":
      return isDay ? "Rain" : "Rain at Night";
    case "showers":
      return "Rain Showers";
    case "snow":
      return "Snowfall";
    case "thunderstorm":
      return "Thunderstorm";
    default:
      return "Conditions unavailable";
  }
}

export function aqiCategory(aqi: number | null): string {
  if (aqi == null) return "Unavailable";
  if (aqi <= 50) return "Good";
  if (aqi <= 100) return "Moderate";
  if (aqi <= 150) return "Unhealthy for Sensitive Groups";
  if (aqi <= 200) return "Unhealthy";
  if (aqi <= 300) return "Very Unhealthy";
  return "Hazardous";
}

export function aqiPristineLabel(aqi: number | null): string {
  if (aqi == null) return "AQI unavailable";
  if (aqi <= 50) return "Pristine";
  if (aqi <= 100) return "Acceptable";
  if (aqi <= 150) return "Caution";
  return "Poor";
}

/** "4 mins ago" style freshness marker. Tolerates clock skew. */
export function formatUpdatedAgo(fetchedAt: string | number | Date): string {
  const diffMs = Math.max(
    0,
    Date.now() - new Date(fetchedAt).getTime(),
  );
  const minutes = Math.floor(diffMs / 60_000);
  if (minutes < 1) return "Updated just now";
  if (minutes < 60) return `Updated ${minutes} min${minutes === 1 ? "" : "s"} ago`;
  const hours = Math.floor(minutes / 60);
  return `Updated ${hours} h ago`;
}