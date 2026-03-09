import * as THREE from "three";
import { OrbitControls } from "three/addons/controls/OrbitControls.js";
import GUI from "lil-gui";
import {
  initOCCT,
  gp_Pnt,
  gp_Ax2,
  gp_Dir,
  BRepBuilderAPI_MakeEdge,
  BRepBuilderAPI_MakePolygon,
  BRepBuilderAPI_MakeWire,
  BRepBuilderAPI_MakeFace,
  BRepAlgoAPI_Section,
  BRepAlgoAPI_Fuse,
  BRepAlgoAPI_Cut,
  BRepAlgoAPI_Common,
  BRepOffsetAPI_ThruSections,
  BRepOffsetAPI_MakePipe,
  BRepPrimAPI_MakeBox,
  BRepPrimAPI_MakeCylinder,
  BRepPrimAPI_MakeSphere,
  TopExp_Explorer,
  TopAbs_ShapeEnum,
  BRep_Tool,
  topoDSToVertex,
  topoDSToEdge,
  meshShape,
  makeArcEdge3d,
  makeBSplineCurveEdge,
  makeBSplineSurfaceFace,
  getEdgeBSplineInfo,
  exportBRep,
  exportSTEP,
  edgeLength,
  wireLength,
  pointAtLengthOnEdge,
  pointAtLengthOnWire,
} from "@cesarecaoduro/occtwasm-core";

function safeDelete(...handles) {
  for (const h of handles) {
    try { if (h && typeof h.delete === "function") h.delete(); } catch (_) {}
  }
}

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
let currentExportShape = null;

