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

// Definitions for wrapping Open CASCADE classes from TKernel toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKernel.lib")
#endif
%}

// Provide method IsNull for Standard_Transient to check whether contained 
// handle is Null
%extend Standard_Transient {
  bool IsNull() { return ! self || self == 0; }
}

// Standard_Transient shall be wrapped in a specific way, as it ia a base 
// class, and is tightly coupled with Standard_Type class
%{
#include <Standard_Type.hxx>
%}
// wrap without DownCast() method
WRAP_AS_HANDLE_1(Standard_Transient,Standard_Transient)
%extend Standard_Transient {
  static Handle(Standard_Transient) DownCast(const Handle(Standard_Transient)& T) {
    return T;
  }
}
WRAP_AS_HANDLE_3(Standard_Transient,Standard_Transient)

WRAP_AS_HANDLE(Standard_Type)
WRAP_INCLUDE(Standard_Transient)
WRAP_INCLUDE(Standard_Type)
WRAP_INCLUDE(Standard_Macro)

// Disable warning "Specialization of non-template" for hash
#pragma SWIG nowarn=SWIGWARN_PARSE_TEMPLATE_SP_UNDEF;

// Other standard classes can be wrapped in regular way
WRAP_INCLUDE(Standard_DefineException)

%warnfilter(520) Standard_Failure;
%ignore Standard_Failure::NewInstance;
#if defined(SWIGCSHARP)
  %typemap(csbase, replace="1") Standard_Failure "System.ApplicationException";
#elif defined(SWIGJAVA)
  %typemap(javabase, replace="1") Standard_Failure "java.lang.RuntimeException";
#endif
WRAP_CLASS_NOCOPY(Standard_Failure)
%{
#include <Standard_Failure.hxx>
%}
%include <Standard_Failure.hxx>

WRAP_AS_EXCEPTION(Standard_AbortiveTransaction)
WRAP_AS_EXCEPTION(Standard_DomainError)
WRAP_AS_EXCEPTION(Standard_LicenseError)
WRAP_AS_EXCEPTION(Standard_NumericError)
WRAP_AS_EXCEPTION(Standard_ProgramError)
WRAP_AS_EXCEPTION(Standard_ConstructionError)
WRAP_AS_EXCEPTION(Standard_DimensionError)
WRAP_AS_EXCEPTION(Standard_DimensionMismatch)
WRAP_AS_EXCEPTION(Standard_DivideByZero)
WRAP_AS_EXCEPTION(Standard_ImmutableObject)
WRAP_AS_EXCEPTION(Standard_LicenseNotFound)
WRAP_AS_EXCEPTION(Standard_MultiplyDefined)
WRAP_AS_EXCEPTION(Standard_NoMoreObject)
WRAP_AS_EXCEPTION(Standard_NoSuchObject)
WRAP_AS_EXCEPTION(Standard_NotImplemented)
WRAP_AS_EXCEPTION(Standard_NullObject)
WRAP_AS_EXCEPTION(Standard_OutOfMemory)
WRAP_AS_EXCEPTION(Standard_Overflow)
WRAP_AS_EXCEPTION(Standard_RangeError)
WRAP_AS_EXCEPTION(Standard_TypeMismatch)
WRAP_AS_EXCEPTION(Standard_Underflow)
WRAP_AS_EXCEPTION(Standard_NegativeValue)
WRAP_AS_EXCEPTION(Standard_NullValue)
WRAP_AS_EXCEPTION(Standard_OutOfRange)
WRAP_AS_EXCEPTION(StdFail_InfiniteSolutions)
WRAP_AS_EXCEPTION(StdFail_NotDone)
WRAP_AS_EXCEPTION(StdFail_Undefined)
WRAP_AS_EXCEPTION(StdFail_UndefinedDerivative)
WRAP_AS_EXCEPTION(StdFail_UndefinedValue)

WRAP_AS_EXCEPTION(Draw_Failure)

WRAP_AS_EXCEPTION(OSD_Exception)
WRAP_AS_EXCEPTION(OSD_Exception_ACCESS_VIOLATION)
WRAP_AS_EXCEPTION(OSD_Exception_ARRAY_BOUNDS_EXCEEDED)
WRAP_AS_EXCEPTION(OSD_Exception_CTRL_BREAK)
WRAP_AS_EXCEPTION(OSD_Exception_ILLEGAL_INSTRUCTION)
WRAP_AS_EXCEPTION(OSD_Exception_INT_OVERFLOW)
WRAP_AS_EXCEPTION(OSD_Exception_INVALID_DISPOSITION)
WRAP_AS_EXCEPTION(OSD_Exception_IN_PAGE_ERROR)
WRAP_AS_EXCEPTION(OSD_Exception_NONCONTINUABLE_EXCEPTION)
WRAP_AS_EXCEPTION(OSD_Exception_PRIV_INSTRUCTION)
WRAP_AS_EXCEPTION(OSD_Exception_STACK_OVERFLOW)
WRAP_AS_EXCEPTION(OSD_Exception_STATUS_NO_MEMORY)
WRAP_AS_EXCEPTION(OSD_OSDError)
WRAP_AS_EXCEPTION(OSD_Signal)
WRAP_AS_EXCEPTION(OSD_SIGBUS)
WRAP_AS_EXCEPTION(OSD_SIGHUP)
WRAP_AS_EXCEPTION(OSD_SIGILL)
WRAP_AS_EXCEPTION(OSD_SIGINT)
WRAP_AS_EXCEPTION(OSD_SIGKILL)
WRAP_AS_EXCEPTION(OSD_SIGQUIT)
WRAP_AS_EXCEPTION(OSD_SIGSEGV)
WRAP_AS_EXCEPTION(OSD_SIGSYS)

