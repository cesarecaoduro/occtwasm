import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
import { initOCCT } from '@occtwasm/core';
import { demos } from './demos';

async function main() {
  const loadingEl = document.getElementById('loading')!;

  // Initialize OCCT WASM
  await initOCCT({
    locateFile: (path: string) => `/${path}`,
  });
  loadingEl.style.display = 'none';

  // Three.js setup
  const canvas = document.getElementById('viewer') as HTMLCanvasElement;
  const container = document.getElementById('viewer-container')!;

  const renderer = new THREE.WebGLRenderer({ canvas, antialias: true });
  renderer.setPixelRatio(window.devicePixelRatio);
  renderer.setClearColor(0x1a1a2e);

  const scene = new THREE.Scene();

  const camera = new THREE.PerspectiveCamera(50, 1, 0.1, 1000);
  camera.position.set(15, 15, 20);
  camera.lookAt(5, 5, 0);

  const controls = new OrbitControls(camera, canvas);
  controls.target.set(5, 5, 0);
  controls.enableDamping = true;
  controls.update();

  // Helpers
  const gridHelper = new THREE.GridHelper(30, 30, 0x333355, 0x222244);
  gridHelper.rotation.x = Math.PI / 2; // XY plane
  scene.add(gridHelper);

  const axesHelper = new THREE.AxesHelper(5);
  scene.add(axesHelper);

  // Resize handling
  function resize() {
    const w = container.clientWidth;
    const h = container.clientHeight;
    renderer.setSize(w, h);
    camera.aspect = w / h;
    camera.updateProjectionMatrix();
  }
  window.addEventListener('resize', resize);
  resize();

  // Render loop
  function animate() {
    requestAnimationFrame(animate);
    controls.update();
    renderer.render(scene, camera);
  }
  animate();

  // Demo switcher
  let currentDispose: (() => void) | null = null;

  function loadDemo(index: number) {
    if (currentDispose) currentDispose();
    currentDispose = demos[index].create(scene);

    // Update active button styling
    const buttons = document.querySelectorAll('.demo-btn');
    buttons.forEach((btn, i) => {
      btn.classList.toggle('active', i === index);
    });
  }

  // Build sidebar buttons
  const buttonContainer = document.getElementById('demo-buttons')!;
  demos.forEach((demo, i) => {
    const btn = document.createElement('button');
    btn.className = 'demo-btn';
    btn.textContent = demo.label;
    btn.addEventListener('click', () => loadDemo(i));
    buttonContainer.appendChild(btn);
  });

  // Load first demo
  loadDemo(0);
}

main().catch(err => {
  console.error('Failed to initialize viewer:', err);
  const loadingEl = document.getElementById('loading');
  if (loadingEl) loadingEl.textContent = `Error: ${err.message}`;
});
