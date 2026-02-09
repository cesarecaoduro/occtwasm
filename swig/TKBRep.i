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

// Definitions for wrapping Open CASCADE classes from TKBRep toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKG2d.lib")  /* for TopAbs */
#pragma comment(lib, "TKBRep.lib")
#endif

#include <TopTools_ShapeMapHasher.hxx>
%}

// BRep Exceptions
WRAP_AS_EXCEPTION(TopoDS_FrozenShape)
WRAP_AS_EXCEPTION(TopoDS_LockedShape)
WRAP_AS_EXCEPTION(TopoDS_UnCompatibleShapes)

// Enumerations from TopAbs package (actually, from another toolkit)
WRAP_AS_ENUM_INCLUDE(TopAbs_Orientation)
WRAP_AS_ENUM_INCLUDE(TopAbs_ShapeEnum)
WRAP_AS_ENUM_INCLUDE(TopAbs_State)

// TopoDS classes
// do not expose TopoDS_Shape::TShape method and TopoDS_TShape type
%ignore TopoDS_Shape::TShape;
WRAP_PROPERTY(TopoDS_Shape, TopAbs_ShapeEnum, shapeType, ShapeType);
WRAP_PROPERTY(TopoDS_Shape, TopAbs_Orientation, orientation, Orientation, Orientation);
WRAP_PROPERTY(TopoDS_Shape, int, nbChildren, NbChildren);
WRAP_PROPERTY(TopoDS_Shape, bool, isFree, Free, Free);
WRAP_PROPERTY(TopoDS_Shape, bool, isLocked, Locked, Locked);
WRAP_PROPERTY(TopoDS_Shape, bool, isModified, Modified, Modified);
WRAP_PROPERTY(TopoDS_Shape, bool, isChecked, Checked, Checked);
WRAP_PROPERTY(TopoDS_Shape, bool, isOrientable, Orientable, Orientable);
WRAP_PROPERTY(TopoDS_Shape, bool, isClosed, Closed, Closed);
WRAP_PROPERTY(TopoDS_Shape, bool, isInfinite, Infinite, Infinite);
WRAP_PROPERTY(TopoDS_Shape, bool, isConvex, Convex, Convex);
EXTEND_NCOLLECTION_ITERATOR_AS_ENUMERATOR(TopoDS_Iterator,TopoDS_Shape)
EXTEND_NCOLLECTION_AS_ENUMERABLE(TopoDS_Shape,TopoDS_Iterator,TopoDS_Shape)
WRAP_AS_STRUCT_INCLUDE(TopoDS_Shape)
WRAP_AS_STRUCT_INCLUDE(TopoDS_Vertex)
WRAP_AS_STRUCT_INCLUDE(TopoDS_Edge)
WRAP_AS_STRUCT_INCLUDE(TopoDS_Wire)
WRAP_AS_STRUCT_INCLUDE(TopoDS_Face)
WRAP_AS_STRUCT_INCLUDE(TopoDS_Shell)
WRAP_AS_STRUCT_INCLUDE(TopoDS_Solid)
WRAP_AS_STRUCT_INCLUDE(TopoDS_CompSolid)
WRAP_AS_STRUCT_INCLUDE(TopoDS_Compound)

WRAP_AS_CLASS_INCLUDE(TopoDS_Builder)
WRAP_AS_CLASS_INCLUDE(TopoDS_Iterator)

// ignore non-const variants of TopoDS:: methods
%ignore TopoDS::Vertex(TopoDS_Shape &);
%ignore TopoDS::Edge(TopoDS_Shape &);
%ignore TopoDS::Wire(TopoDS_Shape &);
%ignore TopoDS::Face(TopoDS_Shape &);
%ignore TopoDS::Shell(TopoDS_Shape &);
%ignore TopoDS::Solid(TopoDS_Shape &);
%ignore TopoDS::CompSolid(TopoDS_Shape &);
%ignore TopoDS::Compound(TopoDS_Shape &);

