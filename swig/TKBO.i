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

// Definitions for wrapping Open CASCADE classes from TKBO toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKBO.lib")
#endif
%}

// IntTools classes
%ignore IntTools_Context::Hatcher; // avoid exposing hatcher classes
WRAP_AS_HANDLE_INCLUDE(IntTools_Context)

WRAP_AS_CLASS_INCLUDE(IntTools_Curve)
WRAP_AS_CLASS_INCLUDE(IntTools_FClass2d)
WRAP_AS_CLASS_INCLUDE(IntTools_Range)
WRAP_AS_CLASS_INCLUDE(IntTools_BaseRangeSample)
WRAP_AS_CLASS_INCLUDE(IntTools_CurveRangeSample)
WRAP_AS_CLASS_INCLUDE(IntTools_SurfaceRangeSample)
WRAP_AS_CLASS_INCLUDE(IntTools_SurfaceRangeLocalizeData)
%ignore NCollection_List<IntTools_SurfaceRangeSample>::Contains;
%ignore NCollection_List<IntTools_SurfaceRangeSample>::Remove(const IntTools_SurfaceRangeSample&);
WRAP_AS_NCOLLECTION_INCLUDE(IntTools_ListOfSurfaceRangeSample,NCollection_List,IntTools_SurfaceRangeSample)

// BOPDS classes
WRAP_AS_CLASS_INCLUDE(BOPDS_ShapeInfo)
WRAP_AS_CLASS_INCLUDE(BOPDS_IndexRange)
WRAP_AS_CLASS_INCLUDE(BOPDS_Pave)
WRAP_AS_NCOLLECTION_INCLUDE(BOPDS_ListOfPave,NCollection_List,BOPDS_Pave)
WRAP_AS_HANDLE_INCLUDE(BOPDS_PaveBlock)
WRAP_AS_HANDLE_INCLUDE(BOPDS_CommonBlock)
WRAP_AS_NCOLLECTION_INCLUDE(BOPDS_ListOfPaveBlock,NCollection_List,Handle(BOPDS_PaveBlock))
WRAP_AS_MAP_INCLUDE(BOPDS_MapOfPaveBlock,NCollection_Map,Handle(BOPDS_PaveBlock),NCollection_DefaultHasher<Handle(BOPDS_PaveBlock)>)
WRAP_AS_MAP_INCLUDE(BOPDS_IndexedMapOfPaveBlock,NCollection_IndexedMap,Handle(BOPDS_PaveBlock),NCollection_DefaultHasher<Handle(BOPDS_PaveBlock)>)
WRAP_AS_CLASS_INCLUDE(BOPDS_FaceInfo)
WRAP_AS_NCOLLECTION_INCLUDE(BOPDS_VectorOfFaceInfo,NCollection_Vector,BOPDS_FaceInfo)
WRAP_AS_NCOLLECTION_INCLUDE(BOPDS_VectorOfListOfPaveBlock,NCollection_Vector,BOPDS_ListOfPaveBlock)

// ignore methods of BOP_DS returning complex data structured (not wrapped yet)
%ignore BOPDS_DS::ShapesSD;
%ignore BOPDS_DS::InterfVV;
%ignore BOPDS_DS::InterfVE;
%ignore BOPDS_DS::InterfVF;
%ignore BOPDS_DS::InterfVZ;
%ignore BOPDS_DS::InterfEE;
%ignore BOPDS_DS::InterfEF;
%ignore BOPDS_DS::InterfEZ;
%ignore BOPDS_DS::InterfFF;
%ignore BOPDS_DS::InterfFZ;
%ignore BOPDS_DS::InterfZZ;
%ignore BOPDS_DS::Interferences;
WRAP_AS_CLASS_INCLUDE(BOPDS_DS)
WRAP_INCLUDE(BOPDS_PDS)
WRAP_AS_CLASS_INCLUDE(BOPDS_Iterator)
WRAP_INCLUDE(BOPDS_PIterator)
	
// BOPAlgo enums
WRAP_AS_ENUM_WNULL_INCLUDE(BOPAlgo_Operation, BOPAlgo_UNKNOWN)
WRAP_AS_ENUM_INCLUDE(BOPAlgo_GlueEnum)

// BOPAlgo classes
WRAP_AS_CLASS_INCLUDE(BOPAlgo_Options)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_Algo)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_BuilderShape)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_Builder)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_ToolsProvider)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_BOP)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_BuilderArea)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_BuilderSolid)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_SectionAttribute)
%ignore BOPAlgo_PaveFiller::Iterator; // not implemented
WRAP_AS_CLASS_INCLUDE(BOPAlgo_PaveFiller)
WRAP_INCLUDE(BOPAlgo_PPaveFiller)

WRAP_AS_ENUM_INCLUDE(BOPAlgo_CheckStatus)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_CheckResult)
%ignore NCollection_List<BOPAlgo_CheckResult>::Contains;
%ignore NCollection_List<BOPAlgo_CheckResult>::Remove(const BOPAlgo_CheckResult&);
WRAP_AS_NCOLLECTION_INCLUDE(BOPAlgo_ListOfCheckResult,NCollection_List,BOPAlgo_CheckResult)
WRAP_AS_CLASS_INCLUDE(BOPAlgo_ArgumentAnalyzer)

// BRepAlgoAPI classes
%warnfilter(SWIGWARN_PARSE_PRIVATE_INHERIT) BRepAlgoAPI_Algo;
WRAP_AS_CLASS_INCLUDE(BRepAlgoAPI_Algo)
%ignore BRepAlgoAPI_BuilderAlgo::Builder; // returns pointer
WRAP_AS_CLASS_INCLUDE(BRepAlgoAPI_BuilderAlgo)
WRAP_AS_CLASS_INCLUDE(BRepAlgoAPI_BooleanOperation)
WRAP_AS_CLASS_INCLUDE(BRepAlgoAPI_Common)
WRAP_AS_CLASS_INCLUDE(BRepAlgoAPI_Cut)
WRAP_AS_CLASS_INCLUDE(BRepAlgoAPI_Fuse)
WRAP_AS_CLASS_INCLUDE(BRepAlgoAPI_Section)
