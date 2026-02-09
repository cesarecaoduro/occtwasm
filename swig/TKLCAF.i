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

// Definitions for wrapping Open CASCADE classes from TKLCAF toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKLCAF.lib") 
#endif
%}

// Specific macros to wrap OCAF attribute classes.
// Avoids safe mapping of references to C++ objects for GetID() method
// since it is static method returning reference to statically allocated memory
%define WRAP_AS_ATTR_INCLUDE(Type)
  %ignore Type::GetID;
  %extend Type {
    static Standard_GUID GetId () { return Type::GetID(); }
  }
  WRAP_AS_HANDLE_INCLUDE(Type)
%enddef

// TDF classes
%warnfilter(403) TDF_Attribute; // disable SWIG warning on abstract class
WRAP_AS_HANDLE(TDF_Attribute)
%ignore TDF_DerivedAttribute::Register; // Uses function pointer as parameter
WRAP_AS_CLASS_INCLUDE(TDF_DerivedAttribute)
EXTEND_NCOLLECTION_ITERATOR_AS_ENUMERATOR(TDF_ChildIterator,TDF_Label)
WRAP_AS_CLASS_INCLUDE(TDF_ChildIterator)
WRAP_AS_HANDLE_INCLUDE(TDF_DataSet)
WRAP_AS_HANDLE_INCLUDE(TDF_AttributeDelta)
WRAP_AS_HANDLE(TDF_Data)
%ignore TDF_Delta::AttributeDeltas; // low-level method
WRAP_AS_HANDLE_INCLUDE(TDF_Delta)
%ignore TDF_Data::LabelNodeAllocator; // low-level method
WRAP_INCLUDE(TDF_Data)
WRAP_AS_NCOLLECTION_INCLUDE(TDF_DeltaList,NCollection_List,Handle(TDF_Delta))
WRAP_AS_HANDLE_INCLUDE(TDF_DeltaOnAddition)
WRAP_AS_HANDLE_INCLUDE(TDF_DeltaOnForget)
WRAP_AS_HANDLE_INCLUDE(TDF_DeltaOnModification)
WRAP_AS_HANDLE_INCLUDE(TDF_DeltaOnRemoval)
WRAP_AS_HANDLE_INCLUDE(TDF_DeltaOnResume)
WRAP_AS_NCOLLECTION_INCLUDE(TDF_IDList,NCollection_List,Standard_GUID)
WRAP_AS_CLASS_INCLUDE(TDF_IDFilter)
WRAP_AS_CLASS_INCLUDE(TDF_Transaction)
%ignore TDF_Label::ExtendedDump; // low-level methods
%ignore TDF_Label::InternalDump; // low-level methods
WRAP_AS_STRUCT_INCLUDE(TDF_Label)
WRAP_AS_MAP_INCLUDE(TDF_LabelMap,NCollection_Map,TDF_Label,NCollection_DefaultHasher<TDF_Label>)
WRAP_AS_DATAMAP_INCLUDE(TDF_LabelDataMap,NCollection_DataMap,TDF_Label,TDF_Label,NCollection_DefaultHasher<TDF_Label>)
WRAP_AS_NCOLLECTION_INCLUDE(TDF_LabelList,NCollection_List,TDF_Label)
WRAP_AS_NCOLLECTION_INCLUDE(TDF_LabelSequence,NCollection_Sequence,TDF_Label)
%ignore TDF_RelocationTable::TransientTable; // returns non-const reference to map
WRAP_AS_HANDLE(TDF_RelocationTable)
%ignore TDF_Attribute::ExtendedDump; // low-level methods
WRAP_INCLUDE(TDF_Attribute)
WRAP_AS_NCOLLECTION_INCLUDE(TDF_AttributeList,NCollection_List,Handle(TDF_Attribute))
WRAP_AS_MAP_INCLUDE(TDF_AttributeMap,NCollection_Map,Handle(TDF_Attribute),NCollection_DefaultHasher<Handle(TDF_Attribute)>)
WRAP_AS_DATAMAP_INCLUDE(TDF_AttributeDataMap,NCollection_DataMap,Handle(TDF_Attribute),Handle(TDF_Attribute),NCollection_DefaultHasher<Handle(TDF_Attribute)>)
WRAP_INCLUDE(TDF_RelocationTable)
WRAP_AS_ATTR_INCLUDE(TDF_TagSource)
WRAP_AS_ATTR_INCLUDE(TDF_Reference)
%ignore TDF_Tool::CountLabels; // low-level methods
%ignore TDF_Tool::DeductLabels;
WRAP_AS_CLASS_INCLUDE(TDF_Tool)
%ignore TDF::LowestID; // returns reference to C++ object, but not useful
%ignore TDF::UppestID; // returns reference to C++ object, but not useful
WRAP_AS_PACKAGE(TDF)

