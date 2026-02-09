// Created: 2006-06-22
//
// Copyright (c) 2006-2021 OPEN CASCADE SAS
//
// This file is part of commercial software by OPEN CASCADE SAS.
//
// This software is furnished in accordance with the terms and conditions
// of the contract and with the inclusion of this copyright notice.
// This software or any other copy thereof may not be provided or otherwise
// be made available to any third party.
//
// No ownership title to the software is transferred hereby.
//
// OPEN CASCADE SAS makes no representation or warranties with respect to the
// performance of this software, and specifically disclaims any responsibility
// for any damages, special or consequential, connected with its use.

// Definitions for wrapping Open CASCADE classes from TKG3d toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKG3d.lib")
#endif
%}

// G3d Exceptions
WRAP_AS_EXCEPTION(Geom_UndefinedDerivative)
WRAP_AS_EXCEPTION(Geom_UndefinedValue)
WRAP_AS_EXCEPTION(GProp_UndefinedAxis)

// Geom classes
WRAP_AS_HANDLE_INCLUDE(Geom_Geometry)
WRAP_AS_HANDLE_INCLUDE(Geom_Point)
WRAP_AS_HANDLE_INCLUDE(Geom_CartesianPoint)
WRAP_AS_HANDLE_INCLUDE(Geom_Vector)
WRAP_AS_HANDLE_INCLUDE(Geom_Direction)
WRAP_AS_HANDLE_INCLUDE(Geom_VectorWithMagnitude)
WRAP_AS_HANDLE_INCLUDE(Geom_AxisPlacement)
WRAP_AS_HANDLE_INCLUDE(Geom_Axis1Placement)
WRAP_AS_HANDLE_INCLUDE(Geom_Axis2Placement)
WRAP_AS_HANDLE_INCLUDE(Geom_Transformation)
WRAP_AS_HANDLE_INCLUDE(Geom_Curve)
WRAP_AS_HANDLE_INCLUDE(Geom_Line)
WRAP_AS_HANDLE_INCLUDE(Geom_Conic)
WRAP_AS_HANDLE_INCLUDE(Geom_Circle)
WRAP_AS_HANDLE_INCLUDE(Geom_Ellipse)
WRAP_AS_HANDLE_INCLUDE(Geom_Hyperbola)
WRAP_AS_HANDLE_INCLUDE(Geom_Parabola)
WRAP_AS_HANDLE_INCLUDE(Geom_BoundedCurve)
WRAP_AS_HANDLE_INCLUDE(Geom_BezierCurve)
WRAP_AS_HANDLE_INCLUDE(Geom_BSplineCurve)
WRAP_AS_HANDLE_INCLUDE(Geom_TrimmedCurve)
WRAP_AS_HANDLE_INCLUDE(Geom_OffsetCurve)

WRAP_AS_HANDLE_INCLUDE(Geom_Surface)
WRAP_AS_HANDLE_INCLUDE(Geom_ElementarySurface)
WRAP_AS_HANDLE_INCLUDE(Geom_Plane)
WRAP_AS_HANDLE_INCLUDE(Geom_ConicalSurface)
WRAP_AS_HANDLE_INCLUDE(Geom_CylindricalSurface)
WRAP_AS_HANDLE_INCLUDE(Geom_SphericalSurface)
WRAP_AS_HANDLE_INCLUDE(Geom_ToroidalSurface)
%warnfilter(403) Geom_SweptSurface; // disable SWIG warning on abstract class
WRAP_AS_HANDLE_INCLUDE(Geom_SweptSurface)
WRAP_AS_HANDLE_INCLUDE(Geom_SurfaceOfLinearExtrusion)
WRAP_AS_HANDLE_INCLUDE(Geom_SurfaceOfRevolution)
%warnfilter(403) Geom_BoundedSurface; // disable SWIG warning on abstract class
WRAP_AS_HANDLE_INCLUDE(Geom_BoundedSurface)
WRAP_AS_HANDLE_INCLUDE(Geom_BezierSurface)
WRAP_AS_HANDLE_INCLUDE(Geom_BSplineSurface)
WRAP_AS_HANDLE_INCLUDE(Geom_RectangularTrimmedSurface)
WRAP_AS_HANDLE_INCLUDE(Geom_OsculatingSurface)
WRAP_AS_HANDLE_INCLUDE(Geom_OffsetSurface)

// Adaptor3d classes
%rename(GetCurveType) Adaptor3d_Curve::GetType; // overrides C# standard method
WRAP_AS_HANDLE_INCLUDE(Adaptor3d_Curve)
%rename(GetSurfaceType) Adaptor3d_Surface::GetType; // overrides C# standard method
WRAP_AS_HANDLE_INCLUDE(Adaptor3d_Surface)
WRAP_AS_HANDLE_INCLUDE(Adaptor3d_CurveOnSurface)

// GeomAdaptor classes
WRAP_AS_HANDLE_INCLUDE(GeomAdaptor_Curve)
WRAP_AS_HANDLE_INCLUDE(GeomAdaptor_Surface)

// GeomLProp package and classes
WRAP_AS_CLASS_INCLUDE(GeomLProp_CLProps)
WRAP_AS_CLASS_INCLUDE(GeomLProp_SLProps)
WRAP_AS_PACKAGE(GeomLProp)

// TColGeom classes
WRAP_AS_NCOLLECTION_INCLUDE(TColGeom_Array1OfCurve,NCollection_Array1,Handle(Geom_Curve))
WRAP_AS_HANDLE_INCLUDE(TColGeom_HArray1OfCurve)
WRAP_AS_NCOLLECTION_INCLUDE(TColGeom_Array1OfSurface,NCollection_Array1,Handle(Geom_Surface))
WRAP_AS_HANDLE_INCLUDE(TColGeom_HArray1OfSurface)
WRAP_AS_TEMPLATE(TColGeom_Array2OfSurface,NCollection_Array2< Handle(Geom_Surface) >)
WRAP_AS_HANDLE_INCLUDE(TColGeom_HArray2OfSurface)
WRAP_AS_NCOLLECTION_INCLUDE(TColGeom_Array1OfBSplineCurve,NCollection_Array1,Handle(Geom_BSplineCurve))
WRAP_AS_HANDLE_INCLUDE(TColGeom_HArray1OfBSplineCurve)
WRAP_AS_NCOLLECTION(TColGeom_Array1OfBezierSurface,NCollection_Array1,Handle(Geom_BezierSurface))
%{
  typedef NCollection_Array1<Handle(Geom_BezierSurface)> TColGeom_Array1OfBezierSurface;
%}
WRAP_AS_TEMPLATE(TColGeom_Array2OfBezierSurface,NCollection_Array2< Handle(Geom_BezierSurface) >)