WRAP_AS_EXCEPTION(Plugin_Failure)

WRAP_AS_EXCEPTION(Quantity_DateDefinitionError)
WRAP_AS_EXCEPTION(Quantity_PeriodDefinitionError)

WRAP_AS_EXCEPTION(Resource_NoSuchResource)

WRAP_AS_EXCEPTION(Storage_StreamFormatError)
WRAP_AS_EXCEPTION(Storage_StreamModeError)
WRAP_AS_EXCEPTION(Storage_StreamReadError)
WRAP_AS_EXCEPTION(Storage_StreamExtCharParityError)
WRAP_AS_EXCEPTION(Storage_StreamTypeMismatchError)
WRAP_AS_EXCEPTION(Storage_StreamUnknownTypeError)
WRAP_AS_EXCEPTION(Storage_StreamWriteError)

WRAP_AS_EXCEPTION(Units_NoSuchType)
WRAP_AS_EXCEPTION(Units_NoSuchUnit)

%ignore Standard_GUID::Standard_GUID (const Standard_UUID&);
%ignore Standard_GUID::ToUUID; // UUID is not wrapped
%ignore Standard_GUID::Assign (const Standard_UUID&);
%ignore Standard_GUID::ToExtString; // duplicates ToCString
%ignore Standard_GUID::Standard_GUID(const Standard_ExtString); // uses Standard_ExtString
WRAP_AS_STRUCT_INCLUDE(Standard_GUID)
%{
// undefine known stupid macros defined by windows.h and conflicting with method names
// (Standard_GUID.hxx -> Standard_UUID.hxx -> windows.h)
#ifdef SendMessage
#undef SendMessage
#endif
#ifdef SetForm
#undef SetForm
#endif
#ifdef SetCurrentDirectory
#undef SetCurrentDirectory
#endif
#ifdef SetPrinter
#undef SetPrinter
#endif
%}

WRAP_INCLUDE(Standard_PByte)
WRAP_INCLUDE(Standard_PExtCharacter)
// %ignore Standard_UUID::TYPE;
// WRAP_AS_CLASS_INCLUDE(Standard_UUID)

// TCollection classes
#if defined(SWIGCSHARP) // wrap only wchar_t* constructors
%ignore TCollection_AsciiString::TCollection_AsciiString(const Standard_CString);
%ignore TCollection_AsciiString::TCollection_AsciiString(const Standard_CString, const Standard_Integer);
#endif
%ignore TCollection_AsciiString::IsEqual(const TCollection_AsciiString&,const TCollection_AsciiString&);
%ignore TCollection_AsciiString::IsEqual(const TCollection_AsciiString&,const Standard_CString);
#if defined(SWIGCSHARP)
%rename(ToString) TCollection_AsciiString::ToCString; // use standard name
%csmethodmodifiers TCollection_AsciiString::ToCString "public override";
#endif
%ignore TCollection_AsciiString (TCollection_AsciiString&& theOther);
%warnfilter(SWIGWARN_LANG_OVERLOAD_IGNORED) TCollection_AsciiString;
WRAP_AS_STRUCT_INCLUDE(TCollection_AsciiString)
#if defined(SWIGCSHARP) // wrap only wchar_t* constructors
%ignore TCollection_ExtendedString::TCollection_ExtendedString(const Standard_CString);
%ignore TCollection_ExtendedString::TCollection_ExtendedString(const Standard_CString, const Standard_Boolean);
#endif
%ignore TCollection_ExtendedString::IsEqual(const TCollection_ExtendedString&,const TCollection_ExtendedString&);
%ignore TCollection_ExtendedString::ToUTF8CString; // users non-const char* as buffer
// ignore methods using Standard_ExtString
%ignore TCollection_ExtendedString::TCollection_ExtendedString (const Standard_ExtString);
%ignore TCollection_ExtendedString::IsEqual (const Standard_ExtString other) const;
%ignore TCollection_ExtendedString::IsDifferent (const Standard_ExtString other) const;
%ignore TCollection_ExtendedString::IsLess (const Standard_ExtString other) const;
%ignore TCollection_ExtendedString::IsGreater (const Standard_ExtString other) const;
%ignore TCollection_ExtendedString::Token (const Standard_ExtString separators, const Standard_Integer whichone = 1) const;
%extend TCollection_ExtendedString {
  TCollection_ExtendedString Token (const TCollection_ExtendedString& separators, const Standard_Integer whichone = 1) const
  {
    return $self->Token (separators.ToExtString(), whichone);
  }
}
%ignore TCollection_ExtendedString::ToExtString;
#if defined(SWIGCSHARP) && defined(_WIN32)
%rename(ToString) TCollection_ExtendedString::ToWideString; // use standard name
%csmethodmodifiers TCollection_ExtendedString::ToWideString "public override";
#endif
%ignore TCollection_ExtendedString (TCollection_ExtendedString&& theOther);
%warnfilter(SWIGWARN_LANG_OVERLOAD_IGNORED) TCollection_ExtendedString;
WRAP_AS_STRUCT_INCLUDE(TCollection_ExtendedString)

