import { Badge } from "@/components/ui/badge";
import { Link } from "@tanstack/react-router";
import { Gem, MapPin, Heart } from "lucide-react";

import { monthLabel, deriveTerrain } from "@/lib/compare";
import { cn } from "@/lib/utils";
import type { DestinationCard } from "@/lib/catalog";

interface Props {
  destination: DestinationCard;
  image?: { url: string; alt: string } | null;
  className?: string;
  showChip?: boolean;
}

export function DestinationCardView({ destination, image, className, showChip }: Props) {
  const img = image?.url || "";
  return (
    <Link
      to="/india/$state/$destination"
      params={{ state: destination.stateSlug ?? "", destination: destination.slug }}
      className={cn(
        "group overflow-hidden rounded-2xl border border-border/70 bg-foreground/[0.03] transition-colors hover:border-primary/40",
        className,
      )}
    >
      <div className="relative aspect-[16/10] overflow-hidden">
        {img ? (
          <img
            src={img}
            alt={image?.alt || destination.name}
            loading="lazy"
            className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
          />
        ) : (
          <div className="grid h-full w-full place-items-center bg-gradient-to-br from-primary/10 to-primary/5">
            <MapPin className="h-8 w-8 text-muted-foreground/50" />
          </div>
        )}

        <div className="absolute right-3 top-3 flex gap-2">
          {showChip && (
            <Badge className="glass px-2 py-0.5 text-[10px] font-medium text-foreground">
              {deriveTerrain(destination)}
            </Badge>
          )}
          {destination.is_hidden_gem && (
            <Badge className="border-amber-400/40 bg-amber-400/15 px-2 py-0.5 text-[10px] font-medium text-amber-300">
              <Gem className="mr-1 h-3 w-3" /> Hidden gem
            </Badge>
          )}
        </div>
      </div>

      <div className="space-y-2 p-4">
        <div className="flex items-start justify-between gap-2">
          <div>
            <h3 className="font-display text-base font-semibold leading-tight group-hover:text-primary">
              {destination.name}
            </h3>
            <p className="flex items-center gap-1 text-xs capitalize text-muted-foreground">
              <MapPin className="h-3 w-3" />
              {destination.stateName}
            </p>
          </div>
          <div className="flex flex-col items-end gap-1">
            <div className="flex items-center gap-1 text-xs text-muted-foreground">
              <Heart className="h-3 w-3 fill-current text-rose-400" />
              {destination.popularity}%
            </div>
            <span className="rounded-md border border-border/60 px-1.5 py-0.5 text-[10px] font-medium capitalize text-muted-foreground">
              {destination.budget_level}
            </span>
          </div>
        </div>

        <p className="line-clamp-2 text-xs leading-relaxed text-muted-foreground">
          {destination.summary}
        </p>

        <div className="flex flex-wrap items-center gap-1.5">
          {destination.experience_tags.slice(0, 3).map((tag) => (
            <span
              key={tag}
              className="rounded-full border border-border/60 px-2 py-0.5 text-[10px] text-muted-foreground"
            >
              {tag}
            </span>
          ))}
        </div>

        {destination.best_months.length > 0 && (
          <p className="text-[11px] text-primary/80">
            Best months:{" "}
            <span className="text-muted-foreground">{monthLabel(destination.best_months)}</span>
          </p>
        )}
      </div>
    </Link>
  );
}
