// gprop_helpers.cpp
//
// Binds GProp_GProps and BRepGProp static methods for computing
// linear (length), surface (area), and volume properties of shapes.

#include <emscripten/bind.h>

#include <GProp_GProps.hxx>
#include <BRepGProp.hxx>
#include <TopoDS_Shape.hxx>
#include <gp_Pnt.hxx>
#include <gp_Mat.hxx>

using namespace emscripten;

EMSCRIPTEN_BINDINGS(gprop_helpers) {

  class_<GProp_GProps>("GProp_GProps")
    .constructor<>()
    .function("Mass", &GProp_GProps::Mass)
    .function("CentreOfMass", &GProp_GProps::CentreOfMass)
    .function("MatrixOfInertia", &GProp_GProps::MatrixOfInertia)
    ;

  // Convenience wrappers that create GProp_GProps internally and return it
  function("BRepGProp_LinearProperties",
    +[](const TopoDS_Shape& S) -> GProp_GProps {
      GProp_GProps props;
      BRepGProp::LinearProperties(S, props);
      return props;
    });

  function("BRepGProp_SurfaceProperties",
    +[](const TopoDS_Shape& S) -> GProp_GProps {
      GProp_GProps props;
      BRepGProp::SurfaceProperties(S, props);
      return props;
    });

  function("BRepGProp_VolumeProperties",
    +[](const TopoDS_Shape& S) -> GProp_GProps {
      GProp_GProps props;
      BRepGProp::VolumeProperties(S, props);
      return props;
    });
}
