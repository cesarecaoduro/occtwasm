import * as THREE from "three";
import { OrbitControls } from "three/addons/controls/OrbitControls.js";
import GUI from "lil-gui";
import {
  initOCCT,
  gp_Pnt,
  BRepBuilderAPI_MakeEdge,
  BRepBuilderAPI_MakePolygon,
  BRepBuilderAPI_MakeWire,
  BRepAlgoAPI_Section,
  BRepOffsetAPI_ThruSections,
  TopExp_Explorer,
  TopAbs_ShapeEnum,
  BRep_Tool,
  topoDSToVertex,
  meshShape,
  makeArcEdge3d,
  edgeLength,
  wireLength,
  pointAtLengthOnEdge,
  pointAtLengthOnWire,
} from "@cesarecaoduro/occtwasm-core";

function sampleEdge(edge, n = 64) {
  const len = edgeLength(edge),
    pts = [];
  for (let i = 0; i <= n; i++) {
    const p = pointAtLengthOnEdge(edge, (i / n) * len);
    pts.push(new THREE.Vector3(p.X(), p.Y(), p.Z()));
    p.delete();
  }
  return pts;
}

function sampleWire(wire, n = 128) {
  const len = wireLength(wire),
    pts = [];
  for (let i = 0; i <= n; i++) {
    const p = pointAtLengthOnWire(wire, (i / n) * len);
    pts.push(new THREE.Vector3(p.X(), p.Y(), p.Z()));
    p.delete();
  }
  return pts;
}

const lineMaterials = new Set();
const pointMaterials = new Set();
let currentSolidMesh = null;
let currentSolidMaterial = null;
const solidConfig = {
  visible: true,
  color: "#c9c4b8",
  metalness: 0.05,
  roughness: 0.6,
  opacity: 0.65,
  wireframe: false,
};
const meshConfig = {
  deflection: 0.4,
  angle: 0.6,
};

function line(pts, color = 0x1f2426) {
  const material = new THREE.LineBasicMaterial({
    color,
    linewidth: 2,
    transparent: true,
    opacity: 0.95,
  });
  lineMaterials.add(material);
  return new THREE.Line(
    new THREE.BufferGeometry().setFromPoints(pts),
    material,
  );
}

function dots(pts, color = 0xff4444, size = 8) {
  const material = new THREE.PointsMaterial({
    color,
    size,
    sizeAttenuation: false,
  });
  pointMaterials.add(material);
  return new THREE.Points(
    new THREE.BufferGeometry().setFromPoints(pts),
    material,
  );
}

function v3(h) {
  return new THREE.Vector3(h.X(), h.Y(), h.Z());
}

function dispose(...objs) {
  for (const o of objs) {
    o.geometry.dispose();
    o.material.dispose();
  }
}

function createMeshFromShape(shape, materialOptions, meshOptions) {
  const { positions, indices } = meshShape(shape, meshOptions);
  if (!positions.length || !indices.length) {
    return null;
  }
  const geometry = new THREE.BufferGeometry();
  geometry.setAttribute("position", new THREE.BufferAttribute(positions, 3));
  geometry.setIndex(new THREE.BufferAttribute(indices, 1));
  geometry.computeVertexNormals();
  const material = new THREE.MeshStandardMaterial({
    color: materialOptions.color,
    metalness: materialOptions.metalness,
    roughness: materialOptions.roughness,
    opacity: materialOptions.opacity,
    transparent: materialOptions.opacity < 1,
    wireframe: materialOptions.wireframe,
    side: THREE.DoubleSide,
  });
  const mesh = new THREE.Mesh(geometry, material);
  mesh.visible = materialOptions.visible;
  return { mesh, geometry, material };
}