// cyclic dependency
// ignore methods using Standard_ExtString
%ignore TCollection_HExtendedString::TCollection_HExtendedString(const Standard_ExtString);
%ignore TCollection_HExtendedString::Token (const Standard_ExtString separators, const Standard_Integer whichone = 1) const;
%extend TCollection_HExtendedString {
  Handle(TCollection_HExtendedString) Token (const TCollection_ExtendedString& separators, const Standard_Integer whichone = 1) const
  {
    return $self->Token (separators.ToExtString(), whichone);
  }
}
%ignore TCollection_HExtendedString::ToExtString;
#if defined(SWIGCSHARP) && defined(_WIN32)
%rename(ToString) TCollection_HAsciiString::ToCString; // use standard name
%csmethodmodifiers TCollection_HAsciiString::ToCString "public override";
%csmethodmodifiers TCollection_HExtendedString::ToString "public override";
%extend TCollection_HExtendedString {
  const wchar_t* ToString () const { return $self->String().ToWideString(); }
}
#endif
%ignore TCollection_HAsciiString(TCollection_AsciiString&& theString);
%ignore TCollection_HExtendedString(TCollection_ExtendedString&& theString);
WRAP_AS_HANDLE(TCollection_HExtendedString)
WRAP_AS_HANDLE(TCollection_HAsciiString)
WRAP_INCLUDE(TCollection_HExtendedString)
WRAP_INCLUDE(TCollection_HAsciiString)

// NCollection allocators
WRAP_INCLUDE(NCollection_TypeDef)
WRAP_AS_HANDLE_INCLUDE(NCollection_BaseAllocator)
WRAP_AS_HANDLE_INCLUDE(NCollection_HeapAllocator)
WRAP_INCLUDE(NCollection_Allocator)
WRAP_INCLUDE(NCollection_OccAllocator)
%ignore NCollection_IncAllocator::IBlock::IBlock(void* thePointer, const size_t theSize);
WRAP_AS_HANDLE_INCLUDE(NCollection_IncAllocator)
WRAP_INCLUDE(NCollection_Iterator)
WRAP_INCLUDE(NCollection_StlIterator)
WRAP_AS_HANDLE_INCLUDE(NCollection_AlignedAllocator)
WRAP_AS_HANDLE_INCLUDE(NCollection_Buffer)

