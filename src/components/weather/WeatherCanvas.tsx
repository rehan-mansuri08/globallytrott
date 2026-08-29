// Procedural atmospheric canvas — renders current weather as ambient particles.
// Hardware-light, capped DPR, auto-pauses when the tab is hidden.

import { useEffect, useRef } from "react";

import type { WeatherCondition } from "@/lib/weather";

interface WeatherCanvasProps {
  condition: WeatherCondition;
  isDay: boolean;
  className?: string;
}

interface Particle {
  x: number;
  y: number;
  vx: number;
  vy: number;
  size: number;
  phase: number;
  alpha: number;
}

const MAX_DPR = 1.5;

function pick(arr: readonly [number, number, number][], t: number): [number, number, number] {
  const i = Math.max(0, Math.min(arr.length - 1, Math.floor(t)));
  return arr[i] ?? arr[0] ?? [0, 0, 0];
}

export function WeatherCanvas({ condition, isDay, className }: WeatherCanvasProps) {
  const canvasRef = useRef<HTMLCanvasElement | null>(null);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    let raf = 0;
    let running = true;
    let last = performance.now();
    let width = 0;
    let height = 0;
    let dpr = 1;
    let particles: Particle[] = [];
    const clouds: { x: number; y: number; r: number; vx: number; a: number }[] = [];
    const stars: { x: number; y: number; size: number; phase: number }[] = [];
    let lightAt = 0;
    let lightningT = 0;

    const resize = () => {
      const rect = canvas.getBoundingClientRect();
      if (rect.width === 0 || rect.height === 0) return;
      width = rect.width;
      height = rect.height;
      dpr = Math.min(MAX_DPR, window.devicePixelRatio || 1);
      canvas.width = Math.round(width * dpr);
      canvas.height = Math.round(height * dpr);
      ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
    };

    const spawn = () => {
      particles = [];
      const area = width * height;
      const scale = Math.min(1, area / (700 * 500));

      const snow = condition === "snow";
      const rain =
        condition === "rain" ||
        condition === "showers" ||
        condition === "thunderstorm" ||
        condition === "drizzle";

      const count =
        condition === "snow"
          ? Math.round(85 * scale)
          : condition === "thunderstorm"
            ? Math.round(150 * scale)
            : rain
              ? Math.round(110 * scale)
              : 0;

      for (let i = 0; i < count; i += 1) {
        const isSnow = snow;
        const speed = isSnow ? 30 + Math.random() * 45 : 240 + Math.random() * 320;
        particles.push({
          x: Math.random() * width,
          y: -(Math.random() * height),
          vx: isSnow ? (Math.random() - 0.5) * 18 : 60 + Math.random() * 35,
          vy: speed,
          size: isSnow ? 1 + Math.random() * 2.4 : 0.5 + Math.random() * 0.9,
          phase: Math.random() * Math.PI * 2,
          alpha: isSnow ? 0.55 + Math.random() * 0.4 : 0.3 + Math.random() * 0.35,
        });
      }

      const cloudCount =
        condition === "cloudy"
          ? 5
          : condition === "partly-cloudy"
            ? 3
            : condition === "fog"
              ? 7
              : 0;
      clouds.length = 0;
      for (let i = 0; i < cloudCount; i += 1) {
        clouds.push({
          x: Math.random() * width,
          y:
            (i / cloudCount) * height * (condition === "fog" ? 0.9 : 0.5) +
            Math.random() * height * 0.25,
          r: 60 + Math.random() * 120,
          vx: (condition === "fog" ? 6 : 12) + Math.random() * 14,
          a: condition === "fog" ? 0.05 + Math.random() * 0.06 : 0.1 + Math.random() * 0.12,
        });
      }

      stars.length = 0;
      if (!isDay && condition !== "cloudy" && condition !== "thunderstorm") {
        const n = Math.round(90 * scale);
        for (let i = 0; i < n; i += 1) {
          stars.push({
            x: Math.random() * width,
            y: Math.random() * height * 0.6,
            size: 0.6 + Math.random() * 1.2,
            phase: Math.random() * Math.PI * 2,
          });
        }
      }
    };

    const drawSky = (t: number) => {
      const night = !isDay;
      const top = pick(night ? [[10, 15, 24]] : [[19, 28, 46]], 0);
      const bottom = night ? pick([[15, 22, 36]], 0) : pick([[43, 58, 82]], 0);
      const g = ctx.createLinearGradient(0, 0, 0, height);
      g.addColorStop(0, `rgb(${top[0]},${top[1]},${top[2]})`);
      g.addColorStop(1, `rgb(${bottom[0]},${bottom[1]},${bottom[2]})`);
      ctx.fillStyle = g;
      ctx.fillRect(0, 0, width, height);
      void t;
    };

    const drawCelestial = (t: number) => {
      const cx = width * 0.72;
      const cy = height * 0.24;
      if (isDay) {
        const r = Math.min(width, height) * 0.055 + 14;
        const glow = ctx.createRadialGradient(cx, cy, r * 0.3, cx, cy, r * 5);
        glow.addColorStop(0, "rgba(250, 220, 160, 0.5)");
        glow.addColorStop(1, "rgba(250, 220, 160, 0)");
        ctx.fillStyle = glow;
        ctx.fillRect(cx - r * 5, cy - r * 5, r * 10, r * 10);
        const sun = ctx.createRadialGradient(cx - r * 0.2, cy - r * 0.2, 0, cx, cy, r);
        sun.addColorStop(0, "rgba(255, 244, 214, 1)");
        sun.addColorStop(1, "rgba(250, 205, 130, 0.95)");
        ctx.beginPath();
        ctx.arc(cx, cy, r, 0, Math.PI * 2);
        ctx.fillStyle = sun;
        ctx.fill();
      } else {
        const r = Math.min(width, height) * 0.04 + 10;
        const halo = ctx.createRadialGradient(cx, cy, r * 0.4, cx, cy, r * 4);
        halo.addColorStop(0, "rgba(200, 210, 240, 0.22)");
        halo.addColorStop(1, "rgba(200, 210, 240, 0)");
        ctx.fillStyle = halo;
        ctx.fillRect(cx - r * 4, cy - r * 4, r * 8, r * 8);
        ctx.beginPath();
        ctx.arc(cx, cy, r, 0, Math.PI * 2);
        ctx.fillStyle = "rgba(232, 236, 250, 0.95)";
        ctx.fill();
        // crescent shadow
        const off = Math.sin(t * 0.0003) * r * 0.25;
        ctx.beginPath();
        ctx.arc(cx - r * 0.38 + off, cy - r * 0.2, r * 0.92, 0, Math.PI * 2);
        ctx.fillStyle = `rgb(${isDay ? 0 : 15},${isDay ? 0 : 22},${isDay ? 0 : 36})`;
        ctx.fill();
      }
    };

    const drawStars = (t: number) => {
      ctx.save();
      for (const s of stars) {
        const a = 0.35 + 0.5 * (0.5 + 0.5 * Math.sin(t * 0.0016 + s.phase));
        ctx.globalAlpha = a;
        ctx.fillStyle = "#dfe6ff";
        ctx.beginPath();
        ctx.arc(s.x, s.y, s.size, 0, Math.PI * 2);
        ctx.fill();
      }
      ctx.restore();
    };

    const drawClouds = (t: number) => {
      for (const c of clouds) {
        c.x = ((c.x + c.vx * 0.016) % (width + c.r * 2)) - c.r;
        const g = ctx.createRadialGradient(c.x, c.y, c.r * 0.2, c.x, c.y, c.r);
        g.addColorStop(0, `rgba(205, 222, 250, ${c.a})`);
        g.addColorStop(1, "rgba(205,222,250,0)");
        ctx.fillStyle = g;
        ctx.beginPath();
        ctx.arc(c.x, c.y, c.r, 0, Math.PI * 2);
        ctx.fill();
      }
      void t;
      void performance;
    };

    const drawParticles = (dt: number) => {
      const isSnow = condition === "snow";
      const angle = condition === "snow" ? 0 : 0.14;
      ctx.save();
      ctx.lineWidth = 1;
      for (const p of particles) {
        p.y += p.vy * dt;
        p.x += (isSnow ? p.vx + Math.sin(p.phase + p.y * 0.012) * 26 : p.vx) * dt;
        if (p.y > height + 20) {
          p.y = -20;
          p.x = Math.random() * width;
        }
        if (p.x > width + 20) p.x = -20;
        ctx.globalAlpha = p.alpha;
        if (isSnow) {
          ctx.fillStyle = "#eef2ff";
          ctx.beginPath();
          ctx.arc(p.x + Math.sin(p.phase + p.y * 0.02) * 3, p.y, p.size, 0, Math.PI * 2);
          ctx.fill();
        } else {
          ctx.strokeStyle = "rgba(160, 190, 240, 0.9)";
          ctx.beginPath();
          ctx.moveTo(p.x, p.y);
          ctx.lineTo(p.x - Math.sin(angle) * p.size * 7, p.y - p.size * 7);
          ctx.stroke();
        }
      }
      ctx.restore();
    };

    const drawLightning = (now: number) => {
      if (condition !== "thunderstorm") return;
      lightAt += now;
      if (lightAt > lightningT) {
        lightningT = (4 + Math.random() * 7) * 1000 + 500;
        const flash = 0.22 + Math.random() * 0.18;
        ctx.fillStyle = `rgba(226, 236, 255, ${flash})`;
        ctx.fillRect(0, 0, width, height);
        // jagged bolt
        ctx.strokeStyle = "rgba(255,255,255,0.9)";
        ctx.lineWidth = 2;
        ctx.beginPath();
        const bx = width * (0.2 + Math.random() * 0.6);
        let by = 0;
        ctx.moveTo(bx, by);
        while (by < height * 0.7) {
          by += height * 0.08;
          ctx.lineTo(bx + (Math.random() - 0.5) * 40, by);
        }
        ctx.stroke();
      }
    };

    const frame = (now: number) => {
      if (!running) return;
      const dt = Math.min(0.05, (now - last) / 1000);
      last = now;
      drawSky(dt);
      drawCelestial(now);
      if (!isDay) drawStars(now);
      drawClouds(now);
      drawParticles(dt);
      drawLightning(now);
      raf = requestAnimationFrame(frame);
    };

    const onVisibility = () => {
      running = !document.hidden;
      if (running) {
        last = performance.now();
        raf = requestAnimationFrame(frame);
      } else {
        cancelAnimationFrame(raf);
      }
    };

    resize();
    spawn();
    raf = requestAnimationFrame(frame);

    const ro = new ResizeObserver(() => {
      resize();
      spawn();
    });
    ro.observe(canvas);
    document.addEventListener("visibilitychange", onVisibility);

    return () => {
      cancelAnimationFrame(raf);
      ro.disconnect();
      document.removeEventListener("visibilitychange", onVisibility);
    };
  }, [condition, isDay]);

  return <canvas ref={canvasRef} aria-hidden="true" className={className ?? "h-full w-full"} />;
}