function applySolidSettings() {
  if (!currentSolidMaterial || !currentSolidMesh) {
    return;
  }
  currentSolidMesh.visible = solidConfig.visible;
  currentSolidMaterial.color.set(solidConfig.color);
  currentSolidMaterial.metalness = solidConfig.metalness;
  currentSolidMaterial.roughness = solidConfig.roughness;
  currentSolidMaterial.opacity = solidConfig.opacity;
  currentSolidMaterial.transparent = solidConfig.opacity < 1;
  currentSolidMaterial.wireframe = solidConfig.wireframe;
  currentSolidMaterial.needsUpdate = true;
}

// -- Demos --
const demos = [
  {
    group: "Basics",
    label: "Edge (Line)",
    code: `import { initOCCT, gp_Pnt, BRepBuilderAPI_MakeEdge, edgeLength } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

const p1 = new gp_Pnt(0, 0, 0);
const p2 = new gp_Pnt(10, 0, 0);
const maker = new BRepBuilderAPI_MakeEdge(p1, p2);
const edge = maker.Edge();
console.log(edgeLength(edge)); // 10.0

edge.delete(); maker.delete(); p1.delete(); p2.delete();`,
    create(scene) {
      const p1 = new gp_Pnt(0, 0, 0),
        p2 = new gp_Pnt(10, 0, 0);
      const mk = new BRepBuilderAPI_MakeEdge(p1, p2);
      const edge = mk.Edge();
      const l = line(sampleEdge(edge, 2), 0x1f2426),
        d = dots([v3(p1), v3(p2)]);
      scene.add(l, d);
      return () => {
        scene.remove(l, d);
        dispose(l, d);
        edge.delete();
        mk.delete();
        p1.delete();
        p2.delete();
      };
    },
  },
  {
    group: "Basics",
    label: "Arc (3 Points)",
    code: `import { initOCCT, gp_Pnt, makeArcEdge3d, edgeLength } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

const p1 = new gp_Pnt(10, 0, 0);
const p2 = new gp_Pnt(0, 10, 0);
const p3 = new gp_Pnt(-10, 0, 0);
const arc = makeArcEdge3d(p1, p2, p3);
console.log(edgeLength(arc)); // ~31.42 (pi * 10)

arc.delete(); p1.delete(); p2.delete(); p3.delete();`,
    create(scene) {
      const p1 = new gp_Pnt(10, 0, 0),
        p2 = new gp_Pnt(0, 10, 0),
        p3 = new gp_Pnt(-10, 0, 0);
      const edge = makeArcEdge3d(p1, p2, p3);
      const l = line(sampleEdge(edge, 64), 0x1d6fa5),
        d = dots([v3(p1), v3(p2), v3(p3)]);
      scene.add(l, d);
      return () => {
        scene.remove(l, d);
        dispose(l, d);
        edge.delete();
        p1.delete();
        p2.delete();
        p3.delete();
      };
    },
  },
  {
    group: "Basics",
    label: "Polyline",
    code: `import { initOCCT, gp_Pnt, BRepBuilderAPI_MakePolygon, wireLength } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

const p1 = new gp_Pnt(0, 0, 0);
const p2 = new gp_Pnt(10, 0, 0);
const p3 = new gp_Pnt(10, 10, 0);
const p4 = new gp_Pnt(0, 10, 0);
const p5 = new gp_Pnt(0, 20, 0);

const maker = new BRepBuilderAPI_MakePolygon();
maker.Add(p1); maker.Add(p2); maker.Add(p3);
maker.Add(p4); maker.Add(p5);
const wire = maker.Wire();
console.log(wireLength(wire)); // 40.0

wire.delete(); maker.delete();
[p1, p2, p3, p4, p5].forEach(p => p.delete());`,
    create(scene) {
      const pts = [
        [0, 0, 0],
        [10, 0, 0],
        [10, 10, 0],
        [0, 10, 0],
        [0, 20, 0],
      ].map((c) => new gp_Pnt(...c));
      const mk = new BRepBuilderAPI_MakePolygon();
      pts.forEach((p) => mk.Add(p));
      const wire = mk.Wire();
      const l = line(sampleWire(wire, 64), 0x1f7a4d),
        d = dots(pts.map(v3));
      scene.add(l, d);
      return () => {
        scene.remove(l, d);
        dispose(l, d);
        wire.delete();
        mk.delete();
        pts.forEach((p) => p.delete());
      };
    },
  },
  {
    group: "Wires",
    label: "Wire (Line+Arc+Line)",
    code: `import { initOCCT, gp_Pnt, BRepBuilderAPI_MakeEdge,
  BRepBuilderAPI_MakeWire, makeArcEdge3d, wireLength } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

// Line: (0,0,0) -> (10,0,0)
const line1 = new BRepBuilderAPI_MakeEdge(
  new gp_Pnt(0, 0, 0), new gp_Pnt(10, 0, 0)
).Edge();

// Arc: (10,0,0) -> (15,5,0) -> (10,10,0)
const arc = makeArcEdge3d(
  new gp_Pnt(10, 0, 0), new gp_Pnt(15, 5, 0), new gp_Pnt(10, 10, 0)
);

// Line: (10,10,0) -> (0,10,0)
const line2 = new BRepBuilderAPI_MakeEdge(
  new gp_Pnt(10, 10, 0), new gp_Pnt(0, 10, 0)
).Edge();

const wire = new BRepBuilderAPI_MakeWire(line1, arc, line2).Wire();
console.log(wireLength(wire)); // ~35.71`,
    create(scene) {
      const lp1 = new gp_Pnt(0, 0, 0),
        lp2 = new gp_Pnt(10, 0, 0);
      const m1 = new BRepBuilderAPI_MakeEdge(lp1, lp2);
      const ap1 = new gp_Pnt(10, 0, 0),
        ap2 = new gp_Pnt(15, 5, 0),
        ap3 = new gp_Pnt(10, 10, 0);
      const arc = makeArcEdge3d(ap1, ap2, ap3);
      const lp3 = new gp_Pnt(10, 10, 0),
        lp4 = new gp_Pnt(0, 10, 0);
      const m2 = new BRepBuilderAPI_MakeEdge(lp3, lp4);
      const wm = new BRepBuilderAPI_MakeWire(m1.Edge(), arc, m2.Edge());
      const wire = wm.Wire();
      const l = line(sampleWire(wire, 128), 0xb56700),
        d = dots([v3(lp1), v3(ap2), v3(lp4)]);
      scene.add(l, d);
      return () => {
        scene.remove(l, d);
        dispose(l, d);
        wire.delete();
        wm.delete();
        m2.delete();
        arc.delete();
        m1.delete();
        [lp1, lp2, ap1, ap2, ap3, lp3, lp4].forEach((p) => p.delete());
      };
    },
  },
  {
    group: "Loft",
    label: "Loft Surface (Open Wires)",
    code: `import { initOCCT, gp_Pnt, BRepBuilderAPI_MakePolygon,
  BRepOffsetAPI_ThruSections } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

// Bottom polyline at Z=0 (OPEN wire)
const bottom = new BRepBuilderAPI_MakePolygon();
[new gp_Pnt(0,0,0), new gp_Pnt(10,0,0),
 new gp_Pnt(10,10,0)].forEach(p => bottom.Add(p));

// Top polyline at Z=10 (OPEN wire)
const top = new BRepBuilderAPI_MakePolygon();
[new gp_Pnt(0,0,10), new gp_Pnt(10,0,10),
 new gp_Pnt(10,10,10)].forEach(p => top.Add(p));

const loft = new BRepOffsetAPI_ThruSections(false, true);
loft.AddWire(bottom.Wire());
loft.AddWire(top.Wire());
loft.Build();`,
    create(scene) {
      function openProfile(z) {
        const pts = [
          [0, 0, z],
          [10, 0, z],
          [10, 10, z],
        ].map((c) => new gp_Pnt(...c));
        const mk = new BRepBuilderAPI_MakePolygon();
        pts.forEach((p) => mk.Add(p));
        return { wire: mk.Wire(), mk, pts };
      }
      const b = openProfile(0),
        t = openProfile(10);
      const l1 = line(sampleWire(b.wire, 64), 0x1f7a4d);
      const l2 = line(sampleWire(t.wire, 64), 0x1d6fa5);
      const guides = [];
      for (let i = 0; i < 3; i++) {
        const g = line([v3(b.pts[i]), v3(t.pts[i])], 0x8b8f8c);
        scene.add(g);
        guides.push(g);
      }
      const d = dots([...b.pts, ...t.pts].map(v3), 0xff4444, 6);
      scene.add(l1, l2, d);
      const loft = new BRepOffsetAPI_ThruSections(false, true);
      loft.AddWire(b.wire);
      loft.AddWire(t.wire);
      loft.Build();
      const loftShape = loft.Shape();
      const meshData = createMeshFromShape(loftShape, solidConfig, meshConfig);
      if (meshData) {
        scene.add(meshData.mesh);
        currentSolidMesh = meshData.mesh;
        currentSolidMaterial = meshData.material;
        // Keep references for live material updates
        applySolidSettings();
      }
      return () => {
        scene.remove(l1, l2, d);
        guides.forEach((g) => scene.remove(g));
        dispose(l1, l2, d, ...guides);
        if (meshData) {
          scene.remove(meshData.mesh);
          meshData.geometry.dispose();
          meshData.material.dispose();
          if (currentSolidMesh === meshData.mesh) {
            currentSolidMesh = null;
            currentSolidMaterial = null;
          }
        }
        loftShape.delete();
        loft.delete();
        [b, t].forEach((s) => {
          s.wire.delete();
          s.mk.delete();
          s.pts.forEach((p) => p.delete());
        });
      };
    },
  },
  {
    group: "Loft",
    label: "Loft Solid (Closed Wires)",
    code: `import { initOCCT, gp_Pnt, BRepBuilderAPI_MakePolygon,
  BRepOffsetAPI_ThruSections, volumeProperties } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

// Bottom square at Z=0 (CLOSED wire)
const bottom = new BRepBuilderAPI_MakePolygon();
[new gp_Pnt(0,0,0), new gp_Pnt(10,0,0),
 new gp_Pnt(10,10,0), new gp_Pnt(0,10,0)].forEach(p => bottom.Add(p));
bottom.Close();

// Top square at Z=10 (CLOSED wire)
const top = new BRepBuilderAPI_MakePolygon();
[new gp_Pnt(0,0,10), new gp_Pnt(10,0,10),
 new gp_Pnt(10,10,10), new gp_Pnt(0,10,10)].forEach(p => top.Add(p));
top.Close();

const loft = new BRepOffsetAPI_ThruSections(true, true);
loft.AddWire(bottom.Wire());
loft.AddWire(top.Wire());
loft.Build();

const props = volumeProperties(loft.Shape());
console.log(props.Mass()); // 1000 (10x10x10 box)`,
    create(scene) {
      function sq(z) {
        const pts = [
          [0, 0, z],
          [10, 0, z],
          [10, 10, z],
          [0, 10, z],
        ].map((c) => new gp_Pnt(...c));
        const mk = new BRepBuilderAPI_MakePolygon();
        pts.forEach((p) => mk.Add(p));
        mk.Close();
        return { wire: mk.Wire(), mk, pts };
      }
      const b = sq(0),
        t = sq(10);
      const l1 = line(sampleWire(b.wire, 64), 0x1f7a4d);
      const l2 = line(sampleWire(t.wire, 64), 0x1d6fa5);
      const guides = [];
      for (let i = 0; i < 4; i++) {
        const g = line([v3(b.pts[i]), v3(t.pts[i])], 0x8b8f8c);
        scene.add(g);
        guides.push(g);
      }
      const d = dots([...b.pts, ...t.pts].map(v3), 0xff4444, 6);
      scene.add(l1, l2, d);
      const loft = new BRepOffsetAPI_ThruSections(true, true);
      loft.AddWire(b.wire);
      loft.AddWire(t.wire);
      loft.Build();
      const loftShape = loft.Shape();
      const meshData = createMeshFromShape(loftShape, solidConfig, meshConfig);
      if (meshData) {
        scene.add(meshData.mesh);
        currentSolidMesh = meshData.mesh;
        currentSolidMaterial = meshData.material;
        // Keep references for live material updates
        applySolidSettings();
      }
      return () => {
        scene.remove(l1, l2, d);
        guides.forEach((g) => scene.remove(g));
        dispose(l1, l2, d, ...guides);
        if (meshData) {
          scene.remove(meshData.mesh);
          meshData.geometry.dispose();
          meshData.material.dispose();
          if (currentSolidMesh === meshData.mesh) {
            currentSolidMesh = null;
            currentSolidMaterial = null;
          }
        }
        loftShape.delete();
        loft.delete();
        [b, t].forEach((s) => {
          s.wire.delete();
          s.mk.delete();
          s.pts.forEach((p) => p.delete());
        });
      };
    },
  },
  {
    group: "Boolean",
    label: "Intersection",
    code: `import { initOCCT, gp_Pnt, BRepBuilderAPI_MakeEdge,
  BRepBuilderAPI_MakeWire, BRepAlgoAPI_Section,
  TopExp_Explorer, TopAbs_ShapeEnum, BRep_Tool, topoDSToVertex } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

// Horizontal wire
const wire1 = new BRepBuilderAPI_MakeWire(
  new BRepBuilderAPI_MakeEdge(new gp_Pnt(-10,0,0), new gp_Pnt(10,0,0)).Edge()
).Wire();

// Vertical wire
const wire2 = new BRepBuilderAPI_MakeWire(
  new BRepBuilderAPI_MakeEdge(new gp_Pnt(0,-10,0), new gp_Pnt(0,10,0)).Edge()
).Wire();

const section = BRepAlgoAPI_Section.FromShapes(wire1, wire2);
const result = section.Shape();

// Extract intersection points
const explorer = new TopExp_Explorer(
  result, TopAbs_ShapeEnum.TopAbs_VERTEX, TopAbs_ShapeEnum.TopAbs_SHAPE
);
while (explorer.More()) {
  const vtx = topoDSToVertex(explorer.Current());
  const pnt = BRep_Tool.Pnt(vtx);
  console.log(pnt.X(), pnt.Y(), pnt.Z());
  pnt.delete();
  vtx.delete();
  explorer.Next();
}`,
    create(scene) {
      const w1p1 = new gp_Pnt(-10, -10, 0),
        w1p2 = new gp_Pnt(10, 0, 0);
      const w1e = new BRepBuilderAPI_MakeEdge(w1p1, w1p2);
      const w1w = new BRepBuilderAPI_MakeWire(w1e.Edge());
      const wire1 = w1w.Wire();
      const w2p1 = new gp_Pnt(0, -10, 0),
        w2p2 = new gp_Pnt(0, 10, 0);
      const w2e = new BRepBuilderAPI_MakeEdge(w2p1, w2p2);
      const w2w = new BRepBuilderAPI_MakeWire(w2e.Edge());
      const wire2 = w2w.Wire();
      const section = BRepAlgoAPI_Section.FromShapes(wire1, wire2);
      const result = section.Shape();
      const l1 = line(sampleWire(wire1, 2), 0x1f2426);
      const l2 = line(sampleWire(wire2, 2), 0x1d6fa5);
      scene.add(l1, l2);
      const intPts = [];
      const exp = new TopExp_Explorer(
        result,
        TopAbs_ShapeEnum.TopAbs_VERTEX,
        TopAbs_ShapeEnum.TopAbs_SHAPE,
      );
      while (exp.More()) {
        const vtx = topoDSToVertex(exp.Current());
        const p = BRep_Tool.Pnt(vtx);
        intPts.push(new THREE.Vector3(p.X(), p.Y(), p.Z()));
        p.delete();
        vtx.delete();
        exp.Next();
      }
      const d = dots(intPts, 0xff0000, 12);
      scene.add(d);
      return () => {
        scene.remove(l1, l2, d);
        dispose(l1, l2, d);
        exp.delete();
        result.delete();
        section.delete();
        [wire2, w2w, w2e, wire1, w1w, w1e, w1p1, w1p2, w2p1, w2p2].forEach(
          (h) => h.delete(),
        );
      };
    },
  },
];

