import { useQuery } from "@tanstack/react-query";

import {
  fetchDestinationCards,
  fetchDestinationDetail,
  fetchIndiaStates,
  type DestinationCard,
  type DestinationDetail,
} from "@/lib/catalog";

export function useIndiaStates() {
  return useQuery({
    queryKey: ["india", "states"],
    queryFn: fetchIndiaStates,
    staleTime: 10 * 60_000,
  });
}

export function useDestinations() {
  return useQuery<DestinationCard[]>({
    queryKey: ["india", "destinations"],
    queryFn: fetchDestinationCards,
    staleTime: 10 * 60_000,
  });
}

export function useDestinationDetail(slug: string) {
  return useQuery<DestinationDetail | null>({
    queryKey: ["india", "destination", slug],
    queryFn: () => fetchDestinationDetail(slug),
    staleTime: 10 * 60_000,
    enabled: slug.length > 0,
  });
}