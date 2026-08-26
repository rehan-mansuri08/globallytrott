import { useQuery, useQueryClient } from "@tanstack/react-query";
import { createFileRoute } from "@tanstack/react-router";
import {
  DndContext,
  KeyboardSensor,
  PointerSensor,
  closestCenter,
  useSensor,
  useSensors,
  type DragEndEvent,
} from "@dnd-kit/core";
import {
  SortableContext,
  arrayMove,
  sortableKeyboardCoordinates,
  useSortable,
  verticalListSortingStrategy,
} from "@dnd-kit/sortable";
import { CSS } from "@dnd-kit/utilities";
import {
  CalendarDays,
  Check,
  CirclePlus,
  GripVertical,
  ImagePlus,
  MapPin,
  PlaneTakeoff,
  Plus,
  Search,
  Sparkles,
} from "lucide-react";
import { useEffect, useState } from "react";
import { toast } from "sonner";

import { TopNav } from "@/components/TopNav";
import { SceneBackground } from "@/components/scene/SceneBackground";
import { Button } from "@/components/ui/button";
import {
  CommandDialog,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
  CommandList,
  CommandShortcut,
} from "@/components/ui/command";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { supabase } from "@/integrations/supabase/client";
import type { Tables } from "@/integrations/supabase/types";

export const Route = createFileRoute("/_authenticated/itinerary")({
  head: () => ({
    meta: [
      { title: "Itinerary Builder - GlobeTrotter" },
      {
        name: "description",
        content: "Build day-wise, multi-city travel itineraries in GlobeTrotter.",
      },
    ],
  }),
  component: ItineraryBuilder,
});

type Trip = Tables<"trips">;
type Stop = Tables<"stops">;
type Activity = Tables<"activities">;
type StopWithActivities = Stop & { activities: Activity[] };
type SearchTarget =
  | { type: "city" }
  | { type: "activity"; stopId: string; day: string }
  | null;

const citySuggestions = [
  ["Tokyo", "Japan"],
  ["Kyoto", "Japan"],
  ["Seoul", "South Korea"],
  ["Singapore", "Singapore"],
  ["Bangkok", "Thailand"],
  ["Lisbon", "Portugal"],
  ["Paris", "France"],
  ["Reykjav-k", "Iceland"],
  ["New York", "United States"],
  ["Mexico City", "Mexico"],
] as const;

const activitySuggestions = [
  ["Morning coffee & neighbourhood walk", "Local ritual"],
  ["Guided food tour", "Food & drink"],
  ["Museum or gallery visit", "Culture"],
  ["Book a dinner reservation", "Food & drink"],
  ["Sunset viewpoint", "Outdoors"],
  ["Live music or local performance", "Nightlife"],
  ["Market browse & souvenir stop", "Shopping"],
] as const;

function inputDate(value: Date) {
  return [
    value.getFullYear(),
    String(value.getMonth() + 1).padStart(2, "0"),
    String(value.getDate()).padStart(2, "0"),
  ].join("-");
}

function nextDay(value: string) {
  const date = new Date(value + "T12:00:00");
  date.setDate(date.getDate() + 1);
  return inputDate(date);
}

function stopDays(stop: Stop, trip: Trip) {
  const start = stop.arrival_date || trip.start_date || inputDate(new Date());
  const end = stop.departure_date || start;
  const days: string[] = [];
  for (let day = start, count = 0; day <= end && count < 31; day = nextDay(day), count += 1) {
    days.push(day);
  }
  return days;
}

function dateLabel(start: string | null, end: string | null) {
  if (!start) return "Dates to be decided";
  const formatter = new Intl.DateTimeFormat("en", { month: "short", day: "numeric" });
  const first = formatter.format(new Date(start + "T12:00:00"));
  const last = end ? formatter.format(new Date(end + "T12:00:00")) : "";
  return last && last !== first ? first + " - " + last : first;
}

function sortActivities(activities: Activity[]) {
  return [...activities].sort((a, b) =>
    (a.scheduled_at || a.created_at).localeCompare(b.scheduled_at || b.created_at),
  );
}