// NCollection template classes, for WRAP_AS_NCOLLECTION
%{
#include <NCollection_Handle.hxx>
%}
%ignore NCollection_List(NCollection_List&& theOther);
%ignore Append (TheItemType&& theItem);
%ignore Append (TheItemType&& theItem, Iterator& theIter);
%ignore Prepend (TheItemType&& theItem);
%ignore InsertBefore (TheItemType&& theItem, Iterator& theIter);
%ignore InsertAfter (TheItemType&& theItem, Iterator& theIter);
WRAP_INCLUDE(NCollection_List)
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_Sequence::Node;
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_Sequence::Iterator;
%ignore NCollection_Sequence::delNode;
%ignore NCollection_Sequence(NCollection_Sequence&& theOther);
%ignore InsertBefore (const Standard_Integer theIndex, TheItemType&& theItem);
%ignore InsertAfter (Iterator& thePosition, TheItemType&& theItem);
%ignore InsertAfter (const Standard_Integer theIndex, TheItemType&& theItem);
WRAP_INCLUDE(NCollection_Sequence)
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_Array1::Iterator;
%warnfilter(SWIGWARN_LANG_OVERLOAD_IGNORED) NCollection_Array1;
%ignore SetValue(const Standard_Integer theIndex, value_type&& theItem);
WRAP_INCLUDE(NCollection_Array1)
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_Array2::Iterator;
%warnfilter(SWIGWARN_LANG_OVERLOAD_IGNORED) NCollection_Array2;
%ignore SetValue(const Standard_Integer theRow, const Standard_Integer theCol, TheItemType&& theItem);
WRAP_INCLUDE(NCollection_Array2)
%ignore NCollection_DynamicArray(NCollection_DynamicArray&& theOther);
%ignore Assign(NCollection_DynamicArray&& theOther);
%ignore Append(TheItemType&& theValue);
%ignore SetValue(const Standard_Integer theIndex, TheItemType&& theValue);
WRAP_INCLUDE(NCollection_DynamicArray)
WRAP_INCLUDE(NCollection_AliasedArray)
#define NCollection_Vector NCollection_DynamicArray
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_Map::Iterator;
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_Map::MapNode;
%ignore NCollection_Map (NCollection_Map&& theOther);
%ignore Add(TheKeyType&& theKey);
%ignore Added(TheKeyType&& theKey);
WRAP_INCLUDE(NCollection_Map)
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_IndexedMap::Iterator;
%ignore NCollection_IndexedMap(NCollection_IndexedMap&& theOther);
WRAP_INCLUDE(NCollection_IndexedMap)
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_DataMap::Iterator;
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_DataMap::DataMapNode;
%ignore NCollection_DataMap(NCollection_DataMap&& theOther);
%ignore Bind (TheKeyType&& theKey, const TheItemType& theItem);
%ignore Bind (const TheKeyType& theKey, TheItemType&& theItem);
%ignore Bind (TheKeyType&& theKey, TheItemType&& theItem);
%ignore Bound (TheKeyType&& theKey, const TheItemType& theItem);
%ignore Bound (const TheKeyType& theKey, TheItemType&& theItem);
%ignore Bound (TheKeyType&& theKey, TheItemType&& theItem);
WRAP_INCLUDE(NCollection_DataMap)
%warnfilter(SWIGWARN_PARSE_NAMED_NESTED_CLASS) NCollection_IndexedDataMap::Iterator;
%ignore NCollection_IndexedDataMap(NCollection_IndexedDataMap&& theOther);
%ignore Add (TheKeyType&& theKey1, const TheItemType& theItem);
%ignore Add (const TheKeyType& theKey1, TheItemType&& theItem);
%ignore Add (TheKeyType&& theKey1, TheItemType&& theItem);
WRAP_INCLUDE(NCollection_IndexedDataMap)
%ignore NCollection_UtfString (const Standard_WideChar* theCopyUtfWide,const Standard_Integer theLength);
%ignore NCollection_UtfString (const Standard_WideChar* theCopyUtfWide);
%ignore NCollection_UtfString (NCollection_UtfString&& theOther);
%ignore NCollection_UtfString::Iterator;
%ignore NCollection_UtfString::ToUtfWide;
%ignore NCollection_UtfIterator;
WRAP_INCLUDE(NCollection_UtfString)
%warnfilter(SWIGWARN_LANG_IDENTIFIER,SWIGWARN_LANG_OVERLOAD_IGNORED) NCollection_Vec2;
%warnfilter(SWIGWARN_LANG_IDENTIFIER,SWIGWARN_LANG_OVERLOAD_IGNORED) NCollection_Vec3;
%warnfilter(SWIGWARN_LANG_IDENTIFIER,SWIGWARN_LANG_OVERLOAD_IGNORED) NCollection_Vec4;
WRAP_INCLUDE(NCollection_Vec2)
WRAP_INCLUDE(NCollection_Vec3)
WRAP_INCLUDE(NCollection_Vec4)
WRAP_INCLUDE(NCollection_Mat3)

WRAP_AS_TEMPLATE(NCollection_Utf8String, NCollection_UtfString<Standard_Utf8Char>)
WRAP_AS_TEMPLATE(NCollection_Utf16String, NCollection_UtfString<Standard_Utf16Char>)
WRAP_AS_TEMPLATE(NCollection_Utf32String, NCollection_UtfString<Standard_Utf32Char>)
WRAP_INCLUDE(NCollection_String)
// Ignoring NCollection_UtfWideString, since SWIG does not recommend wrapping wide strings

// NCollection_Vec2
%ignore NCollection_Vec2<Standard_Size>::GetData;
%ignore NCollection_Vec2<Standard_Size>::ChangeData;
%ignore NCollection_Vec2<Standard_Size>::cwiseAbs;
WRAP_AS_TEMPLATE(NCollection_Vec2_Standard_Size, NCollection_Vec2<Standard_Size>)
%ignore NCollection_Vec2<bool>::GetData;
%ignore NCollection_Vec2<bool>::ChangeData;
%ignore NCollection_Vec2<bool>::cwiseAbs;
WRAP_AS_TEMPLATE(NCollection_Vec2_bool, NCollection_Vec2<bool>)

