// Created: 2016-07-04
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

// Definitions for wrapping Open CASCADE classes from TKHLR toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKIVtk.lib")
#endif
%}
// Ignore export definitions because SWIG doesn't underdstand them.
#define IVtkVTK_EXPORT
#define IVtkTools_EXPORT
#define VTKCOMMONDATAMODEL_EXPORT
#define VTKCOMMONEXECUTIONMODEL_EXPORT 
#define VTKCOMMONCORE_EXPORT
#define VTKRENDERINGCORE_EXPORT

// Import VTK java classes into the intermediary JNI class definition.
%pragma(java) jniclassimports=%{import vtk.*;%}
             
%pragma(java) jniclasscode=%{
/* Load VTK shared librarires (.dll) on startup, print message if not found */
	static 
	{				
    if (!vtk.vtkNativeLibrary.LoadAllNativeLibraries()) 
		{
			for (vtk.vtkNativeLibrary lib : vtk.vtkNativeLibrary.values()) 
			{
	    	if (!lib.IsLoaded()) 
				System.out.println(lib.GetLibraryName() + " not loaded");    
			}
	
			System.out.println("Make sure the search path is correct: ");
			System.out.println(System.getProperty("java.library.path"));
    }
    vtk.vtkNativeLibrary.DisableOutputWindow(null);
	}
%}

// Define mappings for VTK-based object
%define TYPEMAP_OCCVTK_OUT(vtkClassType, vtkClassJava)
  
  // Map a smartpointer conversion to return a pointer from C++ to JNI level.
	%typemap(out) vtkSmartPointer< vtkClassType > {
	  *(vtkClassType **)& $result = $1.GetPointer();
	}
     
  %typemap(jstype) vtkClassType, vtkClassType *, vtkClassType&, 
	  vtkSmartPointer< vtkClassType > "vtkClassJava"
	  
	// Mapping a conversion of VTK-based object from JNI level (C++ pointer) 
	// to Java object.
  %typemap(javaout) vtkClassType, vtkClassType *, vtkClassType&, 
	  vtkSmartPointer< vtkClassType > {
	    // Get pointer from JNI level
      long cPtr = $jnicall;
      // If null is received from C++ then return null into Java
      if (cPtr == 0) return null;
      // Try to find the given pointer in java vtk objects manager map. 
      vtkClassJava obj = (vtkClassJava)vtk.vtkObjectBase.JAVA_OBJECT_MANAGER.
			  getJavaObject(new Long(cPtr));
      if (obj == null) {
        // If not found in java then create a new vtk object.
        // To create a new vtk object instance of the given class
				// create a necessary java Class object first, get a constructor
				// from it and then perform a constructor call.
				// Create a temporary object to get a class name. 
        vtkClassJava tempObj = new vtkClassJava(cPtr); 
        String className = tempObj.getClass().getName();
        try {
          // Create a Class object.
          Class<?> c = Class.forName(className);
          // Get a constructor method from the Class object.
          java.lang.reflect.Constructor<?> cons = c.getConstructor( 
					  new Class[] {long.class} );
					// Create a new vtk class instance calling the "copy" constructor
					// with the given pointer as a parameter.
          obj = (vtkClassJava)cons.newInstance(new Object[] {new Long(cPtr)});
        } catch (Exception e) {
          e.printStackTrace();
        }
        // Delete the temporary object
        tempObj.Delete();
      }                 
      return obj;
  }
%enddef
// Convert from java object to C++ pointer using vtk java specific method
// instead of class.getCPtr(o).
%define TYPEMAP_OCCVTK_IN(vtkClassType)
  %typemap(javain) vtkClassType, vtkClassType *, vtkClassType& "$javainput.GetVTKId()"
%enddef

// Primitive type mapping 
%define TYPEMAP_VTKID(aType)
	%typemap(in) aType {$1 = (vtkIdType)$input;}
	%typemap(out) aType {$result = $1;}
	%typemap(out) aType& {$result = *$1;}
	%typemap(jni) aType, aType& "int"
	%typemap(jtype) aType, aType& "int"
	%typemap(jstype) aType, aType& "int"
	%typemap(javain) aType, aType& "$javainput"
	%typemap(javaout) aType, aType& {return $jnicall;}
