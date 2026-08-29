import { cn } from "@/lib/utils";
import { aqiCategory } from "@/lib/weather";

interface AqiGaugeProps {
  aqi: number | null;
  className?: string;
}

function dialColor(aqi: number): string {
  if (aqi <= 50) return "text-emerald-400 ring-emerald-400/40";
  if (aqi <= 100) return "text-yellow-300 ring-yellow-300/40";
  if (aqi <= 150) return "text-orange-400 ring-orange-400/40";
  if (aqi <= 200) return "text-red-400 ring-red-400/40";
  if (aqi <= 300) return "text-purple-400 ring-purple-400/40";
  return "text-rose-400 ring-rose-400/40";
}

export function AqiGauge({ aqi, className }: AqiGaugeProps) {
  const normalized = aqi == null ? 0 : Math.min(300, Math.max(0, aqi));
  const pct = Math.round((normalized / 300) * 100);

  return (
    <div className={cn("flex items-center gap-4", className)}>
      <div className="relative grid h-20 w-20 place-items-center">
        <svg viewBox="0 0 80 80" className="h-20 w-20 -rotate-90">
          <circle cx="40" cy="40" r="34" fill="none" strokeWidth="8" className="stroke-muted" />
          <circle
            cx="40"
            cy="40"
            r="34"
            fill="none"
            strokeWidth="8"
            strokeLinecap="round"
            strokeDasharray={`${(pct / 100) * 2 * Math.PI * 34} ${2 * Math.PI * 34}`}
            className={cn(
              "transition-all duration-700",
              aqi == null ? "stroke-muted" : dialColor(normalized),
            )}
          />
        </svg>
        <div className="absolute text-center">
          <div
            className={cn(
              "font-display text-xl font-semibold leading-none",
              aqi == null ? "text-muted-foreground" : dialColor(normalized),
            )}
          >
            {aqi ?? "–"}
          </div>
          <div className="text-[10px] text-muted-foreground">US AQI</div>
        </div>
      </div>
      <div className="space-y-0.5">
        <div className="text-sm font-medium">{aqiCategory(aqi)}</div>
        <div className="text-xs text-muted-foreground">
          {aqi != null && aqi <= 50
            ? "Pristine air — perfect for outdoor plans."
            : "Check before heavy outdoor activity."}
        </div>
      </div>
    </div>
  );
}
