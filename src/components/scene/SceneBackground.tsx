import { ClientOnly } from "@tanstack/react-router";
import { lazy, Suspense } from "react";

const VideoScene = lazy(() => import("./VideoScene"));

export function SceneBackground({ dimmed = false }: { dimmed?: boolean }) {
  return (
    <div className="pointer-events-none fixed inset-0 -z-10 bg-background">
      <ClientOnly fallback={null}>
        <Suspense fallback={null}>
          <VideoScene opacity={dimmed ? 0.4 : 0.85} />
        </Suspense>
      </ClientOnly>
      {/* Vignette + dim layers keep foreground text legible */}
      <div
        className="absolute inset-0 bg-background/60"
        style={{ opacity: dimmed ? 0.85 : 0.55 }}
      />
      <div className="absolute inset-0 [background:radial-gradient(120%_90%_at_50%_0%,transparent_0%,var(--background)_100%)] opacity-80" />
    </div>
  );
}
