// Created: 2014-08-25
//
// Copyright (c) 2014-2021 OPEN CASCADE SAS
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
#pragma comment(lib, "TKFillet.lib")
#endif
%}

// ChFi* enums
WRAP_AS_ENUM_INCLUDE(ChFi2d_ConstructionError)
WRAP_AS_ENUM_INCLUDE(ChFi3d_FilletShape)
WRAP_AS_ENUM_INCLUDE(ChFiDS_ErrorStatus)

// BRepFilletAPI classes
%ignore BRepFilletAPI_LocalOperation::Sect;
WRAP_AS_CLASS_INCLUDE(BRepFilletAPI_LocalOperation)
%ignore BRepFilletAPI_MakeChamfer::Sect;
%ignore BRepFilletAPI_MakeChamfer::Builder;
WRAP_AS_CLASS_INCLUDE(BRepFilletAPI_MakeChamfer)
%ignore BRepFilletAPI_MakeFillet::Sect;
%ignore BRepFilletAPI_MakeFillet::Builder;
WRAP_AS_CLASS_INCLUDE(BRepFilletAPI_MakeFillet)
WRAP_AS_CLASS_INCLUDE(BRepFilletAPI_MakeFillet2d)
