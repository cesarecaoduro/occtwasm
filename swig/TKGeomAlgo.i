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

// Definitions for wrapping Open CASCADE classes from TKGeomAlgo toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKGeomAlgo.lib")
#endif
%}

// GeomAlgo Exceptions
WRAP_AS_EXCEPTION(GccAna_NoSolution)
WRAP_AS_EXCEPTION(GccEnt_BadQualifier)
WRAP_AS_EXCEPTION(Geom2dGcc_IsParallel)

// IntRes2d enums and classes
WRAP_AS_ENUM_INCLUDE(IntRes2d_Position)
WRAP_AS_ENUM_INCLUDE(IntRes2d_Situation)
WRAP_AS_ENUM_INCLUDE(IntRes2d_TypeTrans)
WRAP_AS_STRUCT_INCLUDE(IntRes2d_Transition)
WRAP_AS_STRUCT_INCLUDE(IntRes2d_Domain)
WRAP_AS_STRUCT_INCLUDE(IntRes2d_IntersectionPoint)
WRAP_AS_STRUCT_INCLUDE(IntRes2d_IntersectionSegment)
WRAP_AS_CLASS_INCLUDE(IntRes2d_Intersection)
WRAP_AS_NCOLLECTION_INCLUDE(IntRes2d_SequenceOfIntersectionPoint,NCollection_Sequence,IntRes2d_IntersectionPoint)
WRAP_AS_NCOLLECTION_INCLUDE(IntRes2d_SequenceOfIntersectionSegment,NCollection_Sequence,IntRes2d_IntersectionSegment)

// IntCurveSurface Packages and Classes
WRAP_AS_ENUM_INCLUDE(IntCurveSurface_TransitionOnCurve)
WRAP_AS_STRUCT_INCLUDE(IntCurveSurface_IntersectionPoint)
WRAP_AS_STRUCT_INCLUDE(IntCurveSurface_IntersectionSegment)
WRAP_AS_CLASS_INCLUDE(IntCurveSurface_ThePolygonOfHInter)
%ignore IntCurveSurface_ThePolyhedronOfHInter::UMinSingularity; // not implemented methods
%ignore IntCurveSurface_ThePolyhedronOfHInter::UMaxSingularity;
%ignore IntCurveSurface_ThePolyhedronOfHInter::VMinSingularity;
%ignore IntCurveSurface_ThePolyhedronOfHInter::VMaxSingularity;
%ignore IntCurveSurface_ThePolyhedronOfHInter::HasUMinSingularity;
%ignore IntCurveSurface_ThePolyhedronOfHInter::HasUMaxSingularity;
%ignore IntCurveSurface_ThePolyhedronOfHInter::HasVMinSingularity;
%ignore IntCurveSurface_ThePolyhedronOfHInter::HasVMaxSingularity;
WRAP_AS_STRUCT_INCLUDE(IntCurveSurface_ThePolyhedronOfHInter)
WRAP_AS_CLASS_INCLUDE(IntCurveSurface_Intersection)
WRAP_AS_CLASS_INCLUDE(IntCurveSurface_HInter)

// ignore typical type conversion operators
%ignore operator Standard_Integer;
%ignore operator Standard_Real;
%ignore operator gp_Pnt;
%ignore operator gp_Pnt2d;
%ignore operator Handle(Geom2d_BSplineCurve);
%ignore operator Handle(Geom_BSplineCurve);
%ignore operator Handle(Geom_BSplineSurface);

// Geom2dAPI package and classes
// do not expose low-level algo (Extrema and Intersector packages)
%ignore Geom2dAPI_ExtremaCurveCurve::Extrema;
%ignore Geom2dAPI_ProjectPointOnCurve::Extrema;
%ignore Geom2dAPI_InterCurveCurve::Intersector;
WRAP_AS_CLASS_INCLUDE(Geom2dAPI_ProjectPointOnCurve)
WRAP_AS_CLASS_INCLUDE(Geom2dAPI_ProjectPointOnCurve)
WRAP_AS_CLASS_INCLUDE(Geom2dAPI_ExtremaCurveCurve)
WRAP_AS_CLASS_INCLUDE(Geom2dAPI_PointsToBSpline)
%ignore Geom2dAPI_Interpolate::ClearTangents; // not implemented
WRAP_AS_CLASS_INCLUDE(Geom2dAPI_Interpolate)
WRAP_AS_CLASS_INCLUDE(Geom2dAPI_InterCurveCurve)

// GeomAPI package and classes
// do not expose low-level algo (Extrema package)
%ignore GeomAPI_ProjectPointOnCurve::Extrema; 
%ignore GeomAPI_ProjectPointOnSurf::Extrema;
%ignore GeomAPI_ExtremaCurveCurve::Extrema;
%ignore GeomAPI_ExtremaCurveSurface::Extrema;
%ignore GeomAPI_ExtremaSurfaceSurface::Extrema;
WRAP_AS_CLASS_INCLUDE(GeomAPI_ProjectPointOnCurve)
WRAP_AS_CLASS_INCLUDE(GeomAPI_ProjectPointOnSurf)
WRAP_AS_CLASS_INCLUDE(GeomAPI_ExtremaCurveCurve)
WRAP_AS_CLASS_INCLUDE(GeomAPI_ExtremaCurveSurface)
WRAP_AS_CLASS_INCLUDE(GeomAPI_ExtremaSurfaceSurface)
WRAP_AS_CLASS_INCLUDE(GeomAPI_PointsToBSpline)
WRAP_AS_CLASS_INCLUDE(GeomAPI_PointsToBSplineSurface)
%ignore GeomAPI_Interpolate::ClearTangents; // not implemented
WRAP_AS_CLASS_INCLUDE(GeomAPI_Interpolate)
WRAP_AS_CLASS_INCLUDE(GeomAPI_IntSS)
WRAP_AS_CLASS_INCLUDE(GeomAPI_IntCS)
WRAP_AS_PACKAGE(GeomAPI)

