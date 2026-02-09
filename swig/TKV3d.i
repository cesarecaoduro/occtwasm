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

// Definitions for wrapping Open CASCADE classes from TKV3d toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKV3d.lib")
#endif
%}

// On Linux / GCC "Status" is defined as macro, we need to undefine it
#ifdef Status
#undef Status
#endif

// V3d Exceptions
WRAP_AS_EXCEPTION(Prs3d_InvalidAngle)
WRAP_AS_EXCEPTION(V3d_BadValue)
WRAP_AS_EXCEPTION(V3d_UnMapped)

// Graphic3d enumerations and classes
WRAP_AS_ENUM_INCLUDE(Graphic3d_AlphaMode)
WRAP_INCLUDE(Graphic3d_ArrayFlags)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfLimit)
WRAP_AS_ENUM_INCLUDE(Graphic3d_NameOfTexture2D)
WRAP_AS_ENUM_INCLUDE(Graphic3d_CubeMapSide)
WRAP_AS_ENUM_INCLUDE(Graphic3d_DiagnosticInfo)
WRAP_AS_ENUM_INCLUDE(Graphic3d_DisplayPriority)
WRAP_AS_ENUM_INCLUDE(Graphic3d_BufferType)
WRAP_AS_ENUM_INCLUDE(Graphic3d_GroupAspect)
WRAP_AS_ENUM_INCLUDE(Graphic3d_LevelOfTextureAnisotropy)
WRAP_AS_ENUM_INCLUDE(Graphic3d_NameOfTextureEnv)
WRAP_AS_ENUM_INCLUDE(Graphic3d_NameOfMaterial)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfBackfacingModel)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfMaterial)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfReflection)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfConnection)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfPrimitiveArray)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfShaderObject)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfShadingModel)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfStructure)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfTexture)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfTextureFilter)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfTextureMode)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfVisualization)
WRAP_INCLUDE(Graphic3d_TransModeFlags)
WRAP_AS_ENUM_INCLUDE(Graphic3d_HorizontalTextAlignment)
WRAP_AS_ENUM_INCLUDE(Graphic3d_VerticalTextAlignment)
WRAP_AS_ENUM_INCLUDE(Graphic3d_RenderingMode)
WRAP_AS_ENUM_INCLUDE(Graphic3d_RenderTransparentMethod)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TextPath)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TextureUnit)
WRAP_AS_ENUM_INCLUDE(Graphic3d_ToneMappingMethod)
WRAP_INCLUDE(Graphic3d_ZLayerId) // unnamed enum + typedef to int
WRAP_AS_ENUM_INCLUDE(Graphic3d_StereoMode)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfBackground)
WRAP_AS_ENUM_INCLUDE(Graphic3d_TypeOfLightSource)

WRAP_AS_STRUCT_INCLUDE(Graphic3d_PolygonOffset)
WRAP_AS_STRUCT_INCLUDE(Graphic3d_BufferRange)

%warnfilter(SWIGWARN_LANG_IDENTIFIER,SWIGWARN_LANG_OVERLOAD_IGNORED) NCollection_Vec2;
%warnfilter(SWIGWARN_LANG_IDENTIFIER,SWIGWARN_LANG_OVERLOAD_IGNORED) NCollection_Vec3;
%warnfilter(SWIGWARN_LANG_IDENTIFIER,SWIGWARN_LANG_OVERLOAD_IGNORED) NCollection_Vec4;
%warnfilter(SWIGWARN_LANG_IDENTIFIER,SWIGWARN_LANG_OVERLOAD_IGNORED) NCollection_Mat4;
WRAP_INCLUDE(NCollection_Vec2)
WRAP_INCLUDE(NCollection_Vec3)
WRAP_INCLUDE(NCollection_Vec4)
WRAP_INCLUDE(NCollection_Mat4)
WRAP_INCLUDE(Graphic3d_Vec2)
WRAP_INCLUDE(Graphic3d_Vec3)
WRAP_INCLUDE(Graphic3d_Vec4)
WRAP_INCLUDE(Graphic3d_Mat4)
WRAP_INCLUDE(Graphic3d_Mat4d)

// Graphic3d_Vec2.hxx
%ignore NCollection_Vec2<float>::GetData;
%ignore NCollection_Vec2<float>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec2,  NCollection_Vec2<float>)
%ignore NCollection_Vec2<double>::GetData;
%ignore NCollection_Vec2<double>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec2d, NCollection_Vec2<double>)
%ignore NCollection_Vec2<int>::Modulus;
%ignore NCollection_Vec2<int>::GetData;
%ignore NCollection_Vec2<int>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec2i, NCollection_Vec2<int>)
%ignore NCollection_Vec2<unsigned int>::Modulus;
%ignore NCollection_Vec2<unsigned int>::GetData;
%ignore NCollection_Vec2<unsigned int>::ChangeData;
%ignore NCollection_Vec2<unsigned int>::cwiseAbs;
WRAP_AS_TEMPLATE(Graphic3d_Vec2u, NCollection_Vec2<unsigned int>)
%ignore NCollection_Vec2<unsigned char>::Modulus;
%ignore NCollection_Vec2<unsigned char>::GetData;
%ignore NCollection_Vec2<unsigned char>::ChangeData;
%ignore NCollection_Vec2<unsigned char>::cwiseAbs;
WRAP_AS_TEMPLATE(Graphic3d_Vec2ub, NCollection_Vec2<unsigned char>)
%ignore NCollection_Vec2<char>::Modulus;
%ignore NCollection_Vec2<char>::GetData;
%ignore NCollection_Vec2<char>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec2b, NCollection_Vec2<char>)