// NCollection_Vec3
%ignore NCollection_Vec3<Standard_Size>::Modulus;
%ignore NCollection_Vec3<Standard_Size>::GetData;
%ignore NCollection_Vec3<Standard_Size>::ChangeData;
%ignore NCollection_Vec3<Standard_Size>::cwiseAbs;
WRAP_AS_TEMPLATE(NCollection_Vec3_Standard_Size, NCollection_Vec3<Standard_Size>)
%ignore NCollection_Vec3<bool>::Modulus;
%ignore NCollection_Vec3<bool>::GetData;
%ignore NCollection_Vec3<bool>::ChangeData;
%ignore NCollection_Vec3<bool>::cwiseAbs;
WRAP_AS_TEMPLATE(NCollection_Vec3_bool, NCollection_Vec3<bool>)

// NCollection_Mat3
%ignore NCollection_Mat3<float>::GetData;
%ignore NCollection_Mat3<float>::ChangeData;
%ignore NCollection_Mat3<float>::Map;
%ignore NCollection_Mat3<float>::Multiply(const NCollection_Mat3<float>& theMatA, const NCollection_Mat3<float>& theMatB);
WRAP_AS_TEMPLATE(NCollection_Mat3_float, NCollection_Mat3<float>)
%ignore NCollection_Mat3<double>::GetData;
%ignore NCollection_Mat3<double>::ChangeData;
%ignore NCollection_Mat3<double>::Map;
%ignore NCollection_Mat3<double>::Multiply(const NCollection_Mat3<double>& theMatA, const NCollection_Mat3<double>& theMatB);
WRAP_AS_TEMPLATE(NCollection_Mat3_double, NCollection_Mat3<double>)

// Define alternative variants of macros DEFINE_H*, to avoid problem of 
// wrapping classes with multiple inheritance, not supported in C# and Java
#define DEFINE_HARRAY1(HClassName, ColType) \
class HClassName : public Standard_Transient { \
public: \
  HClassName (const Standard_Integer theLower, \
              const Standard_Integer theUpper, \
              const ColType::value_type& theValue = 0); \
  HClassName  (const ColType& theOther); \
  const ColType& Array1 () const; \
  ColType& ChangeArray1 (); \
  /* inherited members */ \
  Standard_Integer Size (void) const; \
  Standard_Integer Length (void) const; \
  Standard_Integer Lower (void) const; \
  Standard_Integer Upper (void) const; \
  const ColType::value_type& Value (const Standard_Integer theIndex) const; \
  ColType::value_type& ChangeValue (const Standard_Integer theIndex); \
  void SetValue (const Standard_Integer theIndex, const ColType::value_type& theItem); \
};
#define DEFINE_HARRAY2(HClassName, ColType) \
class HClassName : public Standard_Transient { \
public: \
  HClassName  (const Standard_Integer theRowLow, \
               const Standard_Integer theRowUpp, \
               const Standard_Integer theColLow, \
               const Standard_Integer theColUpp, \
               const ColType::value_type& theValue = 0); \
  HClassName  (const ColType& theOther); \
  const ColType& Array2 () const; \
  ColType& ChangeArray2 (); \
  /* inherited members */ \
  Standard_Integer Size (void) const; \
  Standard_Integer Length (void) const; \
  Standard_Integer RowLength (void) const; \
  Standard_Integer ColLength (void) const; \
  Standard_Integer LowerRow (void) const; \
  Standard_Integer UpperRow (void) const; \
  Standard_Integer LowerCol (void) const; \
  Standard_Integer UpperCol (void) const; \
  const ColType::value_type& Value (const Standard_Integer theRow, const Standard_Integer theCol) const; \
  ColType::value_type& ChangeValue (const Standard_Integer theRow, const Standard_Integer theCol); \
  void SetValue (const Standard_Integer theRow, const Standard_Integer theCol, const ColType::value_type& theItem); \
};
#define DEFINE_HSEQUENCE(HClassName, ColType) \
class HClassName : public Standard_Transient { \
public: \
  HClassName (); \
  HClassName (const ColType& theOther); \
  const ColType& Sequence () const; \
  void Append (const ColType::value_type& theItem); \
  void Append (ColType& theSequence); \
  ColType& ChangeSequence (); \
  /* inherited members */ \
  Standard_Integer Size (void) const; \
  Standard_Integer Length (void) const; \
  Standard_Integer Lower (void) const; \
  Standard_Integer Upper (void) const; \
  Standard_Boolean IsEmpty (void) const; \
  void Reverse (void); \
  void Remove (const Standard_Integer theIndex); \
  void Remove (const Standard_Integer theFromIndex, const Standard_Integer theToIndex); \
  void Prepend (const ColType::value_type& theItem); \
  void Prepend (ColType& theSeq); \
  void InsertBefore (const Standard_Integer theIndex, const ColType::value_type& theItem); \
  void InsertAfter (const Standard_Integer  theIndex, const ColType::value_type& theItem); \
  const ColType::value_type& Value (const Standard_Integer theIndex) const; \
  ColType::value_type& ChangeValue (const Standard_Integer theIndex); \
  void SetValue (const Standard_Integer theIndex, const ColType::value_type& theItem); \
};

WRAP_AS_DATAMAP(NCollection_DataMapOfAsciiStringAsciiString,NCollection_DataMap,TCollection_AsciiString,TCollection_AsciiString,NCollection_DefaultHasher<TCollection_AsciiString>)