function makeItineraryQuery(tripId: string | null) {
  return {
    queryKey: ["itinerary", tripId],
    enabled: Boolean(tripId),
    queryFn: async (): Promise<StopWithActivities[]> => {
      if (!tripId) return [];
      const { data: stops, error: stopError } = await supabase
        .from("stops")
        .select("*")
        .eq("trip_id", tripId)
        .order("position");
      if (stopError) throw stopError;

      const ids = (stops || []).map((stop) => stop.id);
      const { data: activities, error: activityError } = ids.length
        ? await supabase.from("activities").select("*").in("stop_id", ids)
        : { data: [] as Activity[], error: null };
      if (activityError) throw activityError;

      return (stops || []).map((stop) => ({
        ...stop,
        activities: sortActivities((activities || []).filter((item) => item.stop_id === stop.id)),
      }));
    },
  };
}

function ItineraryBuilder() {
  const queryClient = useQueryClient();
  const [selectedTripId, setSelectedTripId] = useState<string | null>(null);
  const [itinerary, setItinerary] = useState<StopWithActivities[]>([]);
  const [tripDialogOpen, setTripDialogOpen] = useState(false);
  const [searchTarget, setSearchTarget] = useState<SearchTarget>(null);
  const [saving, setSaving] = useState(false);
  const [tripDraft, setTripDraft] = useState({
    name: "",
    startDate: "",
    endDate: "",
    coverImage: "",
  });
  const [stopDraft, setStopDraft] = useState({
    city: "",
    country: "",
    arrivalDate: "",
    departureDate: "",
  });

  const tripsQuery = useQuery({
    queryKey: ["trips"],
    queryFn: async (): Promise<Trip[]> => {
      const { data, error } = await supabase
        .from("trips")
        .select("*")
        .order("created_at", { ascending: false });
      if (error) throw error;
      return data || [];
    },
  });
  const trips = tripsQuery.data || [];
  const trip = trips.find((item) => item.id === selectedTripId) || null;
  const itineraryQuery = useQuery(makeItineraryQuery(selectedTripId));
  const sensors = useSensors(
    useSensor(PointerSensor, { activationConstraint: { distance: 6 } }),
    useSensor(KeyboardSensor, { coordinateGetter: sortableKeyboardCoordinates }),
  );

  useEffect(() => {
    const firstTrip = trips.at(0);
    if (!selectedTripId && firstTrip) setSelectedTripId(firstTrip.id);
  }, [selectedTripId, trips]);

  useEffect(() => {
    if (itineraryQuery.data) setItinerary(itineraryQuery.data);
  }, [itineraryQuery.data]);

  function openTripDialog() {
    setTripDraft({ name: "", startDate: "", endDate: "", coverImage: "" });
    setTripDialogOpen(true);
  }

  function chooseCover(file: File | undefined) {
    if (!file) return;
    if (!file.type.startsWith("image/")) {
      toast.error("Choose an image file for the cover photo.");
      return;
    }
    if (file.size > 1_500_000) {
      toast.error("Keep the cover photo under 1.5 MB.");
      return;
    }
    const reader = new FileReader();
    reader.onload = () => {
      if (typeof reader.result === "string") {
        setTripDraft((current) => ({ ...current, coverImage: reader.result as string }));
      }
    };
    reader.readAsDataURL(file);
  }

  async function createTrip(event: React.FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (!tripDraft.name.trim()) {
      toast.error("Give this trip a name first.");
      return;
    }
    if (tripDraft.startDate && tripDraft.endDate && tripDraft.endDate < tripDraft.startDate) {
      toast.error("Your trip cannot end before it starts.");
      return;
    }
    setSaving(true);
    try {
      const { data: auth, error: authError } = await supabase.auth.getUser();
      if (authError) throw authError;
      if (!auth.user) throw new Error("Please sign in before creating a trip.");

      const { data, error } = await supabase
        .from("trips")
        .insert({
          name: tripDraft.name.trim(),
          start_date: tripDraft.startDate || null,
          end_date: tripDraft.endDate || null,
          cover_image_url: tripDraft.coverImage || null,
          user_id: auth.user.id,
        })
        .select()
        .single();
      if (error) throw error;

      await queryClient.invalidateQueries({ queryKey: ["trips"] });
      setSelectedTripId(data.id);
      setItinerary([]);
      setTripDialogOpen(false);
      toast.success("Trip created. Add your first stop when you are ready.");
    } catch (error) {
      toast.error(error instanceof Error ? error.message : "Could not create that trip.");
    } finally {
      setSaving(false);
    }
  }

  function openCitySearch() {
    if (!trip) return;
    const date = trip.start_date || inputDate(new Date());
    setStopDraft({ city: "", country: "", arrivalDate: date, departureDate: date });
    setSearchTarget({ type: "city" });
  }

  async function createStop() {
    if (!trip || !stopDraft.city) return;
    if (stopDraft.departureDate && stopDraft.departureDate < stopDraft.arrivalDate) {
      toast.error("This stop cannot end before it begins.");
      return;
    }
    setSaving(true);
    try {
      const { data: auth, error: authError } = await supabase.auth.getUser();
      if (authError) throw authError;
      if (!auth.user) throw new Error("Please sign in before adding a stop.");

      const { data, error } = await supabase
        .from("stops")
        .insert({
          trip_id: trip.id,
          user_id: auth.user.id,
          city: stopDraft.city,
          country: stopDraft.country || null,
          arrival_date: stopDraft.arrivalDate || null,
          departure_date: stopDraft.departureDate || null,
          position: itinerary.length,
        })
        .select()
        .single();
      if (error) throw error;

      setItinerary((current) => [...current, { ...data, activities: [] }]);
      setSearchTarget(null);
      toast.success(data.city + " added to the timeline.");
    } catch (error) {
      toast.error(error instanceof Error ? error.message : "Could not add that stop.");
    } finally {
      setSaving(false);
    }
  }

  async function createActivity(stopId: string, day: string, title: string, category: string) {
    const stop = itinerary.find((item) => item.id === stopId);
    const count = stop
      ? stop.activities.filter((item) => item.scheduled_at?.slice(0, 10) === day).length
      : 0;
    try {
      const { data: auth, error: authError } = await supabase.auth.getUser();
      if (authError) throw authError;
      if (!auth.user) throw new Error("Please sign in before adding an activity.");

      const hour = String(Math.min(9 + count, 22)).padStart(2, "0");
      const { data, error } = await supabase
        .from("activities")
        .insert({
          stop_id: stopId,
          user_id: auth.user.id,
          title,
          category,
          scheduled_at: day + "T" + hour + ":00:00.000Z",
        })
        .select()
        .single();
      if (error) throw error;

      setItinerary((current) =>
        current.map((item) =>
          item.id === stopId
            ? { ...item, activities: sortActivities([...item.activities, data]) }
            : item,
        ),
      );
      setSearchTarget(null);
      toast.success("Activity added to the plan.");
    } catch (error) {
      toast.error(error instanceof Error ? error.message : "Could not add that activity.");
    }
  }

  async function reorderStops(event: DragEndEvent) {
    if (!event.over || event.active.id === event.over.id) return;
    const from = itinerary.findIndex((item) => item.id === event.active.id);
    const to = itinerary.findIndex((item) => item.id === event.over?.id);
    if (from < 0 || to < 0) return;
    const reordered = arrayMove(itinerary, from, to);
    setItinerary(reordered);
    const results = await Promise.all(
      reordered.map((item, index) =>
        supabase.from("stops").update({ position: index }).eq("id", item.id),
      ),
    );
    if (results.some((result) => result.error)) {
      toast.error("The new stop order could not be saved.");
      void queryClient.invalidateQueries({ queryKey: ["itinerary", selectedTripId] });
    }
  }

  async function reorderActivities(stopId: string, day: string, event: DragEndEvent) {
    if (!event.over || event.active.id === event.over.id) return;
    const stop = itinerary.find((item) => item.id === stopId);
    if (!stop) return;
    const sameDay = sortActivities(
      stop.activities.filter((item) => item.scheduled_at?.slice(0, 10) === day),
    );
    const from = sameDay.findIndex((item) => item.id === event.active.id);
    const to = sameDay.findIndex((item) => item.id === event.over?.id);
    if (from < 0 || to < 0) return;
    const reordered = arrayMove(sameDay, from, to);
    const updated = reordered.map((item, index) => ({
      ...item,
      scheduled_at: day + "T" + String(9 + index).padStart(2, "0") + ":00:00.000Z",
    }));
    const otherDays = stop.activities.filter((item) => item.scheduled_at?.slice(0, 10) !== day);
    setItinerary((current) =>
      current.map((item) =>
        item.id === stopId ? { ...item, activities: sortActivities([...otherDays, ...updated]) } : item,
      ),
    );
    const results = await Promise.all(
      updated.map((item) => supabase.from("activities").update({ scheduled_at: item.scheduled_at }).eq("id", item.id)),
    );
    if (results.some((result) => result.error)) {
      toast.error("The new activity order could not be saved.");
      void queryClient.invalidateQueries({ queryKey: ["itinerary", selectedTripId] });
    }
  }

  return (
    <div className="relative min-h-screen pb-16">
      <SceneBackground dimmed />
      <TopNav name="Traveller" email="" />
      <main className="relative mx-auto max-w-6xl px-4 py-8">
        <div className="mb-7 flex flex-col gap-5 sm:flex-row sm:items-end sm:justify-between">
          <div>
            <p className="mono-label">day-wise itinerary builder</p>
            <h1 className="mt-3 text-3xl font-semibold sm:text-4xl">
              Make the route feel <span className="text-gradient">inevitable</span>.
            </h1>
            <p className="mt-3 max-w-2xl text-sm text-muted-foreground">
              Add cities, shape each day, and drag the details into the right rhythm.
            </p>
          </div>
          <Button onClick={openTripDialog} className="glow shrink-0">
            <Plus /> New trip
          </Button>
        </div>

        {tripsQuery.isLoading ? (
          <section className="glass rounded-2xl p-10 text-sm text-muted-foreground">
            Loading your itineraries.
          </section>
        ) : !trip ? (
          <section className="glass-strong flex min-h-80 flex-col items-center justify-center rounded-3xl px-6 py-12 text-center">
            <div className="flex size-14 items-center justify-center rounded-2xl bg-primary/15 text-primary">
              <PlaneTakeoff className="size-6" />
            </div>
            <h2 className="mt-5 text-2xl font-semibold">Start with a trip</h2>
            <p className="mt-2 max-w-md text-sm text-muted-foreground">
              Give it a name and a date range, then build the route one city at a time.
            </p>
            <Button onClick={openTripDialog} className="mt-6 glow">
              <CirclePlus /> Create your first trip
            </Button>
          </section>
        ) : (
          <>
            <section className="glass overflow-hidden rounded-3xl">
              <div className="relative min-h-44 overflow-hidden px-6 py-7 sm:px-8">
                {trip.cover_image_url ? (
                  <img
                    src={trip.cover_image_url}
                    alt=""
                    className="absolute inset-0 h-full w-full object-cover opacity-30"
                  />
                ) : null}
                <div className="absolute inset-0 bg-linear-to-br from-background/90 via-background/70 to-primary/10" />
                <div className="relative flex flex-col gap-6 sm:flex-row sm:items-end sm:justify-between">
                  <div>
                    <p className="mono-label">active itinerary</p>
                    <h2 className="mt-3 text-3xl font-semibold">{trip.name}</h2>
                    <p className="mt-2 flex items-center gap-2 text-sm text-muted-foreground">
                      <CalendarDays className="size-4" /> {dateLabel(trip.start_date, trip.end_date)}
                    </p>
                  </div>
                  <label className="flex items-center gap-2 text-sm text-muted-foreground">
                    <span className="mono-label">switch trip</span>
                    <select
                      value={trip.id}
                      onChange={(event) => setSelectedTripId(event.target.value)}
                      className="h-9 max-w-52 rounded-lg border border-border bg-background/75 px-3 text-sm text-foreground outline-none focus:ring-2 focus:ring-ring"
                    >
                      {trips.map((item) => (
                        <option key={item.id} value={item.id}>{item.name}</option>
                      ))}
                    </select>
                  </label>
                </div>
              </div>
              <div className="flex flex-col gap-3 border-t border-border/70 px-6 py-4 sm:flex-row sm:items-center sm:justify-between sm:px-8">
                <p className="text-sm text-muted-foreground">
                  <span className="font-medium text-foreground">{itinerary.length}</span>
                  {" "}{itinerary.length === 1 ? "city stop" : "city stops"} - drag the grip to reorder
                </p>
                <Button onClick={openCitySearch} size="sm" className="w-full sm:w-auto">
                  <MapPin /> Add stop
                </Button>
              </div>
            </section>

            <section className="mt-5">
              {itineraryQuery.isLoading ? (
                <div className="glass rounded-2xl p-8 text-sm text-muted-foreground">Loading the route.</div>
              ) : itinerary.length === 0 ? (
                <button
                  type="button"
                  onClick={openCitySearch}
                  className="glass group flex min-h-64 w-full flex-col items-center justify-center rounded-3xl border-dashed px-6 py-10 text-center transition-colors hover:bg-secondary/40"
                >
                  <div className="flex size-12 items-center justify-center rounded-2xl bg-secondary text-primary">
                    <MapPin className="size-5" />
                  </div>
                  <h3 className="mt-5 text-lg font-semibold">Your route begins here</h3>
                  <p className="mt-2 max-w-md text-sm text-muted-foreground">
                    Search for a city, set the dates, and start laying out each day.
                  </p>
                </button>
              ) : (
                <DndContext sensors={sensors} collisionDetection={closestCenter} onDragEnd={reorderStops}>
                  <SortableContext items={itinerary.map((item) => item.id)} strategy={verticalListSortingStrategy}>
                    <div className="space-y-5">
                      {itinerary.map((stop, index) => (
                        <SortableStop
                          key={stop.id}
                          stop={stop}
                          trip={trip}
                          index={index}
                          onAddActivity={(day) => setSearchTarget({ type: "activity", stopId: stop.id, day })}
                          onActivityDragEnd={(day, event) => reorderActivities(stop.id, day, event)}
                        />
                      ))}
                    </div>
                  </SortableContext>
                </DndContext>
              )}
            </section>
          </>
        )}
      </main>

      <Dialog open={tripDialogOpen} onOpenChange={setTripDialogOpen}>
        <DialogContent className="max-w-xl">
          <DialogHeader>
            <DialogTitle>Create a new trip</DialogTitle>
            <DialogDescription>Start with the basics, then build the route one day at a time.</DialogDescription>
          </DialogHeader>
          <form onSubmit={createTrip} className="space-y-5">
            <div className="space-y-2">
              <Label htmlFor="trip-name">Trip name</Label>
              <Input id="trip-name" autoFocus value={tripDraft.name} onChange={(event) => setTripDraft({ ...tripDraft, name: event.target.value })} placeholder="Spring in Japan" />
            </div>
            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              <div className="space-y-2">
                <Label htmlFor="trip-start">Start date</Label>
                <Input id="trip-start" type="date" value={tripDraft.startDate} onChange={(event) => setTripDraft({ ...tripDraft, startDate: event.target.value })} />
              </div>
              <div className="space-y-2">
                <Label htmlFor="trip-end">End date</Label>
                <Input id="trip-end" type="date" min={tripDraft.startDate || undefined} value={tripDraft.endDate} onChange={(event) => setTripDraft({ ...tripDraft, endDate: event.target.value })} />
              </div>
            </div>
            <div className="space-y-2">
              <Label htmlFor="trip-cover">Optional cover photo</Label>
              <div className="flex items-center gap-4 rounded-xl border border-dashed border-border bg-secondary/20 p-3">
                {tripDraft.coverImage ? (
                  <img src={tripDraft.coverImage} alt="Selected trip cover" className="size-14 rounded-lg object-cover" />
                ) : (
                  <div className="flex size-14 items-center justify-center rounded-lg bg-secondary text-muted-foreground">
                    <ImagePlus className="size-5" />
                  </div>
                )}
                <div className="min-w-0 flex-1">
                  <Input
                    id="trip-cover"
                    type="file"
                    accept="image/png,image/jpeg,image/webp"
                    className="h-auto border-0 bg-transparent p-0 file:mr-3 file:cursor-pointer file:rounded-md file:border-0 file:bg-primary/15 file:px-3 file:py-1.5 file:text-xs file:font-medium file:text-primary"
                    onChange={(event) => chooseCover(event.target.files?.[0])}
                  />
                  <p className="mt-1 text-xs text-muted-foreground">PNG, JPG, or WebP - 1.5 MB max</p>
                </div>
              </div>
            </div>
            <div className="flex justify-end gap-3">
              <Button type="button" variant="ghost" onClick={() => setTripDialogOpen(false)}>Cancel</Button>
              <Button type="submit" disabled={saving} className="glow">
                {saving ? "Creating." : "Create trip"} <Plus />
              </Button>
            </div>
          </form>
        </DialogContent>
      </Dialog>

      <CommandDialog open={searchTarget !== null} onOpenChange={(open) => !open && setSearchTarget(null)}>
        {searchTarget?.type === "city" ? (
          <>
            <CommandInput placeholder="Search cities." />
            <CommandList>
              <CommandEmpty>No city found. Try one from the suggestions.</CommandEmpty>
              <CommandGroup heading="Suggested cities">
                {citySuggestions.map(([city, country]) => (
                  <CommandItem
                    key={city}
                    value={city + " " + country}
                    onSelect={() => setStopDraft({ ...stopDraft, city, country })}
                  >
                    <MapPin /><span>{city}</span><CommandShortcut>{country}</CommandShortcut>
                  </CommandItem>
                ))}
              </CommandGroup>
            </CommandList>
            <div className="border-t border-border p-4">
              <div className="mb-3 flex items-center justify-between">
                <p className="text-sm font-medium">{stopDraft.city ? stopDraft.city + ", " + stopDraft.country : "Select a city above"}</p>
                {stopDraft.city ? <Check className="size-4 text-primary" /> : null}
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div className="space-y-1.5">
                  <Label htmlFor="stop-arrival" className="text-xs">Arrival</Label>
                  <Input id="stop-arrival" type="date" value={stopDraft.arrivalDate} onChange={(event) => setStopDraft({ ...stopDraft, arrivalDate: event.target.value })} />
                </div>
                <div className="space-y-1.5">
                  <Label htmlFor="stop-departure" className="text-xs">Departure</Label>
                  <Input id="stop-departure" type="date" min={stopDraft.arrivalDate || undefined} value={stopDraft.departureDate} onChange={(event) => setStopDraft({ ...stopDraft, departureDate: event.target.value })} />
                </div>
              </div>
              <Button onClick={createStop} disabled={!stopDraft.city || saving} className="mt-4 w-full glow">
                {saving ? "Adding stop." : "Add stop to timeline"} <Plus />
              </Button>
            </div>
          </>
        ) : searchTarget?.type === "activity" ? (
          <>
            <CommandInput placeholder="Search activities." />
            <CommandList>
              <CommandEmpty>No matching activity. Try a broader search.</CommandEmpty>
              <CommandGroup heading="Add to this day">
                {activitySuggestions.map(([title, category]) => (
                  <CommandItem
                    key={title}
                    value={title + " " + category}
                    onSelect={() => void createActivity(searchTarget.stopId, searchTarget.day, title, category)}
                  >
                    <Sparkles /><span>{title}</span><CommandShortcut>{category}</CommandShortcut>
                  </CommandItem>
                ))}
              </CommandGroup>
            </CommandList>
          </>
        ) : null}
      </CommandDialog>
    </div>
  );
}

