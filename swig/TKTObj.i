// Created: 2016-04-20
//
// Copyright (c) 2016-2021 OPEN CASCADE SAS
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

// Definitions for wrapping Open CASCADE classes from TKTObj toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKTObj.lib")
#endif
%}

#define DECLARE_TOBJOCAF_PERSISTENCE(a,b)

WRAP_AS_ENUM_INCLUDE(TObj_DeletingMode)

WRAP_AS_HANDLE_INCLUDE(TObj_Application)

%ignore TObj_Object::GetDictionary; // names dictionary is not wrapped
WRAP_AS_HANDLE(TObj_Object)
WRAP_AS_HANDLE_INCLUDE(TObj_ObjectIterator)
WRAP_AS_HANDLE(TObj_Partition)
%ignore TObj_Model::GetChecker; // checker is not wrapped
%ignore TObj_Model::GetDictionary;
%ignore TObj_Model::FindObject;
%ignore TObj_Model::IsRegisteredName;
%ignore TObj_Model::RegisterName;
%ignore TObj_Model::UnRegisterName;
WRAP_AS_HANDLE_INCLUDE(TObj_Model)
WRAP_INCLUDE(TObj_Object)
WRAP_INCLUDE(TObj_Partition)