// TColStd classes
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_ListOfInteger,NCollection_List,Standard_Integer)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_ListOfReal,NCollection_List,Standard_Real)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_ListOfTransient,NCollection_List,Handle(Standard_Transient))
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_ListOfAsciiString,NCollection_List,TCollection_AsciiString)

WRAP_AS_NCOLLECTION_INCLUDE(TColStd_Array1OfByte,NCollection_Array1,Standard_Byte)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray1OfByte)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_Array1OfInteger,NCollection_Array1,Standard_Integer)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray1OfInteger)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_Array1OfReal,NCollection_Array1,Standard_Real)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray1OfReal)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_Array1OfBoolean,NCollection_Array1,Standard_Boolean)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray1OfBoolean)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_Array1OfAsciiString,NCollection_Array1,TCollection_AsciiString)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray1OfAsciiString)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_Array1OfExtendedString,NCollection_Array1,TCollection_ExtendedString)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray1OfExtendedString)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_Array1OfTransient,NCollection_Array1,Handle(Standard_Transient))
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray1OfTransient)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_Array1OfListOfInteger,NCollection_Array1,TColStd_ListOfInteger)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray1OfListOfInteger)

WRAP_AS_TEMPLATE_INCLUDE(TColStd_Array2OfInteger,NCollection_Array2< Standard_Integer >)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray2OfInteger)
WRAP_AS_TEMPLATE_INCLUDE(TColStd_Array2OfReal,NCollection_Array2< Standard_Real >)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray2OfReal)
WRAP_AS_TEMPLATE_INCLUDE(TColStd_Array2OfBoolean,NCollection_Array2< Standard_Boolean >)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray2OfBoolean)
WRAP_AS_TEMPLATE_INCLUDE(TColStd_Array2OfTransient,NCollection_Array2< Handle(Standard_Transient) >)
WRAP_AS_HANDLE_INCLUDE(TColStd_HArray2OfTransient)

WRAP_AS_NCOLLECTION_INCLUDE(TColStd_SequenceOfInteger,NCollection_Sequence,Standard_Integer)
WRAP_AS_HANDLE_INCLUDE(TColStd_HSequenceOfInteger)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_SequenceOfReal,NCollection_Sequence,Standard_Real)
WRAP_AS_HANDLE_INCLUDE(TColStd_HSequenceOfReal)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_SequenceOfTransient,NCollection_Sequence,Handle(Standard_Transient))
WRAP_AS_HANDLE_INCLUDE(TColStd_HSequenceOfTransient)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_SequenceOfHAsciiString,NCollection_Sequence,Handle(TCollection_HAsciiString))
WRAP_AS_HANDLE_INCLUDE(TColStd_HSequenceOfHAsciiString)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_SequenceOfAsciiString,NCollection_Sequence,TCollection_AsciiString)
WRAP_AS_HANDLE_INCLUDE(TColStd_HSequenceOfAsciiString)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_SequenceOfHExtendedString,NCollection_Sequence,Handle(TCollection_HExtendedString))
WRAP_AS_HANDLE_INCLUDE(TColStd_HSequenceOfHExtendedString)
WRAP_AS_NCOLLECTION_INCLUDE(TColStd_SequenceOfExtendedString,NCollection_Sequence,TCollection_ExtendedString)
WRAP_AS_HANDLE_INCLUDE(TColStd_HSequenceOfExtendedString)

WRAP_AS_DATAMAP_INCLUDE(TColStd_DataMapOfStringInteger,NCollection_DataMap,TCollection_ExtendedString,Standard_Integer,NCollection_DefaultHasher<TCollection_ExtendedString>)
WRAP_AS_DATAMAP_INCLUDE(TColStd_IndexedDataMapOfStringString,NCollection_IndexedDataMap,TCollection_AsciiString,TCollection_AsciiString,NCollection_DefaultHasher<TCollection_AsciiString>)

WRAP_AS_MAP_INCLUDE(TColStd_MapOfAsciiString,NCollection_Map,TCollection_AsciiString,NCollection_DefaultHasher<TCollection_AsciiString>)
WRAP_AS_MAP_INCLUDE(TColStd_MapOfInteger,NCollection_Map,Standard_Integer,NCollection_DefaultHasher<Standard_Integer>)
WRAP_AS_MAP_INCLUDE(TColStd_MapOfTransient,NCollection_Map,Handle(Standard_Transient),NCollection_DefaultHasher<Handle(Standard_Transient)>)
WRAP_AS_DATAMAP_INCLUDE(TColStd_IndexedDataMapOfTransientTransient,NCollection_IndexedDataMap,Handle(Standard_Transient),Handle(Standard_Transient),NCollection_DefaultHasher<Handle(Standard_Transient)>)

