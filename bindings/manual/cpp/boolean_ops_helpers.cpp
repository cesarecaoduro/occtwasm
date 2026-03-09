// boolean_ops_helpers.cpp
//
// Binds BRepAlgoAPI_Fuse, BRepAlgoAPI_Cut, BRepAlgoAPI_Common for full
// boolean operations (union, difference, intersection) on solid BREPs.
// These have deep inheritance (5+ levels) so are bound manually like
// BRepAlgoAPI_Section in boolean_helpers.cpp.

#include <emscripten/bind.h>

#include <BRepAlgoAPI_Fuse.hxx>
#include <BRepAlgoAPI_Cut.hxx>
#include <BRepAlgoAPI_Common.hxx>
#include <TopoDS_Shape.hxx>

using namespace emscripten;

EMSCRIPTEN_BINDINGS(boolean_ops_helpers) {

  class_<BRepAlgoAPI_Fuse>("BRepAlgoAPI_Fuse")
    .class_function("Create",
      +[](const TopoDS_Shape& S1, const TopoDS_Shape& S2) -> BRepAlgoAPI_Fuse* {
        return new BRepAlgoAPI_Fuse(S1, S2);
      }, allow_raw_pointers())
    .function("Build",
      +[](BRepAlgoAPI_Fuse& self) { self.Build(); })
    .function("IsDone",
      +[](const BRepAlgoAPI_Fuse& self) -> bool { return self.IsDone(); })
    .function("Shape",
      +[](BRepAlgoAPI_Fuse& self) -> TopoDS_Shape { return self.Shape(); })
    ;

  class_<BRepAlgoAPI_Cut>("BRepAlgoAPI_Cut")
    .class_function("Create",
      +[](const TopoDS_Shape& S1, const TopoDS_Shape& S2) -> BRepAlgoAPI_Cut* {
        return new BRepAlgoAPI_Cut(S1, S2);
      }, allow_raw_pointers())
    .function("Build",
      +[](BRepAlgoAPI_Cut& self) { self.Build(); })
    .function("IsDone",
      +[](const BRepAlgoAPI_Cut& self) -> bool { return self.IsDone(); })
    .function("Shape",
      +[](BRepAlgoAPI_Cut& self) -> TopoDS_Shape { return self.Shape(); })
    ;

  class_<BRepAlgoAPI_Common>("BRepAlgoAPI_Common")
    .class_function("Create",
      +[](const TopoDS_Shape& S1, const TopoDS_Shape& S2) -> BRepAlgoAPI_Common* {
        return new BRepAlgoAPI_Common(S1, S2);
      }, allow_raw_pointers())
    .function("Build",
      +[](BRepAlgoAPI_Common& self) { self.Build(); })
    .function("IsDone",
      +[](const BRepAlgoAPI_Common& self) -> bool { return self.IsDone(); })
    .function("Shape",
      +[](BRepAlgoAPI_Common& self) -> TopoDS_Shape { return self.Shape(); })
    ;
}