// Graphic3d_Vec3.hxx
%ignore NCollection_Vec3<float>::GetData;
%ignore NCollection_Vec3<float>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec3,  NCollection_Vec3<float>)
%ignore NCollection_Vec3<double>::GetData;
%ignore NCollection_Vec3<double>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec3d, NCollection_Vec3<double>)
%ignore NCollection_Vec3<int>::Modulus;
%ignore NCollection_Vec3<int>::Normalize;
%ignore NCollection_Vec3<int>::Normalized;
%ignore NCollection_Vec3<int>::GetData;
%ignore NCollection_Vec3<int>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec3i, NCollection_Vec3<int>)
%ignore NCollection_Vec3<unsigned int>::Modulus;
%ignore NCollection_Vec3<unsigned int>::Normalize;
%ignore NCollection_Vec3<unsigned int>::Normalized;
%ignore NCollection_Vec3<unsigned int>::GetData;
%ignore NCollection_Vec3<unsigned int>::ChangeData;
%ignore NCollection_Vec3<unsigned int>::cwiseAbs;
WRAP_AS_TEMPLATE(Graphic3d_Vec3u, NCollection_Vec3<unsigned int>)
%ignore NCollection_Vec3<unsigned char>::Modulus;
%ignore NCollection_Vec3<unsigned char>::Normalize;
%ignore NCollection_Vec3<unsigned char>::Normalized;
%ignore NCollection_Vec3<unsigned char>::GetData;
%ignore NCollection_Vec3<unsigned char>::ChangeData;
%ignore NCollection_Vec3<unsigned char>::cwiseAbs;
WRAP_AS_TEMPLATE(Graphic3d_Vec3ub, NCollection_Vec3<unsigned char>)
%ignore NCollection_Vec3<char>::Modulus;
%ignore NCollection_Vec3<char>::Normalize;
%ignore NCollection_Vec3<char>::Normalized;
%ignore NCollection_Vec3<char>::GetData;
%ignore NCollection_Vec3<char>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec3b, NCollection_Vec3<char>)

// Graphic3d_Vec4.hxx
%ignore NCollection_Vec4<float>::GetData;
%ignore NCollection_Vec4<float>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec4,  NCollection_Vec4<float>)
%ignore NCollection_Vec4<int>::GetData;
%ignore NCollection_Vec4<int>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec4i, NCollection_Vec4<int>)
%ignore NCollection_Vec4<double>::GetData;
%ignore NCollection_Vec4<double>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec4d, NCollection_Vec4<double>)
%ignore NCollection_Vec4<unsigned int>::GetData;
%ignore NCollection_Vec4<unsigned int>::ChangeData;
%ignore NCollection_Vec4<unsigned int>::cwiseAbs;
WRAP_AS_TEMPLATE(Graphic3d_Vec4u, NCollection_Vec4<unsigned int>)
%ignore NCollection_Vec4<unsigned char>::GetData;
%ignore NCollection_Vec4<unsigned char>::ChangeData;
%ignore NCollection_Vec4<unsigned char>::cwiseAbs;
WRAP_AS_TEMPLATE(Graphic3d_Vec4ub, NCollection_Vec4<unsigned char>)
%ignore NCollection_Vec4<char>::GetData;
%ignore NCollection_Vec4<char>::ChangeData;
WRAP_AS_TEMPLATE(Graphic3d_Vec4b, NCollection_Vec4<char>)

// Graphic3d_Mat4.hxx and Graphic3d_Mat4d.hxx
%ignore NCollection_Mat4<float>::GetData;
%ignore NCollection_Mat4<float>::ChangeData;
%ignore NCollection_Mat4<float>::Map;
WRAP_AS_TEMPLATE(Graphic3d_Mat4,  NCollection_Mat4<float>)
%ignore NCollection_Mat4<double>::GetData;
%ignore NCollection_Mat4<double>::ChangeData;
%ignore NCollection_Mat4<double>::Map;
WRAP_AS_TEMPLATE(Graphic3d_Mat4d, NCollection_Mat4<double>)

WRAP_AS_NCOLLECTION(NCollection_Sequence_Graphic3d_Vec2i, NCollection_Sequence, Graphic3d_Vec2i)
WRAP_AS_NCOLLECTION(NCollection_Array1_Graphic3d_Vec3d, NCollection_Array1, Graphic3d_Vec3d)
WRAP_AS_NCOLLECTION(NCollection_Vector_Graphic3d_Vec4d, NCollection_Vector, Graphic3d_Vec4d)

WRAP_CLASS_COPYABLE(Graphic3d_Fresnel) // defined in Graphic3d_BSDF.hxx
WRAP_AS_STRUCT_INCLUDE(Graphic3d_BSDF)
WRAP_AS_STRUCT_INCLUDE(Graphic3d_MaterialAspect)
%ignore Graphic3d_Camera::Tile; // struct Graphic3d_Tile is not wrapped
%ignore Graphic3d_Camera::SetTile;
WRAP_AS_HANDLE_INCLUDE(Graphic3d_Camera)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_TransformPers)
WRAP_AS_STRUCT_INCLUDE(Graphic3d_PBRMaterial)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_Text)

WRAP_AS_HANDLE_INCLUDE(Graphic3d_DataStructureManager)

%ignore Graphic3d_CView::HiddenObjects; // uses non-wrapped type
%ignore Graphic3d_CView::ChangeHiddenObjects;
%ignore Graphic3d_CView::FBO;
%ignore Graphic3d_CView::SetFBO;
%ignore Graphic3d_CView::FBOCreate;
%ignore Graphic3d_CView::FBORelease;
%ignore Graphic3d_CView::FBOGetDimensions;
%ignore Graphic3d_CView::FBOChangeViewport;
WRAP_AS_HANDLE(Graphic3d_CView)

%ignore Graphic3d_CStructure::ContextLine; // fields
%ignore Graphic3d_CStructure::ContextFillArea;
%ignore Graphic3d_CStructure::ContextMarker;
%ignore Graphic3d_CStructure::ContextText;
%ignore Graphic3d_CStructure::HighlightColor;
%ignore Graphic3d_CStructure::ViewAffinity;
%ignore Graphic3d_CStructure::Transformation;
%ignore Graphic3d_CStructure::BoundingBox; // returns non-wrapped type
%ignore Graphic3d_CStructure::ChangeBoundingBox;
WRAP_AS_HANDLE(Graphic3d_CStructure)

// suppress warning on unknown base type (TEL_POINT), we do not need it to be wrapped
%warnfilter(401) Graphic3d_Vertex;
WRAP_AS_STRUCT_INCLUDE(Graphic3d_Vertex)
%ignore Graphic3d_GraduatedTrihedron::CubicAxesCallback; // callback function
%ignore Graphic3d_GraduatedTrihedron::SetCubicAxesCallback; // callback function
WRAP_AS_STRUCT_INCLUDE(Graphic3d_GraduatedTrihedron)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_CLight)
%ignore Graphic3d_LightSet::Iterator;
WRAP_AS_HANDLE_INCLUDE(Graphic3d_LightSet)
WRAP_AS_STRUCT_INCLUDE(Graphic3d_RenderingParams)
WRAP_AS_STRUCT_INCLUDE(Graphic3d_ZLayerSettings)

