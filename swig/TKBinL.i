// Created: 2019-11-15
//
// Copyright (c) 2019-2021 OPEN CASCADE SAS
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

// Definitions for wrapping Open CASCADE classes from TKBinL toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKBinL.lib") 
#endif
%}

// BinLDrivers classes
WRAP_AS_STRUCT_INCLUDE(BinLDrivers_DocumentSection)
WRAP_AS_HANDLE_INCLUDE(BinLDrivers_DocumentRetrievalDriver)
WRAP_AS_HANDLE_INCLUDE(BinLDrivers_DocumentStorageDriver)
WRAP_AS_PACKAGE(BinLDrivers)
%ignore BinLDrivers::Factory (const Standard_GUID& ); // Draw Plugin method
