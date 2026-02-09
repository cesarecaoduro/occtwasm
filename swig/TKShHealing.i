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

// Definitions for wrapping Open CASCADE classes from TKShHealing toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKShHealing.lib")
#endif
%}

// ShapeExtend classes
WRAP_AS_ENUM_INCLUDE(ShapeExtend_Status)
WRAP_AS_ENUM_INCLUDE(ShapeExtend_Parametrisation)
WRAP_AS_DATAMAP_INCLUDE(ShapeExtend_DataMapOfShapeListOfMsg,NCollection_DataMap,TopoDS_Shape,Message_ListOfMsg,TopTools_ShapeMapHasher)
WRAP_AS_DATAMAP_INCLUDE(ShapeExtend_DataMapOfTransientListOfMsg,NCollection_DataMap,Handle(Standard_Transient),Message_ListOfMsg,NCollection_DefaultHasher<Handle(Standard_Transient)>)
WRAP_AS_HANDLE_INCLUDE(ShapeExtend_BasicMsgRegistrator)
WRAP_AS_HANDLE_INCLUDE(ShapeExtend_MsgRegistrator)
WRAP_AS_HANDLE_INCLUDE(ShapeExtend_ComplexCurve)
WRAP_AS_HANDLE_INCLUDE(ShapeExtend_CompositeSurface)
WRAP_AS_HANDLE_INCLUDE(ShapeExtend_WireData)
WRAP_AS_CLASS_INCLUDE(ShapeExtend_Explorer)
WRAP_AS_PACKAGE(ShapeExtend)

// ShapeBuild classes
WRAP_AS_HANDLE_INCLUDE(ShapeBuild_ReShape)
WRAP_AS_CLASS_INCLUDE(ShapeBuild_Edge)
WRAP_AS_CLASS_INCLUDE(ShapeBuild_Vertex)

// ShapeAnalysis classes
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_Geom)
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_Curve)
WRAP_AS_HANDLE_INCLUDE(ShapeAnalysis_Surface)
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_Edge)
%ignore ShapeAnalysis_Wire::StatusLoop; // not implemented
WRAP_AS_HANDLE_INCLUDE(ShapeAnalysis_Wire)
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_Shell)
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_ShapeContents)
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_ShapeTolerance)
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_WireOrder)
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_WireVertex)
//WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_CheckSmallFace)
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_FreeBounds)
WRAP_AS_HANDLE_INCLUDE(ShapeAnalysis_FreeBoundData)
WRAP_AS_NCOLLECTION_INCLUDE(ShapeAnalysis_SequenceOfFreeBounds,NCollection_Sequence,Handle(ShapeAnalysis_FreeBoundData))
WRAP_AS_HANDLE_INCLUDE(ShapeAnalysis_HSequenceOfFreeBounds)
WRAP_AS_CLASS_INCLUDE(ShapeAnalysis_FreeBoundsProperties)
WRAP_AS_HANDLE_INCLUDE(ShapeAnalysis_TransferParameters)
WRAP_AS_PACKAGE(ShapeAnalysis)

// ShapeConstruct classes
WRAP_AS_HANDLE_INCLUDE(ShapeConstruct_ProjectCurveOnSurface)
WRAP_AS_CLASS_INCLUDE(ShapeConstruct_Curve)
WRAP_AS_PACKAGE(ShapeConstruct)

// ShapeCustom classes
WRAP_AS_CLASS_INCLUDE(ShapeCustom_Curve)
WRAP_AS_CLASS_INCLUDE(ShapeCustom_Curve2d)
WRAP_AS_CLASS_INCLUDE(ShapeCustom_Surface)
%warnfilter(403) ShapeCustom_Modification; // avoid warning on abstract class
WRAP_AS_HANDLE_INCLUDE(ShapeCustom_Modification)
WRAP_AS_HANDLE_INCLUDE(ShapeCustom_RestrictionParameters)
WRAP_AS_HANDLE_INCLUDE(ShapeCustom_BSplineRestriction)
WRAP_AS_HANDLE_INCLUDE(ShapeCustom_ConvertToBSpline)
WRAP_AS_HANDLE_INCLUDE(ShapeCustom_ConvertToRevolution)
WRAP_AS_HANDLE_INCLUDE(ShapeCustom_DirectModification)
WRAP_AS_HANDLE_INCLUDE(ShapeCustom_SweptToElementary)
WRAP_AS_HANDLE_INCLUDE(ShapeCustom_TrsfModification)