%enddef

TYPEMAP_VTKID(vtkIdType)
%apply vtkIdType {IVtk_IdType, IVtk_PointId, IVtk_FaceId, IVtk_EdgeId};

// Array mapping for the ShapePicker::pick
%include "arrays_java.i"
%apply double[] {double *};

%include <vtkVersionMacros.h>

%{
#include <vtkSmartPointer.h>
#include <vtkPolyData.h>
#include <IVtk_Types.hxx>
#include <vtkPolyDataAlgorithm.h>
#include <vtkActorCollection.h>
#include <vtkCommonCoreModule.h>
#include <vtkSetGet.h>
#include <vtkObjectBase.h>
#include <vtkTimeStamp.h>
#include <vtkWeakPointerBase.h>
#include <vtkConfigure.h>
#include <vtkObject.h>
%}

#if VTK_MAJOR_VERSION >= 9
%{
#include <vtkWrappingHints.h>
%}
#endif

TYPEMAP_OCCVTK_OUT(vtkPolyData, vtk.vtkPolyData)

// IVtk classes
// Collections mapping
WRAP_AS_NCOLLECTION(IVtk_ShapeIdList,NCollection_List,IVtk_IdType)
WRAP_AS_NCOLLECTION(IVtk_PointIdList,NCollection_List,IVtk_PointId)
//WRAP_AS_ENUM(IVtk_SelectionMode)
WRAP_AS_NCOLLECTION(IVtk_SelectionModeList,NCollection_List,IVtk_SelectionMode)
WRAP_AS_MAP(IVtk_IdTypeMap,NCollection_Map,IVtk_IdType,NCollection_DefaultHasher<IVtk_IdType>)

%include <IVtk_Types.hxx>
%#define M_PI       3.14159265358979323846
WRAP_AS_HANDLE_INCLUDE(IVtk_Interface)
WRAP_AS_HANDLE_INCLUDE(IVtk_IShape)
WRAP_AS_HANDLE_INCLUDE(IVtk_IShapeData)
WRAP_AS_HANDLE_INCLUDE(IVtk_IShapeMesher)

// IVtkVTK classes
%feature("notabstract") IVtkVTK_ShapeData;
// suppress warning on unknown base types, we do not need them to be wrapped
WRAP_AS_HANDLE_INCLUDE(IVtkVTK_ShapeData)

// IVtkOCC classes 
// Ignore not exported method
%ignore IVtkOCC_Shape::GetSubShapeId;
WRAP_AS_HANDLE_INCLUDE(IVtkOCC_Shape)
WRAP_AS_HANDLE_INCLUDE(IVtkOCC_ShapeMesher)


// IVtkTools classes

TYPEMAP_OCCVTK_OUT(vtkActorCollection, vtk.vtkActorCollection)

// Mapping of conversion from Java object to a pointer for JNI level.
TYPEMAP_OCCVTK_IN(vtkObjectBase)
TYPEMAP_OCCVTK_IN(vtkLookupTable)
TYPEMAP_OCCVTK_IN(vtkMapper)
TYPEMAP_OCCVTK_IN(vtkActor)
TYPEMAP_OCCVTK_IN(vtkRenderer)

