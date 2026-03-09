// pipe_helpers.cpp
//
// Binds BRepOffsetAPI_MakePipe for sweeping a profile shape along a spine wire.
// Used for the AASHTO BT-72 girder with pre-camber example.

#include <emscripten/bind.h>

#include <BRepOffsetAPI_MakePipe.hxx>
#include <TopoDS_Shape.hxx>
#include <TopoDS_Wire.hxx>

using namespace emscripten;

EMSCRIPTEN_BINDINGS(pipe_helpers) {

  class_<BRepOffsetAPI_MakePipe>("BRepOffsetAPI_MakePipe")
    .constructor(+[](const TopoDS_Wire& spine, const TopoDS_Shape& profile)
      -> BRepOffsetAPI_MakePipe* {
        return new BRepOffsetAPI_MakePipe(spine, profile);
      })
    .function("Build",
      +[](BRepOffsetAPI_MakePipe& self) { self.Build(); })
    .function("IsDone",
      +[](const BRepOffsetAPI_MakePipe& self) -> bool { return self.IsDone(); })
    .function("Shape",
      +[](BRepOffsetAPI_MakePipe& self) -> TopoDS_Shape { return self.Shape(); })
    .function("FirstShape",
      +[](BRepOffsetAPI_MakePipe& self) -> TopoDS_Shape { return self.FirstShape(); })
    .function("LastShape",
      +[](BRepOffsetAPI_MakePipe& self) -> TopoDS_Shape { return self.LastShape(); })
    ;
}