// TDataStd classes
WRAP_AS_ENUM_INCLUDE(TDataStd_RealEnum)
%warnfilter(403) TDataStd_GenericEmpty; // disable SWIG warning on abstract class
WRAP_AS_HANDLE_INCLUDE(TDataStd_GenericEmpty)
%warnfilter(403) TDataStd_GenericExtString; // disable SWIG warning on abstract class
WRAP_AS_HANDLE_INCLUDE(TDataStd_GenericExtString)
WRAP_AS_ATTR_INCLUDE(TDataStd_Tick)
WRAP_AS_ATTR_INCLUDE(TDataStd_Integer)
WRAP_AS_ATTR_INCLUDE(TDataStd_IntegerArray)
WRAP_AS_ATTR_INCLUDE(TDataStd_Real)
WRAP_AS_ATTR_INCLUDE(TDataStd_RealArray)
WRAP_AS_ATTR_INCLUDE(TDataStd_Name)
WRAP_AS_ATTR_INCLUDE(TDataStd_Comment)
WRAP_AS_ATTR_INCLUDE(TDataStd_Current)
WRAP_AS_ATTR_INCLUDE(TDataStd_Directory)
WRAP_AS_ATTR_INCLUDE(TDataStd_Expression)
WRAP_AS_ATTR_INCLUDE(TDataStd_ExtStringArray)
WRAP_AS_ATTR_INCLUDE(TDataStd_NamedData)
%rename(GetGeometryType) TDataStd_Geometry::GetType; // overrides C# standard method
WRAP_AS_ATTR_INCLUDE(TDataStd_Relation)
%ignore TDataStd_TreeNode::GetDefaultTreeID;
%extend TDataStd_TreeNode {
  static Standard_GUID GetDefaultTreeId () { return TDataStd_TreeNode::GetDefaultTreeID(); }
}
WRAP_AS_HANDLE_INCLUDE(TDataStd_TreeNode)
WRAP_AS_HANDLE_INCLUDE(TDataStd_UAttribute)
WRAP_AS_ATTR_INCLUDE(TDataStd_Variable)

WRAP_AS_DATAMAP_INCLUDE(TDataStd_DataMapOfStringHArray1OfReal,NCollection_DataMap,TCollection_ExtendedString,Handle(TColStd_HArray1OfReal),NCollection_DefaultHasher<TCollection_ExtendedString>)
WRAP_AS_HANDLE_INCLUDE(TDataStd_HDataMapOfStringHArray1OfReal)
WRAP_AS_DATAMAP_INCLUDE(TDataStd_DataMapOfStringHArray1OfInteger,NCollection_DataMap,TCollection_ExtendedString,Handle(TColStd_HArray1OfInteger),NCollection_DefaultHasher<TCollection_ExtendedString>)
WRAP_AS_HANDLE_INCLUDE(TDataStd_HDataMapOfStringHArray1OfInteger)
WRAP_AS_DATAMAP_INCLUDE(TDataStd_DataMapOfStringString,NCollection_DataMap,TCollection_ExtendedString,TCollection_ExtendedString,NCollection_DefaultHasher<TCollection_ExtendedString>)
WRAP_AS_HANDLE_INCLUDE(TDataStd_HDataMapOfStringString)
WRAP_AS_DATAMAP_INCLUDE(TDataStd_DataMapOfStringReal,NCollection_DataMap,TCollection_ExtendedString,Standard_Real,NCollection_DefaultHasher<TCollection_ExtendedString>)
WRAP_AS_HANDLE_INCLUDE(TDataStd_HDataMapOfStringReal)
WRAP_AS_DATAMAP_INCLUDE(TDataStd_DataMapOfStringByte,NCollection_DataMap,TCollection_ExtendedString,Standard_Byte,NCollection_DefaultHasher<TCollection_ExtendedString>)
WRAP_AS_HANDLE_INCLUDE(TDataStd_HDataMapOfStringByte)

// TDocStd classes
WRAP_AS_ENUM_INCLUDE(TDocStd_FormatVersion)
WRAP_AS_HANDLE(TDocStd_Application)
WRAP_AS_HANDLE_INCLUDE(TDocStd_Document)
WRAP_INCLUDE(TDocStd_Application)
WRAP_AS_NCOLLECTION_INCLUDE(TDocStd_SequenceOfDocument,NCollection_Sequence,Handle(TDocStd_Document))
%ignore TDocStd_MultiTransactionManager::GetAvailableUndos; // too advanced methods
%ignore TDocStd_MultiTransactionManager::GetAvailableRedos;
WRAP_AS_HANDLE_INCLUDE(TDocStd_MultiTransactionManager)
WRAP_AS_ATTR_INCLUDE(TDocStd_XLink)
WRAP_INCLUDE(TDocStd_XLinkPtr)
WRAP_AS_CLASS_INCLUDE(TDocStd_XLinkIterator)
WRAP_INCLUDE(TDocStd_XLink)

// AppStdL classes
WRAP_AS_HANDLE_INCLUDE(AppStdL_Application)
