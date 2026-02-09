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

// Definitions for wrapping Open CASCADE classes from TKXSBase toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKXSBase.lib") 
#endif
%}

// XSBase Exceptions
WRAP_AS_EXCEPTION(Interface_InterfaceError)
WRAP_AS_EXCEPTION(Interface_CheckFailure)
WRAP_AS_EXCEPTION(Interface_InterfaceMismatch)
WRAP_AS_EXCEPTION(Transfer_TransferFailure)
WRAP_AS_EXCEPTION(Transfer_TransferDeadLoop)

WRAP_AS_ENUM_INCLUDE(MoniTool_ValueType)
%ignore MoniTool_TypedValue::LibList;
%ignore MoniTool_TypedValue::SetInterpret;
%ignore MoniTool_TypedValue::Internals;
%ignore MoniTool_TypedValue::SetSatisfies;
WRAP_AS_HANDLE_INCLUDE(MoniTool_TypedValue)

// Interface package
WRAP_AS_ENUM_INCLUDE(Interface_ParamType)
WRAP_AS_ENUM_INCLUDE(Interface_CheckStatus)
WRAP_AS_ENUM_INCLUDE(Interface_DataState)
WRAP_AS_HANDLE_INCLUDE(Interface_TypedValue)
%ignore Interface_Static::Init;
WRAP_AS_HANDLE_INCLUDE(Interface_Static)
WRAP_AS_HANDLE(Interface_InterfaceModel)
WRAP_AS_HANDLE_INCLUDE(Interface_Check)
WRAP_AS_CLASS_INCLUDE(Interface_CheckIterator)
WRAP_AS_HANDLE_INCLUDE(Interface_ReportEntity)

// this methods are not used in sample
%ignore Interface_InterfaceModel::SetGTool;
%ignore Interface_InterfaceModel::GTool;
%ignore Interface_InterfaceModel::SetProtocol;
%ignore Interface_InterfaceModel::Protocol;
%ignore Interface_InterfaceModel::AddWithRefs;
%ignore Interface_InterfaceModel::Redefineds;
WRAP_INCLUDE(Interface_InterfaceModel)
WRAP_AS_CLASS_INCLUDE(Interface_EntityIterator)

%ignore Interface_Graph::GetFromIter;
%ignore Interface_Graph::SetShare;
%ignore Interface_Graph::SetNoShare;
%ignore Interface_Graph::Interface_Graph;
%ignore Interface_Graph::CBitMap;
%ignore Interface_Graph::BitMap;
%ignore Interface_Graph::SharingNums;
%ignore Interface_Graph::SharedNums;
WRAP_AS_CLASS_INCLUDE(Interface_Graph)

// IFSelect package
WRAP_AS_ENUM_INCLUDE(IFSelect_ReturnStatus)
WRAP_AS_ENUM_INCLUDE(IFSelect_PrintCount)
%ignore IFSelect_WorkSession::EvalSelection;
%ignore IFSelect_WorkSession::Sources;
%ignore IFSelect_WorkSession::SentList;
%ignore IFSelect_WorkSession::FileRoot;
%ignore IFSelect_WorkSession::Dispatch;
%ignore IFSelect_WorkSession::EvaluateDispatch;
%ignore IFSelect_WorkSession::SetFileRoot;
%ignore IFSelect_WorkSession::DispatchRank;
%ignore IFSelect_WorkSession::SetAppliedModifier;
%ignore IFSelect_WorkSession::ModifierRank;
%ignore IFSelect_WorkSession::UsesAppliedModifier;
%ignore IFSelect_WorkSession::ResetAppliedModifier;
%ignore IFSelect_WorkSession::GeneralModifier;
%ignore IFSelect_WorkSession::IntParam;
%ignore IFSelect_WorkSession::NewIntParam;
%ignore IFSelect_WorkSession::IntValue;
%ignore IFSelect_WorkSession::SetIntValue;
%ignore IFSelect_WorkSession::ModelCopier;
%ignore IFSelect_WorkSession::SetModelCopier;
%ignore IFSelect_WorkSession::ModelModifier;
%ignore IFSelect_WorkSession::RunModifierSelected;
%ignore IFSelect_WorkSession::RunModifier;
%ignore IFSelect_WorkSession::EvalSplit;
%ignore IFSelect_WorkSession::Selection;
%ignore IFSelect_WorkSession::ToggleSelectExtract;
%ignore IFSelect_WorkSession::SelectionResultFromList;
%ignore IFSelect_WorkSession::SetItemSelection;
%ignore IFSelect_WorkSession::ItemSelection;
%ignore IFSelect_WorkSession::Source;
%ignore IFSelect_WorkSession::NbSources;
%ignore IFSelect_WorkSession::WriteFile;
%ignore IFSelect_WorkSession::SendSelected;
%ignore IFSelect_WorkSession::SetInputSelection;
%ignore IFSelect_WorkSession::SetControl;
%ignore IFSelect_WorkSession::CombineAdd;
%ignore IFSelect_WorkSession::IsReversedSelectExtract;
%ignore IFSelect_WorkSession::CombineRemove;
%ignore IFSelect_WorkSession::NewSelectPointed;
%ignore IFSelect_WorkSession::SetSelectPointed;
%ignore IFSelect_WorkSession::GiveSelection;
%ignore IFSelect_WorkSession::DumpSelection;
%ignore IFSelect_WorkSession::EvaluateSelection;
%ignore IFSelect_WorkSession::SelectionResult;
%ignore IFSelect_WorkSession::SetModelContent;
%ignore IFSelect_WorkSession::SetShareOut;
%ignore IFSelect_WorkSession::ShareOut;
%ignore IFSelect_WorkSession::SignType;
%ignore IFSelect_WorkSession::SignValue;
%ignore IFSelect_WorkSession::Signature;
%ignore IFSelect_WorkSession::SetSignType;
%ignore IFSelect_WorkSession::PrintSignatureList;
%ignore IFSelect_WorkSession::SignCounter;
%ignore IFSelect_WorkSession::ComputeCounter;
%ignore IFSelect_WorkSession::ComputeCounterFromList;
%ignore IFSelect_WorkSession::Transformer;
%ignore IFSelect_WorkSession::NewTransformStandard;
%ignore IFSelect_WorkSession::NewTransformStandard;
%ignore IFSelect_WorkSession::RunTransformer;
%ignore IFSelect_WorkSession::SetLibrary;
%ignore IFSelect_WorkSession::WorkLibrary;
%ignore IFSelect_WorkSession::HGraph;
%ignore IFSelect_WorkSession::Protocol;
%ignore IFSelect_WorkSession::SetProtocol;
%ignore IFSelect_WorkSession::FinalModifierIdents;
%ignore IFSelect_WorkSession::ItemIdents;
%ignore IFSelect_WorkSession::AppliedDispatches;
%ignore IFSelect_WorkSession::SetMapWriter;
%ignore IFSelect_WorkSession::MapWriter;
%ignore IFSelect_WorkSession::LastRunCheckList;
%ignore IFSelect_WorkSession::CheckOne;
%ignore IFSelect_WorkSession::ModelCheckList;
%ignore IFSelect_WorkSession::PrintCheckList;
%ignore IFSelect_WorkSession::ModelCheckList;
%ignore IFSelect_WorkSession::QueryCheckList;
%ignore IFSelect_WorkSession::ListEntities;
%ignore IFSelect_WorkSession::SetRemaining;
%ignore IFSelect_WorkSession::SetParams;
WRAP_AS_HANDLE_INCLUDE(IFSelect_WorkSession)

