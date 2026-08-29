import { useQuery } from "@tanstack/react-query";

import { getLiveAirQuality, getLiveWeather } from "@/server-fns/weather";
import type { TelemetryResult } from "@/lib/weather";

export interface LiveTelemetry {
  loading: boolean;
  weather: TelemetryResult<import("@/lib/weather").LiveWeatherReading> | null;
  air: TelemetryResult<import("@/lib/weather").LiveAirQualityReading> | null;
  refetch: () => void;
}

export function useLiveTelemetry(
  latitude: number | null | undefined,
  longitude: number | null | undefined,
  enabled = latitude != null && longitude != null,
): LiveTelemetry {
  const lat = latitude ?? 0;
  const lng = longitude ?? 0;

  const weather = useQuery({
    queryKey: ["live-weather", lat, lng],
    queryFn: () => getLiveWeather({ data: { latitude: lat, longitude: lng } }),
    enabled,
    staleTime: 60_000,
    refetchInterval: 8 * 60_000,
    retry: 1,
  });

  const air = useQuery({
    queryKey: ["live-air", lat, lng],
    queryFn: () => getLiveAirQuality({ data: { latitude: lat, longitude: lng } }),
    enabled,
    staleTime: 60_000,
    refetchInterval: 8 * 60_000,
    retry: 1,
  });

  return {
    loading: weather.isFetching || air.isFetching,
    weather: (weather.data ?? null) as LiveTelemetry["weather"],
    air: (air.data ?? null) as LiveTelemetry["air"],
    refetch: () => {
      weather.refetch();
      air.refetch();
    },
  };
}