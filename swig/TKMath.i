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

// Definitions for wrapping Open CASCADE classes from TKMath toolkit to CSharp using SWIG.
// This file is to be %included into SWIG interface definition files that wrap OCC classes
// after %include occtypes.i

// Define list of necessary libraries to link with
%{
#ifdef _MSC_VER
#pragma comment(lib, "TKMath.lib")
#endif
%}

// Math Exceptions
WRAP_AS_EXCEPTION(Expr_ExprFailure)
WRAP_AS_EXCEPTION(Expr_InvalidAssignment)
WRAP_AS_EXCEPTION(Expr_InvalidFunction)
WRAP_AS_EXCEPTION(Expr_InvalidOperand)
WRAP_AS_EXCEPTION(Expr_NotAssigned)
WRAP_AS_EXCEPTION(Expr_NotEvaluable)
WRAP_AS_EXCEPTION(ExprIntrp_SyntaxError)
WRAP_AS_EXCEPTION(gp_VectorWithNullMagnitude)
WRAP_AS_EXCEPTION(math_NotSquare)
WRAP_AS_EXCEPTION(math_SingularMatrix)

// Precision package
WRAP_AS_PACKAGE(Precision)

// math classes
%ignore math_VectorBase(const TheItemType* theTab, const Standard_Integer theLower, const Standard_Integer theUpper);
WRAP_INCLUDE(math_VectorBase) // TODO: wrap operator[] with equivalent method for C#
%warnfilter(SWIGWARN_LANG_OVERLOAD_IGNORED) math_Vector;
WRAP_AS_TEMPLATE_INCLUDE(math_Vector, math_VectorBase<double>)
%ignore math_Matrix(const Standard_Address Tab, const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol);
WRAP_AS_CLASS_INCLUDE(math_Matrix)
WRAP_AS_CLASS_INCLUDE(math_Function)
WRAP_AS_CLASS_INCLUDE(math_MultipleVarFunction)

// gp enumerations
WRAP_AS_ENUM_INCLUDE(gp_TrsfForm)
WRAP_AS_ENUM_INCLUDE(gp_EulerSequence)

// Add x, y, z properties and ToString() formatter.
%define WRAP_VECTOR_PROPERTIES(Type,Is2d...)
  WRAP_PROPERTY(Type, double, x, X, SetX);
  WRAP_PROPERTY(Type, double, y, Y, SetY);
  #if (#Is2d == "2d")
  %typemap(cscode) Type %{
    public override string ToString() { return X() + " " + Y(); }
  %}
  #else
  WRAP_PROPERTY(Type, double, z, Z, SetZ);
  %typemap(cscode) Type %{
    public override string ToString() { return X() + " " + Y() + " " + Z(); }
  %}
  #endif
%enddef

