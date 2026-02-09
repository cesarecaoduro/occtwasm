// Created: 2009-02-27
//
// Copyright (c) 2009-2021 OPEN CASCADE SAS
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

// Definition of static code to be included in each wrapper for OCCT

// OCC version macros are wrapped as static methods of the class
%inline %{
  #include "Standard_Version.hxx"
  struct Standard_Version {
    static const int Major()           { return OCC_VERSION_MAJOR; }
    static const int Minor()           { return OCC_VERSION_MINOR; }
    static const int Maintenance()     { return OCC_VERSION_MAINTENANCE; }
    static const double Number()       { return OCC_VERSION; }
    static const char * const String() { return OCC_VERSION_STRING; }
  };
%}

// Define macro indicating host language as string
#if defined(SWIGCSHARP)
%{
#define OCC_HOST_LANGUAGE "CSharp"
%}
#elif defined(SWIGJAVA)
%{
#define OCC_HOST_LANGUAGE "Java"
%}
#else
#error "Cannot recognize target language for SWIG wrapper!"
#endif

#if defined(SWIGCSHARP)
%include "attribute.i"

// Same as %attribute_custom, but keeps original getter method wrapped.
%define WRAP_PROPERTY_CUSTOM(Class, AttributeType, AttributeName, GetMethod, SetMethod, GetMethodCall, SetMethodCall)
  %extend Class {
    AttributeType AttributeName;
  }
  %{
    #define %mangle(Class) ##_## AttributeName ## _get(self_) GetMethodCall
    #define %mangle(Class) ##_## AttributeName ## _set(self_, val_) SetMethodCall
  %}
%enddef

// Same as %attribute_readonly, but keeps original getter method wrapped.
%define WRAP_PROPERTY_READONLY(Class, AttributeType, AttributeName, GetMethod, GetMethodCall)
  %immutable Class::AttributeName;
  %extend Class {
    AttributeType AttributeName;
  }
  %{
    #define %mangle(Class) ##_## AttributeName ## _get(self_) GetMethodCall
  %}
%enddef

// Same as %attribute, but keeps original getter method wrapped.
%define WRAP_PROPERTY(Class, AttributeType, AttributeName, GetMethod, SetMethod...)
  #if (#SetMethod != "")
    WRAP_PROPERTY_CUSTOM(%arg(Class), %arg(AttributeType), AttributeName, GetMethod, SetMethod, self_->GetMethod(), self_->SetMethod(val_))
  #else
    WRAP_PROPERTY_READONLY(%arg(Class), %arg(AttributeType), AttributeName, GetMethod, self_->GetMethod())
  #endif
%enddef

// Same as %attribute2, but keeps original getter method wrapped.
%define WRAP_PROPERTY2(Class, AttributeType, AttributeName, GetMethod, SetMethod...)
  #if (#SetMethod != "")
    WRAP_PROPERTY_CUSTOM(%arg(Class), %arg(AttributeType), AttributeName, GetMethod, SetMethod, &self_->GetMethod(), self_->SetMethod(*val_))
  #else
    WRAP_PROPERTY_READONLY(%arg(Class), %arg(AttributeType), AttributeName, GetMethod, &self_->GetMethod())
  #endif
%enddef

// Same as %attributeval, but keeps original getter method wrapped.
%define WRAP_PROPERTYVAL(Class, AttributeType, AttributeName, GetMethod, SetMethod...)
  %{
    #define %mangle(Class) ##_## AttributeName ## _get(self_) new AttributeType(self_->GetMethod())
  %}
  #if (#SetMethod != "")
    %{
      #define %mangle(Class) ##_## AttributeName ## _set(self_, val_) self_->SetMethod(*val_)
    %}
  #else
    %immutable Class::AttributeName;
  #endif
  %newobject Class::AttributeName;
  %extend Class {
    AttributeType AttributeName;
  }
%enddef

#else
%define WRAP_PROPERTY(Class, AttributeType, AttributeName, GetMethod, SetMethod...)
%enddef
%define WRAP_PROPERTY2(Class, AttributeType, AttributeName, GetMethod, SetMethod...)
%enddef
%define WRAP_PROPERTYVAL(Class, AttributeType, AttributeName, GetMethod, SetMethod...)
%enddef
#endif

// skip C++ macros causing SWIG failures
#define Standard_DEPRECATED(a)

%include <Standard_Version.hxx>

%{
// OCC License protection, should be activated in Protected configuration
#if defined(USE_OCL)
#include <OCCLicense.hxx>
#include <Standard_Version.hxx>
#if defined(_WIN32)
#include <Windows.h>

extern "C" WINUSERAPI int WINAPI MessageBoxA(IN HWND hWnd,IN LPCSTR lpText,IN LPCSTR lpCaption,IN UINT uType);
#endif

static struct _OCCLicenseCheck {
  _OCCLicenseCheck () {
    OCCLIC_CHECK(OCC_HOST_LANGUAGE "-" OCC_VERSION_STRING, onLicenseError());
  }
  void onLicenseError ()
  {
    char buffer[2048];
    int n = sprintf (buffer, "License check failed for product " OCC_HOST_LANGUAGE "-" OCC_VERSION_STRING "\n\n"
                             "Contact us to request new license key: http://www.opencascade.com/contact \n\n"
                             "Your copy ID: %lX\n", OCCLicense_GetHostID());
    char* aKeyFile = getenv ("OCCLICENSE_FILE");
    if (aKeyFile)
    {
      n += sprintf (buffer + n, "Your license file path is: %.512s", aKeyFile);
    }
    else
    {
      n += sprintf (buffer + n, "Warning: Cannot find license file - OCCLICENSE_FILE environment variable is not defined!");
    }

#if defined(_WIN32)
    ::MessageBoxA (0, buffer, "Error", 0x2010L/*MB_TASKMODAL|MB_ICONSTOP*/);
    ExitProcess(0);
#else
    printf ("Error: %s\n", buffer);
    exit(0);
#endif
  }
} TheChecker;
#endif

%}
