// Created: 2007-06-26
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

// Definitions for wrapping Open CASCADE classes from TKTopAlgo toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKTopAlgo.lib")
#endif
%}

// BRepExtrema Exceptions
WRAP_AS_EXCEPTION(BRepExtrema_UnCompatibleShape)

// IntCurvesFace 
WRAP_AS_HANDLE_INCLUDE(IntCurvesFace_Intersector)

// BRepClass3d classes
%ignore BRepClass3d_SolidExplorer::GetTree; // returns non-wrapped type
WRAP_AS_CLASS_INCLUDE(BRepClass3d_SolidExplorer)
WRAP_AS_CLASS_INCLUDE(BRepClass3d_SClassifier)
WRAP_AS_CLASS_INCLUDE(BRepClass3d_SolidClassifier)

// Enumerations from BRepBuilderAPI package 
WRAP_AS_ENUM_INCLUDE(BRepBuilderAPI_EdgeError)
WRAP_AS_ENUM_INCLUDE(BRepBuilderAPI_WireError)
WRAP_AS_ENUM_INCLUDE(BRepBuilderAPI_FaceError)
WRAP_AS_ENUM_INCLUDE(BRepBuilderAPI_ShellError)
WRAP_AS_ENUM_INCLUDE(BRepBuilderAPI_PipeError)
WRAP_AS_ENUM_INCLUDE(BRepBuilderAPI_ShapeModification)
WRAP_AS_ENUM_INCLUDE(BRepBuilderAPI_TransitionMode)

// BRepBuilderAPI classes
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_Command)
%ignore operator TopoDS_Shape;
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_MakeShape)
%ignore operator TopoDS_Vertex;
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_MakeVertex)
%ignore operator TopoDS_Edge;
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_MakeEdge)
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_MakeEdge2d)
%ignore operator TopoDS_Wire;
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_MakePolygon)
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_MakeWire)
%ignore operator TopoDS_Face;
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_MakeFace)
%ignore operator TopoDS_Shell;
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_MakeShell)
%ignore operator TopoDS_Solid;
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_MakeSolid)

WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_ModifyShape)
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_Transform)
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_NurbsConvert)
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_GTransform)
WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_Copy)

WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_FindPlane)

WRAP_AS_CLASS_INCLUDE(BRepBuilderAPI_Collect)

WRAP_AS_HANDLE_INCLUDE(BRepBuilderAPI_Sewing)

//package methods
WRAP_AS_PACKAGE(BRepBuilderAPI)

//package BRepBndLib
WRAP_AS_PACKAGE(BRepBndLib)

//package BRepCheck
WRAP_AS_ENUM_WNULL_INCLUDE(BRepCheck_Status, BRepCheck_CheckFail)
#if ! defined(SWIGJAVA) /* does not work for BRepCheck_Status in Java (??) */
%ignore NCollection_List<BRepCheck_Status>::InsertAfter; // causes compiler error in wrapper C++
%ignore NCollection_List<BRepCheck_Status>::InsertBefore;
WRAP_AS_NCOLLECTION_INCLUDE(BRepCheck_ListOfStatus,NCollection_List,BRepCheck_Status)
#endif

WRAP_AS_HANDLE_INCLUDE(BRepCheck_Result)
WRAP_AS_HANDLE_INCLUDE(BRepCheck_Vertex)
WRAP_AS_HANDLE_INCLUDE(BRepCheck_Edge)
WRAP_AS_HANDLE_INCLUDE(BRepCheck_Wire)
WRAP_AS_HANDLE_INCLUDE(BRepCheck_Face)
WRAP_AS_HANDLE_INCLUDE(BRepCheck_Shell)

WRAP_AS_CLASS_INCLUDE(BRepCheck_Analyzer)

WRAP_AS_PACKAGE(BRepCheck)

//package BRepExtrema
WRAP_AS_ENUM_INCLUDE(BRepExtrema_SupportType)
WRAP_AS_CLASS_INCLUDE(BRepExtrema_SolutionElem)
WRAP_AS_NCOLLECTION_INCLUDE(BRepExtrema_SeqOfSolution,NCollection_Sequence,BRepExtrema_SolutionElem)
WRAP_AS_CLASS_INCLUDE(BRepExtrema_DistShapeShape)
WRAP_AS_CLASS_INCLUDE(BRepExtrema_DistanceSS)
WRAP_AS_CLASS_INCLUDE(BRepExtrema_ExtCC)
WRAP_AS_CLASS_INCLUDE(BRepExtrema_ExtCF)
WRAP_AS_CLASS_INCLUDE(BRepExtrema_ExtFF)
WRAP_AS_CLASS_INCLUDE(BRepExtrema_ExtPC)
WRAP_AS_CLASS_INCLUDE(BRepExtrema_ExtPF)
WRAP_AS_CLASS_INCLUDE(BRepExtrema_Poly)

// BRepGProp classes
WRAP_AS_CLASS_INCLUDE(BRepGProp_EdgeTool)
WRAP_AS_CLASS_INCLUDE(BRepGProp_Face)
WRAP_AS_CLASS_INCLUDE(BRepGProp_Domain)
WRAP_AS_CLASS_INCLUDE(BRepGProp_Cinert)
WRAP_AS_CLASS_INCLUDE(BRepGProp_Sinert)
WRAP_AS_CLASS_INCLUDE(BRepGProp_Vinert)

WRAP_AS_PACKAGE(BRepGProp)

WRAP_AS_PACKAGE(BRepLib)
WRAP_AS_PACKAGE(BRepLib_ToolTriangulatedShape)

WRAP_AS_CLASS_INCLUDE(IntCurvesFace_ShapeIntersector)