// gp classes
%ignore gp_XYZ::GetData; // returns double*
%ignore gp_XYZ::ChangeData;
WRAP_VECTOR_PROPERTIES(gp_XYZ)
WRAP_VECTOR_OPS(gp_XYZ,gp_XYZ)
WRAP_AS_STRUCT_INCLUDE(gp_XYZ)
WRAP_AS_STRUCT_INCLUDE(gp_Mat)
WRAP_AS_STRUCT_INCLUDE(gp_Trsf)
WRAP_AS_STRUCT_INCLUDE(gp_GTrsf)
WRAP_VECTOR_PROPERTIES(gp_Pnt)
WRAP_PROPERTY2(gp_Pnt, gp_XYZ, xyz, XYZ, SetXYZ);
WRAP_AS_STRUCT_INCLUDE(gp_Pnt)
WRAP_VECTOR_PROPERTIES(gp_Vec)
WRAP_VECTOR_OPS(gp_Vec,gp_Vec)
WRAP_PROPERTY2(gp_Vec, gp_XYZ, xyz, XYZ, SetXYZ);
WRAP_AS_STRUCT_INCLUDE(gp_Vec)
WRAP_VECTOR_PROPERTIES(gp_Dir)
WRAP_PROPERTY2(gp_Dir, gp_XYZ, xyz, XYZ, SetXYZ);
WRAP_AS_STRUCT_INCLUDE(gp_Dir)
WRAP_AS_STRUCT_INCLUDE(gp_Ax1)
WRAP_AS_STRUCT_INCLUDE(gp_Ax2)
WRAP_AS_STRUCT_INCLUDE(gp_Ax3)
WRAP_PROPERTYVAL(gp_Lin, gp_Dir, direction, Direction, SetDirection);
WRAP_PROPERTYVAL(gp_Lin, gp_Pnt, location,  Location,  SetLocation);
WRAP_AS_STRUCT_INCLUDE(gp_Lin)
WRAP_AS_STRUCT_INCLUDE(gp_Circ)
WRAP_AS_STRUCT_INCLUDE(gp_Elips)
WRAP_AS_STRUCT_INCLUDE(gp_Hypr)
WRAP_AS_STRUCT_INCLUDE(gp_Parab)
WRAP_AS_STRUCT_INCLUDE(gp_Pln)
WRAP_AS_STRUCT_INCLUDE(gp_Cylinder)
WRAP_AS_STRUCT_INCLUDE(gp_Sphere)
WRAP_AS_STRUCT_INCLUDE(gp_Torus)
WRAP_AS_STRUCT_INCLUDE(gp_Cone)
WRAP_VECTOR_PROPERTIES(gp_XY,2d)
WRAP_VECTOR_OPS(gp_XY,double)
WRAP_AS_STRUCT_INCLUDE(gp_XY)
WRAP_AS_STRUCT_INCLUDE(gp_Mat2d)
WRAP_AS_STRUCT_INCLUDE(gp_Trsf2d)
WRAP_AS_STRUCT_INCLUDE(gp_GTrsf2d)
WRAP_VECTOR_PROPERTIES(gp_Pnt2d,2d)
WRAP_PROPERTY2(gp_Pnt2d, gp_XY, xy, XY, SetXY);
WRAP_AS_STRUCT_INCLUDE(gp_Pnt2d)
WRAP_VECTOR_PROPERTIES(gp_Vec2d,2d)
WRAP_VECTOR_OPS(gp_Vec2d,double)
WRAP_PROPERTY2(gp_Vec2d, gp_XY, xy, XY, SetXY);
WRAP_AS_STRUCT_INCLUDE(gp_Vec2d)
WRAP_VECTOR_PROPERTIES(gp_Dir2d,2d)
WRAP_PROPERTY2(gp_Dir2d, gp_XY, xy, XY, SetXY);
WRAP_AS_STRUCT_INCLUDE(gp_Dir2d)
WRAP_AS_STRUCT_INCLUDE(gp_Ax2d)
WRAP_AS_STRUCT_INCLUDE(gp_Ax22d)
WRAP_AS_STRUCT_INCLUDE(gp_Lin2d)
WRAP_AS_STRUCT_INCLUDE(gp_Circ2d)
WRAP_AS_STRUCT_INCLUDE(gp_Elips2d)
WRAP_AS_STRUCT_INCLUDE(gp_Hypr2d)
WRAP_AS_STRUCT_INCLUDE(gp_Parab2d)
WRAP_PROPERTY(gp_Quaternion, double, x, X);
WRAP_PROPERTY(gp_Quaternion, double, y, Y);
WRAP_PROPERTY(gp_Quaternion, double, z, Z);
WRAP_PROPERTY(gp_Quaternion, double, w, W);
%typemap(cscode) gp_Quaternion %{
  public override string ToString() { return X() + " " + Y() + " " + Z() + " " + W(); }
%}
WRAP_AS_STRUCT_INCLUDE(gp_Quaternion)
WRAP_AS_STRUCT_INCLUDE(gp_QuaternionNLerp)
WRAP_AS_STRUCT_INCLUDE(gp_QuaternionSLerp)

// Collections of geometric structures
typedef NCollection_Vec2<float> gp_Vec2f;
WRAP_INCLUDE(gp_Vec3f)
WRAP_AS_NCOLLECTION(NCollection_List_gp_Pnt, NCollection_List, gp_Pnt)
WRAP_AS_NCOLLECTION(NCollection_Array1_gp_Vec3f, NCollection_Array1, gp_Vec3f)

// TColgp classes
WRAP_AS_NCOLLECTION_INCLUDE(TColgp_Array1OfXY,NCollection_Array1,gp_XY)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray1OfXY)
WRAP_AS_NCOLLECTION_INCLUDE(TColgp_Array1OfVec2d,NCollection_Array1,gp_Vec2d)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray1OfVec2d)
WRAP_AS_NCOLLECTION_INCLUDE(TColgp_Array1OfPnt2d,NCollection_Array1,gp_Pnt2d)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray1OfPnt2d)
WRAP_AS_NCOLLECTION_INCLUDE(TColgp_Array1OfXYZ,NCollection_Array1,gp_XYZ)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray1OfXYZ)
WRAP_AS_NCOLLECTION_INCLUDE(TColgp_Array1OfVec,NCollection_Array1,gp_Vec)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray1OfVec)
WRAP_AS_NCOLLECTION_INCLUDE(TColgp_Array1OfPnt,NCollection_Array1,gp_Pnt)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray1OfPnt)

WRAP_AS_TEMPLATE_INCLUDE(TColgp_Array2OfXY,NCollection_Array2< gp_XY >)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray2OfXY)
WRAP_AS_TEMPLATE_INCLUDE(TColgp_Array2OfVec2d,NCollection_Array2< gp_Vec2d >)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray2OfVec2d)
WRAP_AS_TEMPLATE_INCLUDE(TColgp_Array2OfPnt2d,NCollection_Array2< gp_Pnt2d >)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray2OfPnt2d)
WRAP_AS_TEMPLATE_INCLUDE(TColgp_Array2OfXYZ,NCollection_Array2< gp_XYZ >)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray2OfXYZ)
WRAP_AS_TEMPLATE_INCLUDE(TColgp_Array2OfVec,NCollection_Array2< gp_Vec >)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray2OfVec)
WRAP_AS_TEMPLATE_INCLUDE(TColgp_Array2OfPnt,NCollection_Array2< gp_Pnt >)
WRAP_AS_HANDLE_INCLUDE(TColgp_HArray2OfPnt)

