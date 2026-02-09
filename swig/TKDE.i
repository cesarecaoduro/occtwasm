// Created: 2024-06-19
//
// Copyright (c) 2006-2024 OPEN CASCADE SAS
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

// Definitions for wrapping Open CASCADE classes from TKDE toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKDE.lib")
#endif
%}

// DE package
WRAP_AS_HANDLE(DE_Provider)
WRAP_AS_HANDLE_INCLUDE(DE_ConfigurationContext)
WRAP_AS_HANDLE_INCLUDE(DE_ConfigurationNode)
WRAP_AS_HANDLE_INCLUDE(DE_ShapeFixConfigurationNode)
WRAP_AS_CLASS_INCLUDE(DE_PluginHolder)
WRAP_INCLUDE(DE_Provider)
WRAP_AS_DATAMAP(DE_ConfigurationVendorMap, NCollection_IndexedDataMap, TCollection_AsciiString, Handle(DE_ConfigurationNode), NCollection_DefaultHasher<TCollection_AsciiString>)
WRAP_AS_DATAMAP(DE_ConfigurationFormatMap, NCollection_DataMap, TCollection_AsciiString, DE_ConfigurationVendorMap, NCollection_DefaultHasher<TCollection_AsciiString>)
WRAP_AS_HANDLE_INCLUDE(DE_Wrapper)
WRAP_AS_STRUCT_INCLUDE(DE_ShapeFixParameters)
