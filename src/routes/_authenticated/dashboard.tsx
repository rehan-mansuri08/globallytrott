import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { ArrowUpRight, CalendarDays, MapPin, Plus, Wallet } from "lucide-react";

import { SceneBackground } from "@/components/scene/SceneBackground";
import { TopNav } from "@/components/TopNav";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";
import { supabase } from "@/integrations/supabase/client";

export const Route = createFileRoute("/_authenticated/dashboard")({
  head: () => ({
    meta: [
      { title: "Dashboard — GlobeTrotter" },
      {
        name: "description",
        content:
          "Your GlobeTrotter dashboard: upcoming trips, budget highlights and quick trip planning.",
      },
      { property: "og:title", content: "Dashboard — GlobeTrotter" },
      {
        property: "og:description",
        content: "Upcoming trips, budget highlights and quick trip planning.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: Dashboard,
});

const currency = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
  maximumFractionDigits: 0,
});

function useDashboardData() {
  return useQuery({
    queryKey: ["dashboard"],
    queryFn: async () => {
      const { data: userData } = await supabase.auth.getUser();
      const user = userData.user;

      const [{ data: profile }, { data: trips }, { data: activities }] =
        await Promise.all([
          supabase.from("profiles").select("display_name").maybeSingle(),
          supabase
            .from("trips")
            .select("id, name, destination, start_date, end_date, budget")
            .order("start_date", { ascending: true, nullsFirst: false }),
          supabase.from("activities").select("cost"),
        ]);

      const totalBudget = (trips ?? []).reduce((sum, t) => sum + Number(t.budget ?? 0), 0);
      const spent = (activities ?? []).reduce((sum, a) => sum + Number(a.cost ?? 0), 0);

      return {
        name: profile?.display_name || user?.email?.split("@")[0] || "traveller",
        email: user?.email ?? "",
        trips: trips ?? [],
        totalBudget,
        spent,
      };
    },
  });
}

function Panel({
  children,
  className = "",
}: {
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <section className={`glass rounded-2xl p-6 ${className}`}>{children}</section>
  );
}

function Dashboard() {
  const { data, isLoading } = useDashboardData();

  const upcoming = (data?.trips ?? []).filter(
    (t) => !t.end_date || new Date(t.end_date) >= new Date(),
  );
  const remaining = (data?.totalBudget ?? 0) - (data?.spent ?? 0);
  const usedPct =
    data && data.totalBudget > 0
      ? Math.min(100, Math.round((data.spent / data.totalBudget) * 100))
      : 0;

  return (
    <div className="relative min-h-screen">
      <SceneBackground dimmed />
      <TopNav name={data?.name ?? ""} email={data?.email ?? ""} />

      <main className="mx-auto max-w-6xl px-4 py-8">
        <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
          {/* Welcome */}
          <Panel className="md:col-span-2">
            <p className="mono-label">welcome back</p>
            {isLoading ? (
              <Skeleton className="mt-4 h-9 w-64" />
            ) : (
              <h1 className="mt-3 text-3xl font-semibold sm:text-4xl">
                Hey {data?.name}, where to <span className="text-gradient">next</span>?
              </h1>
            )}
            <p className="mt-3 max-w-lg text-sm text-muted-foreground">
              {upcoming.length > 0
                ? `You have ${upcoming.length} trip${upcoming.length > 1 ? "s" : ""} on the horizon. Keep the itinerary tight and the budget tighter.`
                : "No trips planned yet. Start with a destination and build the itinerary stop by stop."}
            </p>
          </Panel>

          {/* CTA */}
          <Panel className="flex flex-col justify-between bg-primary/5">
            <div>
              <p className="mono-label">new itinerary</p>
              <h2 className="mt-3 text-xl font-semibold">Plan a new trip</h2>
              <p className="mt-2 text-sm text-muted-foreground">
                Cities, stops, activities and costs — laid out on one timeline.
              </p>
            </div>
            <Button className="mt-6 w-full glow" size="lg" onClick={() => window.location.assign("/itinerary")}>
              <Plus /> Plan New Trip
            </Button>
          </Panel>

          {/* Upcoming trips */}
          <Panel className="md:col-span-2">
            <div className="flex items-center justify-between">
              <p className="mono-label">upcoming trips</p>
              <CalendarDays className="size-4 text-muted-foreground" />
            </div>

            <ul className="mt-5 space-y-3">
              {isLoading &&
                [0, 1, 2].map((i) => <Skeleton key={i} className="h-16 w-full rounded-xl" />)}

              {!isLoading && upcoming.length === 0 && (
                <li className="rounded-xl border border-dashed border-border p-6 text-center text-sm text-muted-foreground">
                  Nothing scheduled. Your first trip will appear here.
                </li>
              )}

              {!isLoading &&
                upcoming.slice(0, 4).map((trip) => (
                  <li
                    key={trip.id}
                    className="flex items-center justify-between rounded-xl bg-secondary/30 px-4 py-3 transition-colors hover:bg-secondary/50"
                  >
                    <div className="min-w-0">
                      <p className="truncate text-sm font-medium">{trip.name}</p>
                      <p className="mt-1 flex items-center gap-1.5 truncate text-xs text-muted-foreground">
                        <MapPin className="size-3" />
                        {trip.destination ?? "Destination TBD"}
                        {trip.start_date ? ` · ${trip.start_date}` : ""}
                      </p>
                    </div>
                    <div className="flex items-center gap-3 pl-4">
                      <span className="font-mono text-xs text-primary">
                        {currency.format(Number(trip.budget ?? 0))}
                      </span>
                      <ArrowUpRight className="size-4 text-muted-foreground" />
                    </div>
                  </li>
                ))}
            </ul>
          </Panel>

          {/* Budget */}
          <Panel>
            <div className="flex items-center justify-between">
              <p className="mono-label">budget highlights</p>
              <Wallet className="size-4 text-muted-foreground" />
            </div>

            {isLoading ? (
              <Skeleton className="mt-5 h-24 w-full" />
            ) : (
              <>
                <p className="mt-5 font-display text-3xl font-semibold">
                  {currency.format(remaining)}
                </p>
                <p className="mt-1 text-xs text-muted-foreground">
                  remaining of {currency.format(data?.totalBudget ?? 0)} planned
                </p>

                <div className="mt-5 h-2 w-full overflow-hidden rounded-full bg-secondary/50">
                  <div
                    className="h-full rounded-full"
                    style={{
                      width: `${usedPct}%`,
                      background: "var(--gradient-primary)",
                    }}
                  />
                </div>

                <dl className="mt-5 grid grid-cols-2 gap-3 text-sm">
                  <div>
                    <dt className="text-xs text-muted-foreground">Committed</dt>
                    <dd className="font-mono">{currency.format(data?.spent ?? 0)}</dd>
                  </div>
                  <div>
                    <dt className="text-xs text-muted-foreground">Used</dt>
                    <dd className="font-mono">{usedPct}%</dd>
                  </div>
                </dl>
              </>
            )}
          </Panel>
        </div>
      </main>
    </div>
  );
}
