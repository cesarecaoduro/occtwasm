// Created: 2006-07-19
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

// Definitions for wrapping Open CASCADE classes from TKXCAF toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKXCAF.lib")
#endif
%}

WRAP_AS_DATAMAP_INCLUDE(XCAFDoc_DataMapOfShapeLabel, NCollection_DataMap, TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher)

// XCAF classes
%ignore XCAFDoc_ShapeTool::GetAllComponentSHUO; // uses non-wrapped type
WRAP_AS_CLASS_INCLUDE(XCAFDoc_AssemblyItemId)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_AssemblyItemRef)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_GraphNode)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_Note)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_ShapeTool)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_ColorTool)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_ClippingPlaneTool)
%ignore XCAFDoc_DimTolTool::GetRefDGTLabels; // not implemented
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_DimTolTool)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_LayerTool)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_MaterialTool)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_NotesTool)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_ViewTool)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_DocumentTool)
WRAP_AS_HANDLE_INCLUDE(XCAFDoc_VisMaterial)
WRAP_AS_HANDLE_INCLUDE(XCAFApp_Application)

WRAP_AS_HANDLE_INCLUDE(XCAFPrs_AISObject)

WRAP_AS_CLASS_INCLUDE(XCAFPrs_DocumentExplorer)
WRAP_AS_STRUCT_INCLUDE(XCAFPrs_DocumentNode)
%ignore XCAFPrs_Style::IsEqual(XCAFPrs_Style const &,XCAFPrs_Style const &);
WRAP_AS_CLASS_INCLUDE(XCAFPrs_Style)

WRAP_AS_ENUM_INCLUDE(XCAFDoc_ColorType)
