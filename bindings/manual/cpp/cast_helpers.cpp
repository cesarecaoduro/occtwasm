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

  function("TopoDS_ToVertex", +[](const TopoDS_Shape& S) { return TopoDS::Vertex(S); });
  function("TopoDS_ToEdge", +[](const TopoDS_Shape& S) { return TopoDS::Edge(S); });
  function("TopoDS_ToWire", +[](const TopoDS_Shape& S) { return TopoDS::Wire(S); });
  function("TopoDS_ToFace", +[](const TopoDS_Shape& S) { return TopoDS::Face(S); });
  function("TopoDS_ToShell", +[](const TopoDS_Shape& S) { return TopoDS::Shell(S); });
  function("TopoDS_ToSolid", +[](const TopoDS_Shape& S) { return TopoDS::Solid(S); });
  function("TopoDS_ToCompSolid", +[](const TopoDS_Shape& S) { return TopoDS::CompSolid(S); });
  function("TopoDS_ToCompound", +[](const TopoDS_Shape& S) { return TopoDS::Compound(S); });

}