%import "vtkSetGet.h"
%import "vtkCommonCoreModule.h"
%import "vtkTimeStamp.h"
%import "vtkWeakPointerBase.h"
#if VTK_MAJOR_VERSION >= 9
%import "vtkWrappingHints.h"
#endif
%import "vtkConfigure.h"
%import "vtkObjectBase.h"
%import "vtkObject.h"
%import "vtkDataObject.h"
%import "vtkCollection.h"
%import "vtkPropCollection.h"
%import "vtkProp.h"
%import "vtkProp3D.h"
%import "vtkScalarsToColors.h"
%import "vtkLookupTable.h"
%import "vtkActor.h"
%import "vtkActorCollection.h"
%import "vtkAlgorithm.h"
%import "vtkPolyDataAlgorithm.h"
%import "vtkAbstractMapper.h"
%import "vtkAbstractMapper3D.h"
// vtkMapper has duplicates of macros from its ancestor
// class vtkAbstractMapper, that leads to unnecessary warnings.
// Suppress them for this header file.
%warnfilter(SWIGWARN_PARSE_REDUNDANT);
%import "vtkMapper.h"
%warnfilter(+SWIGWARN_PARSE_REDUNDANT);
%import "vtkViewport.h"
%import "vtkRenderer.h"
%import "vtkAbstractPicker.h"
%import "vtkAbstractPropPicker.h"

%typemap(jstype) vtkObjectBase "vtk.vtkObjectBase"
%typemap(jstype) vtkDataObject "vtk.vtkDataObject"
%typemap(jstype) vtkScalarsToColors "vtk.vtkScalarsToColors"
%typemap(jstype) vtkCollection "vtk.vtkCollection"
%typemap(jstype) vtkPropCollection "vtk.vtkPropCollection"
%typemap(jstype) vtkProp "vtk.vtkProp"
%typemap(jstype) vtkProp3D "vtk.vtkProp3D"
%typemap(jstype) vtkAlgorithm "vtk.vtkAlgorithm"
%typemap(jstype) vtkPolyDataAlgorithm "vtk.vtkPolyDataAlgorithm"
%typemap(jstype) vtkAbstractMapper "vtk.vtkAbstractMapper"
%typemap(jstype) vtkAbstractMapper3D "vtk.vtkAbstractMapper3D"
%typemap(jstype) vtkViewport "vtk.vtkViewport"
%typemap(jstype) vtkAbstractPicker "vtk.vtkAbstractPicker"
%typemap(jstype) vtkAbstractPropPicker "vtk.vtkAbstractPropPicker"

// Macro for wrapping vtk-based classes
%define WRAP_CLASS_OCCVTK(Class, BaseClass)

  %typemap(javaimports) Class %{import vtk.*;
/** This VTK-based wrapper class is generated by SWIG.*/%}
  
  // OCC Java vtk-based class can inherit vtk java class not wrapped by SWIG.
	// Redefine the java base class for the class wrapped by SWIG.
	// All vtk-based classes are derived from vtkObjectBase not wrapped by SWIG. 
  %typemap(javabase, notderived="1" ) Class, Class *, Class &, Class [], 
	  Class (CLASS::*) "BaseClass"
  
  // Redefine constructors for Java wrapper class to correctly call parent vtk
	// class constructor.
  %typemap(javabody) Class, Class *, Class & %{

	/** Pointer to the underlying C++ object. */
  private transient long swigCPtr;
  
  /** Default java constructor */
  public $javaclassname() {
    super();
    swigCPtr = GetVTKId();
  }

	/** Java "copy" constructor */
  public $javaclassname(long cPtr) {
    super(cPtr);
    swigCPtr = cPtr;
  }
  %}

	// Convert from java object to c++ pointer using vtk java specific method.
  TYPEMAP_OCCVTK_IN(Class)
  // No need in delete according to vtk java classes implementation
  %typemap(javadestruct, methodname="disposeUnused", methodmodifiers="public synchronized") Class { }
  //%typemap(javafinalize) Class %{ %}
  %nodefaultdtor Class;
  %typemap(javadestruct_derived, methodname="disposeUnused", methodmodifiers="public synchronized") Class { }
  
  // Redefine body for Java wrapper class for derived classes 
  %typemap(javabody_derived) Class, Class *, Class & %{

	/** Pointer to the underlying C++ object. */
  private transient long swigCPtr;

  /** Default derived java constructor */
  public $javaclassname() 
  {
    super();
    swigCPtr = GetVTKId();
  }

  /** Derived java constructor */
  public $javaclassname(long cPtr) 
  {
    super($imclassname.$javaclassname_SWIGUpcast(cPtr));
    swigCPtr = cPtr;
  }
  %}
  
  // Extend the proxy class with VTKInit() method used in default constructor.
  // See vtkObjectBase().
  %extend Class {
    /** VTKInit() method used in default constructor. @see vtkObjectBase(). */
		jlong VTKInit()
		{
		  vtkObjectBase *aNewOne = Class::New();
		  return (jlong)(size_t)(void*)aNewOne;
		}
	}
	     
  // Define conversion from C++ pointer to java vtk-based object
	TYPEMAP_OCCVTK_OUT(Class, $javaclassname)
	
  // redefine input type for 'non-const &'
  %typemap(jstype,out="$javaclassname") Class & %{ $javaclassname %};

  // restore default input type for const & 
  %typemap(jstype,out="$javaclassname") const Class & %{ $javaclassname %};

	// Ignore because in Java it is completely defined in the very base class.
  %ignore Class::IsTypeOf;
  // Ignore as unused
	%ignore PrintSelf;

  WRAP_INCLUDE(Class)
  