function downloadBlob(content, filename, mimeType) {
  const blob = new Blob([content], { type: mimeType });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

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
      currentExportShape = loftShape;
      const meshData = createMeshFromShape(loftShape, solidConfig, meshConfig);
      if (meshData) {
        scene.add(meshData.mesh);
        currentSolidMesh = meshData.mesh;
        currentSolidMaterial = meshData.material;
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
        currentExportShape = null;
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
      currentExportShape = loftShape;
      const meshData = createMeshFromShape(loftShape, solidConfig, meshConfig);
      if (meshData) {
        scene.add(meshData.mesh);
        currentSolidMesh = meshData.mesh;
        currentSolidMaterial = meshData.material;
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
        currentExportShape = null;
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
  // -----------------------------------------------------------------
  // Example: AASHTO BT-72 Girder with Pre-Camber
  // -----------------------------------------------------------------
  {
    group: "Sweep",
    label: "BT-72 Girder (Pre-Camber)",
    code: `import { initOCCT, gp_Pnt, BRepBuilderAPI_MakeEdge,
  BRepBuilderAPI_MakeWire, BRepBuilderAPI_MakeFace,
  BRepOffsetAPI_MakePipe, makeBSplineCurveEdge,
  makeArcEdge3d } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

// BT-72 cross-section profile (inches, in XY plane at origin)
// Bottom flange: 26" wide, 6" tall
// Web: 6" wide, 59" tall
// Top flange: 42" wide, 3.5" tall (+ 3.5" haunch)
// Total depth: 72"
// Profile built as closed wire, then face, then swept along pre-camber spine.

const spine = makeBSplineCurveEdge(
  [0,0,0, 600,0,1.5, 1200,0,0], // parabolic camber (100ft span, ~1.5" rise)
  [0, 0.5, 1], [3, 1, 3], 2
);
const spineWire = new BRepBuilderAPI_MakeWire(spine).Wire();
// ... build profile, create face, sweep with MakePipe ...`,
    create(scene) {
      const toDispose = [];
      const s = 0.1; // scale: convert inches to viewer units

      // BT-72 half-profile points (symmetric about Y axis)
      // Starting bottom-center, going clockwise on the right half
      const bfw = 13 * s;   // bottom flange half-width
      const bfh = 6 * s;    // bottom flange height
      const ww = 3 * s;     // web half-width
      const wh = 59 * s;    // web height
      const tfw = 21 * s;   // top flange half-width
      const tfh = 3.5 * s;  // top flange thickness
      const hh = 3.5 * s;   // haunch height
      const depth = 72 * s;

      // Build full profile as closed polygon (simplified, no fillets for robustness)
      const profilePts = [
        [-bfw, 0],
        [bfw, 0],
        [bfw, bfh],
        [ww, bfh],
        [ww, bfh + wh],
        [tfw - 5 * s, bfh + wh],
        [tfw, depth],
        [-tfw, depth],
        [-tfw + 5 * s, bfh + wh],
        [-ww, bfh + wh],
        [-ww, bfh],
        [-bfw, bfh],
      ].map((c) => new gp_Pnt(c[0], c[1], 0));

      const profileMk = new BRepBuilderAPI_MakePolygon();
      profilePts.forEach((p) => profileMk.Add(p));
      profileMk.Close();
      const profileWire = profileMk.Wire();

      const faceMk = BRepBuilderAPI_MakeFace.FromWire(profileWire, true);
      const profileFace = faceMk.Shape();

      // Parabolic pre-camber spine along Z axis (100ft = 1200 inches)
      // BSpline invariant: sum(mults) = nPoles + degree + 1
      const spanLen = 120 * s;
      const camber = 1.5 * s;
      const nSpinePts = 5;
      const spinePoles = [];
      for (let i = 0; i < nSpinePts; i++) {
        const t = i / (nSpinePts - 1);
        const z = t * spanLen;
        const y = camber * 4 * t * (1 - t);
        spinePoles.push(0, 0 + y, z);
      }
      // 5 poles, degree 2: sum(mults) must = 5+2+1 = 8
      const spineKnots = [0, 0.33, 0.67, 1];
      const spineMults = [3, 1, 1, 3];
      const spineEdge = makeBSplineCurveEdge(spinePoles, spineKnots, spineMults, 2);
      const spineWireMk = new BRepBuilderAPI_MakeWire(spineEdge);
      const spineWire = spineWireMk.Wire();

      const pipeMk = new BRepOffsetAPI_MakePipe(spineWire, profileFace);
      pipeMk.Build();
      const girderShape = pipeMk.Shape();
      currentExportShape = girderShape;

      const meshData = createMeshFromShape(girderShape, solidConfig, meshConfig);
      if (meshData) {
        scene.add(meshData.mesh);
        currentSolidMesh = meshData.mesh;
        currentSolidMaterial = meshData.material;
        applySolidSettings();
      }

      // Draw spine curve
      const spineLine = line(sampleEdge(spineEdge, 64), 0xb56700);
      scene.add(spineLine);

      return () => {
        scene.remove(spineLine);
        dispose(spineLine);
        if (meshData) {
          scene.remove(meshData.mesh);
          meshData.geometry.dispose();
          meshData.material.dispose();
          if (currentSolidMesh === meshData.mesh) {
            currentSolidMesh = null;
            currentSolidMaterial = null;
          }
        }
        currentExportShape = null;
        safeDelete(pipeMk, spineWire, spineWireMk, spineEdge, profileFace, faceMk, profileWire, profileMk);
        profilePts.forEach((p) => safeDelete(p));
      };
    },
  },
  // -----------------------------------------------------------------
  // Example: Multi-Section Loft (different profiles)
  // -----------------------------------------------------------------
  {
    group: "Loft",
    label: "Multi-Section Loft",
    code: `import { initOCCT, gp_Pnt, BRepBuilderAPI_MakePolygon,
  BRepOffsetAPI_ThruSections } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

// 4 different closed profiles at different Z heights:
// Z=0: large square, Z=5: octagon, Z=10: smaller rotated square, Z=15: point
const loft = new BRepOffsetAPI_ThruSections(true, false);
loft.SetSmoothing(true);
// ... add wires at each station ...
loft.Build();`,
    create(scene) {
      const toDispose = [];

      function makeSquare(cx, cy, z, halfSize, rotation) {
        const pts = [];
        for (let i = 0; i < 4; i++) {
          const angle = rotation + (i * Math.PI) / 2 + Math.PI / 4;
          const x = cx + halfSize * Math.cos(angle);
          const y = cy + halfSize * Math.sin(angle);
          pts.push(new gp_Pnt(x, y, z));
        }
        const mk = new BRepBuilderAPI_MakePolygon();
        pts.forEach((p) => mk.Add(p));
        mk.Close();
        return { wire: mk.Wire(), mk, pts };
      }

      function makeNgon(cx, cy, z, radius, n) {
        const pts = [];
        for (let i = 0; i < n; i++) {
          const angle = (i * 2 * Math.PI) / n;
          pts.push(new gp_Pnt(cx + radius * Math.cos(angle), cy + radius * Math.sin(angle), z));
        }
        const mk = new BRepBuilderAPI_MakePolygon();
        pts.forEach((p) => mk.Add(p));
        mk.Close();
        return { wire: mk.Wire(), mk, pts };
      }

      const sections = [
        makeSquare(5, 5, 0, 6, 0),
        makeNgon(5, 5, 5, 5.5, 8),
        makeNgon(5, 5, 10, 4.5, 12),
        makeSquare(5, 5, 15, 3, Math.PI / 4),
      ];

      const colors = [0x1f7a4d, 0x1d6fa5, 0xb56700, 0x8b2252];
      const wires = [];
      sections.forEach((sec, i) => {
        const l = line(sampleWire(sec.wire, 64), colors[i]);
        scene.add(l);
        wires.push(l);
      });

      const loft = new BRepOffsetAPI_ThruSections(true, false);
      loft.SetSmoothing(true);
      sections.forEach((sec) => loft.AddWire(sec.wire));
      loft.Build();
      const loftShape = loft.Shape();
      currentExportShape = loftShape;

      const meshData = createMeshFromShape(loftShape, solidConfig, meshConfig);
      if (meshData) {
        scene.add(meshData.mesh);
        currentSolidMesh = meshData.mesh;
        currentSolidMaterial = meshData.material;
        applySolidSettings();
      }

      return () => {
        wires.forEach((w) => {
          scene.remove(w);
          dispose(w);
        });
        if (meshData) {
          scene.remove(meshData.mesh);
          meshData.geometry.dispose();
          meshData.material.dispose();
          if (currentSolidMesh === meshData.mesh) {
            currentSolidMesh = null;
            currentSolidMaterial = null;
          }
        }
        currentExportShape = null;
        safeDelete(loftShape, loft);
        sections.forEach((s) => {
          safeDelete(s.wire, s.mk);
          s.pts.forEach((p) => safeDelete(p));
        });
      };
    },
  },
  // -----------------------------------------------------------------
  // Example: NURBS Surface Intersection
  // -----------------------------------------------------------------
  {
    group: "Surfaces",
    label: "NURBS Surface Intersection",
    code: `import { initOCCT, makeBSplineSurfaceFace,
  BRepAlgoAPI_Section, getEdgeBSplineInfo } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

// Surface 1: smooth dome (degree 2, 5×5 control grid)
// Surface 2: tilted saddle crossing through the dome
// Intersection produces a true NURBS curve — use getEdgeBSplineInfo()
// to extract degree, poles, knots and display the control polygon.
const face1 = makeBSplineSurfaceFace(domeP, k, k, m, m, 2, 2, 5, 5);
const face2 = makeBSplineSurfaceFace(saddleP, k, k, m, m, 2, 2, 5, 5);
const section = BRepAlgoAPI_Section.FromShapes(face1, face2);
// Each edge in section.Shape() is a Geom_BSplineCurve:
const info = getEdgeBSplineInfo(edge); // { degree, poles, knots, ... }`,
    create(scene) {
      const nu = 5, nv = 5;
      const span = 12;
      const sp = span / (nu - 1);

      // Surface 1: smooth dome
      const poles1 = [];
      for (let iv = 0; iv < nv; iv++) {
        for (let iu = 0; iu < nu; iu++) {
          const x = iu * sp;
          const y = iv * sp;
          const cx = span / 2, cy = span / 2;
          const dx = x - cx, dy = y - cy;
          const z = 4.0 * Math.exp(-(dx * dx + dy * dy) / 25);
          poles1.push(x, y, z);
        }
      }

      // Surface 2: tilted saddle
      const poles2 = [];
      for (let iv = 0; iv < nv; iv++) {
        for (let iu = 0; iu < nu; iu++) {
          const x = iu * sp;
          const y = iv * sp;
          const cx = span / 2, cy = span / 2;
          const nx = (x - cx) / (span / 2);
          const ny = (y - cy) / (span / 2);
          const z = 1.8 + 0.6 * nx - 0.4 * ny + 1.5 * (nx * nx - ny * ny);
          poles2.push(x, y, z);
        }
      }

      // Degree-2 clamped: 5 poles → sum(mults) = 5+2+1 = 8
      const uKnots = [0, 0.5, 1];
      const vKnots = [0, 0.5, 1];
      const uMults = [3, 2, 3];
      const vMults = [3, 2, 3];
      const deg = 2;

      const face1 = makeBSplineSurfaceFace(poles1, uKnots, vKnots, uMults, vMults, deg, deg, nu, nv);
      const face2 = makeBSplineSurfaceFace(poles2, uKnots, vKnots, uMults, vMults, deg, deg, nu, nv);

      const fineMesh = { deflection: 0.2, angle: 0.4 };
      const surf1Config = { ...solidConfig, color: "#5b9bd5", opacity: 0.30, visible: true };
      const surf2Config = { ...solidConfig, color: "#c75050", opacity: 0.30, visible: true };

      const mesh1Data = createMeshFromShape(face1, surf1Config, fineMesh);
      const mesh2Data = createMeshFromShape(face2, surf2Config, fineMesh);

      if (mesh1Data) scene.add(mesh1Data.mesh);
      if (mesh2Data) scene.add(mesh2Data.mesh);

      // Compute intersection
      const section = BRepAlgoAPI_Section.FromShapes(face1, face2);
      const sectionShape = section.Shape();
      currentExportShape = sectionShape;

      // Extract intersection edges and show NURBS curve info
      const exp = new TopExp_Explorer(
        sectionShape,
        TopAbs_ShapeEnum.TopAbs_EDGE,
        TopAbs_ShapeEnum.TopAbs_SHAPE,
      );
      const threeObjs = [];
      let curveIdx = 0;
      while (exp.More()) {
        try {
          const edgeCast = topoDSToEdge(exp.Current());

          // Sample the evaluated curve (gold)
          const pts = sampleEdge(edgeCast, 100);
          if (pts.length > 1) {
            const curveMat = new THREE.LineBasicMaterial({ color: 0xffd500 });
            const curveGeo = new THREE.BufferGeometry().setFromPoints(pts);
            const curveLine = new THREE.Line(curveGeo, curveMat);
            scene.add(curveLine);
            threeObjs.push({ obj: curveLine, geo: curveGeo, mat: curveMat });
          }

          // Extract BSpline info and draw control polygon (green)
          const info = getEdgeBSplineInfo(edgeCast);
          if (info.isBSpline && info.poles && info.nbPoles > 1) {
            const cpPts = [];
            for (let i = 0; i < info.nbPoles; i++) {
              cpPts.push(new THREE.Vector3(info.poles[i*3], info.poles[i*3+1], info.poles[i*3+2]));
            }
            // Control polygon line (dashed green)
            const cpMat = new THREE.LineDashedMaterial({
              color: 0x22cc66, dashSize: 0.3, gapSize: 0.15,
            });
            const cpGeo = new THREE.BufferGeometry().setFromPoints(cpPts);
            const cpLine = new THREE.Line(cpGeo, cpMat);
            cpLine.computeLineDistances();
            scene.add(cpLine);
            threeObjs.push({ obj: cpLine, geo: cpGeo, mat: cpMat });

            // Control points (green dots)
            const cpDots = dots(cpPts, 0x22cc66, 5);
            scene.add(cpDots);
            threeObjs.push({ obj: cpDots });

            console.log(
              `Intersection curve ${curveIdx}: degree=${info.degree}, ` +
              `${info.nbPoles} poles, ${info.nbKnots} knots, ` +
              `rational=${info.isRational}, periodic=${info.isPeriodic}`
            );
            curveIdx++;
          }
          edgeCast.delete();
        } catch (e) { /* skip degenerate edges */ }
        exp.Next();
      }

      // Surface control-point lattices
      function drawLattice(poles, nu, nv, color) {
        for (let iv = 0; iv < nv; iv++) {
          const row = [];
          for (let iu = 0; iu < nu; iu++) {
            const idx = (iv * nu + iu) * 3;
            row.push(new THREE.Vector3(poles[idx], poles[idx+1], poles[idx+2]));
          }
          const l = line(row, color);
          l.material.opacity = 0.25; l.material.transparent = true;
          scene.add(l); threeObjs.push({ obj: l });
        }
        for (let iu = 0; iu < nu; iu++) {
          const col = [];
          for (let iv = 0; iv < nv; iv++) {
            const idx = (iv * nu + iu) * 3;
            col.push(new THREE.Vector3(poles[idx], poles[idx+1], poles[idx+2]));
          }
          const l = line(col, color);
          l.material.opacity = 0.25; l.material.transparent = true;
          scene.add(l); threeObjs.push({ obj: l });
        }
      }
      drawLattice(poles1, nu, nv, 0x2060a0);
      drawLattice(poles2, nu, nv, 0xa02020);

      return () => {
        threeObjs.forEach((o) => {
          scene.remove(o.obj);
          if (o.geo) o.geo.dispose();
          if (o.mat) o.mat.dispose();
          if (o.obj.geometry) o.obj.geometry.dispose();
          if (o.obj.material) o.obj.material.dispose();
        });
        if (mesh1Data) {
          scene.remove(mesh1Data.mesh);
          mesh1Data.geometry.dispose();
          mesh1Data.material.dispose();
        }
        if (mesh2Data) {
          scene.remove(mesh2Data.mesh);
          mesh2Data.geometry.dispose();
          mesh2Data.material.dispose();
        }
        currentExportShape = null;
        currentSolidMesh = null;
        currentSolidMaterial = null;
        safeDelete(exp, sectionShape, section, face1, face2);
      };
    },
  },
  // -----------------------------------------------------------------
  // Example: Boolean Operations (Fuse, Cut, Common)
  // -----------------------------------------------------------------
  {
    group: "Boolean",
    label: "Boolean Ops (Fuse/Cut/Common)",
    code: `import { initOCCT, gp_Pnt, gp_Ax2, gp_Dir,
  BRepPrimAPI_MakeBox, BRepPrimAPI_MakeCylinder, BRepPrimAPI_MakeSphere,
  BRepAlgoAPI_Fuse, BRepAlgoAPI_Cut, BRepAlgoAPI_Common } from '@cesarecaoduro/occtwasm-core';
await initOCCT();

const box = BRepPrimAPI_MakeBox.FromCornerAndSize(new gp_Pnt(0,0,0), 10, 10, 10).Shape();
const ax = new gp_Ax2(new gp_Pnt(5, 5, -1), new gp_Dir(0, 0, 1));
const cyl = BRepPrimAPI_MakeCylinder.FromAx2(ax, 3, 12).Shape();
const sph = BRepPrimAPI_MakeSphere.FromCenterRadius(new gp_Pnt(10, 5, 5), 4).Shape();

const fused = BRepAlgoAPI_Fuse.Create(box, sph).Shape();     // union
const cut = BRepAlgoAPI_Cut.Create(box, cyl).Shape();          // difference
const common = BRepAlgoAPI_Common.Create(box, cyl).Shape();    // intersection`,
    create(scene) {
      const origin = new gp_Pnt(0, 0, 0);

      // Box
      const boxMk = BRepPrimAPI_MakeBox.FromCornerAndSize(origin, 10, 10, 10);
      const box = boxMk.Shape();

      // Cylinder through the box center
      const cylCenter = new gp_Pnt(5, 5, -1);
      const cylDir = new gp_Dir(0, 0, 1);
      const cylAx = new gp_Ax2(cylCenter, cylDir);
      const cylMk = BRepPrimAPI_MakeCylinder.FromAx2(cylAx, 3, 12);
      const cyl = cylMk.Shape();

      // Sphere overlapping a corner
      const sphCenter = new gp_Pnt(10, 5, 5);
      const sphMk = BRepPrimAPI_MakeSphere.FromCenterRadius(sphCenter, 4);
      const sph = sphMk.Shape();

      // Boolean operations
      const fuseMk = BRepAlgoAPI_Fuse.Create(box, sph);
      const fuseShape = fuseMk.Shape();

      const cutMk = BRepAlgoAPI_Cut.Create(box, cyl);
      const cutShape = cutMk.Shape();

      const commonMk = BRepAlgoAPI_Common.Create(box, cyl);
      const commonShape = commonMk.Shape();

      // Display: fuse at origin, cut offset +15X, common offset +30X
      const fuseConfig = { ...solidConfig, color: "#4a90d9", opacity: 0.7, visible: true };
      const cutConfig = { ...solidConfig, color: "#d9a54a", opacity: 0.7, visible: true };
      const commonConfig = { ...solidConfig, color: "#4ad96a", opacity: 0.7, visible: true };

      const meshes = [];

      const fuseMesh = createMeshFromShape(fuseShape, fuseConfig, meshConfig);
      if (fuseMesh) {
        fuseMesh.mesh.position.set(0, 0, 0);
        scene.add(fuseMesh.mesh);
        meshes.push(fuseMesh);
      }

      const cutMesh = createMeshFromShape(cutShape, cutConfig, meshConfig);
      if (cutMesh) {
        cutMesh.mesh.position.set(15, 0, 0);
        scene.add(cutMesh.mesh);
        meshes.push(cutMesh);
      }

      const commonMesh = createMeshFromShape(commonShape, commonConfig, meshConfig);
      if (commonMesh) {
        commonMesh.mesh.position.set(30, 0, 0);
        scene.add(commonMesh.mesh);
        meshes.push(commonMesh);
      }

      // Export the fuse result by default
      currentExportShape = fuseShape;
      currentSolidMesh = fuseMesh ? fuseMesh.mesh : null;
      currentSolidMaterial = fuseMesh ? fuseMesh.material : null;

      return () => {
        meshes.forEach((m) => {
          scene.remove(m.mesh);
          m.geometry.dispose();
          m.material.dispose();
        });
        currentExportShape = null;
        currentSolidMesh = null;
        currentSolidMaterial = null;
        safeDelete(commonShape, commonMk, cutShape, cutMk, fuseShape, fuseMk,
          sph, sphMk, cyl, cylMk, box, boxMk, origin, cylCenter, cylDir, cylAx, sphCenter);
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
  const exportBrepBtn = document.getElementById("export-brep");
  const exportStepBtn = document.getElementById("export-step");
  const loadDemo = (i) => {
    if (currentDispose) currentDispose();
    currentExportShape = null;
    currentDispose = demos[i].create(scene);
    currentIndex = i;
    const hasShape = currentExportShape != null;
    exportBrepBtn.style.display = hasShape ? "inline-flex" : "none";
    exportStepBtn.style.display = hasShape ? "inline-flex" : "none";
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
  const order = ["Basics", "Wires", "Loft", "Sweep", "Surfaces", "Boolean", "Other"];
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

  // Export buttons
  exportBrepBtn.onclick = () => {
    if (!currentExportShape) return;
    try {
      const brepStr = exportBRep(currentExportShape);
      downloadBlob(brepStr, demos[currentIndex].label.replace(/\s+/g, "_") + ".brep", "application/octet-stream");
    } catch (e) {
      console.error("BREP export failed:", e);
    }
  };
  exportStepBtn.onclick = () => {
    if (!currentExportShape) return;
    try {
      const stepStr = exportSTEP(currentExportShape);
      if (stepStr) {
        downloadBlob(stepStr, demos[currentIndex].label.replace(/\s+/g, "_") + ".step", "application/octet-stream");
      } else {
        console.error("STEP export returned empty result");
      }
    } catch (e) {
      console.error("STEP export failed:", e);
    }
  };

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