function SortableStop({
  stop,
  trip,
  index,
  onAddActivity,
  onActivityDragEnd,
}: {
  stop: StopWithActivities;
  trip: Trip;
  index: number;
  onAddActivity: (day: string) => void;
  onActivityDragEnd: (day: string, event: DragEndEvent) => void;
}) {
  const sortable = useSortable({ id: stop.id });
  const sensors = useSensors(
    useSensor(PointerSensor, { activationConstraint: { distance: 6 } }),
    useSensor(KeyboardSensor, { coordinateGetter: sortableKeyboardCoordinates }),
  );
  const style = {
    transform: CSS.Transform.toString(sortable.transform),
    transition: sortable.transition,
  };

  return (
    <article
      ref={sortable.setNodeRef}
      style={style}
      className={"glass overflow-hidden rounded-3xl " + (sortable.isDragging ? "opacity-50" : "")}
    >
      <header className="flex items-start gap-3 border-b border-border/70 bg-secondary/20 px-4 py-4 sm:px-6">
        <button
          type="button"
          aria-label={"Reorder " + stop.city}
          className="mt-0.5 cursor-grab rounded-md p-1 text-muted-foreground transition-colors hover:bg-secondary hover:text-foreground active:cursor-grabbing"
          {...sortable.attributes}
          {...sortable.listeners}
        >
          <GripVertical className="size-5" />
        </button>
        <span className="mt-1 flex size-6 shrink-0 items-center justify-center rounded-full bg-primary/15 font-mono text-[10px] text-primary">
          {String(index + 1).padStart(2, "0")}
        </span>
        <div className="min-w-0 flex-1">
          <h2 className="truncate text-xl font-semibold">{stop.city}</h2>
          <p className="mt-1 flex flex-wrap items-center gap-x-2 gap-y-1 text-xs text-muted-foreground">
            {stop.country ? <span>{stop.country}</span> : null}
            <span className="hidden size-1 rounded-full bg-muted-foreground/50 sm:block" />
            <span>{dateLabel(stop.arrival_date, stop.departure_date)}</span>
          </p>
        </div>
      </header>
      <div className="divide-y divide-border/70">
        {stopDays(stop, trip).map((day, indexInStop) => {
          const activities = sortActivities(
            stop.activities.filter((item) => item.scheduled_at?.slice(0, 10) === day),
          );
          return (
            <section key={day} className="grid gap-4 px-4 py-5 sm:grid-cols-[7.5rem_1fr] sm:px-6">
              <div>
                <p className="font-mono text-xs text-primary">{"Day " + String(indexInStop + 1).padStart(2, "0")}</p>
                <p className="mt-1 text-xs text-muted-foreground">
                  {new Intl.DateTimeFormat("en", { weekday: "short", month: "short", day: "numeric" }).format(new Date(day + "T12:00:00"))}
                </p>
              </div>
              <div>
                <DndContext sensors={sensors} collisionDetection={closestCenter} onDragEnd={(event) => onActivityDragEnd(day, event)}>
                  <SortableContext items={activities.map((item) => item.id)} strategy={verticalListSortingStrategy}>
                    <div className="space-y-2">
                      {activities.map((activity) => <SortableActivity key={activity.id} activity={activity} />)}
                    </div>
                  </SortableContext>
                </DndContext>
                <button
                  type="button"
                  onClick={() => onAddActivity(day)}
                  className="mt-2 flex w-full items-center gap-2 rounded-xl border border-dashed border-border px-3 py-2.5 text-left text-sm text-muted-foreground transition-colors hover:border-primary/40 hover:bg-primary/5 hover:text-primary"
                >
                  <Search className="size-4" /><span>Add activity</span>
                  <span className="ml-auto font-mono text-[10px] uppercase tracking-wider opacity-70">Search</span>
                </button>
              </div>
            </section>
          );
        })}
      </div>
    </article>
  );
}

function SortableActivity({ activity }: { activity: Activity }) {
  const sortable = useSortable({ id: activity.id });
  return (
    <div
      ref={sortable.setNodeRef}
      style={{ transform: CSS.Transform.toString(sortable.transform), transition: sortable.transition }}
      className={"flex items-center gap-2 rounded-xl border border-border bg-background/35 px-3 py-2.5 " + (sortable.isDragging ? "opacity-50" : "")}
    >
      <button
        type="button"
        aria-label={"Reorder " + activity.title}
        className="cursor-grab text-muted-foreground hover:text-foreground active:cursor-grabbing"
        {...sortable.attributes}
        {...sortable.listeners}
      >
        <GripVertical className="size-4" />
      </button>
      <div className="min-w-0 flex-1">
        <p className="truncate text-sm font-medium">{activity.title}</p>
        <p className="mt-0.5 text-xs text-muted-foreground">{activity.category || "Activity"}</p>
      </div>
      <span className="font-mono text-[10px] text-muted-foreground">
        {activity.scheduled_at
          ? new Intl.DateTimeFormat("en", { hour: "numeric", minute: "2-digit" }).format(new Date(activity.scheduled_at))
          : "Any time"}
      </span>
    </div>
  );
}



