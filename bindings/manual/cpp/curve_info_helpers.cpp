// curve_info_helpers.cpp
//
// Extracts BSpline curve information from TopoDS_Edge objects.
// Used to prove that intersection results are true NURBS curves,
// by returning the control polygon, knots, and degree to JavaScript.

#include <emscripten/bind.h>
#include <emscripten/val.h>

#include <BRep_Tool.hxx>
#include <TopoDS_Edge.hxx>
#include <Geom_Curve.hxx>
#include <Geom_BSplineCurve.hxx>
#include <gp_Pnt.hxx>

using namespace emscripten;

static val GetEdgeBSplineInfo(const TopoDS_Edge& edge)
{
  val result = val::object();
  result.set("isBSpline", false);

  Standard_Real first, last;
  Handle(Geom_Curve) curve = BRep_Tool::Curve(edge, first, last);
  if (curve.IsNull()) return result;

  Handle(Geom_BSplineCurve) bsc = Handle(Geom_BSplineCurve)::DownCast(curve);
  if (bsc.IsNull()) return result;

  result.set("isBSpline", true);
  result.set("degree", bsc->Degree());
  result.set("nbPoles", bsc->NbPoles());
  result.set("nbKnots", bsc->NbKnots());
  result.set("paramFirst", first);
  result.set("paramLast", last);

  val poles = val::array();
  for (int i = 1; i <= bsc->NbPoles(); ++i) {
    gp_Pnt p = bsc->Pole(i);
    poles.call<void>("push", p.X(), p.Y(), p.Z());
  }
  result.set("poles", poles);

  val knots = val::array();
  for (int i = 1; i <= bsc->NbKnots(); ++i)
    knots.call<void>("push", bsc->Knot(i));
  result.set("knots", knots);

  val mults = val::array();
  for (int i = 1; i <= bsc->NbKnots(); ++i)
    mults.call<void>("push", bsc->Multiplicity(i));
  result.set("mults", mults);

  val weights = val::array();
  for (int i = 1; i <= bsc->NbPoles(); ++i)
    weights.call<void>("push", bsc->Weight(i));
  result.set("weights", weights);

  result.set("isRational", (bool)bsc->IsRational());
  result.set("isPeriodic", (bool)bsc->IsPeriodic());

  return result;
}

EMSCRIPTEN_BINDINGS(curve_info_helpers) {
  function("GetEdgeBSplineInfo", &GetEdgeBSplineInfo);
}