%{ #include <Graphic3d_Buffer.hxx> %}
WRAP_CLASS_COPYABLE(Graphic3d_Attribute)
WRAP_AS_NCOLLECTION(Graphic3d_Array1OfAttribute,NCollection_Array1,Graphic3d_Attribute)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_Buffer)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_IndexBuffer)
%ignore Graphic3d_BoundBuffer::Colors; // public pointer field
%ignore Graphic3d_BoundBuffer::Bounds; // public pointer field
WRAP_AS_HANDLE_INCLUDE(Graphic3d_BoundBuffer)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_HatchStyle)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_ViewAffinity)
WRAP_AS_STRUCT_INCLUDE(Graphic3d_WorldViewProjState)

// cyclic dependent
WRAP_AS_HANDLE(Graphic3d_ClipPlane)
%{ #include <Graphic3d_ClipPlane.hxx> %}

%warnfilter(401) Graphic3d_SequenceOfHClipPlane::Iterator;
%ignore Graphic3d_SequenceOfHClipPlane::Iterator;
WRAP_AS_HANDLE(Graphic3d_SequenceOfHClipPlane)

class Graphic3d_SequenceOfHClipPlane_Iterator
{
public:
  Graphic3d_SequenceOfHClipPlane_Iterator (const Graphic3d_SequenceOfHClipPlane&);
  Standard_Boolean More() const;
  void Next();
  const Handle(Graphic3d_ClipPlane)& Value() const;
  Handle(Graphic3d_ClipPlane)& ChangeValue() const;
};
%{
#include <Graphic3d_SequenceOfHClipPlane.hxx>
typedef Graphic3d_SequenceOfHClipPlane::Iterator Graphic3d_SequenceOfHClipPlane_Iterator;
%}
WRAP_CLASS_NOCOPY(Graphic3d_SequenceOfHClipPlane_Iterator)
// define typemaps to map nested iterator class in C++ to global in C#
%typemap(cstype) Graphic3d_SequenceOfHClipPlane::Iterator & %{ Graphic3d_SequenceOfHClipPlane_Iterator %};
%typemap(csin)   Graphic3d_SequenceOfHClipPlane::Iterator & %{ Graphic3d_SequenceOfHClipPlane_Iterator.getCPtr($csinput) %}

%ignore Graphic3d_Structure::CStructure; // low-level method
WRAP_AS_HANDLE(Graphic3d_Structure) // inclusion is deferred
%ignore Graphic3d_GraphicDriver::Redraw; // low-level method
%ignore Graphic3d_GraphicDriver::PrintCPick; // low-level method
%ignore Graphic3d_GraphicDriver::PrintCLight; // low-level method
WRAP_AS_HANDLE(Graphic3d_GraphicDriver)
%ignore Graphic3d_StructureManager::DefinedViews; // returns map of C pointers
WRAP_AS_HANDLE(Graphic3d_StructureManager)
WRAP_INCLUDE(Graphic3d_GraphicDriver)

// For the moment, we do not expose AlienImage and other image-oriented classes
%ignore Graphic3d_TextureRoot::LoadTexture;
%ignore Graphic3d_TextureRoot::Image;
WRAP_AS_HANDLE_INCLUDE(Graphic3d_TextureParams)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_TextureRoot)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_TextureEnv)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_TextureMap)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_Texture2D)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_CubeMap)
%warnfilter(401) Graphic3d_TextureSet::Iterator;
%ignore Graphic3d_TextureSet::Iterator;
WRAP_AS_HANDLE_INCLUDE(Graphic3d_TextureSet)

WRAP_AS_NCOLLECTION(ShaderVariableList,NCollection_Sequence,Graphic3d_ShaderObject::ShaderVariable)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_ShaderAttribute)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_ShaderVariable)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_ShaderObject)
WRAP_AS_NCOLLECTION(Graphic3d_ShaderAttributeList,NCollection_Sequence,Handle(Graphic3d_ShaderAttribute))
WRAP_AS_NCOLLECTION(Graphic3d_ShaderObjectList,NCollection_Sequence,Handle(Graphic3d_ShaderObject))
WRAP_AS_NCOLLECTION(Graphic3d_ShaderVariableList,NCollection_Sequence,Handle(Graphic3d_ShaderVariable))
WRAP_AS_HANDLE_INCLUDE(Graphic3d_ShaderProgram)

WRAP_AS_HANDLE_INCLUDE(Graphic3d_MarkerImage)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_Aspects)
WRAP_AS_DATAMAP_INCLUDE(Graphic3d_MapOfAspectsToAspects,NCollection_DataMap,Handle(Graphic3d_Aspects),Handle(Graphic3d_Aspects),NCollection_DefaultHasher<Handle(Graphic3d_Aspects)>)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_AspectFillArea3d)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_AspectLine3d)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_AspectMarker3d)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_AspectText3d)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_PresentationAttributes)
%ignore Graphic3d_ArrayOfPrimitives::Indices;   // we do not wrap low-level buffer types
%ignore Graphic3d_ArrayOfPrimitives::Attributes;
%ignore Graphic3d_ArrayOfPrimitives::Bounds;
WRAP_AS_HANDLE_INCLUDE(Graphic3d_ArrayOfPrimitives)
WRAP_AS_HANDLE_INCLUDE(Graphic3d_ArrayOfPolylines)
WRAP_INCLUDE(Graphic3d_ArrayOfTriangles) // Wrapped as handle before
WRAP_AS_HANDLE_INCLUDE(Graphic3d_ArrayOfSegments)
WRAP_INCLUDE(Graphic3d_ClipPlane)
%ignore Graphic3d_Group::BoundingBox; // Graphic3d_BndBox3f is not wrapped
%ignore Graphic3d_Group::ChangeBoundingBox; // Graphic3d_BndBox3f is not wrapped
%ignore Graphic3d_Group::AddPrimitiveArray(const Graphic3d_TypeOfPrimitiveArray,const Graphic3d_IndexBuffer_Handle&,const Graphic3d_Buffer_Handle&,const Graphic3d_BoundBuffer_Handle&,const Standard_Boolean); // no buffers
WRAP_AS_HANDLE_INCLUDE(Graphic3d_Group)
WRAP_AS_NCOLLECTION_INCLUDE(Graphic3d_SequenceOfGroup,NCollection_Sequence,Handle(Graphic3d_Group))
WRAP_AS_HANDLE_INCLUDE(Graphic3d_Layer)
WRAP_AS_NCOLLECTION(NCollection_List_Graphic3d_Layer,NCollection_List,Handle(Graphic3d_Layer))
%apply bool* INOUT { Standard_Boolean* theIsInside };
WRAP_AS_STRUCT_INCLUDE(Graphic3d_CullingTool)