WRAP_AS_CLASS_INCLUDE(TColStd_PackedMapOfInteger)
WRAP_AS_HANDLE_INCLUDE(TColStd_HPackedMapOfInteger)

// TShort classes
WRAP_AS_NCOLLECTION_INCLUDE(TShort_Array1OfShortReal,NCollection_Array1,Standard_ShortReal)
WRAP_AS_HANDLE_INCLUDE(TShort_HArray1OfShortReal)

// OSD enums and classes
WRAP_AS_ENUM_INCLUDE(OSD_KindFile)
WRAP_AS_ENUM_INCLUDE(OSD_LockType)
WRAP_AS_ENUM_INCLUDE(OSD_FromWhere)
WRAP_AS_ENUM_INCLUDE(OSD_OpenMode)
WRAP_AS_ENUM_INCLUDE(OSD_SignalMode)
WRAP_AS_ENUM_INCLUDE(OSD_SingleProtection)
WRAP_AS_ENUM_INCLUDE(OSD_SysType)
WRAP_AS_STRUCT_INCLUDE(OSD_Error)
WRAP_AS_STRUCT_INCLUDE(OSD_Environment)
WRAP_AS_STRUCT_INCLUDE(OSD_Protection)
%ignore OSD_Path::LocateExecFile; // not implemented
WRAP_AS_STRUCT_INCLUDE(OSD_Path)
WRAP_AS_CLASS_INCLUDE(OSD_FileNode)
WRAP_AS_STRUCT_INCLUDE(OSD_File)
WRAP_AS_STRUCT_INCLUDE(OSD_Directory)
WRAP_AS_STRUCT_INCLUDE(OSD_FileIterator)
WRAP_AS_STRUCT_INCLUDE(OSD_DirectoryIterator)
WRAP_AS_STRUCT_INCLUDE(OSD_Disk)
WRAP_AS_STRUCT_INCLUDE(OSD_Chronometer)
WRAP_AS_STRUCT_INCLUDE(OSD_Timer)
%ignore OSD_Process::SetCurrentDirectory; // Raises compilation error on Windows TODO: investigate a fix
WRAP_AS_STRUCT_INCLUDE(OSD_Process)
%rename(CountersToString) ToString;
WRAP_AS_STRUCT_INCLUDE(OSD_MemInfo)
%ignore OSD::RealToCString; // uses non-const char*
WRAP_AS_PACKAGE(OSD)

// Message classes
%feature("director") Message_Printer;
%feature("director") Message_ProgressIndicator;
WRAP_AS_ENUM_INCLUDE(Message_Gravity)
WRAP_AS_ENUM_INCLUDE(Message_StatusType)
%csconstvalue("Message_StatusType.Message_DONE") Message_Done1;
%csconstvalue("Message_StatusType.Message_WARN") Message_Warn1;
%csconstvalue("Message_StatusType.Message_ALARM") Message_Alarm1;
%csconstvalue("Message_StatusType.Message_FAIL") Message_Fail1;
WRAP_AS_ENUM_INCLUDE(Message_Status)
WRAP_AS_ENUM_WNULL_INCLUDE(Message_MetricType,Message_MetricType_None)
WRAP_AS_ENUM_INCLUDE(Message_ConsoleColor)
WRAP_AS_MAP(NCollection_IndexedMap_Message_MetricType,NCollection_IndexedMap,Message_MetricType,NCollection_DefaultHasher<Message_MetricType>)
WRAP_AS_STRUCT_INCLUDE(Message_ExecStatus)
%ignore Message_Msg::operator const TCollection_ExtendedString&;
WRAP_AS_CLASS_INCLUDE(Message_Msg)
%ignore NCollection_List<Message_Msg>::Contains;
%ignore NCollection_List<Message_Msg>::Remove(const Message_Msg&);
WRAP_AS_NCOLLECTION_INCLUDE(Message_ListOfMsg,NCollection_List,Message_Msg)
%ignore Message_Printer::SendObject;
WRAP_AS_HANDLE_INCLUDE(Message_Printer)
WRAP_AS_HANDLE_INCLUDE(Message_PrinterOStream)
WRAP_AS_NCOLLECTION_INCLUDE(Message_SequenceOfPrinters,NCollection_Sequence,Handle(Message_Printer))

// ignore Message_Messenger::StreamBuffer and related methods
%ignore Message_Messenger::StreamBuffer;
%ignore Message_Messenger::Send(Message_Gravity);
%ignore Message_Messenger::SendFail();
%ignore Message_Messenger::SendAlarm();
%ignore Message_Messenger::SendWarning();
%ignore Message_Messenger::SendInfo();
%ignore Message_Messenger::SendTrace();
%ignore Message::Send(Message_Gravity);
%ignore Message::SendFail();
%ignore Message::SendAlarm();
%ignore Message::SendWarning();
%ignore Message::SendInfo();
%ignore Message::SendTrace();

%ignore Message_Messenger::Send(const Handle(Standard_Transient)&, const Message_Gravity);

