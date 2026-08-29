import { useMemo, useState } from "react";
import { useQueryClient } from "@tanstack/react-query";
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
  ArrowRight,
  GripVertical,
  MapPin,
  MoonStar,
  Plus,
  RefreshCcw,
  Save,
  Snowflake,
  Sparkles,
  Sun,
  Sunrise,
  Wand2,
} from "lucide-react";
import { toast } from "sonner";

import { SceneBackground } from "@/components/scene/SceneBackground";
import { TopNav } from "@/components/TopNav";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Textarea } from "@/components/ui/textarea";
import { ToggleGroup, ToggleGroupItem } from "@/components/ui/toggle-group";

import { useDestinations } from "@/hooks/use-catalog";
import { requestPlan } from "@/hooks/use-ai-builder";
import { supabase } from "@/integrations/supabase/client";
import type { AITimeBlock, BudgetTier, TravelerType } from "@/lib/ai-types";
import { cn } from "@/lib/utils";

export const Route = createFileRoute("/_authenticated/ai-builder")({
  validateSearch: (search: Record<string, unknown>) => ({
    dest: typeof search["dest"] === "string" ? search["dest"] : undefined,
    state: typeof search["state"] === "string" ? search["state"] : undefined,
  }),
  head: () => ({
    meta: [
      { title: "AI Trip Builder - GlobeTrotter" },
      {
        name: "description",
        content:
          "Generate a fully-editable, weather-aware day-by-day itinerary with GlobeTrotter's travel AI.",
      },
    ],
  }),
  component: AiBuilder,
});

const VIBES = [
  "Adventure",
  "Trekking",
  "Skiing",
  "Water Sports",
  "Culture",
  "Food",
  "Wildlife",
  "Spiritual",
  "Leisure",
  "Photography",
  "Nightlife",
  "Shopping",
] as const;

const GENERATION_STEPS = [
  "Reading your trip parameters…",
  "Fetching live weather & season telemetry…",
  "Routing days, timings and transit…",
  "Pricing stay, transport, food & activities…",
  "Balancing crowds, weather and vibes…",
];

type StudioBlock = AITimeBlock & { _key: string };
type StudioDay = {
  dayNumber: number;
  title: string;
  location: string;
  transportNotes: string;
  budget: number;
  blocks: StudioBlock[];
};

function inputDate(value: Date) {
  return [
    value.getFullYear(),
    String(value.getMonth() + 1).padStart(2, "0"),
    String(value.getDate()).padStart(2, "0"),
  ].join("-");
}

function dayDate(start: string, index: number) {
  const d = new Date(start + "T12:00:00");
  d.setDate(d.getDate() + index);
  return inputDate(d);
}

const TIME_ICONS = { morning: Sunrise, afternoon: Sun, evening: MoonStar };

