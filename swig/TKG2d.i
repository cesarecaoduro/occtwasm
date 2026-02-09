// Created: 2006-07-18
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

// Definitions for wrapping Open CASCADE classes from TKG2d toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKG2d.lib")
#endif
%}

// G2d Exceptions
WRAP_AS_EXCEPTION(Geom2d_UndefinedDerivative)
WRAP_AS_EXCEPTION(Geom2d_UndefinedValue)
WRAP_AS_EXCEPTION(LProp_BadContinuity)
WRAP_AS_EXCEPTION(LProp_NotDefined)

WRAP_AS_HANDLE_INCLUDE(Geom2d_Transformation)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Geometry)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Point)
WRAP_AS_HANDLE_INCLUDE(Geom2d_CartesianPoint)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Vector)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Direction)
WRAP_AS_HANDLE_INCLUDE(Geom2d_VectorWithMagnitude)
WRAP_AS_HANDLE_INCLUDE(Geom2d_AxisPlacement)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Curve)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Line)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Conic)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Circle)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Ellipse)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Hyperbola)
WRAP_AS_HANDLE_INCLUDE(Geom2d_Parabola)
WRAP_AS_HANDLE_INCLUDE(Geom2d_BoundedCurve)
WRAP_AS_HANDLE_INCLUDE(Geom2d_BezierCurve)
WRAP_AS_HANDLE_INCLUDE(Geom2d_BSplineCurve)
WRAP_AS_HANDLE_INCLUDE(Geom2d_TrimmedCurve)
WRAP_AS_HANDLE_INCLUDE(Geom2d_OffsetCurve)

// LProp classes
WRAP_AS_ENUM_INCLUDE(LProp_CIType)
WRAP_AS_CLASS_INCLUDE(LProp_CurAndInf)

// TColGeom2d classes
WRAP_AS_NCOLLECTION_INCLUDE(TColGeom2d_Array1OfCurve,NCollection_Array1,Handle(Geom2d_Curve))
WRAP_AS_HANDLE_INCLUDE(TColGeom2d_HArray1OfCurve)

// Adaptor2d classes
%rename(GetCurveType) Adaptor2d_Curve2d::GetType; // overrides C# standard method
WRAP_AS_HANDLE_INCLUDE(Adaptor2d_Curve2d)

//Geom2dAdaptor classes
WRAP_AS_HANDLE_INCLUDE(Geom2dAdaptor_Curve)

// Geom2dLProp classes
WRAP_AS_CLASS_INCLUDE(Geom2dLProp_CLProps2d)
WRAP_AS_CLASS_INCLUDE(Geom2dLProp_CurAndInf2d)

//package GProp
WRAP_AS_STRUCT_INCLUDE(GProp_PrincipalProps)
WRAP_AS_STRUCT_INCLUDE(GProp_GProps)
