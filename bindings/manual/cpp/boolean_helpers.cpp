// boolean_helpers.cpp
//
// Binds BRepAlgoAPI_Section for intersecting two shapes (e.g. two wires
// extruded into faces, or two planar shapes). The deep inheritance chain
// (5 levels) makes codegen impractical, so we bind manually.
//
// BRepAlgoAPI_Section is not safely copyable/movable (complex internal state),
// so factory functions return raw pointers (heap-allocated) with
// allow_raw_pointers(). Embind takes ownership and calls delete on .delete().

#include <emscripten/bind.h>

#include <BRepAlgoAPI_Section.hxx>
#include <TopoDS_Shape.hxx>
#include <gp_Pln.hxx>

using namespace emscripten;

EMSCRIPTEN_BINDINGS(boolean_helpers) {

  class_<BRepAlgoAPI_Section>("BRepAlgoAPI_Section")
    .constructor(+[]() -> BRepAlgoAPI_Section* {
      return new BRepAlgoAPI_Section();
    })
    .class_function("FromShapes",
      +[](const TopoDS_Shape& S1, const TopoDS_Shape& S2) -> BRepAlgoAPI_Section* {
        return new BRepAlgoAPI_Section(S1, S2, Standard_True);
      }, allow_raw_pointers())
    .class_function("FromShapePlane",
      +[](const TopoDS_Shape& S1, const gp_Pln& Pl) -> BRepAlgoAPI_Section* {
        return new BRepAlgoAPI_Section(S1, Pl, Standard_True);
      }, allow_raw_pointers())
    .function("Build",
      +[](BRepAlgoAPI_Section& self) { self.Build(); })
    .function("IsDone",
      +[](const BRepAlgoAPI_Section& self) -> bool { return self.IsDone(); })
    .function("Shape",
      +[](BRepAlgoAPI_Section& self) -> TopoDS_Shape { return self.Shape(); })
    ;
}
