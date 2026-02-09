// Created: 2009-12-15
//
// Copyright (c) 2009-2021 OPEN CASCADE SAS
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

// Definitions for wrapping Open CASCADE classes from TKCAF toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKCAF.lib") 
#endif
%}

// TNaming classes
WRAP_AS_ENUM_INCLUDE(TNaming_Evolution)
WRAP_AS_ENUM_INCLUDE(TNaming_NameType)
WRAP_AS_ATTR_INCLUDE(TNaming_NamedShape)
WRAP_AS_CLASS_INCLUDE(TNaming_Builder)
WRAP_AS_CLASS_INCLUDE(TNaming_Iterator)
%ignore TNaming_Tool::Collect; // do not expose map
WRAP_AS_CLASS_INCLUDE(TNaming_Tool)
%ignore TNaming::IDList; // low-level method
WRAP_AS_PACKAGE(TNaming)

// TDataXtd classes
WRAP_AS_ENUM_INCLUDE(TDataXtd_ConstraintEnum)
WRAP_AS_ENUM_INCLUDE(TDataXtd_GeometryEnum)
WRAP_AS_NCOLLECTION_INCLUDE(TDataXtd_Array1OfTrsf,NCollection_Array1,gp_Trsf)
%rename(GetConstraintType) TDataXtd_Constraint::GetType; // overrides C# standard method
WRAP_AS_ATTR_INCLUDE(TDataXtd_Constraint)
%rename(GetGeometryType) TDataXtd_Geometry::GetType; // overrides C# standard method
WRAP_AS_ATTR_INCLUDE(TDataXtd_Geometry)
WRAP_AS_ATTR_INCLUDE(TDataXtd_Pattern)
%ignore TDataXtd_PatternStd::GetPatternID;
%extend TDataXtd_PatternStd {
  static Standard_GUID GetPatternId () { return TDataXtd_PatternStd::GetPatternID(); }
}
WRAP_AS_ATTR_INCLUDE(TDataXtd_PatternStd)
WRAP_AS_ATTR_INCLUDE(TDataXtd_Placement)
WRAP_AS_ATTR_INCLUDE(TDataXtd_Plane)
WRAP_AS_ATTR_INCLUDE(TDataXtd_Point)
WRAP_AS_ATTR_INCLUDE(TDataXtd_Position)
WRAP_AS_ATTR_INCLUDE(TDataXtd_Shape)