// these are last, as they form cycle with others
WRAP_INCLUDE(Graphic3d_CView)
WRAP_AS_NCOLLECTION(NCollection_Sequence_Graphic3d_CView, NCollection_Sequence, Handle(Graphic3d_CView))
WRAP_INCLUDE(Graphic3d_CStructure)
WRAP_AS_MAP(Graphic3d_IndexedMapOfStructure, NCollection_IndexedMap, const Graphic3d_CStructure*, NCollection_DefaultHasher<const Graphic3d_CStructure*>)
WRAP_AS_TEMPLATE(Graphic3d_ArrayOfIndexedMapOfStructure,std::array<Graphic3d_IndexedMapOfStructure, Graphic3d_DisplayPriority_NB>);
WRAP_INCLUDE(Graphic3d_Structure)
WRAP_AS_MAP(Graphic3d_Map_Graphic3d_Structure,NCollection_Map,Graphic3d_Structure*,NCollection_DefaultHasher<Graphic3d_Structure*>)
WRAP_AS_MAP_INCLUDE(Graphic3d_MapOfStructure,NCollection_Map,Handle(Graphic3d_Structure),NCollection_DefaultHasher<Handle(Graphic3d_Structure)>)
WRAP_INCLUDE(Graphic3d_StructureManager)
// work-around for definition of Graphic3d_SequenceOfHClipPlane as class (#28383)
typedef NCollection_Sequence<Handle(Graphic3d_ClipPlane)> Graphic3d_TSequenceOfHClipPlane;
WRAP_INCLUDE(Graphic3d_SequenceOfHClipPlane)

// V3d enumerations
WRAP_AS_ENUM_INCLUDE(V3d_StereoDumpOptions)
WRAP_AS_ENUM_INCLUDE(V3d_TypeOfOrientation)
WRAP_AS_ENUM_INCLUDE(V3d_TypeOfVisualization)
WRAP_AS_ENUM_INCLUDE(V3d_TypeOfShadingModel)
WRAP_AS_ENUM_INCLUDE(V3d_TypeOfAxe)
WRAP_AS_ENUM_INCLUDE(V3d_TypeOfBackfacingModel)
WRAP_AS_ENUM_INCLUDE(V3d_TypeOfLight)
WRAP_AS_ENUM_INCLUDE(V3d_TypeOfView)

// V3d classes are cyclically dependent...
%ignore V3d_View::ToPixMap (Image_PixMap&, const V3d_ImageDumpOptions&); // struct V3d_ImageDumpOptions is not wrapped
%ignore V3d_View::SetClipPlanes (const Graphic3d_SequenceOfHClipPlane&); // non-handle duplicate, deprecated
%ignore V3d_View::ActiveLightIterator; // V3d_ListOfLightIterator is not wrapped

%ignore V3d_Viewer::ActiveLightIterator;  // V3d_ListOfLightIterator is not wrapped
%ignore V3d_Viewer::DefinedLightIterator; // V3d_ListOfLightIterator is not wrapped
%ignore V3d_Viewer::ActiveViewIterator;   // V3d_ListOfViewIterator is not wrapped
%ignore V3d_Viewer::DefinedViewIterator;  // V3d_ListOfViewIterator is not wrapped
%ignore V3d_Viewer::V3d_Viewer (const Handle(Graphic3d_GraphicDriver)& theDriver,
                                const Standard_ExtString theName,
                                const Standard_CString theDomain = "",
                                const Standard_Real theViewSize = 1000.0,
                                const V3d_TypeOfOrientation theViewProj = V3d_XposYnegZpos,
                                const Quantity_Color& theViewBackground = Quantity_NOC_GRAY30,
                                const V3d_TypeOfVisualization theVisualization = V3d_ZBUFFER,
                                const V3d_TypeOfShadingModel theShadingModel = V3d_GOURAUD,
                                const Standard_Boolean theComputedMode = Standard_True,
                                const Standard_Boolean theDefaultComputedMode = Standard_True);
WRAP_AS_HANDLE(V3d_Viewer)
%ignore V3d_Trihedron::Display(const V3d_View& theView);
WRAP_AS_HANDLE(V3d_Trihedron)
WRAP_AS_HANDLE(V3d_View)
WRAP_AS_HANDLE(V3d_Plane)
WRAP_INCLUDE(V3d_Viewer)
WRAP_INCLUDE(V3d_View)
WRAP_AS_NCOLLECTION(NCollection_Sequence_V3d_View,NCollection_Sequence,Handle(V3d_View))
WRAP_INCLUDE(V3d_Light)
WRAP_INCLUDE(V3d_Plane)
WRAP_AS_HANDLE_INCLUDE(V3d_AmbientLight)
WRAP_AS_HANDLE_INCLUDE(V3d_PositionLight)
WRAP_AS_HANDLE_INCLUDE(V3d_PositionalLight)
WRAP_AS_HANDLE_INCLUDE(V3d_DirectionalLight)
WRAP_AS_HANDLE_INCLUDE(V3d_SpotLight)

// V3d collections
WRAP_AS_NCOLLECTION_INCLUDE(V3d_ListOfLight, NCollection_List, Handle(Graphic3d_CLight))
WRAP_AS_NCOLLECTION_INCLUDE(V3d_ListOfView, NCollection_List, Handle(V3d_View))