WRAP_AS_HANDLE_INCLUDE(Message_Messenger)
WRAP_AS_HANDLE_INCLUDE(Message_ProgressIndicator)
%warnfilter(SWIGWARN_LANG_OVERLOAD_IGNORED) Message_ProgressScope;
// extend with methods taking string class as input
%extend Message_ProgressScope {
  Message_ProgressScope (const Message_ProgressRange& theRange, const char* theName, double theMax, bool theIsInfinite = false) {
    Message_ProgressScope* aNewScope = new Message_ProgressScope (theRange, TCollection_AsciiString(theName), theMax, theIsInfinite);
    return aNewScope;
  }
  void SetName (const char* theName) { $self->SetName (TCollection_AsciiString (theName)); }
}
WRAP_AS_CLASS_INCLUDE(Message_ProgressScope)
%warnfilter(SWIGWARN_LANG_OVERLOAD_IGNORED) Message_ProgressRange;
WRAP_AS_CLASS_INCLUDE(Message_ProgressRange)
WRAP_AS_HANDLE_INCLUDE(Message_Alert)
WRAP_AS_NCOLLECTION_INCLUDE(Message_ListOfAlert,NCollection_List,Handle(Message_Alert))
WRAP_AS_HANDLE_INCLUDE(Message_CompositeAlerts)
WRAP_AS_HANDLE_INCLUDE(Message_Report)
WRAP_AS_HANDLE_INCLUDE(Message_Attribute)
WRAP_AS_HANDLE_INCLUDE(Message_AlertExtended)
WRAP_AS_HANDLE_INCLUDE(Message_Algorithm)
WRAP_AS_STRUCT_INCLUDE(Message_Level)
WRAP_AS_PACKAGE(Message)

// Quantity aliases, enums and classes
WRAP_AS_ENUM_INCLUDE(Quantity_TypeOfColor)
WRAP_AS_ENUM_INCLUDE(Quantity_NameOfColor)
WRAP_AS_STRUCT_INCLUDE(Quantity_Period)
WRAP_AS_STRUCT_INCLUDE(Quantity_Date)
%warnfilter(503) Quantity_Color;
%typemap(cscode) Quantity_Color %{
  public override string ToString()
  {
    return "RGB(" + (int)(Red() * 255.0) + ", " + (int)(Green() * 255.0) + ", " + (int)(Blue() * 255.0)
      + ") [" + Quantity_Color.StringName (Name()) + "]";
  }
%}
WRAP_PROPERTY(Quantity_Color, double, red, Red);
WRAP_PROPERTY(Quantity_Color, double, green, Green);
WRAP_PROPERTY(Quantity_Color, double, blue, Blue);
WRAP_PROPERTY(Quantity_Color, double, hue, Hue);
WRAP_PROPERTY(Quantity_Color, double, saturation, Saturation);
WRAP_PROPERTY(Quantity_Color, double, light, Light);
WRAP_AS_STRUCT_INCLUDE(Quantity_Color)
%warnfilter(503) Quantity_ColorRGBA;
%typemap(cscode) Quantity_ColorRGBA %{
  public override string ToString()
  {
    return "RGBA(" + (int)(GetRGB().Red() * 255.0) + ", " + (int)(GetRGB().Green() * 255.0) + ", " + (int)(GetRGB().Blue() * 255.0) + ", " + (int)(Alpha() * 255.0)
      + ") [" + Quantity_Color.StringName (GetRGB().Name()) + "]";
  }
%}
WRAP_PROPERTY2(Quantity_ColorRGBA, Quantity_Color, rgb, GetRGB, SetRGB);
WRAP_PROPERTY(Quantity_ColorRGBA, float, alpha, Alpha, SetAlpha);
WRAP_AS_STRUCT_INCLUDE(Quantity_ColorRGBA)
WRAP_AS_NCOLLECTION_INCLUDE(Quantity_Array1OfColor,NCollection_Array1,Quantity_Color)
WRAP_AS_HANDLE_INCLUDE(Quantity_HArray1OfColor)

// Resource enums and classes
WRAP_AS_ENUM_INCLUDE(Resource_FormatType)
WRAP_AS_DATAMAP_INCLUDE(Resource_DataMapOfAsciiStringAsciiString,NCollection_DataMap,TCollection_AsciiString,TCollection_AsciiString,NCollection_DefaultHasher<TCollection_AsciiString>)
%ignore Resource_Manager::ExtValue; // uses Standard_ExtString
%ignore Resource_Manager::SetResource (const Standard_CString, const Standard_ExtString); // uses Standard_ExtString
WRAP_AS_HANDLE_INCLUDE(Resource_Manager)

// Units classes
WRAP_AS_HANDLE_INCLUDE(Units_Dimensions)
WRAP_AS_ENUM_INCLUDE(UnitsAPI_SystemUnits)
WRAP_AS_PACKAGE(UnitsAPI)

// Storage enums and typedefs
WRAP_INCLUDE(Storage_Position)