// export_helpers.cpp
//
// Exports a TopoDS_Shape to BREP format as a string.
// Uses BRepTools::Write(shape, ostream) which is in TKBRep (already linked).
// The string can be passed to JavaScript and downloaded as a .brep file.

#include <emscripten/bind.h>

#include <BRepTools.hxx>
#include <TopoDS_Shape.hxx>
#include <sstream>
#include <string>

using namespace emscripten;

static std::string ExportBRep(const TopoDS_Shape& shape)
{
  std::ostringstream oss;
  BRepTools::Write(shape, oss);
  return oss.str();
}

EMSCRIPTEN_BINDINGS(export_helpers) {
  function("ExportBRep", &ExportBRep);
}