// Prs3d enumerations
WRAP_AS_ENUM_INCLUDE(Prs3d_DatumAttribute)
WRAP_AS_ENUM_INCLUDE(Prs3d_DatumAxes)
WRAP_AS_ENUM_INCLUDE(Prs3d_DatumMode)
WRAP_AS_ENUM_INCLUDE(Prs3d_DatumParts)
WRAP_AS_ENUM_INCLUDE(Prs3d_TypeOfHighlight)
WRAP_AS_ENUM_INCLUDE(Prs3d_TypeOfHLR)
WRAP_AS_ENUM_INCLUDE(Prs3d_VertexDrawMode)

// Prs3d classes
WRAP_AS_HANDLE_INCLUDE(Prs3d_BasicAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_LineAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_IsoAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_ShadingAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_ArrowAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_TextAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_DimensionAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_PlaneAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_PointAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_DatumAspect)
WRAP_AS_HANDLE_INCLUDE(Prs3d_Drawer)

WRAP_AS_CLASS_INCLUDE(Prs3d_Root)
WRAP_AS_CLASS_INCLUDE(Prs3d_Arrow)
WRAP_AS_CLASS_INCLUDE(Prs3d_Text)

WRAP_AS_ENUM_INCLUDE(Prs3d_DimensionTextVerticalPosition)
WRAP_AS_ENUM_INCLUDE(Prs3d_DimensionTextHorizontalPosition)
WRAP_AS_ENUM_INCLUDE(Prs3d_DimensionArrowOrientation)

%ignore Prs3d::PrimitivesFromPolylines; // uses non-wrapped type
%ignore Prs3d::AddPrimitivesGroup; // uses non-wrapped type
WRAP_AS_PACKAGE(Prs3d)

// Defined later because it depends on Prs3d_TextAspect and Prs3d_ShadingAspect
WRAP_INCLUDE(V3d_Trihedron)

// PrsMgr enum
WRAP_AS_ENUM_INCLUDE(PrsMgr_DisplayStatus)
WRAP_AS_ENUM_INCLUDE(PrsMgr_TypeOfPresentation3d)

// PrsMgr classes
WRAP_AS_HANDLE(PrsMgr_PresentationManager)
WRAP_AS_HANDLE_INCLUDE(PrsMgr_Presentation)
WRAP_AS_NCOLLECTION_INCLUDE(PrsMgr_Presentations,NCollection_Sequence,Handle(PrsMgr_Presentation))
%ignore PrsMgr_PresentableObject::Parent; // returns pointer
%ignore PrsMgr_PresentableObject::SetClipPlanes (const Graphic3d_SequenceOfHClipPlane&); // non-handle duplicate, deprecated
WRAP_AS_HANDLE(PrsMgr_PresentableObject)
WRAP_AS_NCOLLECTION(PrsMgr_ListOfPresentableObjects,NCollection_List,Handle(PrsMgr_PresentableObject))
WRAP_INCLUDE(PrsMgr_PresentableObject)
WRAP_INCLUDE(PrsMgr_ListOfPresentableObjects)
WRAP_INCLUDE(PrsMgr_PresentationManager)

// SelectMgr enums
WRAP_AS_ENUM_INCLUDE(Select3D_TypeOfSensitivity)
WRAP_AS_ENUM_INCLUDE(SelectMgr_SelectionType)
WRAP_AS_ENUM_INCLUDE(SelectMgr_TypeOfDepthTolerance)
WRAP_AS_ENUM_INCLUDE(SelectMgr_FilterType)
WRAP_AS_ENUM_INCLUDE(SelectMgr_PickingStrategy)
WRAP_AS_ENUM_INCLUDE(SelectMgr_StateOfSelection)
WRAP_AS_ENUM_INCLUDE(SelectMgr_TypeOfBVHUpdate)
WRAP_AS_ENUM_INCLUDE(SelectMgr_TypeOfUpdate)

WRAP_INCLUDE(SelectMgr_VectorTypes)
WRAP_AS_STRUCT_INCLUDE(SelectBasics_PickResult)
WRAP_AS_STRUCT_INCLUDE(SelectMgr_ViewClipRange)

%ignore SelectBasics_SelectingVolumeManager::Overlaps; // uses bool* as argument
%ignore SelectBasics_SelectingVolumeManager::Point;
%ignore SelectBasics_SelectingVolumeManager::Box;
%ignore SelectBasics_SelectingVolumeManager::Polyline;
%ignore SelectBasics_SelectingVolumeManager::Unknown;
%apply bool* INOUT { Standard_Boolean* theInside };
WRAP_AS_CLASS_INCLUDE(SelectBasics_SelectingVolumeManager)

WRAP_AS_HANDLE(SelectMgr_SelectableObject)
WRAP_AS_STRUCT_INCLUDE(SelectMgr_SelectableObjectSet)
WRAP_AS_HANDLE_INCLUDE(SelectMgr_EntityOwner)

%ignore Select3D_SensitiveEntity::BoundingBox; // returns non-wrapped type
WRAP_AS_HANDLE_INCLUDE(Select3D_SensitiveEntity)
// suppress warning on unknown base type, we do not wrap it now
%warnfilter(401);
%warnfilter(315) Select3D_SensitiveSet;
%include Select3D_BndBox3d.hxx
%ignore Select3D_SensitiveSet::SetDefaultBVHBuilder;
%ignore Select3D_SensitiveSet::DefaultBVHBuilder;
%ignore Select3D_SensitiveSet::SetBuilder;
WRAP_AS_HANDLE_INCLUDE(Select3D_SensitiveSet)
%warnfilter(+401);
WRAP_AS_HANDLE_INCLUDE(Select3D_SensitivePrimitiveArray)

// StdSelect enumerations
WRAP_AS_ENUM_INCLUDE(StdSelect_TypeOfSelectionImage)
WRAP_INCLUDE(StdSelect_ViewerSelector3d)

