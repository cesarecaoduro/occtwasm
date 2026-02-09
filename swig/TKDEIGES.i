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

// Definitions for wrapping Open CASCADE classes from TKDEIGES toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKDEIGES.lib")
#endif
%}

// IGES... classes
WRAP_AS_ENUM_INCLUDE(IGESData_DefList)
WRAP_AS_ENUM_INCLUDE(IGESData_DefType)
%ignore IGESData_GlobalSection::Init;
%ignore IGESData_GlobalSection::Params;
WRAP_AS_STRUCT_INCLUDE(IGESData_GlobalSection)

// IGESData_IGESEntity has cyclic dependency on other classes 
%ignore IGESData_IGESEntity::Associativities;
%ignore IGESData_IGESEntity::Properties;
WRAP_AS_HANDLE(IGESData_ColorEntity)
WRAP_AS_HANDLE(IGESData_TransfEntity)
WRAP_AS_HANDLE(IGESData_LineFontEntity)
WRAP_AS_HANDLE(IGESData_LevelListEntity)
WRAP_AS_HANDLE(IGESData_ViewKindEntity)
WRAP_AS_HANDLE(IGESData_LabelDisplayEntity)
WRAP_AS_HANDLE_INCLUDE(IGESData_IGESEntity)
WRAP_INCLUDE(IGESData_ColorEntity)
WRAP_INCLUDE(IGESData_TransfEntity)
WRAP_INCLUDE(IGESData_LineFontEntity)
WRAP_INCLUDE(IGESData_LevelListEntity)
WRAP_INCLUDE(IGESData_ViewKindEntity)
WRAP_INCLUDE(IGESData_LabelDisplayEntity)

WRAP_AS_STRUCT_INCLUDE(IGESData_IGESType)
%ignore IGESData_IGESModel::VerifyCheck;
WRAP_AS_HANDLE_INCLUDE(IGESData_IGESModel)

%ignore IGESControl_Reader::PrintTransferInfo;
WRAP_AS_CLASS_INCLUDE(IGESControl_Reader)

%ignore IGESControl_Controller::TransferWriteTransient;
%ignore IGESControl_Controller::TransferProcess;
%ignore IGESControl_Controller::SetTransferProcess;
WRAP_AS_HANDLE_INCLUDE(IGESControl_Controller)

%ignore IGESControl_Writer::TransferProcess;
%ignore IGESControl_Writer::SetTransferProcess;
WRAP_AS_CLASS_INCLUDE(IGESControl_Writer)

// HLRAlgo classes
WRAP_AS_CLASS_INCLUDE(IGESCAFControl_Reader)
WRAP_AS_CLASS_INCLUDE(IGESCAFControl_Writer)

WRAP_AS_HANDLE_INCLUDE(DEIGES_ConfigurationNode)
WRAP_AS_HANDLE_INCLUDE(DEIGES_Provider)
WRAP_AS_STRUCT_INCLUDE(DEIGES_Parameters)
