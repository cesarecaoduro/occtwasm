// Created: 2015-06-10
//
// Copyright (c) 2015-2021 OPEN CASCADE SAS
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

// Definitions for wrapping Open CASCADE classes from TKD3DHost toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKD3DHost.lib")
#endif
%}

WRAP_AS_INT_PTR(IDirect3DSurface9)
WRAP_AS_HANDLE_INCLUDE(D3DHost_GraphicDriver)

%feature("notabstract") D3DHost_View;
WRAP_AS_HANDLE(D3DHost_View)
%{ #include <D3DHost_View.hxx> %}
class D3DHost_View : public OpenGl_View
{
public:
  IDirect3DSurface9* D3dColorSurface() const;
public:
  D3DHost_View (const Handle(Graphic3d_StructureManager)& theMgr,
                const Handle(D3DHost_GraphicDriver)& theDriver,
                const Handle(OpenGl_Caps)& theCaps,
                OpenGl_StateCounter* theCounter);
};

%{
#undef Opposite
%}
