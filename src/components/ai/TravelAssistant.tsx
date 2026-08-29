// GlobeTrotter co-pilot — contextual travel Q&A on destination pages.
// RPCs run server-side only (OpenAI key never reaches the client).

import { useCallback, useEffect, useRef, useState } from "react";
import { Bot, Send, Sparkles, X } from "lucide-react";

import { Button } from "@/components/ui/button";
import { Sheet, SheetContent, SheetHeader, SheetTitle } from "@/components/ui/sheet";
import { Textarea } from "@/components/ui/textarea";
import { askTravelAssistant } from "@/server-fns/ai";
import type { AssistantResult } from "@/lib/ai-types";
import { cn } from "@/lib/utils";

export interface TravelAssistantContext {
  destinationName: string;
  stateName: string;
  latitude?: number | null;
  longitude?: number | null;
  weatherSummary?: string;
}

interface Message {
  role: "user" | "assistant";
  content: string;
}

export function TravelAssistant({ context }: { context: TravelAssistantContext }) {
  const [open, setOpen] = useState(false);
  const [messages, setMessages] = useState<Message[]>([]);
  const [input, setInput] = useState("");
  const [busy, setBusy] = useState(false);
  const scrollRef = useRef<HTMLDivElement | null>(null);

  useEffect(() => {
    if (open && messages.length === 0) {
      setMessages([
        {
          role: "assistant",
          content: `Hi! I'm the GlobeTrotter co-pilot for ${context.destinationName}, ${context.stateName}. Ask me about seasons, permits, routes, food or what to pack.`,
        },
      ]);
    }
  }, [open, messages.length, context.destinationName, context.stateName]);

  useEffect(() => {
    scrollRef.current?.scrollTo({ top: scrollRef.current.scrollHeight, behavior: "smooth" });
  }, [messages, busy]);

  const send = useCallback(async () => {
    const question = input.trim();
    if (!question || busy) return;
    setInput("");
    setMessages((m) => [...m, { role: "user", content: question }]);
    setBusy(true);

    const base = `Context — currently viewing: ${context.destinationName}, ${context.stateName}, India. Coordinates: ${context.latitude != null && context.longitude != null ? `${context.latitude.toFixed(3)}, ${context.longitude.toFixed(3)}` : "not pinned"}.${context.weatherSummary ? ` Live conditions: ${context.weatherSummary}.` : ""}`;
    const res: AssistantResult = await askTravelAssistant({ data: { question, context: base } });
    setMessages((m) => [
      ...m,
      res.ok
        ? { role: "assistant", content: res.answer }
        : { role: "assistant", content: `I couldn't answer yet — ${res.message}` },
    ]);
    setBusy(false);
  }, [input, busy, context]);

  return (
    <>
      <Button
        size="sm"
        onClick={() => setOpen(true)}
        className="fixed bottom-6 right-6 z-40 gap-2 shadow-xl shadow-primary/20 glow"
        aria-label="Open GlobeTrotter co-pilot"
      >
        <Sparkles className="h-4 w-4" />
        Ask the co-pilot
      </Button>

      <Sheet open={open} onOpenChange={setOpen}>
        <SheetContent side="right" className="flex w-full flex-col gap-0 p-0 sm:max-w-md">
          <SheetHeader className="border-b border-border/70 px-4 py-3">
            <SheetTitle className="flex items-center gap-2">
              <div className="grid h-7 w-7 place-items-center rounded-lg bg-primary/15 text-primary">
                <Bot className="h-4 w-4" />
              </div>
              GlobeTrotter co-pilot
            </SheetTitle>
          </SheetHeader>

          <div ref={scrollRef} className="flex-1 space-y-3 overflow-y-auto px-4 py-4">
            {messages.map((m, i) => (
              <div
                key={i}
                className={cn("flex", m.role === "user" ? "justify-end" : "justify-start")}
              >
                <div
                  className={cn(
                    "max-w-[85%] rounded-2xl px-3.5 py-2.5 text-sm leading-relaxed",
                    m.role === "user"
                      ? "rounded-br-sm bg-primary text-white"
                      : "rounded-bl-sm border border-border/70 bg-foreground/[0.03] text-foreground",
                  )}
                >
                  {m.content}
                </div>
              </div>
            ))}
            {busy && (
              <div className="flex justify-start">
                <div className="rounded-2xl rounded-bl-sm border border-border/70 bg-foreground/[0.03] px-4 py-3 text-sm text-muted-foreground">
                  Thinking…
                </div>
              </div>
            )}
          </div>

          <div className="border-t border-border/70 p-3">
            <div className="flex items-end gap-2">
              <Textarea
                value={input}
                onChange={(e) => setInput(e.target.value)}
                onKeyDown={(e) => {
                  if (e.key === "Enter" && !e.shiftKey) {
                    e.preventDefault();
                    void send();
                  }
                }}
                placeholder={`Ask about ${context.destinationName}…`}
                className="min-h-11 max-h-32 resize-none"
                rows={2}
              />
              <Button
                size="icon"
                onClick={() => void send()}
                disabled={busy || !input.trim()}
                aria-label="Send question"
              >
                {busy ? <X className="h-4 w-4" /> : <Send className="h-4 w-4" />}
              </Button>
            </div>
            <p className="mt-2 text-[10px] text-muted-foreground">
              Powered by OpenAI on the server. Travel decisions should always be double-checked with
              official sources.
            </p>
          </div>
        </SheetContent>
      </Sheet>
    </>
  );
}
