// Created: 2007-06-28
//
// Copyright (c) 2007-2021 OPEN CASCADE SAS
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

// Definitions for wrapping Open CASCADE classes from TKBO toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKBool.lib")
#endif
%}

// BRepAlgo classes
WRAP_AS_CLASS_INCLUDE(BRepAlgo_NormalProjection)
WRAP_AS_CLASS_INCLUDE(BRepAlgo_Image)

WRAP_AS_PACKAGE(BRepAlgo)

// BRepProj classes
WRAP_AS_CLASS_INCLUDE(BRepProj_Projection)

// BRepFill enums
WRAP_AS_ENUM_INCLUDE(BRepFill_TypeOfContact)

// BRepFill classes
WRAP_AS_CLASS_INCLUDE(BRepFill_Evolved)
WRAP_AS_CLASS_INCLUDE(BRepFill_Pipe)
WRAP_AS_CLASS_INCLUDE(BRepFill_Filling)
WRAP_AS_PACKAGE(BRepFill)

// TopOpeBRepTool enumerations and classes
WRAP_AS_ENUM_INCLUDE(TopOpeBRepTool_OutCurveType)

WRAP_AS_CLASS_INCLUDE(TopOpeBRepTool_ShapeClassifier)
WRAP_AS_CLASS_INCLUDE(TopOpeBRepTool_ShapeTool)
WRAP_AS_CLASS_INCLUDE(TopOpeBRepTool_SolidClassifier)