// SelectMgr classes
%ignore SelectMgr_ToleranceMap::SelectMgr_ToleranceMap; //do not wrap constructor of internal class
//do not wrap non-exportable methods:
%ignore SelectMgr_SensitiveEntity::SelectMgr_SensitiveEntity(const Handle(Select3D_SensitiveEntity)&);
%ignore SelectMgr_SensitiveEntity::~SelectMgr_SensitiveEntity;
%ignore SelectMgr_SensitiveEntity::Clear;
%ignore SelectMgr_SensitiveEntity::IsActiveForSelection;
WRAP_AS_HANDLE_INCLUDE(SelectMgr_SensitiveEntity)
WRAP_AS_NCOLLECTION(NCollection_Vector_SelectMgr_SensitiveEntity,NCollection_Vector,Handle(SelectMgr_SensitiveEntity))
WRAP_AS_HANDLE(SelectMgr_Selection)
WRAP_AS_NCOLLECTION_INCLUDE(SelectMgr_SequenceOfSelection,NCollection_Sequence,Handle(SelectMgr_Selection))
//WRAP_AS_MAP_INCLUDE(SelectMgr_IndexedMapOfOwner) // NCollection_Shared
%ignore SelectMgr_SelectableObject::BndBoxOfSelected; // uses non-wrapped type
%ignore SelectMgr_SelectableObject::ComputeSelection;
WRAP_INCLUDE(SelectMgr_SelectableObject)
WRAP_AS_HANDLE_INCLUDE(SelectMgr_Filter)

WRAP_AS_HANDLE_INCLUDE(SelectMgr_FrustumBuilder)
WRAP_AS_HANDLE_INCLUDE(SelectMgr_BaseIntersector)
%warnfilter(SWIGWARN_TYPE_ABSTRACT) SelectMgr_BaseFrustum; // disable 403 warning
WRAP_AS_HANDLE_INCLUDE(SelectMgr_BaseFrustum)

WRAP_AS_NCOLLECTION_INCLUDE(SelectMgr_ListOfFilter,NCollection_List,Handle(SelectMgr_Filter))
WRAP_AS_NCOLLECTION_INCLUDE(SelectMgr_SequenceOfOwner,NCollection_Sequence,Handle(SelectMgr_EntityOwner))
WRAP_AS_CLASS_INCLUDE(SelectMgr_SelectingVolumeManager)
%ignore SelectMgr_ViewerSelector::EntitySetBuilder; // Select3D_BVHBuilder3D not wrapped
%ignore SelectMgr_ViewerSelector::SetEntitySetBuilder;
%ignore SelectMgr_ViewerSelector::PickedData; // struct SelectMgr_SortCriterion is not yet wrapped
WRAP_AS_HANDLE(SelectMgr_ViewerSelector)
WRAP_AS_HANDLE_INCLUDE(SelectMgr_SelectionManager)
WRAP_INCLUDE(SelectMgr_ViewerSelector)
WRAP_INCLUDE(SelectMgr_Selection)

%warnfilter(SWIGWARN_TYPE_ABSTRACT) SelectMgr_CompositionFilter;
WRAP_AS_HANDLE_INCLUDE(SelectMgr_CompositionFilter)
%ignore SelectMgr_OrFilter::SetDisabledObjects; // Graphic3d_NMapOfTransient not wrapped
WRAP_AS_HANDLE_INCLUDE(SelectMgr_OrFilter)
WRAP_AS_HANDLE_INCLUDE(SelectMgr_AndFilter)
WRAP_AS_HANDLE_INCLUDE(SelectMgr_AndOrFilter)

WRAP_AS_PACKAGE(StdPrs_ToolTriangulatedShape)

// AIS enumerations
WRAP_AS_ENUM_INCLUDE(AIS_DisplayMode)
WRAP_AS_ENUM_INCLUDE(AIS_DisplayStatus)
WRAP_AS_ENUM_INCLUDE(AIS_KindOfInteractive)
WRAP_AS_ENUM_WNULL_INCLUDE(AIS_SelectionScheme,AIS_SelectionScheme_UNKNOWN)
WRAP_AS_ENUM_INCLUDE(AIS_StatusOfDetection)
WRAP_AS_ENUM_INCLUDE(AIS_StatusOfPick)
WRAP_AS_ENUM_INCLUDE(AIS_TypeOfIso)
WRAP_AS_ENUM_INCLUDE(AIS_TypeOfAxis)
WRAP_AS_ENUM_INCLUDE(AIS_TypeOfPlane)
WRAP_AS_ENUM_INCLUDE(AIS_ManipulatorMode)
WRAP_AS_ENUM_INCLUDE(AIS_DragAction)
WRAP_AS_ENUM_WNULL_INCLUDE(AIS_MouseGesture, AIS_MouseGesture_NONE)
WRAP_AS_ENUM_INCLUDE(AIS_NavigationMode)
WRAP_AS_ENUM_INCLUDE(AIS_RotationMode)
WRAP_AS_ENUM_INCLUDE(AIS_SelectStatus)
WRAP_AS_ENUM_INCLUDE(AIS_SelectionModesConcurrency)
WRAP_AS_ENUM_INCLUDE(PrsDim_DisplaySpecialSymbol)
WRAP_AS_ENUM_INCLUDE(PrsDim_KindOfDimension)
WRAP_AS_ENUM_INCLUDE(PrsDim_TypeOfAngle)
WRAP_AS_ENUM_INCLUDE(PrsDim_TypeOfAngleArrowVisibility)

// AIS classes
WRAP_AS_NCOLLECTION_INCLUDE(AIS_NListOfEntityOwner,NCollection_List,Handle(SelectMgr_EntityOwner))
WRAP_AS_NCOLLECTION_INCLUDE(AIS_NArray1OfEntityOwner,NCollection_Array1,Handle(SelectMgr_EntityOwner))
WRAP_AS_HANDLE_INCLUDE(AIS_Selection)
WRAP_AS_HANDLE_INCLUDE(AIS_GlobalStatus)

// InteractiveObject and InteractiveContext are cyclically dependent
WRAP_AS_HANDLE(AIS_InteractiveObject)
%ignore AIS_InteractiveContext::EntityOwners; // uses non-wrapped type
%ignore AIS_InteractiveContext::ObjectIterator; // uses non-wrapped type TODO: find a way to wrap the iterator reference correctly
WRAP_AS_HANDLE(AIS_InteractiveContext)
WRAP_INCLUDE(AIS_InteractiveObject)
WRAP_AS_DATAMAP(AIS_DataMapOfIOStatus,NCollection_DataMap,Handle(AIS_InteractiveObject),Handle(AIS_GlobalStatus),NCollection_DefaultHasher<Handle(AIS_InteractiveObject)>)
WRAP_INCLUDE(AIS_InteractiveContext)
WRAP_INCLUDE(AIS_DataMapOfIOStatus)