WRAP_AS_NCOLLECTION_INCLUDE(TColgp_SequenceOfXY,NCollection_Sequence,gp_XY)
WRAP_AS_HANDLE_INCLUDE(TColgp_HSequenceOfXY)
WRAP_AS_NCOLLECTION_INCLUDE(TColgp_SequenceOfXYZ,NCollection_Sequence,gp_XYZ)
WRAP_AS_HANDLE_INCLUDE(TColgp_HSequenceOfXYZ)
WRAP_AS_NCOLLECTION_INCLUDE(TColgp_SequenceOfPnt2d,NCollection_Sequence,gp_Pnt2d)
WRAP_AS_HANDLE_INCLUDE(TColgp_HSequenceOfPnt2d)
WRAP_AS_NCOLLECTION_INCLUDE(TColgp_SequenceOfPnt,NCollection_Sequence,gp_Pnt)
WRAP_AS_HANDLE_INCLUDE(TColgp_HSequenceOfPnt)

// Bnd classes
WRAP_AS_STRUCT_INCLUDE(Bnd_Range)
WRAP_AS_NCOLLECTION(NCollection_List_Bnd_Range, NCollection_List, Bnd_Range)
WRAP_AS_STRUCT_INCLUDE(Bnd_OBB)
WRAP_AS_STRUCT_INCLUDE(Bnd_Box)
WRAP_AS_STRUCT_INCLUDE(Bnd_Box2d)
WRAP_AS_NCOLLECTION_INCLUDE(Bnd_Array1OfBox,NCollection_Array1,Bnd_Box)
WRAP_AS_HANDLE_INCLUDE(Bnd_HArray1OfBox)
WRAP_AS_CLASS_INCLUDE(Bnd_BoundSortBox)

// TopLoc_Location
// do not expose TopLoc_Datum3D type and relevant methods
WRAP_AS_HANDLE_INCLUDE(TopLoc_Datum3D)
%ignore TopLoc_Location::FirstDatum;
%ignore TopLoc_Location::TopLoc_Location(const Handle(TopLoc_Datum3D)&);
%ignore TopLoc_Location::operator gp_Trsf;
WRAP_AS_STRUCT_INCLUDE(TopLoc_Location)

// Poly enums and classes
%ignore Poly_ArrayOfNodes::Poly_ArrayOfNodes(Poly_ArrayOfNodes &&);
WRAP_INCLUDE(Poly_ArrayOfNodes)
%ignore Poly_ArrayOfUVNodes::Poly_ArrayOfUVNodes(Poly_ArrayOfUVNodes &&);
WRAP_INCLUDE(Poly_ArrayOfUVNodes)
WRAP_AS_ENUM_INCLUDE(Poly_MeshPurpose)
WRAP_AS_STRUCT_INCLUDE(Poly_Triangle)
WRAP_AS_NCOLLECTION_INCLUDE(Poly_Array1OfTriangle,NCollection_Array1,Poly_Triangle)
WRAP_AS_HANDLE_INCLUDE(Poly_HArray1OfTriangle)
WRAP_AS_HANDLE_INCLUDE(Poly_Polygon2D)
WRAP_AS_HANDLE_INCLUDE(Poly_Polygon3D)
WRAP_AS_HANDLE_INCLUDE(Poly_TriangulationParameters)
WRAP_AS_HANDLE_INCLUDE(Poly_Triangulation)
WRAP_AS_HANDLE_INCLUDE(Poly_PolygonOnTriangulation)
WRAP_AS_STRUCT_INCLUDE(Poly_Connect)

// Poly collections
WRAP_AS_NCOLLECTION_INCLUDE(Poly_ListOfTriangulation,NCollection_List,Handle(Poly_Triangulation))

// Convert types
WRAP_AS_ENUM_INCLUDE(Convert_ParameterisationType)

// GeomAbs enumerations
WRAP_AS_ENUM_INCLUDE(GeomAbs_BSplKnotDistribution)
WRAP_AS_ENUM_INCLUDE(GeomAbs_CurveType)
WRAP_AS_ENUM_INCLUDE(GeomAbs_IsoType)
WRAP_AS_ENUM_INCLUDE(GeomAbs_JoinType)
WRAP_AS_ENUM_INCLUDE(GeomAbs_Shape)
WRAP_AS_ENUM_INCLUDE(GeomAbs_SurfaceType)

// ElClib package
WRAP_AS_PACKAGE(ElCLib)

// ElSLib package
WRAP_AS_PACKAGE(ElSLib)

// gp package
WRAP_AS_PACKAGE(gp)
