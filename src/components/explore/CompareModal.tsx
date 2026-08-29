import { Dialog, DialogContent, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { Utensils, Route, Users, Heart, Snowflake, CalendarDays, Gem } from "lucide-react";

import { computeMetrics, monthLabel } from "@/lib/compare";
import type { DestinationCard } from "@/lib/catalog";

interface Props {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  destinations: DestinationCard[];
}

function DiffBar({ a, b }: { a: number; b: number }) {
  const pct = a === b ? 50 : 25 + ((a ?? 0) / (a + b)) * 50;
  return (
    <div className="mt-1.5 flex h-1 w-full overflow-hidden rounded-full bg-muted">
      <div className="bg-primary transition-all" style={{ width: `${pct}%` }} />
      <div className="bg-amber-400 transition-all" style={{ width: `${100 - pct}%` }} />
    </div>
  );
}

function money(n: number): string {
  return `₹${n.toLocaleString("en-IN")}`;
}

export function CompareModal({ open, onOpenChange, destinations }: Props) {
  const [a, b] = destinations;
  const ma = a ? computeMetrics(a) : null;
  const mb = b ? computeMetrics(b) : null;

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-h-[85vh] overflow-y-auto sm:max-w-3xl">
        <DialogHeader>
          <DialogTitle>Compare destinations</DialogTitle>
        </DialogHeader>

        {destinations.length < 2 ? (
          <p className="text-sm text-muted-foreground">
            Select two destinations to compare side by side.
          </p>
        ) : (
          <div className="grid grid-cols-[1fr_1.35fr_1.35fr] gap-4 text-sm">
            {a && ma && b && mb ? (
              <>
                <div className="space-y-4 text-xs font-medium uppercase tracking-wide text-muted-foreground">
                  <div className="flex h-28 items-start pt-2">Destination</div>
                  <div>
                    <Utensils className="mb-1 h-4 w-4" /> Daily cost est.
                  </div>
                  <div>
                    <Route className="mb-1 h-4 w-4" /> Transit complexity
                  </div>
                  <div>
                    <Users className="mb-1 h-4 w-4" /> Crowd
                  </div>
                  <div>
                    <Heart className="mb-1 h-4 w-4" /> Family-friendly
                  </div>
                  <div>
                    <Snowflake className="mb-1 h-4 w-4" /> Snow likelihood
                  </div>
                  <div>
                    <CalendarDays className="mb-1 h-4 w-4" /> Best months
                  </div>
                  <div>
                    <Gem className="mb-1 h-4 w-4" /> Hidden gem
                  </div>
                </div>

                <CompareCol d={a} m={ma} />
                <CompareCol d={b} m={mb} highlight />

                <div className="col-span-3 mt-2 flex items-center gap-2 text-[11px] text-muted-foreground">
                  <span className="inline-block h-2 w-2 rounded-full bg-primary" />
                  First destination
                  <span className="ml-auto inline-block h-2 w-2 rounded-full bg-amber-400" />
                  Second destination
                </div>
              </>
            ) : null}
          </div>
        )}
      </DialogContent>
    </Dialog>
  );
}

function CompareCol({
  d,
  m,
  highlight,
}: {
  d: DestinationCard;
  m: ReturnType<typeof computeMetrics>;
  highlight?: boolean;
}) {
  return (
    <div className={highlight ? "rounded-xl bg-muted/30 p-2" : "p-2"}>
      <div className="flex items-start justify-between gap-2">
        <div>
          <div className="text-sm font-semibold">{d.name}</div>
          <div className="text-[11px] capitalize text-muted-foreground">{d.stateName}</div>
        </div>
        <span className="rounded-md border border-border/60 px-1.5 py-0.5 text-[10px] capitalize text-muted-foreground">
          {m.costTier}
        </span>
      </div>
      <div className="mt-2 space-y-2.5 text-sm">
        <div>
          <span className="font-semibold">{money(m.dailyCost)}</span>
          <span className="text-[10px] text-muted-foreground"> /day/pp</span>
        </div>
        <div>
          <span className="text-sm">{m.transitComplexity}/5</span>
          <DiffBar a={m.transitComplexity} b={m.transitComplexity} />
        </div>
        <div className="text-sm">{m.crowdLevel}</div>
        <div className="flex items-center gap-2">
          <div className="h-1.5 w-full overflow-hidden rounded-full bg-muted">
            <div className="h-full bg-emerald-400" style={{ width: `${m.familyFriendliness}%` }} />
          </div>
          <span className="text-xs tabular-nums">{m.familyFriendliness}%</span>
        </div>
        <div className="flex items-center gap-2">
          <div className="h-1.5 w-full overflow-hidden rounded-full bg-muted">
            <div className="h-full bg-sky-400" style={{ width: `${m.snowLikelihood}%` }} />
          </div>
          <span className="text-xs tabular-nums">{m.snowLikelihood}%</span>
        </div>
        <div className="text-xs text-muted-foreground">{monthLabel(d.best_months)}</div>
        <div className="text-xs">{m.hiddenGem ? "Yes" : "No"}</div>
      </div>
    </div>
  );
}
