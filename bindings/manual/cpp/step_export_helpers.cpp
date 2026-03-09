// step_export_helpers.cpp
//
// Exports a TopoDS_Shape to STEP format as a string using STEPControl_Writer.
// Requires TKDESTEP and its dependencies to be linked.

#include <emscripten/bind.h>

#include <STEPControl_Writer.hxx>
#include <STEPControl_StepModelType.hxx>
#include <IFSelect_ReturnStatus.hxx>
#include <TopoDS_Shape.hxx>
#include <sstream>
#include <string>

using namespace emscripten;

static std::string ExportSTEP(const TopoDS_Shape& shape)
{
  STEPControl_Writer writer;
  IFSelect_ReturnStatus status = writer.Transfer(shape, STEPControl_AsIs);
  if (status != IFSelect_RetDone)
    return "";

  std::ostringstream oss;
  status = writer.WriteStream(oss);
  if (status != IFSelect_RetDone)
    return "";

  return oss.str();
}

EMSCRIPTEN_BINDINGS(step_export_helpers) {
  function("ExportSTEP", &ExportSTEP);
}
