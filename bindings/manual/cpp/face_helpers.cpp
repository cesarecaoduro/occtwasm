// face_helpers.cpp
//
// Binds BRepBuilderAPI_MakeFace for creating faces from wires (planar).
// Needed to create the profile face for pipe sweeps and general face creation.

#include <emscripten/bind.h>

#include <BRepBuilderAPI_MakeFace.hxx>
#include <TopoDS_Shape.hxx>
#include <TopoDS_Face.hxx>
#include <TopoDS_Wire.hxx>
#include <gp_Pln.hxx>

using namespace emscripten;

EMSCRIPTEN_BINDINGS(face_helpers) {

  class_<BRepBuilderAPI_MakeFace>("BRepBuilderAPI_MakeFace")
    .class_function("FromWire",
      +[](const TopoDS_Wire& W, bool onlyPlane) -> BRepBuilderAPI_MakeFace* {
        return new BRepBuilderAPI_MakeFace(W, onlyPlane);
      }, allow_raw_pointers())
    .class_function("FromPlane",
      +[](const gp_Pln& P) -> BRepBuilderAPI_MakeFace* {
        return new BRepBuilderAPI_MakeFace(P);
      }, allow_raw_pointers())
    .class_function("FromPlaneAndBounds",
      +[](const gp_Pln& P, double uMin, double uMax, double vMin, double vMax)
        -> BRepBuilderAPI_MakeFace* {
        return new BRepBuilderAPI_MakeFace(P, uMin, uMax, vMin, vMax);
      }, allow_raw_pointers())
    .function("IsDone",
      +[](const BRepBuilderAPI_MakeFace& self) -> bool { return self.IsDone(); })
    .function("Face",
      +[](BRepBuilderAPI_MakeFace& self) -> TopoDS_Face { return self.Face(); })
    .function("Shape",
      +[](BRepBuilderAPI_MakeFace& self) -> TopoDS_Shape { return self.Shape(); })
    ;
}