//package Transfer
WRAP_AS_ENUM_INCLUDE(Transfer_StatusExec)
WRAP_AS_ENUM_INCLUDE(Transfer_StatusResult)
WRAP_AS_HANDLE_INCLUDE(Transfer_Binder)
WRAP_AS_HANDLE_INCLUDE(Transfer_SimpleBinderOfTransient)

WRAP_AS_HANDLE(Transfer_ActorOfProcessForTransient)
WRAP_AS_HANDLE_INCLUDE(Transfer_ProcessForTransient)
WRAP_AS_CLASS_INCLUDE(Transfer_TransferIterator)
WRAP_AS_CLASS_INCLUDE(Transfer_IteratorOfProcessForTransient)
WRAP_INCLUDE(Transfer_ActorOfProcessForTransient)

%ignore Transfer_TransientProcess::Context;
%ignore Transfer_TransientProcess::SetGraph;
%ignore Transfer_TransientProcess::HGraph;
%ignore Transfer_TransientProcess::Graph;
WRAP_AS_HANDLE_INCLUDE(Transfer_TransientProcess)
WRAP_AS_HANDLE_INCLUDE(Transfer_ActorOfTransientProcess)

// XSControl package

%ignore XSControl_Controller::Profile;
%ignore XSControl_Controller::SignType;
%ignore XSControl_Controller::WorkLibrary;
%ignore XSControl_Controller::Protocol;
%ignore XSControl_Controller::ResolveCluster;
%ignore XSControl_Controller::ActorWrite;
%ignore XSControl_Controller::ActorRead;
%ignore XSControl_Controller::TransferWriteShape;
%ignore XSControl_Controller::TransferWriteTransient;
%ignore XSControl_Controller::AdaptorSession;

%ignore XSControl_TransferReader::SetGraph;
%ignore XSControl_TransferReader::Context;
%ignore XSControl_TransferReader::FinalResult;
%ignore XSControl_TransferReader::ResultFromNumber;

// XSControl_Controller and XSControl_WorkSession has interdependency
%ignore XSControl_WorkSession::SetTransferReader;
%ignore XSControl_WorkSession::TransferWriter;
%ignore XSControl_WorkSession::SetVars;
%ignore XSControl_WorkSession::Vars;
%ignore XSControl_WorkSession::TransferWriteCheckList;
%ignore XSControl_WorkSession::Context;
%ignore XSControl_WorkSession::SetAllContext;
WRAP_AS_HANDLE(XSControl_TransferReader)
WRAP_AS_HANDLE(XSControl_Controller)
WRAP_AS_HANDLE(XSControl_WorkSession)
WRAP_INCLUDE(XSControl_TransferReader)
WRAP_INCLUDE(XSControl_Controller)
WRAP_INCLUDE(XSControl_WorkSession)

WRAP_AS_CLASS_INCLUDE(XSControl_Reader)
WRAP_AS_CLASS_INCLUDE(XSControl_Writer)

// StepData package
%ignore StepData_StepModel::VerifyCheck;
%ignore StepData_StepModel::Header;
WRAP_AS_HANDLE_INCLUDE(StepData_StepModel)

// UnitsMethods package
WRAP_AS_ENUM_INCLUDE(UnitsMethods_LengthUnit)
WRAP_AS_PACKAGE(UnitsMethods)
