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

// Definitions for wrapping Open CASCADE classes from TKCDF toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKCDF.lib") 
#endif
%}

// CDF Exceptions
WRAP_AS_EXCEPTION(PCDM_DriverError)

// CDM classes
WRAP_AS_ENUM_INCLUDE(CDM_CanCloseStatus)
%ignore CDM_Document::Comment; // uses Standard_ExtString
%ignore CDM_Document::Presentation; // uses Standard_ExtString
WRAP_AS_HANDLE(CDM_Document)
WRAP_AS_HANDLE_INCLUDE(CDM_MetaData)
//WRAP_AS_HANDLE_INCLUDE(Message_Messenger)
%ignore CDM_Application::Write; // uses Standard_ExtString
%ignore CDM_Application::MessageDriver; // uses non-wrapped type Message_Messenger
WRAP_AS_HANDLE_INCLUDE(CDM_Application)
%ignore CDM_Document::Reference; // uses non-wrapped type
WRAP_INCLUDE(CDM_Document)
WRAP_AS_HANDLE_INCLUDE(PCDM_ReaderFilter)
WRAP_AS_HANDLE_INCLUDE(PCDM_ReferenceIterator)
WRAP_AS_DATAMAP_INCLUDE(CDM_MetaDataLookUpTable,NCollection_DataMap,TCollection_ExtendedString,Handle(CDM_MetaData),NCollection_DefaultHasher<TCollection_ExtendedString>)

// PCDM classes
WRAP_AS_ENUM_INCLUDE(PCDM_ReaderStatus)
WRAP_AS_ENUM_INCLUDE(PCDM_StoreStatus)

%ignore PCDM_Reader::Read (Standard_IStream&, const Handle(Storage_Data)&, const Handle(CDM_Document)&, const Handle(CDM_Application)& theApplication);
WRAP_AS_HANDLE_INCLUDE(PCDM_Reader)
WRAP_AS_HANDLE_INCLUDE(PCDM_Writer)
%warnfilter(403) PCDM_RetrievalDriver; // disable SWIG warning on abstract class
%ignore PCDM_RetrievalDriver::DocumentVersion; // uses non-wrapped type Message_Messenger
%ignore PCDM_RetrievalDriver::ReferenceCounter; // uses non-wrapped type Message_Messenger
WRAP_AS_HANDLE_INCLUDE(PCDM_RetrievalDriver)
%ignore PCDM_StorageDriver::Make; // uses non-wrapped type
WRAP_AS_HANDLE_INCLUDE(PCDM_StorageDriver)

// CDF classes
WRAP_AS_HANDLE_INCLUDE(CDF_Directory)
WRAP_AS_HANDLE_INCLUDE(CDF_MetaDataDriver)
WRAP_AS_HANDLE_INCLUDE(CDF_FWOSDriver)
%ignore CDF_Application::DefaultFolder; // uses Standard_ExtString
%ignore CDF_Application::SetDefaultFolder; // uses Standard_ExtString
WRAP_AS_HANDLE_INCLUDE(CDF_Application)
