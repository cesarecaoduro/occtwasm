// arc_helpers.cpp
//
// Creates arc edges from 3 points without requiring Handle types.
// Uses gce_MakeCirc to compute the circle, then BRepBuilderAPI_MakeEdge
// with parameter-based arc construction for correct orientation.

#include <emscripten/bind.h>

#include <gp_Pnt.hxx>
#include <gp_Pnt2d.hxx>
#include <gp_Circ.hxx>
#include <gp_Circ2d.hxx>
#include <gce_MakeCirc.hxx>
#include <gce_MakeCirc2d.hxx>
#include <ElCLib.hxx>
#include <BRepBuilderAPI_MakeEdge.hxx>
#include <BRepBuilderAPI_MakeEdge2d.hxx>
#include <TopoDS_Edge.hxx>

using namespace emscripten;

// Build a 3D arc edge passing through P1, P2, P3 in order.
static TopoDS_Edge makeArcEdge3d(const gp_Pnt& P1, const gp_Pnt& P2, const gp_Pnt& P3)
{
  gce_MakeCirc mc(P1, P2, P3);
  if (!mc.IsDone())
    return TopoDS_Edge();

  const gp_Circ& circ = mc.Value();

  // Compute parametric values on the circle for each point
  Standard_Real u1 = ElCLib::Parameter(circ, P1);
  Standard_Real u2 = ElCLib::Parameter(circ, P2);
  Standard_Real u3 = ElCLib::Parameter(circ, P3);

  // Ensure u1 < u2 < u3 by unwrapping angles
  // The arc must go from u1 to u3 passing through u2.
  if (u2 < u1) u2 += 2.0 * M_PI;
  if (u3 < u1) u3 += 2.0 * M_PI;

  // If u2 is not between u1 and u3, we need the complementary arc
  if (u2 > u3) {
    // Swap direction: go from u1 backwards (decrease angle) to u3
    // Equivalently, go from u3 to u1 in the positive direction
    // and then reverse the edge
    Standard_Real tmp = u1;
    u1 = u3;
    u3 = tmp + 2.0 * M_PI;
  }

  BRepBuilderAPI_MakeEdge me(circ, u1, u3);
  if (!me.IsDone())
    return TopoDS_Edge();

  return me.Edge();
}

// Build a 2D arc edge passing through P1, P2, P3 (lifted to Z=0 in 3D space).
static TopoDS_Edge makeArcEdge2d(const gp_Pnt2d& P1, const gp_Pnt2d& P2, const gp_Pnt2d& P3)
{
  // Lift 2D points to 3D (Z=0)
  gp_Pnt p1(P1.X(), P1.Y(), 0.0);
  gp_Pnt p2(P2.X(), P2.Y(), 0.0);
  gp_Pnt p3(P3.X(), P3.Y(), 0.0);
  return makeArcEdge3d(p1, p2, p3);
}

EMSCRIPTEN_BINDINGS(arc_helpers) {
  function("MakeArcEdge3d", &makeArcEdge3d);
  function("MakeArcEdge2d", &makeArcEdge2d);
}
