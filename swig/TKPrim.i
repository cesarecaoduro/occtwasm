// Created: 2008-10-01
//
// Copyright (c) 2008-2021 OPEN CASCADE SAS
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

// Definitions for wrapping Open CASCADE classes from TKPrim toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKPrim.lib")
#endif
%}

// BRepPrim enums
WRAP_AS_ENUM_INCLUDE(BRepPrim_Direction)

// BRepPrim classes
WRAP_AS_CLASS_INCLUDE(BRepPrim_Builder)
WRAP_AS_CLASS_INCLUDE(BRepPrim_OneAxis)
WRAP_AS_CLASS_INCLUDE(BRepPrim_GWedge)
WRAP_AS_CLASS_INCLUDE(BRepPrim_Wedge)
WRAP_AS_CLASS_INCLUDE(BRepPrim_Revolution)
WRAP_AS_CLASS_INCLUDE(BRepPrim_Cylinder)
WRAP_AS_CLASS_INCLUDE(BRepPrim_Cone)
WRAP_AS_CLASS_INCLUDE(BRepPrim_Sphere)
WRAP_AS_CLASS_INCLUDE(BRepPrim_Torus)

// BRepSweep classes
WRAP_AS_CLASS_INCLUDE(BRepSweep_Prism)
WRAP_AS_CLASS_INCLUDE(BRepSweep_Revol)

// BRepPrimAPI classes
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeHalfSpace)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeBox)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeWedge)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeOneAxis)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeCylinder)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeCone)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeSphere)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeTorus)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeRevolution)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeSweep)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakePrism)
WRAP_AS_CLASS_INCLUDE(BRepPrimAPI_MakeRevol)
