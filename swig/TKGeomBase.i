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

// Definitions for wrapping Open CASCADE classes from TKGeomBase toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKGeomBase.lib")
#endif
%}

// GeomConvert classes
WRAP_AS_CLASS_INCLUDE(GeomConvert_ApproxCurve)
WRAP_AS_CLASS_INCLUDE(GeomConvert_ApproxSurface)
WRAP_AS_CLASS_INCLUDE(GeomConvert_CompBezierSurfacesToBSplineSurface)
WRAP_AS_PACKAGE(GeomConvert)

// AppParCurves enums and classes
WRAP_AS_ENUM_INCLUDE(AppParCurves_Constraint)
WRAP_AS_CLASS_INCLUDE(AppParCurves_MultiPoint)
WRAP_AS_NCOLLECTION_INCLUDE(AppParCurves_Array1OfMultiPoint,NCollection_Array1,AppParCurves_MultiPoint)
WRAP_AS_CLASS_INCLUDE(AppParCurves_MultiCurve)
WRAP_AS_CLASS_INCLUDE(AppParCurves_MultiBSpCurve)

// Approx enums
WRAP_AS_ENUM_INCLUDE(Approx_ParametrizationType)

// AppDef classes
WRAP_AS_CLASS_INCLUDE(AppDef_MultiPointConstraint)
WRAP_AS_NCOLLECTION_INCLUDE(AppDef_Array1OfMultiPointConstraint,NCollection_Array1,AppDef_MultiPointConstraint)
%ignore AppDef_MultiLine::SetParameter; // not implemented
WRAP_AS_CLASS_INCLUDE(AppDef_MultiLine)
WRAP_AS_CLASS_INCLUDE(AppDef_BSplineCompute)

// IntAna classess
WRAP_AS_ENUM_INCLUDE(IntAna_ResultType)
WRAP_AS_STRUCT_INCLUDE(IntAna_Curve)
WRAP_AS_STRUCT_INCLUDE(IntAna_Quadric)
WRAP_AS_STRUCT_INCLUDE(IntAna_IntConicQuad)
WRAP_AS_STRUCT_INCLUDE(IntAna_IntQuadQuad)
WRAP_AS_STRUCT_INCLUDE(IntAna_IntLinTorus)
WRAP_AS_STRUCT_INCLUDE(IntAna_QuadQuadGeo)

// gce types
WRAP_AS_ENUM_INCLUDE(gce_ErrorType)

// gce classes
WRAP_AS_CLASS_INCLUDE(gce_Root)
%ignore gce_MakeCirc::operator gp_Circ;
WRAP_AS_CLASS_INCLUDE(gce_MakeCirc)
%ignore gce_MakeCirc2d::operator gp_Circ2d;
WRAP_AS_CLASS_INCLUDE(gce_MakeCirc2d)
%ignore gce_MakeDir2d::operator gp_Dir2d;
WRAP_AS_CLASS_INCLUDE(gce_MakeDir2d)

// GCE2d classes
WRAP_AS_CLASS_INCLUDE(GCE2d_Root)
%ignore GCE2d_MakeArcOfCircle::operator const Handle(Geom2d_TrimmedCurve)&;
WRAP_AS_CLASS_INCLUDE(GCE2d_MakeArcOfCircle)
%ignore GCE2d_MakeLine::operator const Handle(Geom2d_Line)&;
WRAP_AS_CLASS_INCLUDE(GCE2d_MakeLine)
%ignore GCE2d_MakeSegment::operator const Handle(Geom2d_TrimmedCurve)&;
WRAP_AS_CLASS_INCLUDE(GCE2d_MakeSegment)

// GC classes
WRAP_AS_CLASS_INCLUDE(GC_Root)
%ignore GC_MakePlane::operator const Handle(Geom_Plane)&;
%ignore GC_MakePlane::operator const Handle(Geom_Surface)&;
WRAP_AS_CLASS_INCLUDE(GC_MakePlane)
%ignore GC_MakeRotation::operator const Handle(Geom_Transformation)&;
WRAP_AS_CLASS_INCLUDE(GC_MakeRotation)
%ignore GC_MakeTranslation::operator const Handle(Geom_Transformation)&;
WRAP_AS_CLASS_INCLUDE(GC_MakeTranslation)
%ignore GC_MakeArcOfCircle::operator const Handle(Geom_TrimmedCurve)&;
WRAP_AS_CLASS_INCLUDE(GC_MakeArcOfCircle)
%ignore GC_MakeSegment::operator const Handle(Geom_TrimmedCurve)&;
WRAP_AS_CLASS_INCLUDE(GC_MakeSegment)

// GCPnts classes
WRAP_AS_ENUM_INCLUDE(GCPnts_AbscissaType)
WRAP_AS_ENUM_INCLUDE(GCPnts_DeflectionType)
WRAP_AS_CLASS_INCLUDE(GCPnts_AbscissaPoint)
%ignore GCPnts_DistFunction::GCPnts_DistFunction(const GCPnts_DistFunction& theOther);
WRAP_AS_CLASS_INCLUDE(GCPnts_DistFunction)
%ignore GCPnts_DistFunction2d::GCPnts_DistFunction2d(const GCPnts_DistFunction2d& theOther);
WRAP_AS_CLASS_INCLUDE(GCPnts_DistFunction2d)
WRAP_AS_CLASS_INCLUDE(GCPnts_QuasiUniformAbscissa)
WRAP_AS_CLASS_INCLUDE(GCPnts_QuasiUniformDeflection)
WRAP_AS_CLASS_INCLUDE(GCPnts_TangentialDeflection)
WRAP_AS_CLASS_INCLUDE(GCPnts_UniformAbscissa)
WRAP_AS_CLASS_INCLUDE(GCPnts_UniformDeflection)

// Extrema enumerations
WRAP_AS_ENUM_INCLUDE(Extrema_ExtFlag)
WRAP_AS_ENUM_INCLUDE(Extrema_ExtAlgo)

// ProjLib package
%ignore ProjLib::MakePCurveOfType; // uses non-wrapped type
WRAP_AS_PACKAGE(ProjLib)

