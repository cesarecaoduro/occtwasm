#include <emscripten/bind.h>

#include <TopoDS.hxx>
#include <TopoDS_Shape.hxx>
#include <TopoDS_Vertex.hxx>
#include <TopoDS_Edge.hxx>
#include <TopoDS_Wire.hxx>
#include <TopoDS_Face.hxx>
#include <TopoDS_Shell.hxx>
#include <TopoDS_Solid.hxx>
#include <TopoDS_CompSolid.hxx>
#include <TopoDS_Compound.hxx>

using namespace emscripten;

EMSCRIPTEN_BINDINGS(cast_helpers) {

  function("TopoDS_ToVertex", &TopoDS::Vertex);
  function("TopoDS_ToEdge", &TopoDS::Edge);
  function("TopoDS_ToWire", &TopoDS::Wire);
  function("TopoDS_ToFace", &TopoDS::Face);
  function("TopoDS_ToShell", &TopoDS::Shell);
  function("TopoDS_ToSolid", &TopoDS::Solid);
  function("TopoDS_ToCompSolid", &TopoDS::CompSolid);
  function("TopoDS_ToCompound", &TopoDS::Compound);

}
