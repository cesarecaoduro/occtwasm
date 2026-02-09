// mesh_helpers.cpp
//
// Triangulate a TopoDS_Shape and return raw vertex/index arrays for rendering.

#include <emscripten/bind.h>
#include <emscripten/val.h>

#include <BRepMesh_IncrementalMesh.hxx>
#include <BRep_Tool.hxx>
#include <Poly_Triangulation.hxx>
#include <Poly_Array1OfTriangle.hxx>
#include <TopExp_Explorer.hxx>
#include <TopLoc_Location.hxx>
#include <TopoDS.hxx>
#include <TopoDS_Face.hxx>
#include <gp_Pnt.hxx>

using namespace emscripten;

EMSCRIPTEN_BINDINGS(mesh_helpers) {
  function("MeshShape", +[](const TopoDS_Shape& shape, double deflection, double angle) {
    // Build triangulation
    BRepMesh_IncrementalMesh mesher(shape, deflection, false, angle, true);
    mesher.Perform();

    val positions = val::array();
    val indices = val::array();

    uint32_t indexOffset = 0;
    TopExp_Explorer exp(shape, TopAbs_FACE);
    for (; exp.More(); exp.Next()) {
      const TopoDS_Face face = TopoDS::Face(exp.Current());
      TopLoc_Location loc;
      Handle(Poly_Triangulation) tri = BRep_Tool::Triangulation(face, loc);
      if (tri.IsNull()) {
        continue;
      }

      const gp_Trsf trsf = loc.Transformation();
      const int nodeCount = tri->NbNodes();
      const int triCount = tri->NbTriangles();

      for (int i = 1; i <= nodeCount; i++) {
        gp_Pnt p = tri->Node(i).Transformed(trsf);
        positions.call<void>("push", p.X());
        positions.call<void>("push", p.Y());
        positions.call<void>("push", p.Z());
      }

      for (int i = 1; i <= triCount; i++) {
        int n1, n2, n3;
        tri->Triangle(i).Get(n1, n2, n3);
        indices.call<void>("push", static_cast<uint32_t>(indexOffset + (n1 - 1)));
        indices.call<void>("push", static_cast<uint32_t>(indexOffset + (n2 - 1)));
        indices.call<void>("push", static_cast<uint32_t>(indexOffset + (n3 - 1)));
      }

      indexOffset += static_cast<uint32_t>(nodeCount);
    }

    val out = val::object();
    out.set("positions", positions);
    out.set("indices", indices);
    return out;
  });
}
