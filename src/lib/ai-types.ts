// Shared types for the AI trip-planner engine.
// Kept dependency-free so both client and server can import safely.

export type TravelerType = "solo" | "couple" | "family" | "group";
export type BudgetTier = "budget" | "moderate" | "luxury";

export interface AITimeBlock {
  timeOfDay: "morning" | "afternoon" | "evening";
  title: string;
  description: string;
  category: string;
  indoor: boolean;
  cost: number;
}

export interface AIDayPlan {
  dayNumber: number;
  title: string;
  location: string;
  transportNotes: string;
  budget: number;
  blocks: AITimeBlock[];
}

export interface AITripPlan {
  destination: string;
  state: string;
  totalDays: number;
  travelerSummary: string;
  budgetTier: BudgetTier;
  note: string;
  costBreakdown: {
    stay: number;
    transit: number;
    activities: number;
    food: number;
  };
  days: AIDayPlan[];
}

export interface AIPlanRequest {
  destination: string;
  state?: string;
  startDate?: string;
  endDate?: string;
  travelers: TravelerType;
  budgetTier: BudgetTier;
  vibes: string[];
  notes?: string;
  latitude?: number;
  longitude?: number;
  /** seasonal + weather context string assembled by the server */
  climateContext?: string;
}

export type PlanResult =
  | { ok: true; plan: AITripPlan }
  | {
      ok: false;
      code: "NO_KEY" | "AI_ERROR" | "INVALID_RESPONSE";
      message: string;
      raw?: string;
    };

export type AssistantResult =
  | { ok: true; answer: string }
  | { ok: false; code: "NO_KEY" | "AI_ERROR"; message: string };