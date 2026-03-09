// bspline_helpers.cpp
//
// Factory functions to create BSpline curves and surfaces from flat JS arrays.
// OCCT's Geom_BSplineCurve/Surface require TColgp_Array1OfPnt and
// TColStd_Array1Of* collections, which are awkward to bind via embind.
// Instead we provide factory functions that accept emscripten::val (JS arrays)
// and construct the OCCT objects internally, returning topology types.

#include <emscripten/bind.h>
#include <emscripten/val.h>

#include <Geom_BSplineCurve.hxx>
#include <Geom_BSplineSurface.hxx>
#include <BRepBuilderAPI_MakeEdge.hxx>
#include <BRepBuilderAPI_MakeFace.hxx>
#include <TColgp_Array1OfPnt.hxx>
#include <TColgp_Array2OfPnt.hxx>
#include <TColStd_Array1OfReal.hxx>
#include <TColStd_Array1OfInteger.hxx>
#include <TopoDS_Edge.hxx>
#include <TopoDS_Face.hxx>
#include <gp_Pnt.hxx>

using namespace emscripten;

static TopoDS_Edge MakeBSplineCurveEdge(
    val jsPoles,    // flat [x0,y0,z0, x1,y1,z1, ...]
    val jsKnots,    // [k0, k1, ...]
    val jsMults,    // [m0, m1, ...]
    int degree)
{
  const int nPoles = jsPoles["length"].as<int>() / 3;
  const int nKnots = jsKnots["length"].as<int>();

  TColgp_Array1OfPnt poles(1, nPoles);
  for (int i = 0; i < nPoles; ++i) {
    double x = jsPoles[i * 3 + 0].as<double>();
    double y = jsPoles[i * 3 + 1].as<double>();
    double z = jsPoles[i * 3 + 2].as<double>();
    poles.SetValue(i + 1, gp_Pnt(x, y, z));
  }

  TColStd_Array1OfReal knots(1, nKnots);
  for (int i = 0; i < nKnots; ++i)
    knots.SetValue(i + 1, jsKnots[i].as<double>());

  TColStd_Array1OfInteger mults(1, nKnots);
  for (int i = 0; i < nKnots; ++i)
    mults.SetValue(i + 1, jsMults[i].as<int>());

  Handle(Geom_BSplineCurve) curve =
      new Geom_BSplineCurve(poles, knots, mults, degree);

  BRepBuilderAPI_MakeEdge edgeMaker(curve);
  return edgeMaker.Edge();
}

static TopoDS_Face MakeBSplineSurfaceFace(
    val jsPoles,    // flat [x0,y0,z0, x1,y1,z1, ...] row-major (U varies fastest)
    val jsUKnots,
    val jsVKnots,
    val jsUMults,
    val jsVMults,
    int uDeg,
    int vDeg,
    int nUPoles,
    int nVPoles)
{
  const int nUKnots = jsUKnots["length"].as<int>();
  const int nVKnots = jsVKnots["length"].as<int>();

  TColgp_Array2OfPnt poles(1, nUPoles, 1, nVPoles);
  for (int iv = 0; iv < nVPoles; ++iv) {
    for (int iu = 0; iu < nUPoles; ++iu) {
      int idx = (iv * nUPoles + iu) * 3;
      double x = jsPoles[idx + 0].as<double>();
      double y = jsPoles[idx + 1].as<double>();
      double z = jsPoles[idx + 2].as<double>();
      poles.SetValue(iu + 1, iv + 1, gp_Pnt(x, y, z));
    }
  }

  TColStd_Array1OfReal uKnots(1, nUKnots);
  for (int i = 0; i < nUKnots; ++i)
    uKnots.SetValue(i + 1, jsUKnots[i].as<double>());

  TColStd_Array1OfReal vKnots(1, nVKnots);
  for (int i = 0; i < nVKnots; ++i)
    vKnots.SetValue(i + 1, jsVKnots[i].as<double>());

  TColStd_Array1OfInteger uMults(1, nUKnots);
  for (int i = 0; i < nUKnots; ++i)
    uMults.SetValue(i + 1, jsUMults[i].as<int>());

  TColStd_Array1OfInteger vMults(1, nVKnots);
  for (int i = 0; i < nVKnots; ++i)
    vMults.SetValue(i + 1, jsVMults[i].as<int>());

  Handle(Geom_BSplineSurface) surface =
      new Geom_BSplineSurface(poles, uKnots, vKnots, uMults, vMults, uDeg, vDeg);

  BRepBuilderAPI_MakeFace faceMaker(surface, 1e-6);
  return faceMaker.Face();
}

EMSCRIPTEN_BINDINGS(bspline_helpers) {
  function("MakeBSplineCurveEdge", &MakeBSplineCurveEdge);
  function("MakeBSplineSurfaceFace", &MakeBSplineSurfaceFace);
}