// -- Main --
async function main() {
  const loadingEl = document.getElementById("loading");
  await initOCCT();
  loadingEl.style.display = "none";

  const canvas = document.getElementById("viewer");
  const container = document.getElementById("viewer-container");
  const renderer = new THREE.WebGLRenderer({ canvas, antialias: true });
  renderer.setPixelRatio(window.devicePixelRatio);
  const background = { color: "#eeeeea" };
  renderer.setClearColor(background.color);
  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(50, 1, 0.1, 1000);
  camera.up.set(0, 0, 1);
  const cameraDefault = { x: 28, y: 28, z: 30, target: { x: 0, y: 0, z: 0 } };
  camera.position.set(cameraDefault.x, cameraDefault.y, cameraDefault.z);
  camera.lookAt(5, 5, 0);
  const controls = new OrbitControls(camera, canvas);
  controls.target.set(
    cameraDefault.target.x,
    cameraDefault.target.y,
    cameraDefault.target.z,
  );
  controls.enableDamping = true;
  controls.update();
  const grid = new THREE.GridHelper(30, 30, 0xdad6d0, 0xe6e2dc).rotateX(
    Math.PI / 2,
  );
  const axes = new THREE.AxesHelper(5);
  const hemi = new THREE.HemisphereLight(0xffffff, 0xdcd7cf, 0.7);
  const dir = new THREE.DirectionalLight(0xffffff, 0.65);
  dir.position.set(20, 10, 30);
  scene.add(grid);
  scene.add(axes);
  scene.add(hemi);
  scene.add(dir);

  const resize = () => {
    const w = container.clientWidth,
      h = container.clientHeight;
    renderer.setSize(w, h);
    camera.aspect = w / h;
    camera.updateProjectionMatrix();
  };
  window.addEventListener("resize", resize);
  resize();
  (function loop() {
    requestAnimationFrame(loop);
    controls.update();
    renderer.render(scene, camera);
  })();

  let currentDispose = null,
    currentIndex = 0;
  const loadDemo = (i) => {
    if (currentDispose) currentDispose();
    currentDispose = demos[i].create(scene);
    currentIndex = i;
    document
      .querySelectorAll(".demo-item")
      .forEach((b) => b.classList.toggle("active", Number(b.dataset.index) === i));
  };

  const demoList = document.getElementById("demo-list");
  const groups = demos.reduce((acc, demo, index) => {
    const key = demo.group || "Other";
    if (!acc[key]) acc[key] = [];
    acc[key].push({ demo, index });
    return acc;
  }, {});
  const order = ["Basics", "Wires", "Loft", "Boolean", "Other"];
  order.forEach((group) => {
    if (!groups[group]) return;
    const groupEl = document.createElement("div");
    const title = document.createElement("div");
    title.className = "demo-group-title";
    title.textContent = group;
    const items = document.createElement("ul");
    items.className = "demo-items";
    groups[group].forEach(({ demo, index }) => {
      const item = document.createElement("li");
      item.className = "demo-item";
      item.textContent = demo.label;
      item.dataset.index = String(index);
      item.onclick = () => loadDemo(index);
      items.appendChild(item);
    });
    groupEl.appendChild(title);
    groupEl.appendChild(items);
    demoList.appendChild(groupEl);
  });

  loadDemo(0);

  const ui = new GUI({ width: 240, title: "Viewer" });
  ui.domElement.style.position = "absolute";
  ui.domElement.style.top = "16px";
  ui.domElement.style.right = "16px";
  ui.domElement.style.zIndex = "10";
  document.body.appendChild(ui.domElement);

  const view = {
    grid: true,
    axes: true,
    background: background.color,
    lineOpacity: 0.95,
    lineWidth: 2,
    pointSize: 8,
    resetCamera: () => {
      camera.position.set(cameraDefault.x, cameraDefault.y, cameraDefault.z);
      controls.target.set(
        cameraDefault.target.x,
        cameraDefault.target.y,
        cameraDefault.target.z,
      );
      controls.update();
    },
  };

  ui.add(view, "grid")
    .name("Grid")
    .onChange((v) => {
      grid.visible = v;
    });
  ui.add(view, "axes")
    .name("Axes")
    .onChange((v) => {
      axes.visible = v;
    });
  ui.addColor(view, "background")
    .name("Background")
    .onChange((v) => {
      renderer.setClearColor(v);
    });
  ui.add(view, "lineOpacity", 0.2, 1, 0.05)
    .name("Line Opacity")
    .onChange((v) => {
      lineMaterials.forEach((m) => {
        m.opacity = v;
        m.needsUpdate = true;
      });
    });
  ui.add(view, "lineWidth", 1, 4, 1)
    .name("Line Width")
    .onChange((v) => {
      lineMaterials.forEach((m) => {
        m.linewidth = v;
        m.needsUpdate = true;
      });
    });
  ui.add(view, "pointSize", 2, 14, 1)
    .name("Point Size")
    .onChange((v) => {
      pointMaterials.forEach((m) => {
        m.size = v;
        m.needsUpdate = true;
      });
    });
  ui.add(view, "resetCamera").name("Reset Camera");

  const solidFolder = ui.addFolder("Surface / Solid");
  solidFolder
    .add(solidConfig, "visible")
    .name("Visible")
    .onChange(() => applySolidSettings());
  solidFolder
    .addColor(solidConfig, "color")
    .name("Color")
    .onChange(() => applySolidSettings());
  solidFolder
    .add(solidConfig, "opacity", 0.1, 1, 0.05)
    .name("Opacity")
    .onChange(() => applySolidSettings());
  solidFolder
    .add(solidConfig, "roughness", 0, 1, 0.05)
    .name("Roughness")
    .onChange(() => applySolidSettings());
  solidFolder
    .add(solidConfig, "metalness", 0, 1, 0.05)
    .name("Metalness")
    .onChange(() => applySolidSettings());
  solidFolder
    .add(solidConfig, "wireframe")
    .name("Wireframe")
    .onChange(() => applySolidSettings());

  // View Code dialog
  const dialog = document.getElementById("code-dialog");
  const dialogTitle = document.getElementById("code-dialog-title");
  const dialogCode = document.getElementById("code-dialog-code");
  document.getElementById("view-code").onclick = () => {
    dialogTitle.textContent = demos[currentIndex].label;
    dialogCode.textContent = demos[currentIndex].code;
    dialog.classList.add("open");
  };
  document.getElementById("code-dialog-close").onclick = () =>
    dialog.classList.remove("open");
  dialog.onclick = (e) => {
    if (e.target === dialog) dialog.classList.remove("open");
  };
}

main().catch((err) => {
  console.error("Failed to initialize viewer:", err);
  const el = document.getElementById("loading");
  if (el) el.textContent = `Error: ${err.message}`;
});