// rename conversion methods to avoid conflict with class names
%rename(ApplyBSplineRestriction)  ShapeCustom::BSplineRestriction;
%rename(ApplyConvertToRevolution) ShapeCustom::ConvertToRevolution;
%rename(ApplySweptToElementary)   ShapeCustom::SweptToElementary;
%rename(ApplyConvertToBSpline)    ShapeCustom::ConvertToBSpline;
WRAP_AS_PACKAGE(ShapeCustom)

// ShapeFix classes
WRAP_AS_HANDLE_INCLUDE(ShapeFix_Root)
%ignore ShapeFix_Edge::FixAddPCurve; // not all variants are implemented
WRAP_AS_HANDLE_INCLUDE(ShapeFix_Edge)
WRAP_AS_HANDLE_INCLUDE(ShapeFix_Wire)
WRAP_AS_HANDLE_INCLUDE(ShapeFix_Face)
WRAP_AS_HANDLE_INCLUDE(ShapeFix_Shell)
WRAP_AS_HANDLE_INCLUDE(ShapeFix_Solid)
WRAP_AS_HANDLE_INCLUDE(ShapeFix_Shape)
WRAP_AS_HANDLE_INCLUDE(ShapeFix_Wireframe)
WRAP_AS_HANDLE_INCLUDE(ShapeFix_FixSmallFace)
%ignore ShapeFix_ComposeShell::DispatchWires; // uses non-exposed type
WRAP_AS_HANDLE_INCLUDE(ShapeFix_ComposeShell)
WRAP_AS_HANDLE_INCLUDE(ShapeFix_SplitCommonVertex)
WRAP_AS_CLASS_INCLUDE(ShapeFix_ShapeTolerance)
WRAP_AS_CLASS_INCLUDE(ShapeFix_EdgeConnect)
WRAP_AS_CLASS_INCLUDE(ShapeFix_FaceConnect)
WRAP_AS_CLASS_INCLUDE(ShapeFix_FreeBounds)
WRAP_AS_CLASS_INCLUDE(ShapeFix_SplitTool)
WRAP_AS_CLASS_INCLUDE(ShapeFix_IntersectionTool)
WRAP_AS_CLASS_INCLUDE(ShapeFix_WireVertex)
WRAP_AS_PACKAGE(ShapeFix)

// ShapeUpgrade classes
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_SplitCurve)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_SplitCurve2d)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_SplitCurve2dContinuity)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_SplitCurve3d)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_SplitCurve3dContinuity)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_SplitSurface)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_SplitSurfaceAngle)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_SplitSurfaceArea)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_SplitSurfaceContinuity)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_ConvertCurve2dToBezier)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_ConvertCurve3dToBezier)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_ConvertSurfaceToBezierBasis)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_Tool)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_EdgeDivide)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_FixSmallCurves)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_WireDivide)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_FaceDivide)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_ClosedEdgeDivide)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_ClosedFaceDivide)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_FaceDivideArea)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_FixSmallBezierCurves)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_RemoveInternalWires)
WRAP_AS_HANDLE_INCLUDE(ShapeUpgrade_RemoveLocations)
WRAP_AS_CLASS_INCLUDE(ShapeUpgrade_ShapeDivide)
WRAP_AS_CLASS_INCLUDE(ShapeUpgrade_ShapeDivideAngle)
WRAP_AS_CLASS_INCLUDE(ShapeUpgrade_ShapeDivideArea)
WRAP_AS_CLASS_INCLUDE(ShapeUpgrade_ShapeDivideClosed)
WRAP_AS_CLASS_INCLUDE(ShapeUpgrade_ShapeDivideClosedEdges)
WRAP_AS_CLASS_INCLUDE(ShapeUpgrade_ShapeDivideContinuity)
WRAP_AS_CLASS_INCLUDE(ShapeUpgrade_ShapeConvertToBezier)

// ShapeProcess classes
%ignore ShapeProcess_Context::Messages() const;
WRAP_AS_HANDLE_INCLUDE(ShapeProcess_Context)
WRAP_AS_HANDLE_INCLUDE(ShapeProcess_ShapeContext)
WRAP_AS_HANDLE_INCLUDE(ShapeProcess_Operator)
// Ignore ShapeProcess::Perform method with OperationFlags parameter. TODO: wrap OperationFlags (std::bitset)
%ignore ShapeProcess::Perform(const Handle(ShapeProcess_Context)& theContext, const OperationsFlags& theOperations, const Message_ProgressRange& theProgress);
%ignore ShapeProcess::Perform(const Handle(ShapeProcess_Context)& theContext, const OperationsFlags& theOperations);
WRAP_AS_PACKAGE(ShapeProcess)

WRAP_AS_CLASS_INCLUDE(ShapeProcessAPI_ApplySequence)