WRAP_AS_NCOLLECTION_INCLUDE(AIS_ListOfInteractive,NCollection_List,Handle(AIS_InteractiveObject))

%warnfilter(SWIGWARN_TYPE_ABSTRACT) PrsDim_Dimension; // disable SWIG warning on abstract class
WRAP_AS_HANDLE_INCLUDE(PrsDim_Dimension)
%rename(GetTypeOfAngle) PrsDim_AngleDimension::GetType; // overrides C# standard method
WRAP_AS_HANDLE_INCLUDE(PrsDim_AngleDimension)
WRAP_AS_HANDLE_INCLUDE(PrsDim_DiameterDimension)
WRAP_AS_HANDLE_INCLUDE(PrsDim_LengthDimension)
WRAP_AS_HANDLE_INCLUDE(PrsDim_RadiusDimension)
WRAP_AS_HANDLE_INCLUDE(AIS_ColorScale)
WRAP_AS_HANDLE_INCLUDE(AIS_Point)
WRAP_AS_HANDLE_INCLUDE(AIS_Line)
WRAP_AS_HANDLE_INCLUDE(AIS_PlaneTrihedron)
WRAP_AS_HANDLE_INCLUDE(AIS_Triangulation)
WRAP_AS_HANDLE_INCLUDE(AIS_Axis)
WRAP_AS_HANDLE_INCLUDE(AIS_Plane)
WRAP_AS_HANDLE_INCLUDE(AIS_ManipulatorOwner)
#if !defined(SWIGJAVA) // building errors in Java
WRAP_AS_NCOLLECTION(NCollection_Sequence_AIS_InteractiveObject,NCollection_Sequence,Handle(AIS_InteractiveObject))
WRAP_AS_HANDLE_INCLUDE(AIS_Manipulator) // TODO: fix for AIS_ManipulatorObjectSequence
#endif
WRAP_AS_HANDLE_INCLUDE(AIS_RubberBand)
WRAP_AS_HANDLE_INCLUDE(AIS_Shape)
WRAP_AS_HANDLE_INCLUDE(AIS_ColoredDrawer)
WRAP_AS_DATAMAP_INCLUDE(AIS_DataMapOfShapeDrawer,NCollection_DataMap,TopoDS_Shape,Handle(AIS_ColoredDrawer),TopTools_ShapeMapHasher)
WRAP_AS_HANDLE_INCLUDE(AIS_ColoredShape)
WRAP_AS_HANDLE_INCLUDE(AIS_TextLabel)
WRAP_AS_HANDLE_INCLUDE(AIS_Trihedron)
WRAP_AS_HANDLE_INCLUDE(AIS_TexturedShape)
WRAP_AS_HANDLE_INCLUDE(Media_Timer)
WRAP_AS_HANDLE(AIS_Animation)
%{ 
#include <AIS_Animation.hxx>
%}
WRAP_AS_NCOLLECTION(AIS_SequenceOfAnimation,NCollection_Sequence,Handle(AIS_Animation))
WRAP_INCLUDE(AIS_Animation)
WRAP_AS_HANDLE_INCLUDE(AIS_AnimationCamera)
WRAP_AS_HANDLE_INCLUDE(AIS_BaseAnimationObject)
WRAP_AS_HANDLE_INCLUDE(AIS_AnimationObject)

