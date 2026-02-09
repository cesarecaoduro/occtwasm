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

// Definitions for wrapping Open CASCADE classes from TKOpenGL toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKOpenGL.lib")
#endif
%}

WRAP_AS_ENUM_INCLUDE(OpenGl_ShaderProgramDumpLevel)
WRAP_AS_HANDLE_INCLUDE(OpenGl_Caps)

// OpenGl_Context is re-declared manually: SWIG fails to process actual header
// (fails with message "Unable to open file..."); also many methods of this
// class are low-level and thus useless for wrapping
WRAP_AS_HANDLE(OpenGl_Context)
%{ #include <OpenGl_Context.hxx> %}
class OpenGl_Context : public Standard_Transient
{
public:
  OpenGl_Context (const Handle(OpenGl_Caps)& theCaps = NULL);
  void forcedRelease();
  void Share (const Handle(OpenGl_Context)& theShareCtx);
  Standard_Boolean Init (const Standard_Boolean theIsCoreProfile = Standard_False);
  Standard_Boolean IsValid() const;
  static void ReadGlVersion (Standard_Integer& theGlVerMajor, Standard_Integer& theGlVerMinor);
  Standard_Boolean CheckExtension (const char* theExtName) const;
  static Standard_Boolean CheckExtension (const char* theExtString, const char* theExtName);
  Standard_Boolean IsGlGreaterEqual (const Standard_Integer theVerMajor, const Standard_Integer theVerMinor) const;
  void ResetErrors();
  Standard_Boolean IsCurrent() const;
  Standard_Boolean MakeCurrent();
  void SwapBuffers();
  Standard_Boolean SetSwapInterval (const Standard_Integer theInterval);
  Standard_Boolean IsRender() const;
  Standard_Boolean IsFeedback() const;
  Standard_Size AvailableMemory() const;
  TCollection_AsciiString MemoryInfo() const;
  Standard_Integer TextureWrapClamp() const;
  Standard_Integer MaxDegreeOfAnisotropy() const;
  Standard_Integer MaxTextureSize() const;
  Standard_Integer MaxClipPlanes() const;
  bool ToUseVbo() const;
  Standard_Boolean HasStereoBuffers() const;
  Standard_Boolean IsDebugContext() const;
  void EnableFeatures() const;
  void DisableFeatures() const;
};

%ignore OpenGl_GraphicDriver::UserDrawCallback;
%ignore OpenGl_GraphicDriver::GetSharedContext;
%ignore OpenGl_GraphicDriver::myLayerIds; // public fields!
%ignore OpenGl_GraphicDriver::myLayerSeq;
%ignore OpenGl_GraphicDriver::myMapOfZLayerSettings;
WRAP_AS_HANDLE(OpenGl_GraphicDriver)
%ignore OpenGl_Window::ReadDepths;
WRAP_AS_HANDLE_INCLUDE(OpenGl_Window)
WRAP_INCLUDE(OpenGl_GraphicDriver)

%feature("notabstract") OpenGl_View;
WRAP_AS_HANDLE(OpenGl_View)
%{ #include <OpenGl_View.hxx> %}
class OpenGl_View : public Graphic3d_CView
{
public:
  OpenGl_View (const Handle(Graphic3d_StructureManager)& theMgr,
               const Handle(OpenGl_GraphicDriver)& theDriver,
               const Handle(OpenGl_Caps)& theCaps,
               OpenGl_StateCounter* theCounter);
  virtual void Redraw();
};

%{
#undef Opposite
%}
