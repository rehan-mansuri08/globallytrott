import { buildItinerary } from "@/server-fns/ai";
import type { AIPlanRequest, PlanResult } from "@/lib/ai-types";

export function requestPlan(input: AIPlanRequest): Promise<PlanResult> {
  return buildItinerary({ data: input });
}