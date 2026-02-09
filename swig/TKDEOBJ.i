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

// Definitions for wrapping Open CASCADE classes from TKDEOBJ toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKDEOBJ.lib")
#endif
%}

// RWObj package
WRAP_AS_STRUCT_INCLUDE(RWObj_Material)
WRAP_AS_HANDLE_INCLUDE(RWObj_Reader)
WRAP_AS_HANDLE_INCLUDE(RWObj_TriangulationReader)
%extend RWObj_IShapeReceiver { virtual ~RWObj_IShapeReceiver() {}; };
WRAP_AS_HANDLE_INCLUDE(RWObj_CafReader)
WRAP_AS_HANDLE_INCLUDE(RWObj_CafWriter)

WRAP_AS_HANDLE_INCLUDE(DEOBJ_ConfigurationNode)
WRAP_AS_HANDLE_INCLUDE(DEOBJ_Provider)
