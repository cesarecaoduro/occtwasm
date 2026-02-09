// curve_measure_helpers.cpp
//
// Length calculation and point-at-length for edges and wires.
// Wraps BRepAdaptor_Curve + GCPnts_AbscissaPoint (which require
// abstract base class Adaptor3d_Curve that can't be bound directly).

#include <emscripten/bind.h>

#include <BRepAdaptor_Curve.hxx>
#include <GCPnts_AbscissaPoint.hxx>
#include <TopoDS_Edge.hxx>
#include <TopoDS_Wire.hxx>
#include <TopoDS.hxx>
#include <TopExp_Explorer.hxx>
#include <TopAbs_ShapeEnum.hxx>
#include <gp_Pnt.hxx>

using namespace emscripten;

// Total length of an edge
static Standard_Real edgeLength(const TopoDS_Edge& edge)
{
  BRepAdaptor_Curve curve(edge);
  return GCPnts_AbscissaPoint::Length(curve);
}

// Point at a given arc-length distance from the start of an edge
static gp_Pnt pointAtLengthOnEdge(const TopoDS_Edge& edge, Standard_Real length)
{
  BRepAdaptor_Curve curve(edge);
  Standard_Real u0 = curve.FirstParameter();
  GCPnts_AbscissaPoint absc(curve, length, u0);
  if (!absc.IsDone())
    return gp_Pnt(0, 0, 0);
  return curve.Value(absc.Parameter());
}

// Total length of a wire (sum of all edge lengths)
static Standard_Real wireLength(const TopoDS_Wire& wire)
{
  Standard_Real total = 0.0;
  for (TopExp_Explorer ex(wire, TopAbs_EDGE); ex.More(); ex.Next()) {
    const TopoDS_Edge& edge = TopoDS::Edge(ex.Current());
    total += edgeLength(edge);
  }
  return total;
}

// Point at a given arc-length distance from the start of a wire
static gp_Pnt pointAtLengthOnWire(const TopoDS_Wire& wire, Standard_Real targetLength)
{
  Standard_Real accumulated = 0.0;
  for (TopExp_Explorer ex(wire, TopAbs_EDGE); ex.More(); ex.Next()) {
    const TopoDS_Edge& edge = TopoDS::Edge(ex.Current());
    Standard_Real len = edgeLength(edge);
    if (accumulated + len >= targetLength) {
      // The target point is on this edge
      Standard_Real localLen = targetLength - accumulated;
      return pointAtLengthOnEdge(edge, localLen);
    }
    accumulated += len;
  }
  // Past the end — return the last point of the last edge
  // (or origin if wire is empty)
  return gp_Pnt(0, 0, 0);
}

EMSCRIPTEN_BINDINGS(curve_measure_helpers) {
  function("EdgeLength", &edgeLength);
  function("PointAtLengthOnEdge", &pointAtLengthOnEdge);
  function("WireLength", &wireLength);
  function("PointAtLengthOnWire", &pointAtLengthOnWire);
}