// Note: shape type casting methods of package TopoDS cause two troubles:
// a) they conflict with names of the corresponding types
// b) they return C references to argument objects which breaks 
//    memory management on C# level
// The solution is to provide alternative implementation of these methods 
// in the wrapper 
%ignore TopoDS::Vertex;
%ignore TopoDS::Edge;
%ignore TopoDS::Wire;
%ignore TopoDS::Face;
%ignore TopoDS::Shell;
%ignore TopoDS::Solid;
%ignore TopoDS::CompSolid;
%ignore TopoDS::Compound;
WRAP_AS_PACKAGE(TopoDS)
%extend TopoDS {
  static TopoDS_Vertex ToVertex (const TopoDS_Shape& theShape) 
  { return TopoDS::Vertex (theShape); }

  static TopoDS_Edge   ToEdge   (const TopoDS_Shape& theShape) 
  { return TopoDS::Edge   (theShape); }

  static TopoDS_Wire   ToWire   (const TopoDS_Shape& theShape) 
  { return TopoDS::Wire   (theShape); }

  static TopoDS_Face   ToFace   (const TopoDS_Shape& theShape) 
  { return TopoDS::Face   (theShape); }

  static TopoDS_Shell  ToShell  (const TopoDS_Shape& theShape) 
  { return TopoDS::Shell  (theShape); }

  static TopoDS_Solid  ToSolid  (const TopoDS_Shape& theShape) 
  { return TopoDS::Solid  (theShape); }

  static TopoDS_CompSolid ToCompSolid (const TopoDS_Shape& theShape) 
  { return TopoDS::CompSolid (theShape); }

  static TopoDS_Compound ToCompound (const TopoDS_Shape& theShape) 
  { return TopoDS::Compound (theShape); }
}

// TopTools classes
WRAP_AS_ENUM_INCLUDE(TopTools_FormatVersion)
WRAP_AS_MAP_INCLUDE(TopTools_IndexedMapOfShape,NCollection_IndexedMap,TopoDS_Shape,TopTools_ShapeMapHasher)
WRAP_AS_NCOLLECTION_INCLUDE(TopTools_ListOfShape,NCollection_List,TopoDS_Shape)
WRAP_AS_MAP_INCLUDE(TopTools_MapOfShape,NCollection_Map,TopoDS_Shape,TopTools_ShapeMapHasher)
WRAP_AS_DATAMAP_INCLUDE(TopTools_DataMapOfShapeShape,NCollection_DataMap,TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher)
WRAP_AS_DATAMAP_INCLUDE(TopTools_DataMapOfShapeListOfShape,NCollection_DataMap,TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher)
WRAP_AS_DATAMAP_INCLUDE(TopTools_IndexedDataMapOfShapeListOfShape,NCollection_IndexedDataMap,TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher)
WRAP_AS_DATAMAP_INCLUDE(TopTools_DataMapOfShapeBox, NCollection_DataMap, TopoDS_Shape, Bnd_Box, TopTools_ShapeMapHasher)
WRAP_AS_NCOLLECTION_INCLUDE(TopTools_SequenceOfShape,NCollection_Sequence,TopoDS_Shape)
WRAP_AS_HANDLE_INCLUDE(TopTools_HSequenceOfShape)
WRAP_AS_NCOLLECTION_INCLUDE(TopTools_Array1OfShape,NCollection_Array1,TopoDS_Shape)
WRAP_AS_HANDLE_INCLUDE(TopTools_HArray1OfShape)

// BRep... classes
WRAP_AS_CLASS_INCLUDE(BRep_Builder)
%ignore BRep_Tool::UVBox; // trash method
%ignore BRep_Tool::ChangeUVBox; // trash method
%ignore BRep_Tool::Triangulations; // Generates incorrect code (use 'this' in static method)
%apply bool* OUTPUT { Standard_Boolean* theIsStored };
WRAP_AS_CLASS_INCLUDE(BRep_Tool)

// BRepTools classes
%ignore BRepTools_ReShape::History; // temporarily not wrapped
WRAP_AS_HANDLE_INCLUDE(BRepTools_ReShape)
WRAP_AS_HANDLE_INCLUDE(BRepTools_Modification)
WRAP_AS_HANDLE_INCLUDE(BRepTools_TrsfModification)
%ignore BRepTools_History::Merge(const BRepTools_History& theHistory23); // generates duplicated signature
WRAP_AS_HANDLE_INCLUDE(BRepTools_History)
WRAP_AS_CLASS_INCLUDE(BRepTools_Modifier)
WRAP_AS_PACKAGE(BRepTools)

// TopExp classes
WRAP_AS_CLASS_INCLUDE(TopExp_Explorer)
WRAP_AS_PACKAGE(TopExp)

//BRepAdaptor class
WRAP_AS_HANDLE_INCLUDE(BRepAdaptor_Curve)
WRAP_AS_NCOLLECTION_INCLUDE(BRepAdaptor_Array1OfCurve,NCollection_Array1,BRepAdaptor_Curve)
WRAP_AS_HANDLE_INCLUDE(BRepAdaptor_HArray1OfCurve)

WRAP_AS_HANDLE_INCLUDE(BRepAdaptor_CompCurve)
WRAP_AS_HANDLE_INCLUDE(BRepAdaptor_Curve2d)
WRAP_AS_HANDLE_INCLUDE(BRepAdaptor_Surface)

// BinTools enums
WRAP_AS_ENUM_INCLUDE(BinTools_FormatVersion)