// Law classes
WRAP_AS_HANDLE_INCLUDE(Law_Function)
WRAP_AS_HANDLE_INCLUDE(Law_BSpline)
WRAP_AS_HANDLE_INCLUDE(Law_BSpFunc)
WRAP_AS_NCOLLECTION_INCLUDE(Law_Laws,NCollection_List,Handle(Law_Function))
WRAP_AS_HANDLE_INCLUDE(Law_Composite)
WRAP_AS_HANDLE_INCLUDE(Law_Constant)
WRAP_AS_HANDLE_INCLUDE(Law_Linear)
WRAP_AS_HANDLE_INCLUDE(Law_S)
//WRAP_AS_STRUCT_INCLUDE(Law_Interpolate)

// GeomFill enumerations
WRAP_AS_ENUM_INCLUDE(GeomFill_Trihedron)

// GeomFill classes
WRAP_AS_HANDLE_INCLUDE(GeomFill_Boundary)
WRAP_AS_HANDLE_INCLUDE(GeomFill_SimpleBound)
WRAP_AS_HANDLE_INCLUDE(GeomFill_BoundWithSurf)
WRAP_AS_CLASS_INCLUDE(GeomFill_ConstrainedFilling)

// Plate classes
WRAP_AS_STRUCT_INCLUDE(Plate_D1)
WRAP_AS_STRUCT_INCLUDE(Plate_D2)
WRAP_AS_STRUCT_INCLUDE(Plate_D3)
WRAP_AS_STRUCT_INCLUDE(Plate_PinpointConstraint)
WRAP_AS_NCOLLECTION_INCLUDE(Plate_SequenceOfPinpointConstraint,NCollection_Sequence,Plate_PinpointConstraint)
WRAP_AS_NCOLLECTION_INCLUDE(Plate_Array1OfPinpointConstraint,NCollection_Array1,Plate_PinpointConstraint)
WRAP_AS_HANDLE_INCLUDE(Plate_HArray1OfPinpointConstraint)
WRAP_AS_STRUCT_INCLUDE(Plate_LinearScalarConstraint)
WRAP_AS_STRUCT_INCLUDE(Plate_LinearXYZConstraint)
WRAP_AS_STRUCT_INCLUDE(Plate_GlobalTranslationConstraint)
WRAP_AS_STRUCT_INCLUDE(Plate_PlaneConstraint)
WRAP_AS_STRUCT_INCLUDE(Plate_LineConstraint)
WRAP_AS_STRUCT_INCLUDE(Plate_SampledCurveConstraint)
WRAP_AS_STRUCT_INCLUDE(Plate_GtoCConstraint)
WRAP_AS_STRUCT_INCLUDE(Plate_FreeGtoCConstraint)
WRAP_AS_STRUCT_INCLUDE(Plate_Plate)

// GeomPlate classes
WRAP_AS_NCOLLECTION_INCLUDE(GeomPlate_Array1OfHCurve,NCollection_Array1,Handle(Adaptor3d_Curve))
WRAP_AS_HANDLE_INCLUDE(GeomPlate_HArray1OfHCurve)
WRAP_AS_HANDLE_INCLUDE(GeomPlate_CurveConstraint)
WRAP_AS_HANDLE_INCLUDE(GeomPlate_PointConstraint)
WRAP_AS_HANDLE_INCLUDE(GeomPlate_Surface)
WRAP_AS_CLASS_INCLUDE(GeomPlate_BuildPlateSurface)
%ignore GeomPlate_MakeApprox::GeomPlate_MakeApprox(const Handle(GeomPlate_Surface)& SurfPlate,const AdvApp2Var_Criterion& PlateCrit,const Standard_Real Tol3d,const Standard_Integer Nbmax,const Standard_Integer dgmax,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Real EnlargeCoeff = 1.1);
WRAP_AS_CLASS_INCLUDE(GeomPlate_MakeApprox)

// GccEnt enumerations and classes
WRAP_AS_ENUM_INCLUDE(GccEnt_Position)
WRAP_AS_CLASS_INCLUDE(GccEnt_QualifiedCirc)
WRAP_AS_CLASS_INCLUDE(GccEnt_QualifiedLin)

// GccAna classes
WRAP_AS_CLASS_INCLUDE(GccAna_Circ2d3Tan)

// Geom2dGcc classes
WRAP_AS_CLASS_INCLUDE(Geom2dGcc_Circ2d3Tan)
WRAP_AS_CLASS_INCLUDE(Geom2dGcc_Lin2d2Tan)
WRAP_AS_CLASS_INCLUDE(Geom2dGcc_QualifiedCurve)
