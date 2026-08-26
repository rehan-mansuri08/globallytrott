import { Canvas, useFrame } from "@react-three/fiber";
import { useVideoTexture } from "@react-three/drei";
import { Suspense, useRef } from "react";
import * as THREE from "three";

import videoAsset from "../../../public/videos/nature.mp4.asset.json";

function CurvedScreen({ opacity }: { opacity: number }) {
  const texture = useVideoTexture(videoAsset.url, {
    loop: true,
    muted: true,
    start: true,
    playsInline: true,
    crossOrigin: "anonymous",
  });
  const mesh = useRef<THREE.Mesh>(null);

  useFrame((_, delta) => {
    if (mesh.current) mesh.current.rotation.y += delta * 0.025;
  });

  return (
    <mesh ref={mesh}>
      {/* Open cylinder segment viewed from inside = a slowly rotating curved plane */}
      <cylinderGeometry args={[7, 7, 9, 96, 1, true, -1.1, 2.2]} />
      <meshBasicMaterial
        map={texture}
        side={THREE.BackSide}
        toneMapped={false}
        transparent
        opacity={opacity}
      />
    </mesh>
  );
}

export default function VideoScene({ opacity = 0.85 }: { opacity?: number }) {
  return (
    <Canvas
      dpr={[1, 1.75]}
      camera={{ position: [0, 0, 0.1], fov: 68 }}
      gl={{ antialias: true }}
    >
      <Suspense fallback={null}>
        <CurvedScreen opacity={opacity} />
      </Suspense>
    </Canvas>
  );
}
