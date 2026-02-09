// Created: 2015-04-15
//
// Copyright (c) 2015-2021 OPEN CASCADE SAS
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

// Definitions for wrapping Open CASCADE classes from TKMesh toolkit 
// to CSharp and Java using SWIG.

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKMesh.lib")
#endif
%}

// BRepMesh classes
WRAP_AS_HANDLE_INCLUDE(BRepMesh_DiscretRoot)
WRAP_AS_ENUM_INCLUDE(IMeshTools_MeshAlgoType)
WRAP_AS_HANDLE_INCLUDE(IMeshData_Shape)
WRAP_AS_HANDLE_INCLUDE(IMeshTools_Context)
WRAP_AS_STRUCT_INCLUDE(IMeshTools_Parameters)

%ignore BRepMesh_IncrementalMesh::Discret; // poor and useless
WRAP_AS_HANDLE_INCLUDE(BRepMesh_IncrementalMesh)
