// Created: 2008-12-01
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

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKOffset.lib")
#endif
%}

// BRepOffset enums
WRAP_AS_ENUM_INCLUDE(BRepOffset_Mode)
WRAP_AS_ENUM_INCLUDE(BRepOffset_Error)

// Draft enums
WRAP_AS_ENUM_INCLUDE(Draft_ErrorStatus)

// BRepOffset classes
%ignore BRepOffset_MakeOffset::GetAnalyse;
WRAP_AS_CLASS_INCLUDE(BRepOffset_MakeOffset)

// BRepOffsetAPI classes
WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_ThruSections)

WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_MakePipe)
WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_MakePipeShell)

WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_MakeDraft)
WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_MakeFilling)
WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_MakeEvolved)
WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_MakeOffset)

WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_MakeOffsetShape)
WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_MakeThickSolid)

WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_DraftAngle)
WRAP_AS_CLASS_INCLUDE(BRepOffsetAPI_NormalProjection)