%enddef

%ignore IVtkTools_SubPolyDataFilter::GetNumberOfGenerationsFromBaseType;
WRAP_CLASS_OCCVTK(IVtkTools_SubPolyDataFilter, vtk.vtkPolyDataAlgorithm)
%ignore IVtkTools_DisplayModeFilter::GetNumberOfGenerationsFromBaseType;
WRAP_CLASS_OCCVTK(IVtkTools_DisplayModeFilter, opencascade.IVtkTools_SubPolyDataFilter)
%ignore IVtkTools_ShapePicker::GetNumberOfGenerationsFromBaseType;
WRAP_CLASS_OCCVTK(IVtkTools_ShapePicker, vtk.vtkAbstractPropPicker)
// Ignore unused method because of returned IVtkOCC_Shape::Handle mapping problem
%ignore IVtkTools_ShapeDataSource::GetNumberOfGenerationsFromBaseType;
%ignore IVtkTools_ShapeDataSource::GetShape;
WRAP_CLASS_OCCVTK(IVtkTools_ShapeDataSource, vtk.vtkPolyDataAlgorithm)

%typemap(javaimports) IVtkTools_Helper %{import vtk.vtkActor;
import vtk.vtkMapper;
import vtk.vtkLookupTable;
/**
  The helper class providing wrapping for some IVtkTools namespace methods
  and for the static method IVtkTools_ShapeObject::SetShapeSource(). 
  This wrapper class is generated by SWIG.
 */%}
%import "IVtkTools_ShapeObject.hxx"
class IVtkTools_Helper
{
public:
  static void InitShapeMapper(vtkMapper* theMapper)
  {
    IVtkTools::InitShapeMapper( theMapper );
  }

  static void SetLookupTableColor(vtkLookupTable* theColorTable,
                                  IVtk_MeshType theColorRole,
                                  double theR, double theG, double theB, double theA)
  {
    IVtkTools::SetLookupTableColor(theColorTable, theColorRole, theR, theG, theB, theA);
  }

  static void SetShapeSource(IVtkTools_ShapeDataSource* theDataSource, vtkActor* theActor)
  {
    IVtkTools_ShapeObject::SetShapeSource(theDataSource, theActor);
  }
};
%{
#include <IVtkTools_ShapeObject.hxx>
class IVtkTools_Helper
{
public:
  static void InitShapeMapper(vtkMapper* theMapper)
  {
    IVtkTools::InitShapeMapper( theMapper );
  }

  static void SetLookupTableColor(vtkLookupTable* theColorTable,
                                  IVtk_MeshType theColorRole,
                                  double theR, double theG, double theB, double theA)
  {
    IVtkTools::SetLookupTableColor(theColorTable, theColorRole, theR, theG, theB, theA);
  }

  static void SetShapeSource(IVtkTools_ShapeDataSource* theDataSource, vtkActor* theActor)
  {
    IVtkTools_ShapeObject::SetShapeSource(theDataSource, theActor);
  }
};
%}
