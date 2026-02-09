// loft_helpers.cpp
//
// Binds BRepOffsetAPI_ThruSections for creating lofted surfaces/solids
// through a sequence of wires. Virtual methods (Build, Shape, IsDone)
// are exposed via lambdas.

#include <emscripten/bind.h>

#include <BRepOffsetAPI_ThruSections.hxx>
#include <TopoDS_Shape.hxx>
#include <TopoDS_Wire.hxx>
#include <TopoDS_Vertex.hxx>

using namespace emscripten;

EMSCRIPTEN_BINDINGS(loft_helpers) {

  class_<BRepOffsetAPI_ThruSections>("BRepOffsetAPI_ThruSections")
    .constructor(+[](bool isSolid, bool isRuled) -> BRepOffsetAPI_ThruSections* {
      return new BRepOffsetAPI_ThruSections(isSolid, isRuled);
    })
    .function("AddWire", &BRepOffsetAPI_ThruSections::AddWire)
    .function("AddVertex", &BRepOffsetAPI_ThruSections::AddVertex)
    .function("CheckCompatibility",
      +[](BRepOffsetAPI_ThruSections& self, bool check) {
        self.CheckCompatibility(check);
      })
    .function("SetSmoothing", &BRepOffsetAPI_ThruSections::SetSmoothing)
    .function("SetMaxDegree", &BRepOffsetAPI_ThruSections::SetMaxDegree)
    .function("Build",
      +[](BRepOffsetAPI_ThruSections& self) { self.Build(); })
    .function("IsDone",
      +[](const BRepOffsetAPI_ThruSections& self) -> bool { return self.IsDone(); })
    .function("Shape",
      +[](BRepOffsetAPI_ThruSections& self) -> TopoDS_Shape { return self.Shape(); })
    .function("FirstShape", &BRepOffsetAPI_ThruSections::FirstShape)
    .function("LastShape", &BRepOffsetAPI_ThruSections::LastShape)
    ;
}