%{ #include <AIS_ViewCube.hxx> %}
WRAP_AS_HANDLE(AIS_ViewCube)
WRAP_AS_HANDLE(AIS_ViewCubeOwner)
WRAP_AS_HANDLE(AIS_ViewCubeSensitive)
WRAP_INCLUDE(AIS_ViewCube)

#if !defined(SWIGJAVA) // building errors in Java
WRAP_AS_DATAMAP(AIS_MouseGestureMap,NCollection_DataMap,unsigned int,AIS_MouseGesture,NCollection_DefaultHasher<unsigned int>)
WRAP_AS_DATAMAP(AIS_MouseSelectionSchemeMap,NCollection_DataMap,unsigned int,AIS_SelectionScheme,NCollection_DefaultHasher<unsigned int>)
%{ #include <AIS_ViewInputBuffer.hxx> %}
WRAP_INCLUDE(AIS_ViewInputBuffer)
WRAP_AS_ENUM(AIS_ViewSelectionTool)
WRAP_AS_ENUM(AIS_ViewInputBufferType)
WRAP_CLASS_NOCOPY(AIS_ViewInputBuffer)
WRAP_AS_STRUCT_INCLUDE(AIS_WalkDelta)
%ignore AIS_ViewController::InputBuffer; // generates invalid C# code - to be fixed
%ignore AIS_ViewController::ChangeInputBuffer;
%feature("director") AIS_ViewController;
%feature("nodirector") AIS_ViewController::PickPoint;
%feature("nodirector") AIS_ViewController::PickAxis;
WRAP_AS_CLASS_INCLUDE(AIS_ViewController)
#endif

%ignore AIS_ConnectedInteractive::Compute;
WRAP_AS_HANDLE_INCLUDE(AIS_ConnectedInteractive)

// Introduce dedicated class AIS_CustomInteractiveObject, equivalent to AIS_InteractiveObject,
// but with director capabilities allowing overriding of methods ::Compute() and ::ComputeSelection().
%feature("director")   AIS_CustomInteractiveObject;
%feature("nodirector") AIS_CustomInteractiveObject::SetTransformPersistence;
%feature("nodirector") AIS_CustomInteractiveObject::setLocalTransformation;
%feature("nodirector") AIS_CustomInteractiveObject::SetLocalTransformation;
%feature("nodirector") AIS_CustomInteractiveObject::ResetTransformation;
%feature("nodirector") AIS_CustomInteractiveObject::UpdateTransformation;
%feature("nodirector") AIS_CustomInteractiveObject::SetZLayer;
%feature("nodirector") AIS_CustomInteractiveObject::AddClipPlane;
%feature("nodirector") AIS_CustomInteractiveObject::RemoveClipPlane;
%feature("nodirector") AIS_CustomInteractiveObject::SetClipPlanes;
%feature("nodirector") AIS_CustomInteractiveObject::SetMutable;
%feature("nodirector") AIS_CustomInteractiveObject::AddChild;
%feature("nodirector") AIS_CustomInteractiveObject::RemoveChild;
%feature("nodirector") AIS_CustomInteractiveObject::computeHLR;
%feature("nodirector") AIS_CustomInteractiveObject::Compute;
// use double renaming trick to define ::Compute() method on C# level
%rename("computePrivate") AIS_CustomInteractiveObject::Compute(opencascade::handle< PrsMgr_PresentationManager > const &, opencascade::handle< Prs3d_Presentation > const &, Standard_Integer const );
%rename("Compute") AIS_CustomInteractiveObject::compute(opencascade::handle< PrsMgr_PresentationManager > const &, opencascade::handle< Prs3d_Presentation > const &, Standard_Integer const );
%feature("nodirector") AIS_CustomInteractiveObject::Fill;
%feature("nodirector") AIS_CustomInteractiveObject::SetCombinedParentTransform;
%feature("nodirector") AIS_CustomInteractiveObject::UpdateClipping;
%feature("nodirector") AIS_CustomInteractiveObject::ComputeSelection;
// use double renaming trick to define ::ComputeSelection() method on C# level
%rename("computeSelectionPrivate") AIS_CustomInteractiveObject::ComputeSelection;
%rename("ComputeSelection") AIS_CustomInteractiveObject::computeSelection;
%feature("nodirector") AIS_CustomInteractiveObject::UpdateTransformations;
%feature("nodirector") AIS_CustomInteractiveObject::HilightSelected;
%feature("nodirector") AIS_CustomInteractiveObject::ClearSelected;
%feature("nodirector") AIS_CustomInteractiveObject::HilightOwnerWithColor;
%feature("nodirector") AIS_CustomInteractiveObject::IsAutoHilight;
%feature("nodirector") AIS_CustomInteractiveObject::SetAutoHilight;
%feature("nodirector") AIS_CustomInteractiveObject::BoundingBox;
%feature("nodirector") AIS_CustomInteractiveObject::SetAttributes;
%feature("nodirector") AIS_CustomInteractiveObject::UnsetAttributes;
%feature("nodirector") AIS_CustomInteractiveObject::SetHilightAttributes;
%feature("nodirector") AIS_CustomInteractiveObject::UnsetHilightAttributes;
%feature("nodirector") AIS_CustomInteractiveObject::SetDynamicHilightAttributes;
%feature("nodirector") AIS_CustomInteractiveObject::GlobalSelOwner;
%feature("nodirector") AIS_CustomInteractiveObject::Type;
%feature("nodirector") AIS_CustomInteractiveObject::Signature;
%feature("nodirector") AIS_CustomInteractiveObject::AcceptShapeDecomposition;
%feature("nodirector") AIS_CustomInteractiveObject::SetColor;
%feature("nodirector") AIS_CustomInteractiveObject::UnsetColor;
%feature("nodirector") AIS_CustomInteractiveObject::SetWidth;
%feature("nodirector") AIS_CustomInteractiveObject::UnsetWidth;
%feature("nodirector") AIS_CustomInteractiveObject::AcceptDisplayMode;
%feature("nodirector") AIS_CustomInteractiveObject::DefaultDisplayMode;
%feature("nodirector") AIS_CustomInteractiveObject::SetContext;
%feature("nodirector") AIS_CustomInteractiveObject::Color;
%feature("nodirector") AIS_CustomInteractiveObject::Material;
%feature("nodirector") AIS_CustomInteractiveObject::SetMaterial;
%feature("nodirector") AIS_CustomInteractiveObject::UnsetMaterial;
%feature("nodirector") AIS_CustomInteractiveObject::SetTransparency;
%feature("nodirector") AIS_CustomInteractiveObject::Transparency;
%feature("nodirector") AIS_CustomInteractiveObject::UnsetTransparency;
%feature("nodirector") AIS_CustomInteractiveObject::SetPolygonOffsets;
%feature("nodirector") AIS_CustomInteractiveObject::HasPolygonOffsets;
%feature("nodirector") AIS_CustomInteractiveObject::PolygonOffsets;
%feature("nodirector") AIS_CustomInteractiveObject::updateSelection;
%feature("nodirector") AIS_CustomInteractiveObject::GetAssemblyOwner;
%{
class AIS_CustomInteractiveObject : public AIS_InteractiveObject {
public:
  AIS_CustomInteractiveObject() {}
  virtual ~AIS_CustomInteractiveObject() {}
  virtual void compute(const Handle(PrsMgr_PresentationManager)&, const Handle(Prs3d_Presentation)&, const Standard_Integer) {}
  virtual void computeSelection (const Handle(SelectMgr_Selection)&, const Standard_Integer) {}
protected:
  virtual void Compute (const Handle(PrsMgr_PresentationManager)& thePrsMgr, const Handle(Prs3d_Presentation)& thePrs, const Standard_Integer theMode) { compute (thePrsMgr, thePrs, theMode); }
  virtual void ComputeSelection (const Handle(SelectMgr_Selection)& theSelection, const Standard_Integer theMode) { computeSelection (theSelection, theMode); }
  DEFINE_STANDARD_RTTI_INLINE(AIS_CustomInteractiveObject,AIS_InteractiveObject)
};
DEFINE_STANDARD_HANDLE(AIS_CustomInteractiveObject,AIS_InteractiveObject)
%}
WRAP_AS_HANDLE(AIS_CustomInteractiveObject)
class AIS_CustomInteractiveObject : public AIS_InteractiveObject {
public:
  AIS_CustomInteractiveObject() {}
  virtual ~AIS_CustomInteractiveObject() {}
  virtual void compute (const Handle(PrsMgr_PresentationManager)& thePrsMgr, const Handle(Prs3d_Presentation)& thePrs, const Standard_Integer theMode) {}
  virtual void computeSelection (const Handle(SelectMgr_Selection)& theSelection, const Standard_Integer theMode) {}
protected:
  virtual void Compute (const Handle(PrsMgr_PresentationManager)& thePrsMgr, const Handle(Prs3d_Presentation)& thePrs, const Standard_Integer theMode) { compute (thePrsMgr, thePrs, theMode); }
  virtual void ComputeSelection (const Handle(SelectMgr_Selection)& theSelection, const Standard_Integer theMode) { computeSelection (theSelection, theMode); }
  DEFINE_STANDARD_RTTI_INLINE(AIS_CustomInteractiveObject,AIS_InteractiveObject)
};
