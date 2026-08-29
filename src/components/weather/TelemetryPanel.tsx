import {
  Area,
  AreaChart,
  CartesianGrid,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from "recharts";

import { Badge } from "@/components/ui/badge";

import { AqiGauge } from "./AqiGauge";
import {
  aqiPristineLabel,
  conditionLabel,
  formatUpdatedAgo,
  TELEMETRY_OFFLINE_LABEL,
  type LiveAirQualityReading,
  type LiveWeatherReading,
} from "@/lib/weather";
import { cn } from "@/lib/utils";

export interface TelemetryPanelProps {
  weather: LiveWeatherReading | null;
  air: LiveAirQualityReading | null;
  fetchedAt: string | null;
  fallbackNote?: string;
  compact?: boolean;
  className?: string;
}

function hourLabel(iso: string): string {
  const d = new Date(iso);
  const h = d.getUTCHours();
  const suffix = h < 12 ? "am" : "pm";
  return `${h % 12 === 0 ? 12 : h % 12}${suffix}`;
}

export function TelemetryPanel({
  weather,
  air,
  fetchedAt,
  fallbackNote,
  compact,
  className,
}: TelemetryPanelProps) {
  const offline = !weather;
  if (offline && !fallbackNote) fallbackNote = TELEMETRY_OFFLINE_LABEL;

  const t = weather;
  const curve =
    t?.hourly.map((h) => ({
      time: hourLabel(h.time),
      temp: h.temperatureC,
      rain: h.precipitationProbPct,
    })) ?? [];

  const windBearing = t?.windDirectionDeg ?? null;
  const windDir =
    windBearing == null
      ? "—"
      : `${["N", "NE", "E", "SE", "S", "SW", "W", "NW"][Math.round(windBearing / 45) % 8]}${Math.round(windBearing)}°`;

  return (
    <div className={cn("space-y-4", className)}>
      {offline && (
        <Badge
          variant="outline"
          className="border-amber-500/40 bg-amber-500/10 px-3 py-1 text-amber-300"
        >
          <span className="mr-2 inline-block h-2 w-2 rounded-full bg-amber-400" />
          {fallbackNote}
        </Badge>
      )}

      {t && (
        <>
          <div className="flex flex-wrap items-center justify-between gap-3">
            <div className="flex items-end gap-2">
              <span className="font-display text-5xl font-semibold tracking-tight">
                {t.temperatureC != null ? `${Math.round(t.temperatureC)}°` : "—"}
              </span>
              <span className="pb-1.5 text-base text-muted-foreground">C</span>
              <span className="pb-1.5 text-sm capitalize text-muted-foreground">
                · {conditionLabel(t.condition, t.isDay)}
              </span>
            </div>
            {fetchedAt && <span className="mono-label">{formatUpdatedAgo(fetchedAt)}</span>}
          </div>

          <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
            <Metric
              label="RealFeel"
              value={
                t.apparentTemperatureC != null ? `${Math.round(t.apparentTemperatureC)}°` : "—"
              }
            />
            <Metric
              label="Humidity"
              value={t.humidityPct != null ? `${Math.round(t.humidityPct)}%` : "—"}
            />
            <Metric
              label="Wind"
              value={t.windSpeedKmh != null ? `${Math.round(t.windSpeedKmh)} km/h` : "—"}
              sub={windDir}
            />
            <Metric
              label="Rain"
              value={
                t.precipitationProbabilityPct != null ? `${t.precipitationProbabilityPct}%` : "—"
              }
            />
          </div>

          {!compact && (
            <div className="h-40">
              <ResponsiveContainer width="100%" height="100%">
                <AreaChart data={curve} margin={{ top: 4, right: 4, bottom: 0, left: -24 }}>
                  <defs>
                    <linearGradient id="tempFill" x1="0" y1="0" x2="0" y2="1">
                      <stop offset="0%" stopColor="var(--chart-1)" stopOpacity={0.45} />
                      <stop offset="100%" stopColor="var(--chart-1)" stopOpacity={0} />
                    </linearGradient>
                  </defs>
                  <CartesianGrid stroke="var(--border)" strokeDasharray="3 3" vertical={false} />
                  <XAxis
                    dataKey="time"
                    tick={{ fontSize: 10, fill: "var(--muted-foreground)" }}
                    tickLine={false}
                    axisLine={false}
                    interval={3}
                  />
                  <YAxis
                    tick={{ fontSize: 10, fill: "var(--muted-foreground)" }}
                    tickLine={false}
                    axisLine={false}
                    width={40}
                  />
                  <Tooltip
                    contentStyle={{
                      background: "var(--popover)",
                      border: "1px solid var(--border)",
                      borderRadius: 12,
                      fontSize: 12,
                    }}
                    labelStyle={{ color: "var(--muted-foreground)" }}
                  />
                  <Area
                    type="monotone"
                    dataKey="temp"
                    stroke="var(--chart-1)"
                    strokeWidth={2}
                    fill="url(#tempFill)"
                    name="°C"
                  />
                </AreaChart>
              </ResponsiveContainer>
            </div>
          )}
        </>
      )}

      <AqiGauge aqi={air?.usAqi ?? null} />

      {air && (
        <div className="flex flex-wrap items-center gap-x-4 gap-y-1 text-xs text-muted-foreground">
          <span>PM2.5 {air.pm25 != null ? `${Math.round(air.pm25)} µg` : "—"}</span>
          <span>PM10 {air.pm10 != null ? `${Math.round(air.pm10)} µg` : "—"}</span>
          <span>{air.usAqi != null ? aqiPristineLabel(air.usAqi) : ""}</span>
        </div>
      )}

      {t?.sunrise && t?.sunset && (
        <div className="flex items-center gap-4 text-xs text-muted-foreground">
          <span>Sunrise {styleTime(t.sunrise)}</span>
          <span className="text-border">|</span>
          <span>Sunset {styleTime(t.sunset)}</span>
        </div>
      )}

      {t && !compact && t.daily.length > 0 && (
        <div className="grid grid-cols-7 gap-1">
          {t.daily.slice(0, 7).map((d) => (
            <div key={d.date} className="rounded-lg border border-border/60 p-1.5 text-center">
              <div className="text-[10px] uppercase text-muted-foreground">{dayShort(d.date)}</div>
              <div className="text-sm font-medium">
                {d.tempMaxC != null ? `${Math.round(d.tempMaxC)}°` : "—"}
              </div>
              <div className="text-[10px] text-muted-foreground">
                {d.tempMinC != null ? `${Math.round(d.tempMinC)}°` : ""}
              </div>
              <div className="mt-0.5 text-[10px] text-sky-300/80">
                {d.precipitationProbPct != null && d.precipitationProbPct >= 30
                  ? `${Math.round(d.precipitationProbPct)}%`
                  : ""}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

function Metric({ label, value, sub }: { label: string; value: string; sub?: string }) {
  return (
    <div className="rounded-lg border border-border/60 bg-muted/20 p-3">
      <div className="mono-label">{label}</div>
      <div className="mt-1 font-display text-lg font-semibold leading-none">{value}</div>
      {sub && <div className="mt-1 text-[10px] text-muted-foreground">{sub}</div>}
    </div>
  );
}

function styleTime(iso: string): string {
  const d = new Date(iso);
  let h = d.getUTCHours();
  const m = String(d.getUTCMinutes()).padStart(2, "0");
  const ampm = h < 12 ? "AM" : "PM";
  h = h % 12 === 0 ? 12 : h % 12;
  return `${h}:${m} ${ampm}`;
}

function dayShort(date: string): string {
  const d = new Date(`${date}T00:00:00`);
  return d.toLocaleDateString("en-US", { weekday: "short" });
}
