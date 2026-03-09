// primitive_helpers.cpp
//
// Binds BRepPrimAPI primitives: MakeBox, MakeCylinder, MakeSphere.
// These are the building blocks for boolean operation examples.

#include <emscripten/bind.h>

#include <BRepPrimAPI_MakeBox.hxx>
#include <BRepPrimAPI_MakeCylinder.hxx>
#include <BRepPrimAPI_MakeSphere.hxx>
#include <TopoDS_Shape.hxx>
#include <TopoDS_Solid.hxx>
#include <gp_Pnt.hxx>
#include <gp_Ax2.hxx>

using namespace emscripten;

EMSCRIPTEN_BINDINGS(primitive_helpers) {

  class_<BRepPrimAPI_MakeBox>("BRepPrimAPI_MakeBox")
    .class_function("FromCornerAndSize",
      +[](const gp_Pnt& P, double dx, double dy, double dz) -> BRepPrimAPI_MakeBox* {
        return new BRepPrimAPI_MakeBox(P, dx, dy, dz);
      }, allow_raw_pointers())
    .class_function("FromTwoCorners",
      +[](const gp_Pnt& P1, const gp_Pnt& P2) -> BRepPrimAPI_MakeBox* {
        return new BRepPrimAPI_MakeBox(P1, P2);
      }, allow_raw_pointers())
    .function("Build",
      +[](BRepPrimAPI_MakeBox& self) { self.Build(); })
    .function("IsDone",
      +[](const BRepPrimAPI_MakeBox& self) -> bool { return self.IsDone(); })
    .function("Shape",
      +[](BRepPrimAPI_MakeBox& self) -> TopoDS_Shape { return self.Shape(); })
    .function("Solid",
      +[](BRepPrimAPI_MakeBox& self) -> TopoDS_Solid { return self.Solid(); })
    ;

  class_<BRepPrimAPI_MakeCylinder>("BRepPrimAPI_MakeCylinder")
    .class_function("FromAx2",
      +[](const gp_Ax2& axes, double R, double H) -> BRepPrimAPI_MakeCylinder* {
        return new BRepPrimAPI_MakeCylinder(axes, R, H);
      }, allow_raw_pointers())
    .class_function("FromAx2Angle",
      +[](const gp_Ax2& axes, double R, double H, double angle) -> BRepPrimAPI_MakeCylinder* {
        return new BRepPrimAPI_MakeCylinder(axes, R, H, angle);
      }, allow_raw_pointers())
    .function("Build",
      +[](BRepPrimAPI_MakeCylinder& self) { self.Build(); })
    .function("IsDone",
      +[](const BRepPrimAPI_MakeCylinder& self) -> bool { return self.IsDone(); })
    .function("Shape",
      +[](BRepPrimAPI_MakeCylinder& self) -> TopoDS_Shape { return self.Shape(); })
    ;

  class_<BRepPrimAPI_MakeSphere>("BRepPrimAPI_MakeSphere")
    .class_function("FromCenterRadius",
      +[](const gp_Pnt& center, double R) -> BRepPrimAPI_MakeSphere* {
        auto ax2 = gp_Ax2(center, gp_Dir(0, 0, 1));
        return new BRepPrimAPI_MakeSphere(ax2, R);
      }, allow_raw_pointers())
    .function("Build",
      +[](BRepPrimAPI_MakeSphere& self) { self.Build(); })
    .function("IsDone",
      +[](const BRepPrimAPI_MakeSphere& self) -> bool { return self.IsDone(); })
    .function("Shape",
      +[](BRepPrimAPI_MakeSphere& self) -> TopoDS_Shape { return self.Shape(); })
    ;
}
