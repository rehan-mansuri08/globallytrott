import {
  Bird,
  Building,
  Cable,
  Camera,
  Car,
  Castle,
  Church,
  Coffee,
  Compass,
  Drama,
  Fish,
  Flag,
  Footprints,
  Hand,
  Heart,
  Home,
  Landmark,
  Leaf,
  Mountain,
  Music,
  Palmtree,
  Sailboat,
  Shovel,
  ShoppingBag,
  Snowflake,
  Sparkles,
  Sunrise,
  Tent,
  Train,
  Trees,
  Utensils,
  Waves,
  Wind,
} from "lucide-react";

import { Badge } from "@/components/ui/badge";

import { assessActivity, type FeasibilityContext } from "@/lib/activity-engine";
import type { ActivityRow } from "@/lib/catalog";
import { cn } from "@/lib/utils";

const ICONS: Record<string, typeof Mountain> = {
  bird: Bird,
  boat: Sailboat,
  building: Building,
  cable: Cable,
  camera: Camera,
  car: Car,
  castle: Castle,
  church: Church,
  coffee: Coffee,
  compass: Compass,
  fish: Fish,
  flag: Flag,
  golf: Compass,
  hand: Hand,
  heart: Heart,
  home: Home,
  landmark: Landmark,
  leaf: Leaf,
  "tree-pine": Trees,
  drama: Drama,
  mountain: Mountain,
  music: Music,
  palmtree: Palmtree,
  shopping: ShoppingBag,
  snowflake: Snowflake,
  shovel: Shovel,
  sparkles: Sparkles,
  sunrise: Sunrise,
  tent: Tent,
  train: Train,
  utensils: Utensils,
  waves: Waves,
  walk: Footprints,
  wind: Wind,
  animal: Bird,
  eye: Camera,
  globe: Compass,
};

interface Props {
  activities: ActivityRow[];
  context: FeasibilityContext;
}

const ORDER: Record<string, number> = {
  active: 0,
  restricted: 1,
  weather_off: 2,
  offseason: 3,
};

const STYLE: Record<string, string> = {
  active: "border-emerald-400/30 bg-emerald-400/[0.06]",
  restricted: "border-amber-400/30 bg-amber-400/[0.06]",
  weather_off: "border-sky-400/30 bg-sky-400/[0.06]",
  offseason: "border-border/50 bg-muted/20 opacity-70",
};

export function ActivityFeasibilityList({ activities, context }: Props) {
  const verdicts = activities.map((a) => ({ activity: a, verdict: assessActivity(a, context) }));
  verdicts.sort((a, b) => (ORDER[a.verdict.status] ?? 0) - (ORDER[b.verdict.status] ?? 0));

  return (
    <div className="space-y-2.5">
      {verdicts.map(({ activity, verdict }) => {
        const Icon = ICONS[activity.icon ?? ""] ?? Sparkles;
        return (
          <div
            key={activity.id}
            className={cn("rounded-xl border p-3.5 transition-colors", STYLE[verdict.status])}
          >
            <div className="flex items-start gap-3">
              <div className="grid h-9 w-9 shrink-0 place-items-center rounded-lg bg-background/60 text-primary">
                <Icon className="h-4.5 w-4.5" />
              </div>
              <div className="min-w-0 flex-1 space-y-1">
                <div className="flex flex-wrap items-center gap-2">
                  <h4 className="font-display text-sm font-medium">{activity.title}</h4>
                  <Badge
                    variant="outline"
                    className={cn(
                      "px-2 py-0 text-[10px] capitalize",
                      verdict.status === "active"
                        ? "border-emerald-400/40 text-emerald-300"
                        : "text-muted-foreground",
                    )}
                  >
                    {verdict.status === "active" ? "Active now" : verdict.label}
                  </Badge>
                </div>
                <p className="text-xs leading-relaxed text-muted-foreground">
                  {activity.description}
                </p>
                <p className="text-[11px] italic text-muted-foreground/80">{verdict.reason}</p>
              </div>
            </div>
          </div>
        );
      })}
    </div>
  );
}
