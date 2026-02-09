// Created: 2019-11-15
//
// Copyright (c) 2019-2021 OPEN CASCADE SAS
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

// Definitions for wrapping Open CASCADE classes from TKRWMesh toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKRWMesh.lib") 
#endif
%}

// RWMesh classes
WRAP_AS_ENUM_INCLUDE(RWMesh_CoordinateSystem)
WRAP_AS_CLASS_INCLUDE(RWMesh_CoordinateSystemConverter)
WRAP_AS_HANDLE(RWMesh_TriangulationSource)
WRAP_AS_HANDLE(RWMesh_TriangulationReader)
WRAP_INCLUDE(RWMesh_TriangulationSource)
WRAP_INCLUDE(RWMesh_TriangulationReader)
WRAP_AS_ENUM_INCLUDE(RWMesh_NameFormat)
WRAP_AS_CLASS_INCLUDE(RWMesh_NodeAttributes)

WRAP_AS_HANDLE_INCLUDE(RWMesh_CafReader)