export default function AiBuilder() {
  const queryClient = useQueryClient();
  const search = Route.useSearch();

  const { data: destinations } = useDestinations();
  const destinationOptions = useMemo(() => destinations ?? [], [destinations]);

  const preselect = useMemo(() => {
    const found = destinationOptions.find((d) => d.slug === search["dest"]);
    return found ?? null;
  }, [destinationOptions, search]);

  const [destSlug, setDestSlug] = useState<string | undefined>(preselect?.slug);
  const [travelers, setTravelers] = useState<TravelerType>("couple");
  const [budget, setBudget] = useState<BudgetTier>("moderate");
  const [vibes, setVibes] = useState<string[]>(["Culture", "Food"]);
  const [notes, setNotes] = useState("");
  const [startDate, setStartDate] = useState("");
  const [endDate, setEndDate] = useState("");

  const [phase, setPhase] = useState<"form" | "generating" | "plan">("form");
  const [step, setStep] = useState(0);
  const [error, setError] = useState<string | null>(null);
  const [days, setDays] = useState<StudioDay[]>([]);
  const [costs, setCosts] = useState<{
    stay: number;
    transit: number;
    activities: number;
    food: number;
  } | null>(null);
  const [noteText, setNoteText] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const sensors = useSensors(
    useSensor(PointerSensor, { activationConstraint: { distance: 6 } }),
    useSensor(KeyboardSensor, { coordinateGetter: sortableKeyboardCoordinates }),
  );

  const selected = useMemo(
    () => destinationOptions.find((d) => d.slug === destSlug) ?? null,
    [destinationOptions, destSlug],
  );

  const toggleVibe = (v: string) => {
    setVibes((cur) => (cur.includes(v) ? cur.filter((x) => x !== v) : [...cur, v]));
  };

  async function generate() {
    if (!selected) {
      toast.error("Pick a destination first.");
      return;
    }
    if (startDate && endDate && endDate < startDate) {
      toast.error("The trip cannot end before it starts.");
      return;
    }
    setPhase("generating");
    setStep(0);
    setError(null);

    const timer = setInterval(() => {
      setStep((s) => Math.min(GENERATION_STEPS.length - 1, s + 1));
    }, 700);

    try {
      const res = await requestPlan({
        data: {
          destination: selected.name,
          state: selected.stateName ?? undefined,
          startDate: startDate || undefined,
          endDate: endDate || undefined,
          travelers,
          budgetTier: budget,
          vibes: vibes.length ? vibes : ["General sightseeing"],
          notes: notes.trim() || undefined,
          latitude: selected.latitude,
          longitude: selected.longitude,
        },
      });

      if (!res.ok) {
        setError(res.message);
        setPhase("form");
        return;
      }

      const plan = res.plan;
      const seededDays = plan.days.map<StudioDay>((d) => ({
        dayNumber: d.dayNumber,
        title: d.title,
        location: d.location,
        transportNotes: d.transportNotes,
        budget: d.budget,
        blocks: (d.blocks ?? []).map((b) => ({ ...b, _key: crypto.randomUUID() })),
      }));
      setDays(seededDays);
      setCosts(plan.costBreakdown);
      setNoteText(plan.note ?? null);
      setPhase("plan");
      toast.success("Itinerary drafted. Drag to refine it, then save.");
    } catch (e) {
      setError(e instanceof Error ? e.message : "Generation failed.");
      setPhase("form");
    } finally {
      clearInterval(timer);
    }
  }

  function reorderDays(event: DragEndEvent) {
    if (!event.over || event.active.id === event.over.id) return;
    const from = days.findIndex((d) => `day-${d.dayNumber}` === event.active.id);
    const to = days.findIndex((d) => `day-${d.dayNumber}` === event.over?.id);
    if (from < 0 || to < 0) return;
    setDays(arrayMove(days, from, to));
  }

  function reorderBlocks(dayKey: number, event: DragEndEvent) {
    if (!event.over || event.active.id === event.over.id) return;
    const day = days.find((d) => d.dayNumber === dayKey);
    if (!day) return;
    const ids = day.blocks.map((b) => b._key);
    const from = ids.indexOf(event.active.id as string);
    const to = ids.indexOf(event.over.id as string);
    if (from < 0 || to < 0) return;
    setDays((cur) =>
      cur.map((d) =>
        d.dayNumber === dayKey ? { ...d, blocks: arrayMove(d.blocks, from, to) } : d,
      ),
    );
  }

  function moveBlock(dayKey: number, blockKey: string, targetDay: number) {
    if (dayKey === targetDay) return;
    setDays((cur) => {
      const src = cur.find((d) => d.dayNumber === dayKey);
      const dst = cur.find((d) => d.dayNumber === targetDay);
      if (!src || !dst) return cur;
      const block = src.blocks.find((b) => b._key === blockKey);
      if (!block) return cur;
      return cur.map((d) => {
        if (d.dayNumber === dayKey)
          return { ...d, blocks: d.blocks.filter((b) => b._key !== blockKey) };
        if (d.dayNumber === targetDay) {
          const copy = { ...block };
          const slot =
            block.timeOfDay === "morning" ? 9 : block.timeOfDay === "afternoon" ? 14 : 19;
          copy._key = crypto.randomUUID();
          return { ...d, blocks: [...d.blocks, copy] };
        }
        return d;
      });
    });
  }

  function patchBlock(dayKey: number, blockKey: string, patch: Partial<StudioBlock>) {
    setDays((cur) =>
      cur.map((d) =>
        d.dayNumber === dayKey
          ? { ...d, blocks: d.blocks.map((b) => (b._key === blockKey ? { ...b, ...patch } : b)) }
          : d,
      ),
    );
  }

  function patchDay(dayKey: number, patch: Partial<StudioDay>) {
    setDays((cur) => cur.map((d) => (d.dayNumber === dayKey ? { ...d, ...patch } : d)));
  }

  const totalCost = useMemo(() => days.reduce((sum, d) => sum + (d.budget || 0), 0), [days]);

  async function savePlan() {
    if (saving) return;
    setSaving(true);
    try {
      const { data: auth, error: authError } = await supabase.auth.getUser();
      if (authError) throw authError;
      if (!auth.user) throw new Error("Please sign in again to save a trip.");

      const name = `${selected?.name ?? "AI"} trip · ${budget}`;
      const start = startDate || inputDate(new Date());
      const end = endDate || dayDate(start, Math.max(1, days.length) - 1);

      const { data: trip, error: tripError } = await supabase
        .from("trips")
        .insert({
          name,
          start_date: start,
          end_date: end,
          user_id: auth.user.id,
        })
        .select()
        .single();
      if (tripError) throw tripError;

      const { data: stop, error: stopError } = await supabase
        .from("stops")
        .insert({
          trip_id: trip.id,
          user_id: auth.user.id,
          city: selected?.name ?? planLocation(),
          country: "India",
          arrival_date: start,
          departure_date: end,
          position: 0,
        })
        .select()
        .single();
      if (stopError) throw stopError;

      const activityRows = days.flatMap((d) =>
        d.blocks.map((b, i) => ({
          stop_id: stop.id,
          user_id: auth.user.id,
          title: b.title,
          category: b.category ?? b.timeOfDay,
          scheduled_at: `${dayDate(start, d.dayNumber - 1)}T${String(9 + i * 3).padStart(2, "0")}:00:00.000Z`,
        })),
      );
      const { error: activityError } = await supabase.from("activities").insert(activityRows);
      if (activityError) throw activityError;

      await queryClient.invalidateQueries({ queryKey: ["trips"] });
      toast.success("Saved to your itineraries.");
    } catch (e) {
      toast.error(e instanceof Error ? e.message : "Could not save the trip.");
    } finally {
      setSaving(false);
    }
  }

  function planLocation() {
    const first = days[0];
    return first?.location || selected?.name || "Destination";
  }

  return (
    <div className="relative min-h-screen pb-16">
      <SceneBackground dimmed />
      <TopNav name="Traveller" email="" />
      <main className="relative mx-auto max-w-6xl px-4 py-8">
        <div className="mb-7 flex flex-col gap-5 sm:flex-row sm:items-end sm:justify-between">
          <div>
            <p className="mono-label">automated AI trip builder</p>
            <h1 className="mt-3 text-3xl font-semibold sm:text-4xl">
              Ask for a trip, get a <span className="text-gradient">plan</span>.
            </h1>
            <p className="mt-3 max-w-2xl text-sm text-muted-foreground">
              The AI reads live weather, season and pricing context into a day-by-day roadmap. Then
              you take the wheel — drag, edit, and save it to your profile.
            </p>
          </div>
        </div>

        {error && (
          <section className="mb-6 rounded-xl border border-amber-500/40 bg-amber-500/10 p-4 text-sm text-amber-200">
            {error}
          </section>
        )}

        {phase === "form" && (
          <section className="glass space-y-6 rounded-3xl p-6 sm:p-8">
            <div className="grid gap-4 sm:grid-cols-2">
              <div className="space-y-2 sm:col-span-2">
                <Label>Destination</Label>
                <Select
                  value={destSlug ?? "none"}
                  onValueChange={(v) => v !== "none" && setDestSlug(v)}
                >
                  <SelectTrigger className="w-full">
                    <SelectValue placeholder="Choose a place in India" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="none" disabled>
                      Pick a destination
                    </SelectItem>
                    {destinationOptions.map((d) => (
                      <SelectItem key={d.id} value={d.slug}>
                        {d.name} · {d.stateName}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>

              <div className="space-y-2">
                <Label>Start date</Label>
                <Input
                  type="date"
                  value={startDate}
                  onChange={(e) => setStartDate(e.target.value)}
                />
              </div>
              <div className="space-y-2">
                <Label>End date</Label>
                <Input
                  type="date"
                  min={startDate || undefined}
                  value={endDate}
                  onChange={(e) => setEndDate(e.target.value)}
                />
              </div>
            </div>

            <div className="grid gap-4 sm:grid-cols-2">
              <div className="space-y-2">
                <Label>Who is travelling?</Label>
                <Select value={travelers} onValueChange={(v) => setTravelers(v as TravelerType)}>
                  <SelectTrigger>
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="solo">Solo traveller</SelectItem>
                    <SelectItem value="couple">Couple</SelectItem>
                    <SelectItem value="family">Family with kids</SelectItem>
                    <SelectItem value="group">Group of friends</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div className="space-y-2">
                <Label>Budget tier</Label>
                <Select value={budget} onValueChange={(v) => setBudget(v as BudgetTier)}>
                  <SelectTrigger>
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="budget">Budget</SelectItem>
                    <SelectItem value="moderate">Moderate</SelectItem>
                    <SelectItem value="luxury">Luxury</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>

            <div className="space-y-2">
              <Label>Pick your vibes</Label>
              <ToggleGroup type="multiple" variant="outline" size="sm" className="flex-wrap">
                {VIBES.map((v) => (
                  <ToggleGroupItem
                    key={v}
                    value={v}
                    data-state={vibes.includes(v) ? "on" : undefined}
                    onClick={() => toggleVibe(v)}
                    className="data-[state=on]:border-primary data-[state=on]:bg-primary/15 data-[state=on]:text-primary"
                  >
                    {v}
                  </ToggleGroupItem>
                ))}
              </ToggleGroup>
            </div>

            <div className="space-y-2">
              <Label>Special notes (optional)</Label>
              <Textarea
                value={notes}
                onChange={(e) => setNotes(e.target.value)}
                placeholder="E.g. travelling with a toddler, want a cooking class, prefer mornings for the mountains…"
                className="min-h-20"
              />
            </div>

            <div className="flex flex-wrap items-center justify-between gap-3">
              <p className="text-xs text-muted-foreground">
                The AI factors in {selected ? `${selected.name}'s` : "the destination's"} live
                forecast and the current season.
              </p>
              <Button onClick={() => void generate()} className="glow" disabled={!selected}>
                <Wand2 className="mr-2 h-4 w-4" /> Generate itinerary
              </Button>
            </div>
          </section>
        )}

        {phase === "generating" && (
          <section className="glass-strong flex min-h-80 flex-col items-center justify-center gap-6 rounded-3xl p-10 text-center">
            <div className="flex size-14 items-center justify-center rounded-2xl bg-primary/15 text-primary">
              <Sparkles className="size-6 animate-pulse" />
            </div>
            <div className="space-y-1">
              <p className="font-display text-lg font-semibold">Composing your trip</p>
              <p className="text-sm text-muted-foreground">{GENERATION_STEPS[step]}</p>
            </div>
            <div className="h-1.5 w-64 overflow-hidden rounded-full bg-secondary">
              <div
                className="h-full rounded-full bg-primary transition-all duration-700"
                style={{ width: `${((step + 1) / GENERATION_STEPS.length) * 100}%` }}
              />
            </div>
          </section>
        )}

        {phase === "plan" && (
          <PlanStudio
            days={days}
            costs={costs}
            noteText={noteText}
            totalCost={totalCost}
            sensors={sensors}
            onReorderDays={reorderDays}
            onReorderBlocks={reorderBlocks}
            onMoveBlock={moveBlock}
            onPatchBlock={patchBlock}
            onPatchDay={patchDay}
            onSave={savePlan}
            saving={saving}
            onRegenerate={() => {
              setPhase("form");
              setError(null);
            }}
          />
        )}
      </main>
    </div>
  );
}

function PlanStudio({
  days,
  costs,
  noteText,
  totalCost,
  sensors,
  onReorderDays,
  onReorderBlocks,
  onMoveBlock,
  onPatchBlock,
  onPatchDay,
  onSave,
  saving,
  onRegenerate,
}: {
  days: StudioDay[];
  costs: { stay: number; transit: number; activities: number; food: number } | null;
  noteText: string | null;
  totalCost: number;
  sensors: ReturnType<typeof useSensors>;
  onReorderDays: (e: DragEndEvent) => void;
  onReorderBlocks: (dayKey: number, e: DragEndEvent) => void;
  onMoveBlock: (dayKey: number, blockKey: string, target: number) => void;
  onPatchBlock: (dayKey: number, blockKey: string, patch: Partial<StudioBlock>) => void;
  onPatchDay: (dayKey: number, patch: Partial<StudioDay>) => void;
  onSave: () => void;
  saving: boolean;
  onRegenerate: () => void;
}) {
  return (
    <section className="space-y-5">
      <div className="glass flex flex-col gap-4 rounded-3xl p-5 sm:flex-row sm:items-center sm:justify-between">
        <div className="flex flex-wrap items-center gap-3">
          <Badge className="glass px-2.5 py-1">
            {days.length} day{days.length === 1 ? "" : "s"}
          </Badge>
          {costs && (
            <>
              <Badge variant="outline">Stay ₹{costs.stay.toLocaleString("en-IN")}</Badge>
              <Badge variant="outline">Transit ₹{costs.transit.toLocaleString("en-IN")}</Badge>
              <Badge variant="outline">
                Activities ₹{costs.activities.toLocaleString("en-IN")}
              </Badge>
              <Badge variant="outline">Food ₹{costs.food.toLocaleString("en-IN")}</Badge>
            </>
          )}
          <Badge variant="outline" className="border-primary/40 text-primary">
            ≈ ₹{totalCost.toLocaleString("en-IN")} total
          </Badge>
        </div>
        <div className="flex gap-2">
          <Button variant="ghost" size="sm" onClick={onRegenerate}>
            <RefreshCcw className="mr-2 h-4 w-4" /> Regenerate
          </Button>
          <Button size="sm" onClick={onSave} disabled={saving}>
            <Save className="mr-2 h-4 w-4" /> {saving ? "Saving…" : "Save to trips"}
          </Button>
        </div>
      </div>

      {noteText && (
        <p className="rounded-xl border border-primary/20 bg-primary/[0.06] p-4 text-sm leading-relaxed text-muted-foreground">
          <span className="font-medium text-foreground">AI note: </span>
          {noteText}
        </p>
      )}

      <DndContext sensors={sensors} collisionDetection={closestCenter} onDragEnd={onReorderDays}>
        <SortableContext
          items={days.map((d) => `day-${d.dayNumber}`)}
          strategy={verticalListSortingStrategy}
        >
          <div className="space-y-5">
            {days.map((day) => (
              <SortableDay
                key={day.dayNumber}
                day={day}
                days={days}
                onReorderBlocks={(e) => onReorderBlocks(day.dayNumber, e)}
                onMoveBlock={(k, t) => onMoveBlock(day.dayNumber, k, t)}
                onPatchBlock={(k, p) => onPatchBlock(day.dayNumber, k, p)}
                onPatchDay={(p) => onPatchDay(day.dayNumber, p)}
              />
            ))}
          </div>
        </SortableContext>
      </DndContext>
    </section>
  );
}

function SortableDay({
  day,
  days,
  onReorderBlocks,
  onMoveBlock,
  onPatchBlock,
  onPatchDay,
}: {
  day: StudioDay;
  days: StudioDay[];
  onReorderBlocks: (e: DragEndEvent) => void;
  onMoveBlock: (blockKey: string, targetDay: number) => void;
  onPatchBlock: (blockKey: string, patch: Partial<StudioBlock>) => void;
  onPatchDay: (patch: Partial<StudioDay>) => void;
}) {
  const sortable = useSortable({ id: `day-${day.dayNumber}` });
  const blockSensors = useSensors(
    useSensor(PointerSensor, { activationConstraint: { distance: 6 } }),
    useSensor(KeyboardSensor, { coordinateGetter: sortableKeyboardCoordinates }),
  );

  return (
    <article
      ref={sortable.setNodeRef}
      style={{
        transform: CSS.Transform.toString(sortable.transform),
        transition: sortable.transition,
      }}
      className={cn("glass overflow-hidden rounded-3xl", sortable.isDragging ? "opacity-50" : "")}
    >
      <header className="flex items-start gap-3 border-b border-border/70 bg-secondary/20 px-4 py-4 sm:px-6">
        <button
          type="button"
          aria-label={`Reorder day ${day.dayNumber}`}
          className="mt-0.5 cursor-grab rounded-md p-1 text-muted-foreground hover:bg-secondary hover:text-foreground active:cursor-grabbing"
          {...sortable.attributes}
          {...sortable.listeners}
        >
          <GripVertical className="size-5" />
        </button>
        <span className="mt-1 flex size-6 shrink-0 items-center justify-center rounded-full bg-primary/15 font-mono text-[10px] text-primary">
          {String(day.dayNumber).padStart(2, "0")}
        </span>
        <div className="min-w-0 flex-1">
          <Input
            value={day.title}
            onChange={(e) => onPatchDay({ title: e.target.value })}
            className="h-7 border-0 bg-transparent px-0 text-xl font-semibold focus-visible:ring-0"
          />
          <p className="mt-1 flex flex-wrap items-center gap-x-2 gap-y-1 text-xs text-muted-foreground">
            <span className="inline-flex items-center">
              <MapPin className="mr-1 h-3 w-3" /> {day.location}
            </span>
            {day.transportNotes && <span>{day.transportNotes}</span>}
          </p>
        </div>
        <Badge variant="outline" className="shrink-0">
          {day.budget ? `₹${day.budget.toLocaleString("en-IN")}` : "—"}
        </Badge>
      </header>

      <DndContext
        sensors={blockSensors}
        collisionDetection={closestCenter}
        onDragEnd={onReorderBlocks}
      >
        <SortableContext
          items={day.blocks.map((b) => b._key)}
          strategy={verticalListSortingStrategy}
        >
          <div className="space-y-2 p-4 sm:p-6">
            {day.blocks.map((block) => (
              <SortableBlock
                key={block._key}
                block={block}
                dayNumber={day.dayNumber}
                days={days}
                onMove={(t) => onMoveBlock(block._key, t)}
                onPatch={(p) => onPatchBlock(block._key, p)}
              />
            ))}
          </div>
        </SortableContext>
      </DndContext>
    </article>
  );
}

function SortableBlock({
  block,
  dayNumber,
  days,
  onMove,
  onPatch,
}: {
  block: StudioBlock;
  dayNumber: number;
  days: StudioDay[];
  onMove: (target: number) => void;
  onPatch: (patch: Partial<StudioBlock>) => void;
}) {
  const sortable = useSortable({ id: block._key });
  const TimeIcon = TIME_ICONS[block.timeOfDay] ?? Sun;

  return (
    <div
      ref={sortable.setNodeRef}
      style={{
        transform: CSS.Transform.toString(sortable.transform),
        transition: sortable.transition,
      }}
      className={cn(
        "rounded-xl border border-border bg-background/35 p-3",
        sortable.isDragging ? "opacity-50" : "",
      )}
    >
      <div className="flex items-start gap-3">
        <button
          type="button"
          aria-label={`Reorder ${block.title}`}
          className="mt-0.5 cursor-grab text-muted-foreground hover:text-foreground active:cursor-grabbing"
          {...sortable.attributes}
          {...sortable.listeners}
        >
          <GripVertical className="size-4" />
        </button>
        <div className="grid h-8 w-8 shrink-0 place-items-center rounded-lg bg-secondary text-primary">
          <TimeIcon className="h-4 w-4" />
        </div>
        <div className="min-w-0 flex-1 space-y-1.5">
          <div className="flex items-center gap-2">
            <input
              value={block.title}
              onChange={(e) => onPatch({ title: e.target.value })}
              className="w-full bg-transparent text-sm font-medium outline-none"
            />
            {block.indoor && (
              <Badge variant="outline" className="shrink-0 text-[10px]">
                Indoor
              </Badge>
            )}
            {block.cost > 0 && (
              <span className="shrink-0 text-xs text-muted-foreground">₹{block.cost}</span>
            )}
          </div>
          <textarea
            value={block.description}
            onChange={(e) => onPatch({ description: e.target.value })}
            rows={2}
            className="w-full resize-none rounded-md border border-transparent bg-transparent text-xs leading-relaxed text-muted-foreground outline-none transition-colors hover:border-border focus:border-primary/40 focus:bg-background/40"
          />
        </div>
      </div>
      <div className="mt-2 flex items-center justify-between pl-11 text-[10px] text-muted-foreground">
        <span className="capitalize">{block.category ?? block.timeOfDay}</span>
        <label className="flex items-center gap-1.5">
          <Snowflake className="hidden" />
          Move to day
          <select
            value={dayNumber}
            onChange={(e) => onMove(Number(e.target.value))}
            className="rounded border border-border/60 bg-background/50 px-1.5 py-0.5 text-[10px] outline-none focus:border-primary/40"
          >
            {days.map((d) => (
              <option key={d.dayNumber} value={d.dayNumber}>
                Day {d.dayNumber}
              </option>
            ))}
          </select>
          <ArrowRight className="h-3 w-3" />
        </label>
      </div>
    </div>
  );
}
