### Install Node-API Addon

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command globally installs the `node-addon-api` package, which is required for running examples with the Node-API engine.

```bash
$ sudo npm install -g node-addon-api
```

---

### SWIG Language Module check.list File Setup

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Instructions for setting up the check.list file for a new SWIG language module's examples directory, by copying and modifying an existing Python example.

```Shell
cp ../python/check.list .
```

---

### Install JavascriptCore Development Library

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command installs the `libjavascriptcoregtk-1.0-dev` package, which is required to run examples with the JavascriptCore engine on Ubuntu-based systems.

```bash
$ sudo apt-get install libjavascriptcoregtk-1.0-dev
```

---

### Install Node.js Development Library for V8

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command installs the `libnode-dev` package, which provides the necessary libraries for running examples with the V8 engine.

```bash
$ sudo apt-get install libnode-dev
```

---

### Manually Generating and Installing Go Wrappers with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates the manual process of generating Go wrapper code using SWIG and then installing the resulting Go package. It involves running SWIG with the `-go` option on an interface file and subsequently using `go install` to compile and install the generated Go module.

```Shell
% swig -go example.i
% go install
```

---

### Example Output of Android NDK Build Process

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

This snippet shows the typical console output when running `ndk-build` after configuring the `Android.mk`. It illustrates the compilation steps for C++ files, the creation of a static library, the linking of the shared library (`libexample.so`), and its final installation into the `libs/armeabi` directory, confirming a successful build.

```Shell
$ ndk-build
Compile++ thumb  : example <= example_wrap.cpp
Compile++ thumb  : example <= example.cpp
StaticLibrary  : libstdc++.a
SharedLibrary  : libexample.so
Install        : libexample.so => libs/armeabi/libexample.so
```

---

### Concrete Examples of Individual Testcase Commands

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides specific examples of cleaning and running individual C, C++, and multi-module C++ test cases using their actual names.

```Shell
make -s ret_by_value.clean
make -s ret_by_value.ctest
make -s bools.cpptest
make -s imports.multicpptest
```

---

### CMake Configuration for SWIG Python Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Introduction

This CMake script demonstrates the setup required to use SWIG for generating Python bindings. It locates SWIG and Python libraries, configures include paths, sets properties for the SWIG interface file (example.i) to enable C++ processing and include all definitions, and finally uses SWIG_ADD_MODULE to create a Python module named 'example' from the interface and C++ source files.

```CMake
FIND_PACKAGE(SWIG REQUIRED)
INCLUDE(${SWIG_USE_FILE})

FIND_PACKAGE(PythonLibs)
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

SET(CMAKE_SWIG_FLAGS "")

SET_SOURCE_FILES_PROPERTIES(example.i PROPERTIES CPLUSPLUS ON)
SET_SOURCE_FILES_PROPERTIES(example.i PROPERTIES SWIG_FLAGS "-includeall")
SWIG_ADD_MODULE(example python example.i example.cxx)
SWIG_LINK_LIBRARIES(example ${PYTHON_LIBRARIES})
```

---

### Real Examples of Individual Testcase Commands

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Concrete examples demonstrating how to clean, run C, C++, and multi-module C++ individual testcases using specific testcase names.

```Shell
make -s ret_by_value.clean
make -s ret_by_value.ctest
make -s bools.cpptest
make -s imports.multicpptest
```

---

### Install CMake-win64 via Nuget for Windows Build

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Commands to install the CMake-win64 Nuget package, providing CMake for building SWIG on Windows. Includes both standard command prompt and PowerShell syntax.

```Batch
C:\Tools\nuget install CMake-win64 -Version 3.15.5 -OutputDirectory C:\Tools\CMake
```

```PowerShell
& "C:\Tools\nuget" install CMake-win64 -Version 3.15.5 -OutputDirectory C:\Tools\CMake
```

---

### CMake Configuration for SWIG Python Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This CMake example demonstrates how to configure a project to use SWIG to create a Python wrapper for a C++ interface file (example.i). It finds SWIG and Python libraries, includes necessary directories, sets SWIG properties for example.i (C++ and includeall flag), adds a SWIG module named 'example' for Python, and links it against Python libraries. This setup generates native build files (makefiles, Visual Studio projects) that invoke SWIG to compile C++ files into a Python extension module (\_example.so or \_example.pyd). This allows easy cross-platform SWIG development.

```CMake
# This is a CMake example for Python

FIND_PACKAGE(SWIG REQUIRED)
INCLUDE(${SWIG_USE_FILE})

FIND_PACKAGE(PythonLibs)
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

SET(CMAKE_SWIG_FLAGS "")

SET_SOURCE_FILES_PROPERTIES(example.i PROPERTIES CPLUSPLUS ON)
SET_SOURCE_FILES_PROPERTIES(example.i PROPERTIES SWIG_FLAGS "-includeall")
SWIG_ADD_MODULE(example python example.i example.cxx)
SWIG_LINK_LIBRARIES(example ${PYTHON_LIBRARIES})

```

---

### Load SWIG Java Module with System.loadLibrary

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a Java class (runme.java) demonstrating how to load a native shared library named 'example' using System.loadLibrary within a static initializer block. It then shows an example of calling a native method example.fact from the loaded module.

```Java
// runme.java

public class runme {
  static {
    System.loadLibrary("example");
  }

  public static void main(String argv[]) {
    System.out.println(example.fact(4));
  }
}
```

---

### Build and Install SWIG on Unix

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Instructions to compile and install SWIG from a distributed tarball on Unix-like systems using GNU make. This assumes PCRE2 is installed and pcre2-config is available.

```Shell
$ ./configure
$ make
$ make install
```

---

### Install Node-GYP Build Tool

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command globally installs `node-gyp`, a cross-platform command-line tool for compiling native Node.js addon modules. It is essential for building C++ extensions for Node.js.

```bash
$ sudo npm install -g node-gyp
```

---

### Install Bison via Nuget for Windows Build

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to install the Bison Nuget package, a parser generator essential for compiling SWIG on Windows.

```Batch
C:\Tools\nuget install Bison -Version 3.7.4 -OutputDirectory C:\Tools\bison
```

---

### C++ Uniform Initialization Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ snippet provides examples of uniform initialization using curly braces `{}`. It demonstrates direct member initialization for structs and constructor calls for classes, showcasing how this C++11 feature works.

```C++
struct BasicStruct {
 int x;
 double y;
};

struct AltStruct {
  AltStruct(int x, double y) : x_{x}, y_{y} {}

  int x_;
  double y_;
};

BasicStruct var1{5, 3.2}; // only fills the struct components
AltStruct var2{2, 4.3};   // calls the constructor
```

---

### Run SWIG Javascript Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command executes the SWIG Javascript examples using the specified engine. The `ENGINE` variable can be set to `node`, `jsc`, `v8`, or `napi` to select the desired Javascript runtime.

```bash
$ make check-javascript-examples ENGINE=jsc
```

---

### C++ Example: Setting and Getting Element in Container

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the straightforward usage of the `Container` and `Element` classes in C++. An `Element` object is created on the stack, its address is passed to `Container::setElement`, and its value is retrieved, demonstrating the expected behavior where the `Element` remains valid.

```C++
Container container;
Element element(20);
container.setElement(&element);
cout << "element.value: " << container.getElement()->value << endl;
```

---

### Configure SWIG Python Extension with distutils setup.py

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Python script defines the configuration for building a SWIG-generated Python extension module using distutils. It specifies the extension name (\_example), the source files (example_wrap.c, example.c), and package metadata for the setup function.

```Python
#!/usr/bin/env python3

"""
setup.py file for SWIG example
"""

from distutils.core import setup, Extension

example_module = Extension('_example',
                           sources=['example_wrap.c', 'example.c'],
                           )

setup (name = 'example',
       version = '0.1',
       author      = "SWIG Docs",
       description = """Simple swig example from docs""",
       ext_modules = [example_module],
       py_modules = ["example"],
       )
```

---

### Compile SWIG OCaml Bindings for Qt Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This bash script outlines the steps to compile the SWIG-generated OCaml bindings for the Qt example. It involves running SWIG to generate OCaml and C++ wrapper files, compiling OCaml source files, compiling the C++ wrapper, and finally linking everything into an OCaml toplevel executable.

```Bash
$ QTPATH=/your/qt/path
$ for file in swig.mli swig.ml swigp4.ml ; do swig -ocaml -co $file ; done
$ ocamlc -c swig.mli ; ocamlc -c swig.ml
$ ocamlc -I `camlp4 -where` -pp "camlp4o pa_extend.cmo q_MLast.cmo" -c swigp4.ml
$ swig -ocaml -c++ -o qt_wrap.c qt.i
$ ocamlc -c -ccopt -xc++ -ccopt -g -g -ccopt -I$QTPATH/include qt_wrap.c
$ ocamlc -c qt.mli
$ ocamlc -c qt.ml
$ ocamlmktop -custom swig.cmo -I `camlp4 -where` \
  camlp4o.cma swigp4.cmo qt_wrap.o qt.cmo -o qt_top -cclib \
  -L$QTPATH/lib -cclib -lqt
```

---

### Create SWIG Interface File for C++ Classes

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

This SWIG interface file ('example.i') defines the SWIG module 'example' and includes the C++ header file 'example.h'. This setup instructs SWIG on how to generate wrapper code, making the C++ classes accessible from target languages like Java.

```SWIG
/* File : example.i */
%module example

%{
#include "example.h"
%}

/* Let's just grab the original header file here */
%include "example.h"
```

---

### Example Usage of SWIG char\*\* Typemap in Tcl

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to call the `print_args` function from Tcl, passing a Tcl list that gets converted to a C `char **` by the SWIG typemap.

```Tcl
% print_args {John Guido Larry}
argv[0] = John
argv[1] = Guido
argv[2] = Larry
3
```

---

### Install Bison using Nuget

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Command to install the Bison package via Nuget, specifying version and output directory for building SWIG.

```Shell
C:\Tools\nuget install Bison -Version 3.7.4 -OutputDirectory C:\Tools\bison
```

---

### Bootstrap Node-API Project with Yeoman

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These commands outline the process of setting up a Node-API project using Yeoman. It involves installing Yeoman and the Node-API module generator, creating a project directory, generating a skeleton, updating `node-addon-api`, generating SWIG wrappers, and finally configuring and building the module with `node-gyp`.

```bash
$ sudo npm install -g yo
$ sudo npm install -g generator-napi-module
$ mkdir example
$ cd example
$ yo napi-module
$ npm install node-addon-api@latest
$ swig -javascript -napi -c++ -o src/example.cc example.i
$ node-gyp configure
$ node-gyp build
```

---

### SWIG C++ Wrapper Compilation Steps

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a step-by-step command-line example for generating and compiling a SWIG C++ wrapper. It demonstrates using `swig -c++` to create the wrapper file and then compiling it with a C++ compiler to produce a shared library.

```Shell
$ swig -c++ -tcl example.i
$ c++ -fPIC -c example_wrap.cxx
$ c++ example_wrap.o $(OBJS) -o example.so
```

---

### Perl Example: Accessing SWIG Wrapped C Struct

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the SWIG-generated Perl functions to create an instance of `Vector`, get its `x` component, and set its `x` component.

```Perl
$v = example::new_Vector();
print example::Vector_x_get($v), "\n";   # Get x component
example::Vector_x_set($v, 7.8);          # Change x component
```

---

### Building Ruby Extension Module with mkmf

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

After creating extconf.rb, these commands are used to build and install the Ruby extension module. extconf.rb generates the Makefile, make compiles, and make install installs the module.

```Bash
$ ruby extconf.rb
$ make
$ make install
```

---

### Node-GYP Configuration File (binding.gyp)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This `binding.gyp` file, in JSON format, configures `node-gyp` to build a native Node.js module named 'example'. It specifies the C++ source files required for compilation, including the SWIG-generated wrapper.

```json
{
  "targets": [
    {
      "target_name": "example",
      "sources": ["example.cxx", "example_wrap.cxx"]
    }
  ]
}
```

---

### Java Director Method Override and Main Class Setup

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java code defines a 'DerivedClass' that extends 'MyClass' and overrides the 'dirmethod' to throw different Java exceptions based on the input 'x'. It also includes the 'runme' class, which serves as the entry point for the application, loading the native library and preparing for the execution of the examples.

```Java
class DerivedClass extends MyClass {
  @Override
  public void dirmethod(int x) {
    if (x < 0)
      throw new IndexOutOfBoundsException("Index is negative");
    else if (x == 0)
      throw new MyException("MyException: bad dirmethod");
  }
}
public class runme {
  public static void main(String argv[]) {
    System.loadLibrary("example");
    ... code snippets shown below ...
  }
}
```

---

### C# Usage of SWIG-Wrapped CDate Property

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to set and get the SWIG-wrapped C++ CDate variable as a System.DateTime property in C#. The module name is 'example'.

```C#
example.ImportantDate = new System.DateTime(2000, 11, 22);
System.DateTime importantDate = example.ImportantDate;
Console.WriteLine("Important date: " + importantDate);
```

---

### Configure TCL Environment Variables for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

This snippet provides the necessary environment variables, TCL_INCLUDE and TCL_LIB, for integrating TCL with SWIG. It includes an example path for an ActiveTcl 8.6 installation.

```TCL
TCL_INCLUDE: C:\ActiveTcl\include
TCL_LIB: C:\ActiveTcl\lib\tcl86t.lib
```

---

### SWIG: Example of Missing shared_ptr Macros in Hierarchy

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Provides an example of a SWIG interface file where `%shared_ptr` macros are omitted for some classes in an inheritance hierarchy (`GrandParent`, `Child`). This setup is used to demonstrate the warnings SWIG generates in such cases.

```SWIG
%include "boost_shared_ptr.i"
%shared_ptr(Parent);

%inline %{
  #include <boost/shared_ptr.hpp>
  struct GrandParent {
    virtual ~GrandParent() {}
  };

  struct Parent : GrandParent {
    virtual ~Parent() {}
  };

  struct Child : Parent {
    virtual ~Child() {}
  };
%}
```

---

### SWIG Interface File Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A basic SWIG interface file (`example.i`) demonstrating module definition and C function declaration for wrapping.

```C
/* File: example.i */
%module test
%{
#include "stuff.h"
%}
int fact(int n);
```

---

### Perl Example: Using SWIG Wrapped C++ Class

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the SWIG-generated Perl functions to interact with a `List` C++ object, including creating, inserting elements, printing, and getting its length.

```Perl
use example;
$l = example::new_List();
example::List_insert($l, "Ale");
example::List_insert($l, "Stout");
example::List_insert($l, "Lager")
example::List_print($l)
Lager
Stout
Ale
print example::List_length_get($l), "\n";
3
```

---

### Define Android NDK Build System (Android.mk)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This `Android.mk` file defines the build system for the Android NDK. It specifies the module name 'example' and lists the source files (`example_wrap.c`, `example.c`) required to build a shared library (`libexample.so`).

```Makefile
# File: Android.mk
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := example
LOCAL_SRC_FILES := example_wrap.c example.c

include $(BUILD_SHARED_LIBRARY)
```

---

### Configure Java Environment Variables for SWIG Examples on Windows

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Instructions for setting the necessary environment variables (JAVA_INCLUDE and JAVA_BIN) required to compile and run SWIG-generated Java examples using Visual C++ on Windows. These variables point to the Java Development Kit (JDK) include and binary directories, essential for the build process.

```APIDOC
JAVA_INCLUDE: Set this to the directory containing jni.h
JAVA_BIN: Set this to the bin directory containing javac.exe

Example using the openjdk package installed in a Conda environment:
JAVA_INCLUDE: C:\miniconda3\envs\java\Library\lib\jvm\include
JAVA_BIN: C:\miniconda3\envs\java\Library\lib\jvm\bin
```

---

### List Available Android Target IDs

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command lists all available Android target IDs installed with the SDK. It is used to verify and select the correct target ID for building Android applications, which might need adjustment based on the development setup.

```Bash
android list targets
```

---

### Configure Python Environment Variables for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

This snippet provides the necessary environment variables, PYTHON_INCLUDE and PYTHON_LIB, for integrating Python with SWIG. It includes an example path for a Python 3.13 installation within a Conda environment.

```Python
PYTHON_INCLUDE: C:\miniconda3\envs\python\include
PYTHON_LIB: C:\miniconda3\envs\python\libs\python313.lib
```

---

### Generate PHP Extension Wrapper Files with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command demonstrates how to use SWIG with the `-php` option to generate the necessary C wrapper code (`example_wrap.c`) and PHP header file (`php_example.h`) from a SWIG interface file (`example.i`). It's the first step in creating a PHP extension.

```Bash
swig -php example.i
```

---

### Build and Install Android Application

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

These commands are used to build the Android application, uninstall any previously installed version, and then install the newly built debug APK onto a connected Android device or emulator. This prepares the app for testing the native code integration.

```Shell
$ ant debug
$ adb uninstall org.swig.simple
$ adb install bin/SwigSimple-debug.apk
```

---

### C++ Namespace Name Conflict Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows a scenario where two different C++ namespaces define functions with the same name but different signatures. This setup leads to a name conflict when SWIG flattens namespaces, resulting in an error.

```C++
namespace A {
  void foo(int);
}
namespace B {
  void foo(double);
}
```

---

### Adding Python Code at File Beginning with %pythonbegin

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates the use of the %pythonbegin directive to insert Python code at the very start of the generated .py file. This is useful for adding module-level comments, 'from **future** import' statements, or other Python imports that must appear at the top of the file.

```SWIG
%pythonbegin %{
# This module provides wrappers to the Whizz Bang library
%}

%pythonbegin %{
from __future__ import print_function
print("Loading", "Whizz", "Bang", sep=' ... ')
%}
```

---

### SWIG Interface Example Using cdata.i and carrays.i

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A SWIG interface example demonstrating the inclusion of `carrays.i` and `cdata.i` modules, and the definition of an `intArray` class using `%array_class` for C arrays, which is used in subsequent examples.

```SWIG
// SWIG interface
%module example
%include "carrays.i"
%include "cdata.i"

%array_class(int, intArray);
```

---

### Configure SWIG TCL Environment Variables

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates how to set the TCL_INCLUDE and TCL_LIB environment variables for SWIG when using TCL. These variables point to the TCL header files and library required for linking. The example shows a setup for ActiveTcl 8.6 on Windows.

```TCL
TCL_INCLUDE: C:\ActiveTcl\include
TCL_LIB: C:\ActiveTcl\lib\tcl86t.lib
```

---

### Integrate Native Extension with WebKit on GTK

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C code illustrates the integration of a native extension, 'example', into a GTK application using WebKit. It outlines the initialization of GTK and WebKit, obtaining the JavaScript global context, and exposing the native extension's JSObjectRef to JavaScript. The snippet also includes loading a URI into the WebView.

```C
#include <gtk/gtk.h>
#include <webkit/webkit.h>

extern bool example_initialize(JSGlobalContextRef context);

int main(int argc, char* argv[])
{
  // Initialize GTK+
  gtk_init(&argc, &argv);

  ...

  // Create a browser instance
  WebKitWebView *webView = WEBKIT_WEB_VIEW(webkit_web_view_new());
  WebFrame *webframe = webkit_web_view_get_main_frame(webView);
  JSGlobalContextRef context = webkit_web_frame_get_global_context(webFrame);
  JSObjectRef global = JSContextGetGlobalObject(context);

  JSObjectRef exampleModule;
  example_initialize(context, &exampleModule);
  JSStringRef jsName = JSStringCreateWithUTF8CString("example");
  JSObjectSetProperty(context, global, jsName, exampleModule, kJSPropertyAttributeReadOnly, NULL);
  JSStringRelease(jsName);

  ...

  // Load a web page into the browser instance
  webkit_web_view_load_uri(webView, "https://www.webkitgtk.org/");

  ...

  // Run the main GTK+ event loop
  gtk_main();

  return 0;
}
```

---

### Install Node.js on Ubuntu via PPA

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These commands add the Node.js PPA to your system, update the package list, and then install Node.js. This method provides a more up-to-date version of Node.js compared to default distribution packages.

```bash
$ sudo add-apt-repository ppa:chris-lea/node.js
$ sudo apt-get update
$ sudo apt-get install nodejs
```

---

### Building C Shared Libraries on Solaris and Linux

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides shell commands for compiling and linking C source files (example.c, example_wrap.c) into a dynamically loadable shared library (.so) on Solaris using `gcc` and `ld`, and on Linux using `gcc`.

```Shell
# Build a shared library for Solaris
gcc -fPIC -c example.c example_wrap.c -I/usr/local/include
ld -G example.o example_wrap.o -o example.so

# Build a shared library for Linux
gcc -fPIC -c example.c example_wrap.c -I/usr/local/include
gcc -shared example.o example_wrap.o -o example.so
```

---

### Scilab Examples for Matrix Operations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These Scilab commands illustrate how to interact with the C matrix manipulation functions ('create_matrix', 'get_matrix', 'set_matrix', 'print_matrix') exposed via SWIG, demonstrating matrix creation, printing, and element access/modification.

```Scilab
--> m = create_matrix();

--> print_matrix(m);
   1.   2.
   3.   4.

--> set_matrix(m, 1, 1, 5.);

--> get_matrix(m, 1, 1)
 ans  =

    5.
```

---

### Define a C++ Class for SWIG Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a basic C++ class `List` with a constructor, destructor, methods for searching, inserting, removing, getting elements, and a public data member `length`. This class serves as an example for SWIG's class wrapping.

```C++
class List {
public:
  List();
  ~List();
  int  search(char *item);
  void insert(char *item);
  void remove(char *item);
  char *get(int n);
  int  length;
};
```

---

### C++ Classes and Functions for Multiple Inheritance Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines three C++ classes (A, B, C) where C inherits from both A and B, along with functions that accept pointers to A and B. This setup is used to demonstrate issues with type information loss when casting pointers.

```C++
class A {
public:
  int x;
};

class B {
public:
  int y;
};

class C : public A, public B {
};

int A_function(A *a) {
  return a->x;
}

int B_function(B *b) {
  return b->y;
}
```

---

### Build a Perl5 Module with SWIG from C Header

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Introduction

This example shows a shortcut method to build a Perl5 module by directly running SWIG on a C header file. It includes the SWIG command, GCC compilation, linking, and a Perl interactive session demonstrating module usage and function calls.

```Shell
unix > swig -perl5 -module example example.h
unix > gcc -c example.c example_wrap.c \
        -I/usr/local/lib/perl5/sun4-solaris/5.003/CORE
unix > ld -G example.o example_wrap.o -o example.so
```

```Perl
unix > perl5.003
use example;
print example::fact(4), "\n";
print example::my_mod(23, 7), "\n";
print $example::My_variable + 4.5, "\n";
<ctrl-d>
24
2
7.5
```

---

### SWIG Interface: Wrapping C Array with %array_functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Example of a SWIG interface file (`.i`) demonstrating how to use the `%array_functions` macro from `carrays.i` to wrap a C function that takes a double array. This setup allows scripting languages to interact with the C array.

```SWIG
%module example

%include "carrays.i"
%array_functions(double, doubleArray);

void print_array(double x[10]);
```

---

### Embed Lua Code in SWIG Module Initialization

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to embed custom Lua code within a SWIG module using the %luacode directive. This code executes after module initialization, allowing for the definition of module-specific functions or other setup tasks. It shows how to define a 'greet' function within the 'example' module.

```SWIG
%module example;

%luacode {
  function example.greet()
    print "hello world"
  end

  print "Module loaded ok"
}
...
%}
```

---

### Compile SWIG Lua Wrapper and Module (Bash)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet provides the Bash commands to compile a SWIG-generated Lua wrapper and link it with a C example file to create a dynamically loadable Lua module (.so file). It assumes example.i is the SWIG interface file and example.c is the C source.

```Bash
swig -lua example.i -o example_wrap.c
gcc -fPIC -I/usr/include/lua -c example_wrap.c -o example_wrap.o
gcc -fPIC -c example.c -o example.o
gcc -shared -I/usr/include/lua -L/usr/lib/lua example_wrap.o example.o -o example.so
```

---

### SWIG I/O Example: Printing to String and File

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates common usage of SWIG's internal I/O functions, demonstrating how to create a new string, print formatted output to it, and then print the string's content to a file.

```C
/* Print into a string */
String *s = NewString("");
Printf(s, "Hello\n");
for (i = 0; i < 10; i++) {
  Printf(s, "%d\n", i);
}
...
/* Print string into a file */
Printf(f, "%s\n", s);
```

---

### Example C Header File for SWIG Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Presents a simple C header file (`header.h`) containing function declarations. This file serves as an example of the C source code that would typically be wrapped by SWIG.

```C
/* File : header.h */

#include <stdio.h>
#include <math.h>

extern int foo(double);
extern double bar(int, int);
extern void dump(FILE *f);
```

---

### Basic SWIG Command Line Usage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Demonstrates the fundamental command structure for running SWIG, specifying options and the input interface or header file. It also notes how to access the full help documentation.

```bash
swig [ options ] filename
```

---

### Example C Function for SWIG Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A simple C function declaration used as an example to demonstrate how SWIG generates wrapper code and integrates typemaps for argument and return value conversion.

```C
int gcd(int x, int y);
```

---

### SWIG Generated C Accessor Functions for Nested Unions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides examples of the C accessor functions that SWIG generates to allow scripting languages to interact with members of nested structures and unions. These functions provide a low-level interface for getting and setting values within the transformed structure.

```C
Object_intRep *Object_intRep_get(Object *o) {
  return (Object_intRep *) &o->intRep;
}
int Object_intRep_ivalue_get(Object_intRep *o) {
  return o->ivalue;
}
int Object_intRep_ivalue_set(Object_intRep *o, int value) {
  return (o->ivalue = value);
}
double Object_intRep_dvalue_get(Object_intRep *o) {
  return o->dvalue;
}
... etc ...
```

---

### SWIG Typemap Definition Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides various examples of SWIG typemap definitions, demonstrating simple declarations, use with extra argument names, multiple types, modifiers, multi-argument patterns, and extra pattern parameters.

```SWIG
/* Simple typemap declarations */
%typemap(in) int {
  $1 = PyInt_AsLong($input);
}
%typemap(in) int "$1 = PyInt_AsLong($input);"
%typemap(in) int %{
  $1 = PyInt_AsLong($input);
%}

/* Typemap with extra argument name */
%typemap(in) int nonnegative {
  ...
}

/* Multiple types in one typemap */
%typemap(in) int, short, long {
  $1 = SvIV($input);
}

/* Typemap with modifiers */
%typemap(in, doc="integer") int "$1 = scm_to_int($input);"

/* Typemap applied to patterns of multiple arguments */
%typemap(in) (char *str, int len),
             (char *buffer, int size)
{
  $1 = PyString_AsString($input);
  $2 = PyString_Size($input);
}

/* Typemap with extra pattern parameters */
%typemap(in, numinputs=0) int *output (int temp),
                          long *output (long temp)
{
  $1 = &temp;
}
```

---

### Create and Build Android Project

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Commands to initialize a new Android project named 'SwigSimple' and build it using Ant. This sets up the basic application structure for the Android app.

```Shell
$ android create project --target 1 --name SwigSimple --path ./simple --activity SwigSimple --package org.swig.simple
$ cd simple
$ ant debug
```

---

### SWIG %define Macro for Array Helper Generation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Preprocessor

Illustrates the SWIG-specific %define directive for creating large, multi-line macros. This example defines an ARRAYHELPER macro that generates C functions for creating, deleting, getting, and setting elements in arrays of a specified type, then shows its usage for int and double arrays.

```SWIG
%define ARRAYHELPER(type, name)
%inline %{
type *new_ ## name (int nitems) {
  return (type *) malloc(sizeof(type)*nitems);
}
void delete_ ## name(type *t) {
  free(t);
}
type name ## _get(type *t, int index) {
  return t[index];
}
void name ## _set(type *t, int index, type val) {
  t[index] = val;
}
%}
%enddef

ARRAYHELPER(int, IntArray)
ARRAYHELPER(double, DoubleArray)
```

---

### Configure SWIG Python Environment Variables

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates how to set the PYTHON_INCLUDE and PYTHON_LIB environment variables for SWIG when using Python. These variables point to the Python header files and library required for linking, respectively. The example shows a setup for Python 3.13 within a Conda environment on Windows.

```Python
PYTHON_INCLUDE: C:\miniconda3\envs\python\include
PYTHON_LIB: C:\miniconda3\envs\python\libs\python313.lib
```

---

### SWIG Wrapped C Declarations: Example Usage in Scripting Languages

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These code examples demonstrate how to access and use the C functions, variables, and constants wrapped by SWIG in different scripting languages. The Tcl example shows direct function calls and variable access, while the Python example uses the 'example' module and 'cvar' attribute for variables.

```Tcl
% sin 3
5.2335956
% strcmp Dave Mike
-1
% puts $Foo
42
% puts $STATUS
50
% puts $VERSION
1.1
```

```Python
>>> example.sin(3)
5.2335956
>>> example.strcmp('Dave', 'Mike')
-1
>>> print example.cvar.Foo
42
>>> print example.STATUS
50
>>> print example.VERSION
1.1
```

---

### Install PCRE2 using Nuget

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Command to install the PCRE2 package via Nuget, specifying version and output directory. Note that this is an x64 build.

```Shell
C:\Tools\nuget install PCRE2 -Version 10.39 -OutputDirectory C:\Tools\pcre2
```

---

### Create SWIG Interface File for C Code

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

SWIG interface file `example.i` that defines the module 'example' and declares the `gcd` function and `Foo` global variable from `example.c`. This file instructs SWIG on how to generate wrappers for the C code.

```swig
/* File : example.i */
%module example

%inline %{
extern int    gcd(int x, int y);
extern double Foo;
%}
```

---

### SWIG Interface: Wrapping C Array with %array_class

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Example of a SWIG interface file (`.i`) demonstrating how to use the `%array_class` macro from `carrays.i` to wrap a C function that takes a double array. This setup allows scripting languages to interact with the C array using a class-based interface.

```SWIG
%module example
%include "carrays.i"
%array_class(double, doubleArray);

void print_array(double x[10]);
```

---

### Create SWIG Interface File for C++ (example.i)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines the SWIG module 'example' and includes the 'example.h' header, instructing SWIG to parse the C++ class definitions and generate wrapper code for target languages like Java.

```SWIG
/* File : example.i */
%module example

%{
#include "example.h"
%}

/* Let's just grab the original header file here */
%include "example.h"

```

---

### Install SWIG to a Custom Directory on Unix

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to install SWIG to a non-default location (e.g., a user's home directory project folder) on Unix using the --prefix option with the configure script. The path provided must be an absolute pathname.

```Shell
$ ./configure --prefix=/home/yourname/projects
$ make
$ make install
```

---

### Install SWIG after Build (MSYS2)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Command to install the compiled SWIG binaries and related files to the system after a successful build in MSYS2.

```Make
make install
```

---

### Building SWIG Perl Module using MakeMaker Commands

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

After creating a `Makefile.PL` script, these shell commands are used to build and install the SWIG-generated Perl module. `perl Makefile.PL` generates the Makefile, `make` compiles the module, and `make install` installs it into the Perl library path.

```Shell
$ perl Makefile.PL
$ make
$ make install
```

---

### SWIG Module Initialization with %init

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Demonstrates how to use the `%init` section in SWIG to execute C code during module initialization. This is useful for setting up variables or performing one-time setup when the wrapped module is loaded.

```SWIG
%init %{
  init_variables();
%}
```

---

### Install PCRE2 via Nuget for Windows Build

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to install the PCRE2 Nuget package, a regular expression library required for SWIG, specifically for Windows x64 builds.

```Batch
C:\Tools\nuget install PCRE2 -Version 10.39 -OutputDirectory C:\Tools\pcre2
```

---

### Define Android NDK Build System (Android.mk)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

This Android.mk file defines the build rules for the Android NDK. It specifies the module name 'example' and lists the source files 'example_wrap.c' and 'example.c' to be compiled into a shared library.

```Makefile
# File: Android.mk
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := example
LOCAL_SRC_FILES := example_wrap.c example.c

include $(BUILD_SHARED_LIBRARY)
```

---

### Manipulate Pointers with SWIG Utility Functions in Scilab

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Scilab example illustrates the use of SWIG's utility functions `SWIG_this()` to get a pointer's address and `SWIG_ptr()` to create a pointer from an address. It shows how a pointer created by `SWIG_ptr()` loses its specific type and becomes a generic 'pointer' type.

```Scilab
--> f = fopen("junk", "w");
--> fputs("Hello", f);
--> addr = SWIG_this(f)
 ans  =

    8219088.

--> p = SWIG_ptr(addr);
--> typeof(p)
ans  =

  pointer

--> fputs(" World", p);
--> fclose(f);
```

---

### Compiling SWIG Module with External Library (Initial Attempt)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to compile a SWIG-generated wrapper (`example_wrap.o`) and application code (`example.o`) into a shared library (`example.so`), linking against an external library (`libfoo`). This setup can lead to runtime library loading issues if `libfoo.so` is not found by the dynamic linker.

```GCC
$ gcc -shared example.o example_wrap.o -L/home/beazley/projects/lib -lfoo \
      -o example.so
```

---

### Create SWIG Interface File for C Code

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

SWIG interface file `example.i` that defines the module 'example' and declares the C functions and variables (`gcd`, `Foo`) to be wrapped for Java, enabling JNI generation.

```SWIG
/* File : example.i */
%module example

%inline %{
extern int    gcd(int x, int y);
extern double Foo;
%}
```

---

### Display SWIG Configure Script Help

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to display the available options and help information for the SWIG configure script, useful for understanding advanced configuration possibilities.

```Shell
$ ./configure --help.
```

---

### Install CMake-win64 using Nuget

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Commands to install the CMake-win64 package via Nuget, specifying version and output directory. Includes both standard command prompt and PowerShell syntax for flexibility.

```Shell
C:\Tools\nuget install CMake-win64 -Version 3.15.5 -OutputDirectory C:\Tools\CMake
```

```PowerShell
& "C:\Tools\nuget" install CMake-win64 -Version 3.15.5 -OutputDirectory C:\Tools\CMake
```

---

### Python: Calling Wrapped printf Function Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows an example of successfully calling the SWIG-wrapped printf function from Python, demonstrating its ability to handle variable arguments and format output in an interactive session.

```Python
>>> import example
>>> example.printf("Grade: %s   %d/60 = %0.2f%%\n", "Dave", 47, 47.0*100/60)
Grade: Dave   47/60 = 78.33%
>>>
```

---

### Define a C++ Class for SWIG Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ code defines a `List` class with a constructor, destructor, various public methods for list manipulation (search, insert, remove, get), and a public `length` data member. This class serves as an example for SWIG's C++ class wrapping capabilities.

```C++
class List {
public:
  List();
  ~List();
  int  search(char *item);
  void insert(char *item);
  void remove(char *item);
  char *get(int n);
  int  length;
};
```

---

### C Source Code for SWIG Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Introduction

A simple C file containing a global variable and two functions (factorial and modulo) intended to be wrapped by SWIG for access from scripting languages.

```C
/* File : example.c */

double My_variable = 3.0;

/* Compute factorial of n */
int fact(int n) {
  if (n <= 1)
    return 1;
  else
    return n*fact(n-1);
}

/* Compute n mod m */
int my_mod(int n, int m) {
  return(n % m);
}
```

---

### SWIG Configuration for Python Modules in Same Package

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Configure SWIG to generate Python modules (foo.py and \_foo.so) that are located within the same Python package. This setup leverages Python's **package** or **name** attributes for module loading. The example shows the SWIG directive, typical file structure, and the Python import statement.

```SWIG
%module(package="mypackage") foo
```

```File System
/dir/mypackage/foo.py
/dir/mypackage/__init__.py
/dir/mypackage/_foo.so
```

```Python
from mypackage import foo
```

---

### SWIG Renaming Rules with %rename Directive

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Demonstrates various regular expression-based renaming rules in SWIG using the %rename directive. Examples include removing 'wx' prefixes from identifiers (except 'wxEVT'), simplifying enum item names by removing common prefixes, and stripping 'Set' or 'Get' prefixes from method names.

```SWIG
%rename("%(regex:/wx(?!EVT)(.*)/\\1/)s") ""; // wxSomeWidget -> SomeWidget
                                             // wxEVT_PAINT -> wxEVT_PAINT

// Apply a rule for renaming the enum elements to avoid the common prefixes
// which are redundant in C#/Java
%rename("%(regex:/^([A-Z][a-z]+)+_(.*)/\\2/)s", %$isenumitem) ""; // Colour_Red -> Red

// Remove all "Set/Get" prefixes.
%rename("%(regex:/^(Set|Get)(.*)/\\2/)s") ""; // SetValue -> Value
                                              // GetValue -> Value
```

---

### Install Compiled SWIG Executable in MSYS2

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Bash command to install the compiled SWIG executable and associated files into the system path within the MSYS2 environment, making it globally accessible.

```Bash
make install
```

---

### SWIG Generated Perl Proxy Class for C++ Vector

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Perl code demonstrates the proxy class 'example::Vector' generated by SWIG. It encapsulates the low-level C accessor functions into object-oriented methods like 'new', 'DESTROY', 'FETCH' (for getting members), and 'STORE' (for setting members), providing a more idiomatic Perl interface to the C++ structure.

```Perl
package example::Vector;
@ISA = qw( example );
%OWNER = ();
%BLESSEDMEMBERS = ();

sub new () {
  my $self = shift;
  my @args = @_;
  $self = vectorc::new_Vector(@args);
  return undef if (!defined($self));
  bless $self, "example::Vector";
  $OWNER{$self} = 1;
  my %retval;
  tie %retval, "example::Vector", $self;
  return bless \%retval, "Vector";
}

sub DESTROY {
  return unless $_[0]->isa('HASH');
  my $self = tied(%{$_[0]});
  delete $ITERATORS{$self};
  if (exists $OWNER{$self}) {
    examplec::delete_Vector($self));
    delete $OWNER{$self};
  }
}

sub FETCH {
  my ($self, $field) = @_;
  my $member_func = "vectorc::Vector_${field}_get";
  my $val = &amp;$member_func($self);
  if (exists $BLESSEDMEMBERS{$field}) {
    return undef if (!defined($val));
    my %retval;
    tie %retval, $BLESSEDMEMBERS{$field}, $val;
    return bless \%retval, $BLESSEDMEMBERS{$field};
  }
  return $val;
}

sub STORE {
  my ($self, $field, $newval) = @_;
  my $member_func = "vectorc::Vector_${field}_set";
  if (exists $BLESSEDMEMBERS{$field}) {
    &amp;$member_func($self, tied(%{$newval}));
  } else {
    &amp;$member_func($self, $newval);
  }
}
```

---

### SWIG Interface Example Using cmalloc.i Macros

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A SWIG interface example demonstrating the use of `%malloc`, `%free`, and `%allocators` macros from the `cmalloc.i` module. It creates wrappers for `int` and `double` types, including a pointer to int (`int *`).

```SWIG
// SWIG interface
%module example
%include "cmalloc.i"

%malloc(int);
%free(int);

%malloc(int *, intp);
%free(int *, intp);

%allocators(double);
```

---

### Create and Build Android Project

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

Commands to initialize a new Android project named 'SwigSimple' and build it using the `android` and `ant` command-line tools. This sets up the basic project structure.

```bash
$ android create project --target 1 --name SwigSimple --path ./simple --activity SwigSimple --package org.swig.simple
$ cd simple
$ ant debug
```

---

### Install ccache-swig using Symbolic Links

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CCache

Demonstrates how to install ccache-swig by creating symbolic links from common compiler names (gcc, g++, cc, swig) to the ccache-swig executable, allowing it to act as a transparent cache.

```Shell
  cp ccache-swig /usr/local/bin/
  ln -s /usr/local/bin/ccache-swig /usr/local/bin/gcc
  ln -s /usr/local/bin/ccache-swig /usr/local/bin/g++
  ln -s /usr/local/bin/ccache-swig /usr/local/bin/cc
  ln -s /usr/local/bin/ccache-swig /usr/local/bin/swig
```

---

### Example Python SWIG Extension Usage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates how to interact with a SWIG-generated Python extension module from the Python interpreter. It shows importing the 'example' module and calling a function 'fact' within it.

```Python
$ python
>>> import example
>>> print(example.fact(4))
24
>>>
```

---

### Build and Deploy Android Application

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These commands are used to compile the Java code using `ant debug`, uninstall any previous version of the Android application, and then install the newly built debug APK onto an Android device or emulator.

```bash
$ ant debug
$ adb uninstall org.swig.simple
$ adb install bin/SwigSimple-debug.apk
```

---

### Install Android Application via ADB

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to install the compiled Android application package (APK) onto a connected Android device for testing and debugging purposes.

```Shell
$ adb install bin/SwigSimple-debug.apk
```

---

### Java Example: Initial Container and Element Usage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Presents the Java equivalent of the C++ usage, where a new `Element` object is instantiated and passed to the `Container`'s `setElement` method. This initial example sets the stage for demonstrating potential memory management issues due to Java's garbage collection.

```Java
Container container = new Container();
container.setElement(new Element(20));
System.out.println("element value: " + container.getElement().getValue());
```

---

### Load SWIG Java Native Library and Call Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This Java code demonstrates how to load a native shared library (named 'example') using System.loadLibrary within a static initializer block. It then shows an example of calling a native method, example.fact(4), which is presumably provided by the loaded native library.

```Java
// runme.java

public class runme {
  static {
    System.loadLibrary("example");
  }

  public static void main(String argv[]) {
    System.out.println(example.fact(4));
  }
}
```

---

### Build PHP Dynamically Loadable Extension using GCC

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These GCC commands illustrate how to compile the SWIG-generated C wrapper (`example_wrap.c`) and your custom C source file (`example.c`) into object files, and then link them together to create a dynamically loadable PHP extension (`example.so`). The `php-config --includes` command provides necessary include paths, and `-fPIC` ensures position-independent code for shared libraries.

```Bash
gcc `php-config --includes` -fPIC -c example_wrap.c example.c
gcc -shared example_wrap.o example.o -o example.so
```

---

### C++ Classes for Stale Pointer Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

Defines simple C++ classes `Obj` and `Node` where `Node` holds a pointer to `Obj`. This setup is used to illustrate a common memory management pitfall where Java's garbage collection can lead to a stale C++ pointer if ownership is not correctly managed.

```C++
class Obj {};
class Node {
  Obj *value;
public:
  void set_value(Obj *v) { value = v; }
};
```

---

### Generated Wrapper Code for printf() Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows a simplified representation of the C-like wrapper code that SWIG generates for the 'printf()' example. It clarifies how the arguments processed by the typemap are passed to the underlying C function.

```C
wrap_printf() {
  char *arg1;
  void *arg2;
  int   result;

  arg1 = "%s";
  arg2 = (void *) PyString_AsString(arg2obj);
  ...
  result = printf(arg1, arg2);
  ...
}
```

---

### SWIG Support for std::result_of and Function Callbacks

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet details the process of wrapping C++ code that uses `std::result_of` to determine function return types, enabling generic function calls. It includes the C++ and SWIG setup for specializing `std::result_of` and wrapping a generic test function, followed by a Python example demonstrating its usage with a callback.

```C++/SWIG
%inline %{
#include <functional>
typedef double(*fn_ptr)(double);
%}

namespace std {
  // Forward declaration of result_of
  template<typename Func> struct result_of;
  // Add in a partial specialization of result_of
  template<> struct result_of< fn_ptr(double) > {
    typedef double type;
  };
}

%template() std::result_of< fn_ptr(double) >;

%inline %{

double square(double x) {
  return (x * x);
}

template<class Fun, class Arg>
typename std::result_of<Fun(Arg)>::type test_result_impl(Fun fun, Arg arg) {
  return fun(arg);
}
%}

%template(test_result) test_result_impl< fn_ptr, double >;
%constant double (*SQUARE)(double) = square;
```

```Python
>>> test_result(SQUARE, 5.0)
25.0
```

---

### SWIG: Catching Director Exceptions for Round-Trip Calls

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of combining a normal %exception directive with the director exception handler. This setup allows C++ to catch Swig::DirectorException, ensuring that exceptions occurring in Perl during a round-trip method call (Perl -> C++ -> Perl) are properly propagated back to the original Perl caller.

```SWIG
%exception {
  try { $action }
  catch (Swig::DirectorException &e) { SWIG_fail; }
}
```

---

### Example Output of Language-Specific Test-Suite Run

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the console output when running the test-suite for a specific language, showing individual test cases being checked and indicating which ones include a runtime test.

```Shell
$ make check-python-test-suite
checking python test-suite
checking python testcase argcargvtest (with run test)
checking python testcase python_autodoc
checking python testcase python_append (with run test)
checking python testcase callback (with run test)
```

---

### Node-GYP Configuration for SWIG Extension Build

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Specifies the `binding.gyp` file used by `node-gyp` to build the Node.js extension. It lists the source files (`example.cxx`, `example_wrap.cxx`) required for compilation.

```JSON
{
  "targets": [
    {
      "target_name": "example",
      "sources": [ "example.cxx", "example_wrap.cxx" ]
    }
  ]
}
```

---

### SWIG C++ Compilation Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Demonstrates the typical command-line steps for compiling C++ code with SWIG, including generating wrapper files and linking the final shared library.

```bash
$ swig -c++ -tcl example.i
$ c++ -fPIC -c example_wrap.cxx
$ c++ example_wrap.o $(OBJS) -o example.so
```

---

### Scilab Builder Script (builder.sce) Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Scilab code snippet shows the typical content of a `builder.sce` script generated by SWIG. It defines the library name, source files, external libraries, and a table mapping Scilab function names to their C counterparts, then calls `ilib_build` to create the shared library.

```Scilab
ilib_name = "examplelib";
files = ["example_wrap.c"];
libs = [];
table = ["fact", "_wrap_fact";"Foo_set", "_wrap_Foo_set";"Foo_get", "_wrap_Foo_get";];
ilib_build(ilib_name, table, files, libs);
```

---

### C++ Example Class Foo

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a simple C++ class `Foo` with a public integer member `x` and a public method `bar()`. This class is used as an example for demonstrating smart pointer wrapping with SWIG.

```C++
class Foo {
public:
  int x;
  int bar();
};
```

---

### SWIG Typemap and C++ Class Definition for Return Value Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Defines a SWIG 'out' typemap and an inline C++ struct XX with constructors, assignment operator, and a static 'create' method. This setup is used to demonstrate object lifecycle during return by value, serving as the base code for illustrating SWIG's default behavior versus behavior with the 'optimal' attribute.

```SWIG/C++
%typemap(out) SWIGTYPE %{
  $result = new $1_ltype($1);
%}

%inline %{
#include <iostream>
using namespace std;

struct XX {
  XX() { cout << "XX()" << endl; }
  XX(int i) { cout << "XX(" << i << ")" << endl; }
  XX(const XX &other) { cout << "XX(const XX &)" << endl; }
  XX & operator =(const XX &other) { cout << "operator=(const XX &)" << endl; return *this; }
  ~XX() { cout << "~XX()" << endl; }
  static XX create() {
    return XX(0);
  }
};
%}
```

---

### Example Python Class Definition for Imports

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a simple Python class `M3` within `pkg1/pkg2/mod3.py` to be used as a base class in subsequent import examples.

```Python
class M3: pass
```

---

### Generate Lua Wrappers with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command demonstrates how to run SWIG with the -lua option to generate C/C++ wrapper files (example_wrap.c or example_wrap.cxx) suitable for creating a Lua extension module. The generated file contains low-level wrappers that need to be compiled and linked.

```Shell
$ swig -lua example.i
```

---

### Install ccache-swig via Symbolic Links

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This code demonstrates the recommended method for installing ccache-swig to intercept all compiler calls. It involves copying the ccache-swig executable to a directory in the system's PATH and then creating symbolic links from common compiler names (gcc, g++, cc, swig) to the ccache-swig binary.

```Bash
  cp ccache-swig /usr/local/bin/
  ln -s /usr/local/bin/ccache-swig /usr/local/bin/gcc
  ln -s /usr/local/bin/ccache-swig /usr/local/bin/g++
  ln -s /usr/local/bin/ccache-swig /usr/local/bin/cc
  ln -s /usr/local/bin/ccache-swig /usr/local/bin/swig
```

---

### Define SWIG Module and Function (SWIG/C)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet illustrates how to define a SWIG module named 'example' and wrap a C function 'fact' within it. This directive instructs SWIG to generate a Lua table 'example' containing the wrapped function.

```SWIG
%module example
int fact(int n);
```

---

### Ruby Example Using SWIG Generated Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to use the SWIG-generated Ruby module `example` to call the `fact` function. This code demonstrates the effect of the `int` typemap defined in SWIG, showing how Ruby integers are passed to C.

```Ruby
require 'example'

puts Example.fact(6)
```

---

### Run SWIG Test Suite on Unix

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Execute this command in a Unix-like environment to perform a comprehensive check of the SWIG build. It can be run before or after installation and requires at least one target language to be installed. While failures may occur due to various reasons like missing dependencies or compiler issues, they do not always indicate a critical problem with SWIG itself.

```Shell
$ make -k check
```

---

### SWIG Compilation Warning Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of a warning message generated by SWIG during compilation, specifically demonstrating a 'Warning 501' for an overloaded declaration being ignored.

```SWIG Output
example.i:16: Warning 501: Overloaded declaration ignored.  bar(double)
example.i:15: Warning 501: Previous declaration is bar(int)
```

---

### Build SWIG Python Extension using distutils Commands

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These shell commands demonstrate how to compile a SWIG interface file (example.i) and then build the Python extension module using the setup.py script with distutils. The --inplace flag ensures the compiled module is placed in the current directory.

```Shell
$ swig -python example.i
$ python setup.py build_ext --inplace
```

---

### C++20 Constexpr Destructors Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of a destructor declared as 'constexpr', indicating that SWIG parses and handles such constructs like any other constructor.

```C++
class DtorA {
public:
  constexpr ~DtorA() {}
};
```

---

### SWIG: Example of %insert Directive for Runtime Section

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Demonstrates how to use the %insert directive to embed a block of code directly into the 'runtime' section of the SWIG-generated C/C++ wrapper file.

```SWIG
%insert("runtime") %{
  ... code in runtime section ...
%}
```

---

### SWIG Typemap Warning Output Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Warnings

Provides an example of the output generated when a typemap with an associated warning is triggered, showing the expanded special variables and file/line information.

```SWIG
example.i:23: Warning 901: You are really going to regret this usage of blah * self
example.i:24: Warning 901: You are really going to regret this usage of blah * stuff
```

---

### SWIG MzScheme Module Build and Test Session on OS X

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A comprehensive sequence of shell commands demonstrating the full workflow to compile the C code, generate SWIG wrappers, link the library, and test the module within an MzScheme interactive session on an OS X machine. It highlights steps for 32-bit compilation and proper library placement for MzScheme to load the extension.

```Shell
% swig -mzscheme -declaremodule example.i
% gcc -c -m32 -o example.o example.c # force 32-bit object file (mzscheme is 32-bit only)
% libtool -dynamic -o libexample.dylib example.o # make it into a library
% ls # what've we got so far?
example.c example.o
example.h example_wrap.c
example.i libexample.dylib*
% mzc --cgc --cc example_wrap.c # compile the wrapping code
% LDFLAGS="-L. -lexample" mzc --ld example_wrap.dylib example_wrap.o # ...and link it
% mzscheme -e '(path->string (build-path \"compiled\" \"native\" (system-library-subpath)))'
"compiled/native/i386-macosx/3m"
% mkdir -p compiled/native/i386-macosx/3m # move the extension library to a magic place
% mv example_wrap.dylib compiled/native/i386-macosx/3m/example_ss.dylib
% mzscheme
Welcome to MzScheme v4.2.4 [3m], Copyright (c) 2004-2010 PLT Scheme Inc.
> (require "example.ss")
> (fact 5)
120
> ^D
% echo 'It works!'
```

---

### Generate Python Wrapper for C Extension with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command runs SWIG with the `-python` option on the `example.i` interface file. It generates a C source file (`example_wrap.c`) and a Python source file (`example.py`) for creating a Python extension module from C code.

```Shell
$ swig -python example.i
```

---

### Integrate Native Extension with WebKit on Mac OS X

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Objective-C code demonstrates how to integrate a native extension, 'example', into a WebKit-based application on Mac OS X. It shows how to initialize a JSGlobalContextRef, create a JSObjectRef for the native extension, and expose it to the JavaScript global object within the WebView's context. It also includes loading a local HTML file.

```Objective-C
#import "appDelegate.h"

extern bool example_initialize(JSGlobalContextRef context, JSObjectRef* exports);

@implementation ExampleAppDelegate

@synthesize webView;

- (void)addGlobalObject:(JSContextRef) context:(NSString *)objectName:(JSObjectRef) theObject {
  JSObjectRef global = JSContextGetGlobalObject(context);
  JSStringRef objectJSName = JSStringCreateWithCFString( (CFStringRef) objectName );
  if ( objectJSName != NULL ) {
    JSObjectSetProperty(context, global, objectJSName, theObject, kJSPropertyAttributeReadOnly, NULL);
    JSStringRelease( objectJSName );
  }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

  // Start a webview with the bundled index.html file
  NSString *path = [[NSBundle mainBundle] bundlePath];
  NSString *url =  [NSString stringWithFormat: @"file://%@/Contents/Assets/index.html", path];

  WebFrame *webframe = [webView mainFrame];
  JSGlobalContextRef context = [webframe globalContext];

  JSObjectRef example;
  example_initialize(context, &example);
  [self addGlobalObject:context:@"example":example];

  JSObjectSetProperty(context, global, JSStringRef propertyName, example, JSPropertyAttributes attributes, NULL);

  [ [webView mainFrame] loadRequest:
    [NSURLRequest requestWithURL: [NSURL URLWithString:url] ]
  ];
}

@end
```

---

### Ruby Example: Using SWIG-wrapped SmartPtrFoo

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows an interactive Ruby session demonstrating the usage of a SWIG-wrapped `SmartPtrFoo`. It illustrates creating an instance, accessing the underlying `Foo` object's members (`x`) and methods (`bar()`) directly through the smart pointer instance, mimicking C++ `operator->()` behavior.

```Ruby
irb(main):001:0> p = Example::CreateFoo() # Create a smart-pointer somehow
#<Example::SmartPtrFoo:0x4016f4df>
irb(main):002:0> p.x = 3 # Foo::x
3
irb(main):003:0> p.bar() # Foo::bar
```

---

### Python Script Examples for File I/O with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to interact with C functions exposed via SWIG from a Python script. It shows opening files, reading and writing data, and closing file handles, demonstrating buffer passing as strings and basic file operations.

```Python
>>> f = example.open("Makefile")
>>> example.read(f, 40)
'TOP        = ../..\nSWIG       = $(TOP)/.'
>>> example.read(f, 40)
'./swig\nSRCS       = example.c\nTARGET    '
>>> example.close(f)
0
>>> g = example.open("foo", example.O_WRONLY | example.O_CREAT, 0644)
>>> example.write(g, "Hello world\n")
12
>>> example.write(g, "This is a test\n")
15
>>> example.close(g)
0
>>>
```

---

### Configure SWIG Debugging Arguments in Visual Studio

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example command-line arguments for configuring the SWIG project's debugging properties in Visual Studio, demonstrating how to process an interface file for debugging.

```Batch
-python -c++ -o C:\Temp\doxygen_parsing.cpp C:\swig\Examples\test-suite\doxygen_parsing.i
```

---

### C/C++: Example export_lib.h for API Macro

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of `export_lib.h`, a C/C++ header file that defines `BAR_API` as a preprocessor macro for `__declspec(dllexport)`. This macro is used to consistently mark functions for export from a DLL.

```C/C++

// export_lib.h
#define BAR_API __declspec(dllexport)

```

---

### C: Example Header File for SWIG Interface

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A sample C header file (`header.h`) containing function declarations (`foo`, `bar`, `dump`) that are intended to be wrapped by SWIG. It includes standard libraries like `stdio.h` and `math.h`.

```C
/* File : header.h */

#include <stdio.h>
#include <math.h>

extern int foo(double);
extern double bar(int, int);
extern void dump(FILE *f);
```

---

### SWIG Module Directive Simple Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Modules

A basic example of the %module directive in SWIG, demonstrating how to specify a module name without any additional options. This is the most common usage for defining a SWIG module.

```SWIG
%module mymodule
```

---

### Install Android Application APK via ADB

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

Command to install the generated debug APK of the Android application onto a connected device using ADB. This deploys the app for testing.

```bash
$ adb install bin/SwigSimple-debug.apk
95 KB/s (4834 bytes in 0.049s)
        pkg: /data/local/tmp/SwigSimple-debug.apk
Success
```

---

### Set up Android SDK and NDK environment variables

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

This command sequence sets up the necessary PATH environment variables for Android SDK tools, platform-tools, and NDK. It then creates a new directory 'AndroidApps' and navigates into it, preparing the environment for Android project development.

```Shell
$ export PATH=$HOME/android/android-sdk-linux_x86/tools:$HOME/android/android-sdk-linux_x86/platform-tools:$HOME/android/android-ndk-r6b:$PATH
$ mkdir AndroidApps
$ cd AndroidApps
```

---

### Python Example: Using %cstring_output_allocate Wrapped Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Shows how to call the `foo` function, wrapped by SWIG using %cstring_output_allocate, from Python. The example demonstrates that the C-allocated string is correctly returned as a Python string.

```Python
>>> foo()
'Hello world\n'
>>>
```

---

### Build SWIG with CMake and Visual Studio using PowerShell

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

PowerShell script to configure, build, and install a Release version of SWIG using CMake and Visual Studio 2019. It sets up environment paths for dependencies and includes commands to verify the build.

```PowerShell
cd C:\swig

$env:PATH="C:\Tools\CMake\CMake-win64.3.15.5\bin;C:\Tools\bison\Bison.3.7.4\bin;" + $env:PATH
$PCRE_ROOT="C:\Tools\pcre2\PCRE2.10.39.0"

cmake -G "Visual Studio 16 2019" -A "x64" `
-DCMAKE_INSTALL_PREFIX="C:/swig/install2" `
-DCMAKE_C_FLAGS="/DPCRE2_STATIC" `
-DCMAKE_CXX_FLAGS="/DPCRE2_STATIC" `
-DPCRE2_INCLUDE_DIR="$PCRE_ROOT/include" `
-DPCRE2_LIBRARY="$PCRE_ROOT/lib/pcre2-8-static.lib" `
-S . -B build

cmake --build build --config Release
cmake --install build --config Release

# to test the exe built correctly
cd install2/bin
./swig.exe -version
./swig.exe -help
```

---

### Python Usage Example for SWIG-Wrapped C++ Variadic Templates

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a Python example demonstrating how to instantiate and use the SWIG-wrapped `ClassName` variadic template with different base classes, calling both inherited methods and the variadic instance method, showcasing cross-language interoperability.

```Python
cn0 = ClassName0()
cn0.InstanceMethod()

a = A()
cn1 = ClassName1(a)
cn1.amethod()
cn1.InstanceMethod(a)

b = B()
cn2 = ClassName2(a, b)
cn2.InstanceMethod(a, b)
cn2.amethod()
cn2.bmethod()
```

---

### Install SWIG Build Dependencies via MSYS2 Pacman

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to install essential build packages (git, autoconf, automake, bison, gcc, make, pcre2-devel) required for compiling SWIG within the MSYS2 environment using its pacman package manager.

```Bash
pacman -S git autoconf automake bison gcc make pcre2-devel
```

---

### C++ Uniform Initialization Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus11

Illustrates C++ uniform initialization syntax for structs and classes, showing how it can be used for direct member initialization or constructor calls, and confirming SWIG's full support for this feature.

```C++
struct BasicStruct {
 int x;
 double y;
};

struct AltStruct {
  AltStruct(int x, double y) : x_{x}, y_{y} {}

  int x_;
  double y_;
};

BasicStruct var1{5, 3.2}; // only fills the struct components
AltStruct var2{2, 4.3};   // calls the constructor
```

---

### SWIG: Wrapping vprintf with a Varargs C Wrapper

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a SWIG interface example for wrapping the vprintf function. It demonstrates how to create a simple C wrapper using va_start and va_end, combined with the %varargs directive, to make vprintf callable from target languages despite va_list's opaque nature.

```SWIG
%{
int vprintf(const char *fmt, va_list ap);
%}

%varargs(const char *) my_vprintf;
%rename(vprintf) my_vprintf;

%inline %{
int my_vprintf(const char *fmt, ...) {
  va_list ap;
  int result;

  va_start(ap, fmt);
  result = vprintf(fmt, ap);
  va_end(ap);
  return result;
}
%}
```

---

### Building SWIG Ruby Extensions on Windows with extconf.rb

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet illustrates the command-line process for building a SWIG-generated Ruby extension on Windows 95/NT using an `extconf.rb` script. It involves running `extconf.rb` to generate a Makefile, then using `nmake` to compile and install the extension as a DLL.

```Shell
C:\swigtest> ruby extconf.rb
C:\swigtest> nmake
C:\swigtest> nmake install
```

---

### SWIG and C++ Template Scoping Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Demonstrates valid and ill-formed examples of %template and C++ explicit template instantiations. It covers various namespace and using declaration scenarios to illustrate correct scoping requirements.

```C++
namespace N {
  template<typename T> class C {};
}

// valid
%template(cin) N::C<int>;
template class N::C<int>;

// valid
namespace N {
  %template(cin) C<int>;
  template class C<int>;
}

// valid
using namespace N;
%template(cin) C<int>;
template class C<int>;

// valid
using N::C;
%template(cin) C<int>;
template class C<int>;

// ill-formed
namespace unrelated {
  using N::C;
  %template(cin) C<int>;
  template class C<int>;
}

// ill-formed
namespace unrelated {
  using namespace N;
  %template(cin) C<int>;
  template class C<int>;
}

// ill-formed
namespace unrelated {
  namespace N {
    %template(cin) C<int>;
    template class C<int>;
  }
}

// ill-formed
namespace unrelated {
  %template(cin) N::C<int>;
  template class N::C<int>;
}
```

---

### Generate Scilab Module using SWIG Command Line

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This shell command executes SWIG with the `-scilab` option, instructing it to generate wrapper code for Scilab from the `example.i` interface file. The command produces `example_wrap.c` (the C wrapper source) and `loader.sce` (a Scilab script for loading the module), enabling the C/C++ code to be integrated into Scilab.

```Shell
$ swig -scilab example.i
```

---

### SWIG: Comprehensive Example of Specific Exception Handlers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This comprehensive example demonstrates defining a SWIG module, including header files, and attaching multiple specific exception handlers to different declarations. It shows how to apply handlers to overloaded functions and class members, reducing code bloat and improving modularity.

```SWIG
%module example
%{
#include "someheader.h"
%}

// Define a few exception handlers for specific declarations
%exception Object::allocate(int) {
  try {
    $action
  }
  catch (MemoryError) {
    croak("Out of memory");
  }
}

%exception Object::getitem {
  try {
    $action
  }
  catch (RangeError) {
    croak("Index out of range");
  }
}
...
// Read a raw header file
%include "someheader.h"
```

---

### SWIG Module Definition with C Callback Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet defines a SWIG module named 'example' and enables the director feature. It also includes a C function `binary_op` that takes two integers and a function pointer `op` as arguments, demonstrating a basic callback mechanism.

```SWIG/C
%module(directors="1") example

%{
int binary_op(int a, int b, int (*op)(int, int)) {
  return op(a, b);
}
%}
```

---

### Python Example: Using %cstring_output_allocate_size Wrapped Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Illustrates calling the `foo` function, wrapped by SWIG using %cstring_output_allocate_size, from Python. The example shows that binary C string data is correctly returned as a Python string.

```Python
>>> foo()
'\xa9Y:\xf6\xd7\xe1\x87\xdbH;y\x97\x7f\xd3\x99\x14V\xec\x06\xea\xa2\x88'
>>>
```

---

### Example Output of SWIG Typemap Warning

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of the console output generated when a warning associated with a typemap is triggered. It shows how special variables like $1_type and $1_name are expanded in the warning message.

```console
example.i:23: Warning 901: You are really going to regret this usage of blah * self
example.i:24: Warning 901: You are really going to regret this usage of blah * stuff
```

---

### C++ Ambiguous Overloaded Function Example (pointer vs reference)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of C++ function overloads ('foo(Bar\*)' vs 'foo(Bar&)') that SWIG might struggle to disambiguate.

```C++
void foo(Bar *b);
void foo(Bar &b);
```

---

### Android NDK Build Configuration (Android.mk)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Makefile defines the build configuration for an Android NDK project. It specifies the source files (`example_wrap.cpp`, `example.cpp`), the module name (`example`), and compiler flags (`-frtti`) for creating a shared library (`libexample.so`). This file is essential for compiling C/C++ code for Android using the NDK.

```Makefile
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := example
LOCAL_SRC_FILES := example_wrap.cpp example.cpp
LOCAL_CFLAGS    := -frtti

include $(BUILD_SHARED_LIBRARY)
```

---

### C++ Ambiguous Overloaded Function Example (int vs short)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of C++ function overloads ('spam(int)' vs 'spam(short)') that SWIG might struggle to disambiguate.

```C++
void spam(int);
void spam(short);
```

---

### SWIG Lvalue Type Conversion Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Provides examples of how `SwigType_ltype()` converts complex C types, including arrays and const-qualified types, into their lvalue equivalents suitable for assignment operations.

```C
typedef double Matrix4[4][4];
Matrix4 x;    // type = 'Matrix4', ltype='p.a(4).double'

typedef const char * Literal;
Literal y;    // type = 'Literal', ltype='p.char'
```

---

### SWIG: C Function Declaration Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A straightforward C function declaration (gcd) provided as a basic example. This declaration serves as the input for SWIG to generate a corresponding wrapper function, demonstrating the initial step in the wrapping process.

```C
int gcd(int x, int y);
```

---

### Install SWIG Build Dependencies using Pacman (MSYS2)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Command to install necessary build tools and libraries for SWIG within the MSYS2 environment using the Pacman package manager.

```Pacman
pacman -S git autoconf automake bison gcc make pcre2-devel
```

---

### Example R Error: Function Not Available

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of an error message encountered in R when a SWIG-wrapped function is not correctly loaded or recognized, typically due to a mismatch between the shared library name and the module name.

```R
> fact(4)
Error in .Call("R_swig_fact", s_arg1, as.logical(.copy), PACKAGE = "example") :
  "R_swig_fact" not available for .Call() for package "example"
```

---

### SWIG Typemap Scoping Example (Redefinition)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how typemaps can be redefined for different sections of an input file. This example shows that subsequent declarations are subject to the currently defined typemap, allowing for context-specific type handling.

```SWIG
// typemap1
%typemap(in) int {
  ...
}

int fact(int); // typemap1
int gcd(int x, int y); // typemap1

// typemap2
%typemap(in) int {
  ...
}

int isprime(int); // typemap2
```

---

### Configure Android SDK/NDK Path and Create Project Directory

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet sets up the environment variables for Android SDK and NDK tools, adding them to the system's PATH. It then creates a new directory 'AndroidApps' and navigates into it, preparing the workspace for Android projects.

```Bash
export PATH=$HOME/android/android-sdk-linux_x86/tools:$HOME/android/android-sdk-linux_x86/platform-tools:$HOME/android/android-ndk-r6b:$PATH
mkdir AndroidApps
cd AndroidApps
```

---

### Define Example C++ Class Foo

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This C++ class `Foo` serves as an example object that can be wrapped by a smart pointer. It contains a public integer member `x` and a public method `bar()`.

```C++
class Foo {
public:
  int x;
  int bar();
};
```

---

### Scilab Example: Calling Absolute Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to call the `absolute` function (exposed via SWIG) from Scilab, passing a sample matrix and observing the output.

```Scilab
--> absolute([-0 1 -2; 3 4 -5])
 ans  =

    0.    1.    2.
    3.    4.    5.
```

---

### SWIG Interface for STL Vector and String Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file defines the module 'example' and includes necessary headers. It specifically templates `std::vector<string>` as `StringVector` to make it accessible in OCaml, demonstrating how to wrap STL containers.

```SWIG Interface
 %module example %{
 #include "example.h"
 %}

 %include <stl.i>

 namespace std {
  %template(StringVector) std::vector < string >;
 };

 %include "example.h"
```

---

### SWIG Command for Java Package Generation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command demonstrates how to use SWIG to generate Java wrappers for a C/C++ interface file (`example.i`), placing the generated Java classes into a specific package (`com.bloggs.swig`) and output directory.

```SWIG
swig -java -package com.bloggs.swig -outdir com/bloggs/swig example.i
```

---

### Example Output of Go FooBarGo.FooBar Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows the expected string output when calling the `FooBar` method on an instance of the Go `FooBarGo` class, demonstrating the overridden method behavior.

```Go
Go Foo, Go Bar
```

---

### Interact with Compiled SWIG Lua Module (Bash/Lua)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows an example of interacting with the loaded 'example' module from a Lua interpreter, demonstrating how to call wrapped C functions (gcd), access and modify global variables (Foo).

```Bash
./my_lua
print(example.gcd(4, 6))
print(example.Foo)
example.Foo=4
print(example.Foo)
```

---

### C++ Overloaded Functions Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Provides a C++ example of two functions named `foo` that are overloaded based on their parameter types (int and char\*). SWIG provides partial support for such overloads.

```C++
void foo(int x) {
  printf("x is %d\n", x);
}
void foo(char *x) {
  printf("x is '%s'\n", x);
}
```

---

### C++17 Hexadecimal Floating Literal Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus17

C++17 added support for hexadecimal floating literals. This snippet provides an example of how to define a double-precision floating-point number using this new literal type.

```C++
double f = 0xF.68p2;
```

---

### Example Usage of SWIG-Wrapped Python Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how the set_transform Python function, defined in the previous snippet, can be called with a Python list representing a 2D array, showcasing the high-level interface in action.

```Python
>>> a = [
...   [1, 0, 0, 0],
...   [0, 1, 0, 0],
...   [0, 0, 1, 0],
...   [0, 0, 0, 1]]
>>> set_transform(im, a)
>>>
```

---

### Java Example: Using SWIG-Extended C/C++ Class

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to instantiate and use the `Vector` class in Java after it has been extended using SWIG's `%extend` directive. The example demonstrates calling the custom constructor and the `toString()` method, which were added via SWIG.

```Java
Vector v = new Vector(2, 3, 4);
System.out.println(v);
```

---

### Building PCRE2 Dependency for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Commands to navigate to the SWIG source directory and execute the provided script to build the PCRE2 third-party library as a static dependency.

```Shell
cd /usr/src/swig
Tools/pcre-build.sh
```

---

### SWIG Interface Definition for cdata.i Usage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

This SWIG interface example demonstrates including `carrays.i` and `cdata.i` modules and defining an `intArray` class for array manipulation, setting up for the subsequent Python example.

```SWIG
// SWIG interface
%module example
%include "carrays.i"
%include "cdata.i"

%array_class(int, intArray);
```

---

### SWIG Java Finalizer Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example demonstrating how to modify the `javafinalize` typemap to customize the `finalize` method. This snippet assumes the `delete` method has been renamed to `swig_delete` to prevent conflicts with existing methods.

```Java
protected void finalize() {
  swig_delete();  // renamed to prevent conflict with existing delete method
}
```

---

### Compiling SWIG-Generated OCaml and C Code

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This sequence of commands demonstrates the compilation process for SWIG-generated OCaml and C code. It involves first generating the swig.mli and swig.ml files, then compiling them along with the example_wrap.c (C wrapper) and the OCaml interface and implementation files (example.mli, example.ml). The -ccopt flag is used to pass options to the C compiler.

```Shell
% swig -ocaml -co swig.mli ; swig -ocaml -co swig.ml
% ocamlc -c swig.mli ; ocamlc -c swig.ml
% ocamlc -c -ccopt "-I/usr/include/foo" example_wrap.c
% ocamlc -c example.mli
% ocamlc -c example.ml
```

---

### Build a Python Module with SWIG on Linux

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Introduction

This snippet demonstrates the steps to compile a C source file and its SWIG-generated wrapper into a Python module (`_example.so`) on a Linux system. It includes the SWIG command, GCC compilation, linking, and a Python interactive session showing module import and function calls.

```Shell
$ swig -python example.i
$ gcc -c -fPIC example.c example_wrap.c -I/usr/include/python3.12
$ gcc -shared example.o example_wrap.o -o _example.so
```

```Python
Python 3.12.4 (main, Jun 12 2024, 19:06:53) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import example
>>> example.fact(4)
24
>>> example.my_mod(23, 7)
2
>>> example.cvar.My_variable + 4.5
7.5
```

---

### OCaml Interactive Session with SWIG-Wrapped Qt Classes

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This interactive OCaml session demonstrates the usage of SWIG-wrapped Qt classes. It shows how to create `QApplication` and `QPushButton` instances, call methods like `resize` and `show` on the button, and finally execute the Qt application event loop, resulting in a visible GUI window.

```Bash
bash-2.05a$ ./qt_top
        Objective Caml version 3.06

        Camlp4 Parsing version 3.06
```

```OCaml
# open Swig ;;
# open Qt ;;
# let a = new_QApplication '(0, 0) ;;
val a : Qt.c_obj = C_obj <fun>
# let hello = new_QPushButton '("hi", 0) ;;
val hello : Qt.c_obj = C_obj <fun>
# hello -> resize (100, 30) ;;
- : Qt.c_obj = C_void
# hello -> show () ;;
- : Qt.c_obj = C_void
# a -> exec () ;;
```

---

### Compile and Link SWIG-Generated Module Statically with Python

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command demonstrates how to compile the SWIG-generated C wrapper file (`example_wrap.c`) and the original C source (`example.c`) along with the Python interpreter libraries to create a statically linked Python executable (`mypython`) that includes the extension module. It specifies necessary include and library paths for Python 2.7, linking against core Python libraries.

```Bash
$ swig -python -lembed.i example.i
$ gcc example.c example_wrap.c \
        -Xlinker -export-dynamic \
        -DHAVE_CONFIG_H -I/usr/include/python2.7 \
        -I/usr/lib/python2.7/config-x86_64-linux-gnu \
        -I/usr/lib/python2.7/config \
        -L/usr/lib/python2.7/config -lpython2.7 -lm -ldl \
        -o mypython

```

---

### Android App Deployment with SWIG C++ Integration

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet provides the command-line steps to compile a Java application, uninstall any previously installed version of the Android app, and then install the newly built debug APK. These commands are essential for deploying SWIG-generated Android applications that integrate C++ code.

```Shell
$ ant debug
$ adb uninstall org.swig.classexample
$ adb install bin/SwigClass-debug.apk
```

---

### Example SWIG Generated File Structure

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet illustrates the resulting file structure when using the -outdir and -o options with SWIG, showing the C++ wrapper file in 'cppfiles' and the Python proxy file in 'pyfiles'.

```Text
cppfiles/example_wrap.cpp
pyfiles/example.py
```

---

### Verify Python Stable ABI Conformance with abi3audit (Success Example)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates a successful check of a SWIG-generated Python extension for Stable ABI conformance using the `abi3audit` tool. The shared object is first renamed to include `.abi3.so` as required, and then `abi3audit` is run with the `--assume-minimum-abi3` flag set to 3.4, indicating no ABI violations.

```Shell

~/swig/Examples/python/class $ mv _example.so _example.abi3.so
~/swig/Examples/python/class $ abi3audit --assume-minimum-abi3 3.4 _example.abi3.so
[22:12:18] WARNING  no wheel to infer abi3 version from; assuming (3.4)
[22:12:18] _example.abi3.so: 1 extensions scanned; 0 ABI version mismatches and 0 ABI violations found

```

---

### SWIG Encoded Pointer String Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This snippet shows an example of how a C++ pointer (e.g., `Foo *`) is encoded as a string by SWIG for internal representation, typically in dynamically typed target languages.

```Text
_108e688_p_Foo
```

---

### C `const` Declaration Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Illustrates various forms of `const` declarations in C, showing how `const` can apply to the variable itself, the pointer, or the data being pointed to. These examples clarify SWIG's interpretation of `const` as read-only.

```C
const char a;           // A constant character
char const b;           // A constant character (the same)
char *const c;          // A constant pointer to a character
const char *const d;    // A constant pointer to a constant character
```

---

### SWIG Command for Scilab Builder Mode

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command demonstrates how to use SWIG in builder mode for Scilab. It specifies the Scilab target, activates builder mode, and includes compiler and linker flags for external library dependencies (libfoo) and additional source files (baa1.cxx, baa2.cxx) for the 'example' module.

```Shell
$ swig -scilab -builder -buildercflags -I/opt/foo/include -builderldflags "-L/opt/foo/lib -lfoo" -buildersources baa1.cxx, baa2.cxx example.i
```

---

### Java Usage Example with -noproxy Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to interact with the generated Java module class when proxy classes are disabled (`-noproxy`). This example illustrates object creation, member access (get/set), method calls, and manual memory deallocation using the static functions provided by the module class, highlighting the more C-like interaction style.

```Java
SWIGTYPE_p_Foo foo = example.new_Foo();
example.Foo_x_set(foo, 10);
int var = example.Foo_x_get(foo);
example.Foo_spam(foo, 20, foo);
example.delete_Foo(foo);
```

---

### Python Example Using SWIG cmalloc.i Wrappers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A Python script demonstrating how to use the memory allocation wrappers generated by SWIG from the `cmalloc.i` module. It shows allocation, deallocation, and size retrieval for `int`, `int*`, and `double` types.

```Python
>>> from example import *
>>> a = malloc_int()
>>> a
'_000efa70_p_int'
>>> free_int(a)
>>> b = malloc_intp()
>>> b
'_000efb20_p_p_int'
>>> free_intp(b)
>>> c = calloc_double(50)
>>> c
'_000fab98_p_double'
>>> c = realloc_double(100000)
>>> free_double(c)
>>> print sizeof_double
8
>>>
```

---

### Compile and Install Android App with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

This snippet demonstrates the command-line steps to compile an Android application using Ant, uninstall a previous version of the app, and then install the newly built debug APK. These commands are typically executed in a shell environment after generating Java and C++ code with SWIG.

```Shell
$ ant debug
$ adb uninstall org.swig.classexample
$ adb install bin/SwigClass-debug.apk
```

---

### Output of Ruby SWIG Integer Conversion Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the console output when running the Ruby example that uses the SWIG module. The output includes the debug message from the `printf` statement within the typemap and the final result from the `fact` function.

```Text

Received an integer : 6
720

```

---

### Applying SWIG Typemap Rules with Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This example showcases how SWIG's basic matching rules are applied to different function arguments. It defines various typemaps and then maps specific function declarations to the typemap rule that would be triggered.

```SWIG Typemap
%typemap(in) int *x {
  ... typemap 1
}

%typemap(in) int * {
  ... typemap 2
}

%typemap(in) const int *z {
  ... typemap 3
}

%typemap(in) int [4] {
  ... typemap 4
}

%typemap(in) int [ANY] {
  ... typemap 5
}
```

```C++
void A(int *x);        // int *x rule       (typemap 1)
void B(int *y);        // int * rule        (typemap 2)
void C(const int *x);  // int *x rule       (typemap 1)
void D(const int *z);  // const int *z rule (typemap 3)
void E(int x[4]);      // int [4] rule      (typemap 4)
void F(int x[1000]);   // int [ANY] rule    (typemap 5)
```

---

### Examples of SWIG Typemap Declarations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Provides various examples demonstrating the definition of SWIG typemaps, including simple declarations, typemaps with extra argument names, multiple types, modifiers, multi-argument patterns, and extra pattern parameters.

```SWIG
/* Simple typemap declarations */
%typemap(in) int {
  $1 = PyInt_AsLong($input);
}
%typemap(in) int "$1 = PyInt_AsLong($input);"
%typemap(in) int %{
  $1 = PyInt_AsLong($input);
%}

/* Typemap with extra argument name */
%typemap(in) int nonnegative {
  ...
}

/* Multiple types in one typemap */
%typemap(in) int, short, long {
  $1 = SvIV($input);
}

/* Typemap with modifiers */
%typemap(in, doc="integer") int "$1 = scm_to_int($input);"

/* Typemap applied to patterns of multiple arguments */
%typemap(in) (char *str, int len),
             (char *buffer, int size)
{
  $1 = PyString_AsString($input);
  $2 = PyString_Size($input);
}

/* Typemap with extra pattern parameters */
%typemap(in, numinputs=0) int *output (int temp),
                          long *output (long temp)
{
  $1 = &temp;
}
```

---

### SWIG Generated Java Module Class Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of a SWIG-generated Java module class. This class wraps C/C++ global functions (like `egg`) as static methods, providing static type checking for parameters.

```Java
public class example {
  public static void egg(Foo chips) {
    exampleJNI.egg(Foo.getCPtr(chips), chips);
  }
}
```

---

### SWIG Include Directive Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how one SWIG interface file (FileB.i) can include another (FileA.i) to combine their definitions and fragment inclusions.

```SWIG
// FileB.i
%include "FileA.i"
```

---

### Initial C# Usage Example (Problematic)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

An initial C# example demonstrating the usage of SWIG-generated proxy classes for `Container` and `Element`. This snippet highlights the potential for memory issues when the C# object is garbage collected, leading to a dangling pointer in the C++ layer.

```C#
  Container container = new Container();
  Element element = new Element(20);
  container.setElement(element);
```

---

### Example Output of Python Test-Suite Run

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Illustrates the console output when running the SWIG test-suite specifically for Python, showing the progress and individual testcases being checked, including those with runtime tests.

```Shell
$ make check-python-test-suite
checking python test-suite
checking python testcase argcargvtest (with run test)
checking python testcase python_autodoc
checking python testcase python_append (with run test)
checking python testcase callback (with run test)
```

---

### C Example: print_array Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

A simple C function demonstrating how to iterate and print elements of a fixed-size double array. This function serves as a common example for demonstrating SWIG's array wrapping capabilities.

```C
void print_array(double x[10]) {
  int i;
  for (i = 0; i < 10; i++) {
    printf("[%d] = %g\n", i, x[i]);
  }
}
```

---

### SWIG Example: Wrapping boost::shared_ptr with %shared_ptr Macro

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Provides a comprehensive SWIG interface file example demonstrating the use of `boost::shared_ptr` with the `%shared_ptr(T)` macro. It defines a simple `IntValue` struct and functions that accept both raw and smart pointers, showcasing how SWIG handles the smart pointer types.

```SWIG
%module example
%include <boost_shared_ptr.i>
%shared_ptr(IntValue)

%inline %{
#include <boost/shared_ptr.hpp>

struct IntValue {
  int value;
  IntValue(int v) : value(v) {}
};

static int extractValue(const IntValue &t) {
  return t.value;
}

static int extractValueSmart(boost::shared_ptr<IntValue> t) {
  return t->value;
}
%}
```

---

### Generate Python Wrapper for C++ Extension with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command runs SWIG with both `-c++` and `-python` options on the `example.i` interface file. It generates a C++ source file (`example_wrap.cxx`) and a Python source file (`example.py`) for creating a Python extension module from C++ code.

```Shell
$ swig -c++ -python example.i
```

---

### SWIG Import Directive Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates the use of %import, which is for collecting type information and does not result in code generation, unlike %include.

```SWIG
// FileC.i
%import "FileA.i"
```

---

### C++ Function Signature for Exception Handling Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This C++ function signature demonstrates a function with C++ exception specifications, serving as an example for SWIG's 'throw' typemap which handles C++ exceptions.

```C++
int foo(int x, double y, char *s) throw(MemoryError, IndexError);
```

---

### SWIG Wrapper for execlp with Variable Arguments using libffi

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG example demonstrates how to wrap the C `execlp` function, which accepts a variable number of arguments, using the `libffi` library. It includes a `typemap` to convert Python tuple arguments into a C array of strings and a `feature("action")` block to dynamically construct and invoke the `execlp` call using `libffi`'s `ffi_prep_cif` and `ffi_call`.

```SWIG
/* Take an arbitrary number of extra arguments and place into an array
   of strings */

%typemap(in) (...) {
  char **argv;
  int    argc;
  int    i;

  argc = PyTuple_Size(varargs);
  argv = (char **) malloc(sizeof(char *)*(argc+1));
  for (i = 0; i < argc; i++) {
    PyObject *o = PyTuple_GetItem(varargs, i);
    if (!PyString_Check(o)) {
      free(argv);
      PyErr_SetString(PyExc_ValueError, "Expected a string");
      SWIG_fail;
    }
    argv[i] = PyString_AsString(o);
  }
  argv[i] = NULL;
  $1 = (void *) argv;
}

/* Rewrite the function call, using libffi */

%feature("action") execlp {
  int       i, vc;
  ffi_cif   cif;
  ffi_type  **types;
  void      **values;
  char      **args;

  vc = PyTuple_Size(varargs);
  types  = (ffi_type **) malloc((vc+3)*sizeof(ffi_type *));
  values = (void **) malloc((vc+3)*sizeof(void *));
  args   = (char **) arg3;

  /* Set up path parameter */
  types[0] = &ffi_type_pointer;
  values[0] = &arg1;

  /* Set up first argument */
  types[1] = &ffi_type_pointer;
  values[1] = &arg2;

  /* Set up rest of parameters */
  for (i = 0; i <= vc; i++) {
    types[2+i] = &ffi_type_pointer;
    values[2+i] = &args[i];
  }
  if (ffi_prep_cif(&cif, FFI_DEFAULT_ABI, vc+3,
                   &ffi_type_uint, types) == FFI_OK) {
    ffi_call(&cif, (void (*)()) execlp, &result, values);
  } else {
    free(types);
    free(values);
    free(arg3);
    PyErr_SetString(PyExc_RuntimeError, "Whoa!!!!!");
    SWIG_fail;
  }
  free(types);
  free(values);
  free(arg3);
}

/* Declare the function. Whew! */
int execlp(const char *path, const char *arg1, ...);
```

---

### SWIG Typemap Matching Precedence Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

An example demonstrating SWIG's typemap matching rules, showing how the most specialized typemap (e.g., const Hello &) is chosen over more generic SWIGTYPE rules for a given enum type.

```SWIG Typemap
%typemap(in) const Hello &          { ... }
%typemap(in) const enum SWIGTYPE &  { ... }
%typemap(in) enum SWIGTYPE &        { ... }
%typemap(in) SWIGTYPE &             { ... }
%typemap(in) SWIGTYPE               { ... }

enum Hello {};
const Hello &hi;
```

---

### Node-webkit Application Logic (app.js)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This JavaScript snippet (app.js) demonstrates how to interact with a native extension ('example') within a node-webkit environment. It uses 'require' to load the module, calls a native function ('gcd'), and updates the DOM with the results upon window load.

```JavaScript
window.onload = function() {
  var example = require("example");
  var x = 18;
  var y = 24;
  var z = example.gcd(x, y);
  document.querySelector('#x').innerHTML = x;
  document.querySelector('#y').innerHTML = y;
  document.querySelector('#z').innerHTML = z;
};
```

---

### Define SWIG Interface for C Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file (`example.i`) defines a module named 'example' and includes the 'example.h' header. It declares the 'fact' function from the C code, making it available for wrapping by SWIG.

```SWIG
/* File: example.i */
%module example

%{
#include "example.h"
%}

int fact(int n);
```

---

### Tcl Example: Loading SWIG Module and Calling `fact` Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Tcl snippet demonstrates loading the compiled SWIG module (`example.so`) and calling the `fact` function. It shows the output from the `printf` statement within the typemap and the function's return value, illustrating the typemap's effect during runtime.

```Tcl
% load ./example.so
% fact 6
Received an integer : 6
720
```

---

### C++ Class Definition for SWIG Wrapping Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This is a simple C++ class definition that serves as an example for demonstrating SWIG's code generation process. It defines a class `Foo` with a virtual member function `bar`, which SWIG will process to generate wrapper code.

```C++
class Foo {
public:
  virtual int *bar(int x);
};
```

---

### Generate Java Wrappers from C++ using SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Executes the SWIG command to process the 'example.i' interface file, generating Java wrapper classes and a C++ wrapper file ('example_wrap.cpp') for the defined C++ classes.

```Shell
$ swig -c++ -java -package org.swig.classexample -outdir src/org/swig/classexample -o jni/example_wrap.cpp jni/example.i
```

---

### C/C++ `read` and `write` Function Signatures Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Presents the C/C++ function signatures for `read` and `write` system calls. These functions are used as examples to demonstrate how multi-argument typemaps can transform their Python wrapping into a more natural and user-friendly interface.

```C++
typedef unsigned int size_t;

int read(int fd, void *rbuffer, size_t len);
int write(int fd, void *wbuffer, size_t len);
```

---

### SWIG Global Variable Mapping Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how SWIG maps C/C++ global variables into scripting language variables. The example shows defining a `double` global variable `foo` within a SWIG interface file and its subsequent access and manipulation in Tcl.

```SWIG
%module example
double foo;
```

```Tcl
# Tcl
set foo [3.5]                   ;# Set foo to 3.5
puts $foo                       ;# Print the value of foo
```

---

### Example Doxygen Comment with Structural Indicators

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This code snippet provides an example of a Doxygen comment block, demonstrating the use of structural indicators like \param, \author, and \return. These "blobs" of Doxygen are parsed by SWIG and passed to the Doxygen Translator module for further processing.

```C++
/*! This is describing function Foo
 \param x some random variable
 \author Bob
 \return Foo
 */
```

---

### Python Example: Using SWIG-Generated Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to import and use the `fact` function from a SWIG-generated Python module, showing the output from the C typemap.

```Python
>>> from example import *
>>> fact(6)
Received an integer : 6
720
```

---

### Configure SWIG Module with Command Line Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates using SWIG command-line options like -prefix for prepending a module path or -globalmodule to wrap everything directly into Ruby's global module, affecting how C/C++ elements are exposed.

```Shell
$ swig -ruby -prefix "foo::bar::" example.i
```

```Shell
$ swig -ruby -globalmodule example.i
```

---

### SWIG Interface Macro Naming Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

Examples demonstrating how different SWIG interface macros and string formatting functions affect the generated Java proxy and interface class names for a C++ class named 'Base'.

```APIDOC
Example Usage: %interface(Base)
  Proxy Class Name: Base
  Interface Class Name: BaseSwigInterface
Example Usage: %interface_impl(Base)
  Proxy Class Name: BaseSwigImpl
  Interface Class Name: Base
Example Usage: %interface_custom("BaseProxy", "IBase", Base)
  Proxy Class Name: BaseProxy
  Interface Class Name: IBase
Example Usage: %interface_custom("%sProxy", "IBase", Base)
  Proxy Class Name: BaseProxy
  Interface Class Name: IBase
Example Usage: %interface_custom("%sProxy", "%sInterface", Base)
  Proxy Class Name: BaseProxy
  Interface Class Name: BaseProxyInterface
Example Usage: %interface_custom("%sProxy", "%(rstrip:[Proxy])sInterface", Base)
  Proxy Class Name: BaseProxy
  Interface Class Name: BaseInterface
```

---

### Guile Dynamic Module Loading (Newer Method)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the shorthand procedure available in newer Guile versions for loading and initializing a SWIG-generated shared library module. This simplifies the process of integrating C-level bindings into Guile.

```Guile/Scheme
(load-extension "./libfoo.so" "scm_init_my_modules_foo_module")
```

---

### Define Example C++ Class Foo

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a simple C++ class `Foo` with a public integer member `x` and a public method `bar()` to be used with smart pointers.

```C++
class Foo {
public:
  int x;
  int bar();
};
```

---

### Java Usage Example for SWIG Wrapped Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This Java code demonstrates how to call the `fact` function, which was originally a C function wrapped by SWIG, from Java. The function is accessed as a static method of the `example` module class.

```Java
System.out.println(example.fact(4));
```

---

### Display SWIG C# Module Help Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command is used to display all available command-line options specific to the C# module within SWIG. It provides a quick reference for configuring C# wrapper generation.

```bash
swig -csharp -help
```

---

### C/C++: `strcat` Function Signature Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Presents the signature of the `strcat` function, used as an example to illustrate the dangers of modifying `char *` arguments that point to internal interpreter string data when bridging C with scripting languages via SWIG.

```C/C++
char *strcat(char *s, const char *t)
```

---

### View SWIG Lua-Specific Command-Line Help

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command displays a list of all additional command-line options specifically available for Lua module generation in SWIG, providing quick reference for configuration.

```Shell
swig -lua -help
```

---

### SWIG Interface File Example with Module and C Code

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This SWIG interface file defines a module named 'example' and includes an embedded C function set_value. This structure is typical for SWIG projects, demonstrating how C code can be directly incorporated and exposed through the SWIG interface.

```SWIG
%module example

%{
void set_value(const char* val) {}
%}
```

---

### SWIG: C Struct Declaration Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A simple C typedef struct declaration, my_struct, containing an integer and a character pointer. This struct is used as an example to demonstrate how SWIG handles C struct wrapping and how the %extend directive can be applied to it.

```C
typedef struct {
  int x;
  char *str;
} my_struct;
```

---

### Example C Function Definition for SWIG Mapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A sample C function demonstrating various primitive and non-primitive parameter types that will be mapped by SWIG.

```C
void func(unsigned short a, char *b, const long &c, unsigned long long d);
```

---

### SWIG Typemap Matching Rule Application Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how SWIG applies its basic typemap matching rules to different function arguments, showing which specific typemap is selected based on the defined rules, including exact matches, qualifier stripping, and array generics.

```SWIG
%typemap(in) int *x {
  ... typemap 1
}

%typemap(in) int * {
  ... typemap 2
}

%typemap(in) const int *z {
  ... typemap 3
}

%typemap(in) int [4] {
  ... typemap 4
}

%typemap(in) int [ANY] {
  ... typemap 5
}

void A(int *x);        // int *x rule       (typemap 1)
void B(int *y);        // int * rule        (typemap 2)
void C(const int *x);  // int *x rule       (typemap 1)
void D(const int *z);  // const int *z rule (typemap 3)
void E(int x[4]);      // int [4] rule      (typemap 4)
void F(int x[1000]);   // int [ANY] rule    (typemap 5)
```

---

### SWIG Typemap Example: Initial Bloated 'in' Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of a long 'in' typemap for MyClass\* that contains repetitive marshalling code, leading to code bloat when used multiple times across different typemaps.

```SWIG
%typemap(in) MyClass * {
  MyClass *value = 0;

  ... many lines of marshalling code  ...

  $result = value;
}
```

---

### Makefile for SWIG C/C++ to Java Integration

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Makefile demonstrates how to compile C source code, generate SWIG wrappers, and link them into a Windows DLL for use with Java. It includes definitions for source files, interface files, compiler/linker paths, and build commands for `swig`, `cl.exe`, `link.exe`, and `javac`.

```Makefile
SRCS          = example.c
IFILE         = example
INTERFACE     = $(IFILE).i
WRAPFILE      = $(IFILE)_wrap.c

# Location of the Visual C++ tools (32 bit assumed)

TOOLS         = c:\msdev
TARGET        = example.dll
CC            = $(TOOLS)\bin\cl.exe
LINK          = $(TOOLS)\bin\link.exe
INCLUDE32     = -I$(TOOLS)\include
MACHINE       = IX86

# C Library needed to build a DLL

DLLIBC        = msvcrt.lib oldnames.lib

# Windows libraries that are apparently needed
WINLIB        = kernel32.lib advapi32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib

# Libraries common to all DLLs
LIBS          = $(DLLIBC) $(WINLIB)

# Linker options
LOPT      = -debug:full -debugtype:cv /NODEFAULTLIB /RELEASE /NOLOGO \
             /MACHINE:$(MACHINE) -entry:_DllMainCRTStartup@12 -dll

# C compiler flags

CFLAGS        = /Z7 /Od /c /nologo
JAVA_INCLUDE    = -ID:\jdk1.3\include -ID:\jdk1.3\include\win32

java::
        swig -java -o $(WRAPFILE) $(INTERFACE)
        $(CC) $(CFLAGS) $(JAVA_INCLUDE) $(SRCS) $(WRAPFILE)
        set LIB=$(TOOLS)\lib
        $(LINK) $(LOPT) -out:example.dll $(LIBS) example.obj example_wrap.obj
        javac *.java
```

---

### Android NDK Build Command Execution and Output

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet illustrates the typical console output when executing the `ndk-build` command. It details the compilation process for C++ source files, the creation of a static library, and the final generation and installation of the shared object library (`libexample.so`) into the Android project's `libs` directory, confirming a successful build.

```Shell
$ ndk-build
Compile++ thumb  : example <= example_wrap.cpp
Compile++ thumb  : example <= example.cpp
StaticLibrary  : libstdc++.a
SharedLibrary  : libexample.so
Install        : libexample.so => libs/armeabi/libexample.so
```

---

### SWIG Interface File for C Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Introduction

The SWIG interface file (.i) defines the C functions and variables to be exposed to target scripting languages. It uses the %module directive to name the module and the %{ %} block for embedding additional C declarations into the generated wrapper code.

```SWIG
/* File : example.i */
%module example
%{
/* Put headers and other declarations here */
extern double My_variable;
extern int    fact(int);
extern int    my_mod(int n, int m);
%}

extern double My_variable;
extern int    fact(int);
extern int    my_mod(int n, int m);
```

---

### C++ Example: Vehicle Class Definition

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A simple C++ class definition for 'Vehicle' with private members, public methods, and constructors. This class serves as an example for SWIG's C++ class wrapping capabilities in R.

```C++
class Vehicle {
private:
  int m_axles;

public:
  int Axles() {
    return(m_axles);
  }

  bool Available;

  Vehicle() {
    Available=false;
    m_axles=2;
  }

  Vehicle(int ax) {
    Available=false;
    m_axles=ax;
  }
};
```

---

### Java Code to Call Native C/C++ Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java code demonstrates how to call native C/C++ functions exposed via SWIG. It includes a `nativeCall` method that uses `example.gcd()` and manipulates a global variable `example.getFoo()`/`example.setFoo()`. A static constructor `System.loadLibrary("example")` is used to load the compiled JNI shared library.

```java
    /** Calls into C/C++ code */
    public void nativeCall()
    {
      // Call our gcd() function

      int x = 42;
      int y = 105;
      int g = example.gcd(x, y);
      outputText.append("The greatest common divisor of " + x + " and " + y + " is " + g + "\n");

      // Manipulate the Foo global variable

      // Output its current value
      double foo = example.getFoo();
      outputText.append("Foo = " + foo + "\n");

      // Change its value
      example.setFoo(3.1415926);

      // See if the change took effect
      outputText.append("Foo = " + example.getFoo() + "\n");

      // Restore value
      example.setFoo(foo);
    }

    /** static constructor */
    static {
        System.loadLibrary("example");
    }
```

---

### C functions demonstrating pointer parameters for I/O

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates common C function patterns where parameters are passed as simple pointers for input or output, requiring special handling when binding to other languages.

```C
void add(int x, int y, int *result) {
  *result = x + y;
}
```

```C
int sub(int *x, int *y) {
  return *x-*y;
}
```

---

### Example Output of SWIG Generated Function Wrapper Details

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet displays example output generated by the `Python::functionWrapper` method, illustrating the format of the debugging or informational lines written to the SWIG wrapper file. It shows how function signatures and their corresponding actions are logged for various wrapped functions like `delete_Shape` and `Shape_x_set`.

```Output
functionWrapper   : void delete_Shape(Shape *self)
           action : delete arg1;

functionWrapper   : void Shape_x_set(Shape *self, double x)
           action : if (arg1) (arg1)->x = arg2;

functionWrapper   : double Shape_x_get(Shape *self)
           action : result = (double) ((arg1)->x);

functionWrapper   : void Shape_y_set(Shape *self, double y)
           action : if (arg1) (arg1)->y = arg2;
...
```

---

### SWIG Interface File for C/C++ Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file (`example.i`) defines a module named `swigexample`. It includes a C/C++ header file (`example.h`) and declares a C function `gcd` and an external C global variable `Foo` for wrapping with SWIG.

```SWIG
%module swigexample
%{
#include "example.h"
%}
int gcd(int x, int y);
extern double Foo;
```

---

### SWIG Variadic Templates Python Usage Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus11

Provides a Python example demonstrating the usage of variadic template classes wrapped by SWIG. It shows how to instantiate 'ClassName0', 'ClassName1', and 'ClassName2' and call their respective methods, including inherited methods and variadic instance methods.

```Python
cn0 = ClassName0()
cn0.InstanceMethod()

a = A()
cn1 = ClassName1(a)
cn1.amethod()
cn1.InstanceMethod(a)

b = B()
cn2 = ClassName2(a, b)
cn2.InstanceMethod(a, b)
cn2.amethod()
cn2.bmethod()
```

---

### Generate Tcl Wrapper for C Code with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command runs SWIG to generate a Tcl wrapper file (example_wrap.c) for a C interface file. The output file contains the necessary code to build a Tcl extension module.

```Shell
$ swig -tcl example.i
```

---

### Define a SWIG module for Javascript

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file defines a simple module named 'example' that exposes a C function 'gcd' and a global variable 'Foo'. This module will be processed by SWIG to generate language-specific wrappers for Javascript.

```SWIG
%module example
%{
#include "example.h"
%}
int gcd(int x, int y);
extern double Foo;
```

---

### SWIG Wrapping of C/C++ Pointer and Reference Parameters

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Covers various techniques for wrapping C/C++ functions that use pointers or references for input, output, or in-out parameters using SWIG's `typemaps.i` library. It includes C function definitions, SWIG interface files, and corresponding Java usage examples.

```C
void add(int x, int y, int *result) {
  *result = x + y;
}
```

```C
int sub(int *x, int *y) {
  return *x-*y;
}
```

```SWIG
%module example
%include "typemaps.i"

void add(int, int, int *OUTPUT);
int  sub(int *INPUT, int *INPUT);
```

```Java
int result = example.sub(7, 4);
System.out.println("7 - 4 = " + result);
int[] sum = {0};
example.add(3, 4, sum);
System.out.println("3 + 4 = " + sum[0]);
```

```Text
7 - 4 = 3
3 + 4 = 7
```

```SWIG
%module example
%include "typemaps.i"

%apply int *OUTPUT { int *result };
%apply int *INPUT  { int *x, int *y};

void add(int x, int y, int *result);
int  sub(int *x, int *y);
```

```C
void negate(int *x) {
  *x = -(*x);
}
```

```SWIG
%include "typemaps.i"
...
void negate(int *INOUT);
```

```Java
int[] neg = {3};
example.negate(neg);
System.out.println("Negative of 3 = " + neg[0]);
```

```Text
Negative of 3 = -3
```

```SWIG
void negate(int &INOUT);
```

---

### Execute Code During PHP Module Initialization with SWIG Pragmas

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Explains how to use the %init or %minit pragmas to insert C code that will be executed during the PHP module's initialization phase (PHP_MINIT_FUNCTION). This is useful for one-time setup tasks.

```SWIG
%module example;
%init {
  zend_printf(\"Inserted into PHP_MINIT_FUNCTION\\n\");
}
%minit {
  zend_printf(\"Inserted into PHP_MINIT_FUNCTION\\n\");
}

```

---

### SWIG Special Variable and Macro Combination (C# Example)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates how special variables are expanded _before_ being used within special variable macros. It shows a sequence of SWIG typemap definitions, demonstrating the step-by-step expansion of `$*1_ltype` within `$typemap(cstype, $*1_ltype)` to ultimately resolve to `uint`, showcasing the order of expansion.

```SWIG
%typemap(cstype) unsigned int "uint"
%typemap(cstype, out="$typemap(cstype, $*1_ltype)") unsigned int& "$typemap(cstype, $*1_ltype)"
```

```SWIG
%typemap(cstype) unsigned int "uint"
%typemap(cstype, out="$typemap(cstype, unsigned int)") unsigned int& "$typemap(cstype, unsigned int)"
```

```SWIG
%typemap(cstype) unsigned int "uint"
%typemap(cstype, out="uint") unsigned int& "uint"
```

---

### Example SWIG Generated File Structure

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

This snippet illustrates the file structure generated by SWIG when using the `-outdir` and `-o` options. It shows the C++ wrapper file placed in `cppfiles/` and the Python proxy file in `pyfiles/`, demonstrating organized output.

```text
cppfiles/example_wrap.cpp
pyfiles/example.py
```

---

### SWIG Global Object Initialization for C# and Java

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Provides an alternative initialization method for language backends like C# or Java that lack direct module initialization functions. It shows how to define a static global object whose constructor performs the necessary setup.

```SWIG
%init %{
  static struct MyInit { MyInit() { init_variables(); } } myInit;
%}
```

---

### Tcl Examples: Using the Custom Array Interface

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the usage of the `Array` Tcl procedure to create and manipulate both `double` and `int` arrays. It demonstrates how to initialize, set individual elements, retrieve elements, and destroy the array objects, showcasing the unified interface.

```Tcl
set a [Array double 100]                   ;# Create a double [100]
for {set i 0} {$i < 100} {incr i 1} {      ;# Clear the array
        $a set $i 0.0
}
$a set 3 3.1455                            ;# Set an individual element
set b [$a get 10]                          ;# Retrieve an element

set ia [Array int 50]                      ;# Create an int[50]
for {set i 0} {$i < 50} {incr i 1} {       ;# Clear it
        $ia set $i 0
}
$ia set 3 7                                ;# Set an individual element
set ib [$ia get 10]                        ;# Get an individual element

$a delete                                  ;# Destroy a
$ia delete                                 ;# Destroy ia
```

---

### SWIG Java Pragma: Injecting Static Block into JNI Class

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates the use of the `jniclasscode` pragma to inject a static block into the generated intermediary JNI class. This example shows how to load a native shared library ('example') and handle potential 'UnsatisfiedLinkError'.

```SWIG
%pragma(java) jniclasscode=%{
  static {
    try {
      System.loadLibrary("example");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native code library failed to load. \n" + e);
      System.exit(1);
    }
  }
%}
```

---

### C Function to Print Integer Array (SWIG Example)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C code defines a 'printArray' function that takes an integer array and its length, then prints its contents to the console. It is part of a SWIG inline module example demonstrating array handling.

```C
%module example

%#include <stdio.h>

%inline %{

void printArray(int values[], int len) {
  int i = 0;
  for (i = 0; i < len; i++) {
    printf("%s %d %s", i==0?"[":"", values[i], i==len-1?"]\n":"");
  }
}
%}
```

---

### SWIG Typemap Matching Precedence Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates SWIG's typemap matching precedence, where the most specific typemap is chosen over more generic ones. It shows a set of `typemap(in)` definitions for `Hello` and `SWIGTYPE` along with a C++ enum and variable declaration, illustrating how `const Hello &` is preferred for `const Hello &hi`.

```SWIG
%typemap(in) const Hello &          { ... }
%typemap(in) const enum SWIGTYPE &  { ... }
%typemap(in) enum SWIGTYPE &        { ... }
%typemap(in) SWIGTYPE &             { ... }
%typemap(in) SWIGTYPE               { ... }
```

```C++
enum Hello {};
const Hello &hi;
```

---

### Display SWIG Scilab Help Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command shows how to display the Scilab-specific command-line options for SWIG directly from the terminal, providing a quick reference for available flags.

```Bash
$ swig -scilab -help
```

---

### Example Output of C++ FooBarCpp::FooBar Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows the expected string output when calling the `FooBar` method on an instance of the C++ `FooBarCpp` class, demonstrating its method behavior.

```C++
C++ Foo, C++ Bar
```

---

### SWIG %naturalvar Directive Usage Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides various examples of using the `%naturalvar` directive to apply const reference typemaps: globally to all non-primitive types, to a specific type ('List'), or to a specific member variable ('Foo::myList').

```SWIG
// All List variables will use const List& typemaps
%naturalvar List;

// Only Foo::myList will use const List& typemaps
%naturalvar Foo::myList;
struct Foo {
  List myList;
};

// All non-primitive types will use const reference typemaps
%naturalvar;
```

---

### SWIG Go Module Command-line Options Reference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This section details the specific command-line options available for SWIG's Go module. Each option controls aspects of code generation, such as CGO integration, integer size, target Go compiler (Go distribution vs. gccgo), package naming, shared library usage, and import path prefixes.

```APIDOC
swig -go -help

Go-specific options:
-cgo: Generate files to be used as input for the Go cgo tool. This is the default.
-no-cgo: This option is no longer supported.
-intgosize <s>: Set the size for the Go type int. The <s> argument should be 32 or 64. This controls the size that the C/C++ code expects to see. Optional in SWIG 4.1.0+, defaults to C pointer size.
-gccgo: Generate code for gccgo. The default is to generate code for the Go compiler of the Go distribution.
-package <name>: Set the name of the Go package to <name>. The default package name is the SWIG module name.
-use-shlib: Tell SWIG to emit code that uses a shared library. This is only meaningful for the Go compiler of the Go distribution.
-soname <name>: Set the runtime name of the shared library that the dynamic linker should include at runtime. The default is the package name with ".so" appended. Used when generating code for the Go compiler of the Go distribution; implies -use-shlib.
-go-pkgpath <pkgpath>: When generating code for gccgo, set the pkgpath to use. Corresponds to the -fgo-pkgpath option to gccgo.
-go-prefix <prefix>: When generating code for gccgo, set the prefix to use. Corresponds to the -fgo-prefix option to gccgo. If -go-pkgpath is used, -go-prefix will be ignored.
-import-prefix <prefix>: A prefix to add when turning a %import prefix in the SWIG interface file into an import statement in the Go file.
```

---

### Implementing General Error Handling for All SWIG Wrapper Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of a generic %exception block that applies to all SWIG-generated wrapper functions, checking for a global error state and raising a Python RuntimeError.

```SWIG
%exception {
  $action
  if (err_occurred()) {
    PyErr_SetString(PyExc_RuntimeError, err_message());
    SWIG_fail;
  }
}
```

---

### SWIG: Regex Renaming for Prefix Removal and Capitalization

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of using the `regex` function to apply a Perl-like regular expression substitution. This specific example removes any alphabetic prefix before an underscore and capitalizes the remaining part using back-references and case conversion escape sequences.

```SWIG
%rename("regex:/(\\w+)\_(.)/\\u\\2/")
```

---

### SWIG: Running SWIG with All Warnings Enabled

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Command to run SWIG with the -Wall flag, which enables all warnings, including those for abstract classes, to help diagnose missing constructor wrappers.

```SWIG
% swig -Wall -python module.i
```

---

### C++ Namespace Definition Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Illustrates a basic C++ namespace `math` containing functions and a class, demonstrating how common functionality can be encapsulated.

```C++
namespace math {
  double sin(double);
  double cos(double);

  class Complex {
    double im, re;
  public:
    ...
  };
  ...
};
```

---

### C Example: Illustrating String Mutation with get_path

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C code snippet demonstrates a function `get_path` that mutates a string argument to output path data. It highlights a potential buffer overflow issue due to the use of `sprintf` without bounds checking. This function serves as a problematic example that the `cstring.i` macros aim to address.

```C
void get_path(char *s) {
  // Potential buffer overflow---uh, oh.
  sprintf(s, "%s/%s", base_directory, sub_directory);
}
...
// Somewhere else in the C program
{
  char path[1024];
  ...
  get_path(path);
  ...
}
```

---

### Execute SWIG Director Example in Java

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java code instantiates the `DirectorDerived` class and passes it to the C++ `callup` function via the SWIG `example` module. This demonstrates how a Java object can be used polymorphically in C++ through SWIG directors, triggering the overridden Java method.

```Java
DirectorDerived director = new DirectorDerived();
example.callup(director);
```

---

### C# Example Simulating Garbage Collection Impact

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Expands on the C# example by explicitly invoking garbage collection. This demonstrates how the `Element` object can be prematurely collected, resulting in a dangling pointer in the C++ layer and potentially incorrect or random values when accessed.

```C#
  Container container = new Container();
  Element element = new Element(20);
  container.setElement(element);
  global::System.Console.WriteLine("element.value: " + container.getElement().value);
  // Simulate a garbage collection
  global::System.GC.Collect();
  global::System.GC.WaitForPendingFinalizers();
  global::System.Console.WriteLine("element.value: " + container.getElement().value);
```

---

### SWIG Left-Most Typemap Reduction Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows example type signatures (`foo<int, int> *x` and `foo<int, int> *`) to illustrate the concept of typemap reductions being applied to the left-most type first. It highlights the specific type patterns SWIG considers for reduction.

```SWIG/C++
foo<int, int> *x
foo<int, int> *
```

---

### SWIG Typedef Relation Trees Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Visual representation of the type relation trees constructed by SWIG from the provided typedef declarations, showing how different aliases point to base types and how pointers are represented.

```text
                 int               p.Integer
               ^  ^  ^                 ^
              /   |   \                |
             /    |    \               |
        Integer  Size   Number    IntegerPtr
```

---

### Compiling SWIG Executable

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Commands to navigate to the SWIG source directory and initiate the standard Autotools build process to compile the SWIG executable.

```Shell
cd /usr/src/swig
./autogen.sh
./configure
make
```

---

### SWIG: Standard Code Insertion Sections with Macro Directives

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Shows the common macro directives (%begin, %runtime, %header, %wrapper, %init) used to insert code into the five main sections of a SWIG-generated C/C++ wrapper file, illustrating the typical structure and order.

```SWIG/C
%begin %{
  ... code in begin section ...
%}

%runtime %{
  ... code in runtime section ...
%}

%header %{
  ... code in header section ...
%}

%wrapper %{
  ... code in wrapper section ...
%}

%init %{
  ... code in init section ...
%}
```

---

### C# Example Demonstrating Dangling Pointer with Garbage Collection

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

This C# example explicitly simulates garbage collection to illustrate how a `Container` holding a shallow copy of an `Element` can end up with a dangling pointer, resulting in an unexpected value after the `Element` is collected.

```C#
  Container container = new Container();
  Element element = new Element(20);
  container.setElement(element);
  global::System.Console.WriteLine("element.value: " + container.getElement().value);
  // Simulate a garbage collection
  global::System.GC.Collect();
  global::System.GC.WaitForPendingFinalizers();
  global::System.Console.WriteLine("element.value: " + container.getElement().value);
```

---

### C/C++: Example bar.h Using API Macro

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows `bar.h`, a C/C++ header file that includes `export_lib.h` and uses the `BAR_API` macro to declare `bar_function`. This demonstrates how the API macro is applied in standard C/C++ function declarations.

```C/C++

// bar.h
#include "export_lib.h"
BAR_API void bar_function(int, double);

```

---

### Prepare Source Directory in MSYS2 Environment

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Bash commands to create and navigate into the /usr/src/ directory within the MSYS2 shell, preparing the location for the SWIG source code.

```Bash
mkdir /usr/src/
cd /usr/src/
```

---

### SWIG Fragment Inclusion in Extend Block with C++ Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Provides a practical example of defining a fragment for a C header and then forcing its inclusion within an %extend block of a C++ struct. This demonstrates how fragments can provide necessary definitions (like SHRT_MIN) for extended functionality.

```SWIG
%fragment("<limits.h>", "header") %{
  #include <limits.h>
%}

struct X {
  ...
  %extend {
    %fragment("<limits.h>");
    bool check(short val) {
      if (val < SHRT_MIN /*defined in <limits.h>*/) {
        return true;
      } else {
        return false;
      }
    }
  }
};
```

---

### Python Absolute Import Syntax Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates importing a module using its full absolute package path in Python. This is the default import behavior in Python 3 and is generally recommended for clarity and avoiding ambiguity.

```Python
# pkg1/mod2.py
import pkg1.pkg2.mod3
class M2(pkg1.pkg2.mod3.M3): pass
```

---

### Collection of C++ Overloaded Methods

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A comprehensive example demonstrating various overloaded C++ methods with different argument counts and types, used to illustrate SWIG's ranking process.

```C++
void foo(double);
void foo(int);
void foo(Bar *);
void foo();
void foo(int x, int y, int z, int w);
void foo(int x, int y, int z = 3);
void foo(double x, double y);
void foo(double x, Bar *z);
```

---

### Running SWIG to Generate OCaml Bindings

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command executes SWIG with the -ocaml option, instructing it to generate OCaml-specific wrapper code from the example.i interface file. This step is the first in creating an OCaml module that can interact with C/C++ code.

```Shell
%swig -ocaml example.i
```

---

### SWIG Interface with %array_functions Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example SWIG interface file (`.i`) demonstrating the use of `%array_functions`. It includes the `carrays.i` module and applies `%array_functions` to create array manipulation functions for `double` types, named `doubleArray`. It also declares the `print_array` C function for wrapping, making it accessible in target scripting languages.

```SWIG
%module example

%include "carrays.i"
%array_functions(double, doubleArray);

void print_array(double x[10]);
```

---

### Ruby Example: Iterating and Modifying DoubleVector Elements

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to use the SWIG-wrapped `DoubleVector` and its iterators in Ruby. The example demonstrates creating a vector, adding elements, and then manually iterating through it to modify values using `value`, `value=`, and `next` methods, mimicking a `map!` operation.

```Ruby
require 'doublevector'
include Doublevector

v = DoubleVector.new
v << 1
v << 2
v << 3

#
# an elaborate and less efficient way of doing v.map! { |x| x+2 }
#
i = v.begin
e = v.end
while i != e
  val = i.value
  val += 2
  i.value = val
  i.next
end
i
>> [3, 4, 5 ]
```

---

### C++ Usage Example for Container and Element

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

Demonstrates the straightforward usage of the `Container` and `Element` classes in native C++, showing how an `Element` is set and its value retrieved, which consistently yields the expected result.

```C++
  Container container;
  Element element(20);
  container.setElement(&element);
  cout << "element.value: " << container.getElement()->value << endl;
```

---

### C++ Inheritance Example for SWIG -fvirtual Option

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ code snippet illustrates a basic inheritance hierarchy with virtual methods. It serves as an example to explain the `-fvirtual` SWIG command-line option, which prevents the generation of redundant wrappers for overridden virtual methods (e.g., `Derived::method` when `Base::method` already has a wrapper), while maintaining correct polymorphic behavior.

```C++
struct Base {
  virtual void method();
  ...
};

struct Derived : Base {
  virtual void method();
  ...
};
```

---

### C Example: print_array Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A standard C function that demonstrates iterating through a fixed-size double array and printing each element. This function serves as a target for SWIG wrapping examples, illustrating how C functions expecting array pointers can interact with wrapped array objects from scripting languages.

```C
void print_array(double x[10]) {
  int i;
  for (i = 0; i < 10; i++) {
    printf("[%d] = %g\n", i, x[i]);
  }
}
```

---

### Create Android Project for SWIG C++ Integration

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Initializes a new Android project named 'SwigClass' in the 'class' subdirectory, setting up the basic project structure and package for C++ integration.

```Shell
$ android create project --target 1 --name SwigClass --path ./class --activity SwigClass --package org.swig.classexample
$ cd class
```

---

### Generating Java Wrappers with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to run SWIG and generate Java wrapper files from a SWIG interface definition.

```Shell
%swig -java example.i
```

---

### Use Ruby Window Class Constructor with Block

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example Ruby code demonstrating how to instantiate the `Window` class and pass a block to its constructor. The block receives the newly created `Window` object, allowing inline configuration of its properties.

```Ruby
Window.new(0, 0, 360, 480) { |w|
  w.color = Fltk::RED
  w.border = false
}
```

---

### Ruby Script to Load and Use SWIG Extension

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Ruby script demonstrates how to load a compiled SWIG extension (e.g., `Example.dll` or `example.so`) using `require` and then call a C function exposed by the extension. It assumes the compiled DLL/shared object is in the Ruby path or current directory.

```Ruby
# file: run.rb
require 'Example'

# Call a c function
print "Foo = ", Example.Foo, "\n"
```

---

### C# Exception Output Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the console output when the ArgumentOutOfRangeException is thrown by the C# client code, confirming the exception handling mechanism works as intended.

```Console Output
Unhandled Exception: System.ArgumentOutOfRangeException: only positive numbers accepted
Parameter name: number
in <0x00034> example:positivesonly (int)
in <0x0000c> runme:Main ()
```

---

### C++ Overloaded Function Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Illustrates a common C++ overloading scenario where functions differ only by integer types (`int` and `long`). This example highlights a source of ambiguity for SWIG when mapping to scripting languages that typically have a single integer type.

```C++
void foo(int x);
void foo(long x);
```

---

### Complex C++ Nested Namespaces and Aliasing Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Presents a highly complex scenario involving nested namespaces, using directives, typedefs, and namespace aliasing. This example highlights the non-trivial semantics of C++ namespaces and how a single class can be accessible via multiple names.

```C++
namespace A {
  class Foo {
  };
}

namespace B {
  namespace C {
    using namespace A;
  }
  typedef C::Foo FooClass;
}

namespace BIGB = B;

namespace D {
  using BIGB::FooClass;
  class Bar : public FooClass {
  }
};

class Spam : public D::Bar {
};

void evil(A::Foo *a, B::FooClass *b, B::C::Foo *c, BIGB::FooClass *d,
          BIGB::C::Foo *e, D::FooClass *f);
```

---

### SWIG: Combined Doxygen Ignore Directives and Translation Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Presents a comprehensive example demonstrating the cumulative effect of multiple `doxygen:ignore` directives on a single C++ Doxygen comment. It shows how different ignore rules (single command, line-range, block-range, and block-range with content parsing) transform the original C++ comment into a Python-friendly equivalent.

```SWIG Configuration
%feature("doxygen:ignore:transferfull");
%feature("doxygen:ignore:compileroptions", range="line");
%feature("doxygen:ignore:forcpponly", range="end");
%feature("doxygen:ignore:beginPythonOnly", range="end:endPythonOnly", contents="parse");
```

```C++
/**
    A contrived example of ignoring too many commands in one comment.

    @forcpponly
    This is C++-specific.
    @endforcpponly

    @beginPythonOnly
    This is specific to @b Python.
    @endPythonOnly

    @transferfull Command ignored, but anything here is still included.

    @compileroptions This function must be compiled with /EHa when using MSVC.
 */
int * Contrived();
```

```Python
def func():
    r"""
    A contrived example of ignoring too many commands in one comment.

    This is specific to **Python**.

    Command ignored, but anything here is still included.
    """
    ...
```

---

### Compile and Run SWIG Java Application

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the shell commands to compile the Java source files (\*.java) using javac and then execute the main class (runme) using java, along with the expected output.

```Shell
$ javac *.java
$ java runme
24
$
```

---

### Python Example: Calling SWIG Wrapped Function with String and Length

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to call a SWIG-wrapped C function from Python, passing a string that will be expanded into a pointer and length parameter by the wrapper, suitable for binary data.

```Python
s = "H\x00\x15eg\x09\x20"
parity(s, 0)
```

---

### Python: Example Package and Module Directory Structure

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows a typical file system hierarchy defining Python modules and packages. Directories containing an '**init**.py' file are recognized as packages, while '.py' files are modules. This structure dictates the import paths in Python.

```File System
mod1.py
pkg1/__init__.py
pkg1/mod2.py
pkg1/pkg2/__init__.py
pkg1/pkg2/mod3.py
```

---

### Perl Access Example for SWIG Wrapped Nested C Struct

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how a nested C struct member, wrapped by SWIG, can be accessed and modified from a Perl script. This example highlights the user-friendly proxy class interface provided by SWIG, abstracting the underlying C structure complexity.

```Perl
# Perl5 script for accessing nested member
$o = CreateObject();                    # Create an object somehow
$o->{intRep}->{ivalue} = 7              # Change value of o.intRep.ivalue
```

---

### Compile SWIG Java Dynamic Module (Solaris)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides shell commands for compiling a SWIG-generated JNI wrapper (example_wrap.c) and a C source file (example.c) into a shared library (libexample.so) on Solaris. It highlights the use of swig, gcc with -fPIC and include paths, and ld for linking. Important note on -fno-strict-aliasing for GCC optimizations is included.

```Shell
$ swig -java example.i
$ gcc -fPIC -c example_wrap.c -I/usr/java/include -I/usr/java/include/solaris
$ gcc -fPIC -c example.c
$ ld -G example_wrap.o example.o -o libexample.so
```

---

### C Example: get_path Function with Buffer Overflow Risk

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Illustrates a C function `get_path` that writes a path into a character array, highlighting a potential buffer overflow vulnerability due to lack of bounds checking. This function serves as a problematic example that the `cstring.i` macros aim to address by providing safer alternatives.

```C
void get_path(char *s) {
  // Potential buffer overflow---uh, oh.
  sprintf(s, "%s/%s", base_directory, sub_directory);
}
...
// Somewhere else in the C program
{
  char path[1024];
  ...
  get_path(path);
  ...
}
```

---

### SWIG: Inserting Code into Runtime Section

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example showing how to use the %insert directive to place custom C/C++ code directly into the 'runtime' section of the SWIG-generated wrapper file, useful for internal support functions.

```SWIG

%insert("runtime") %{
  ... code in runtime section ...
%}

```

---

### SWIG Ltype Definitions and Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Defines 'ltype' in SWIG as a type that can legally appear on the left-hand side of a C assignment. Provides examples illustrating how various C types are converted to their corresponding ltypes, typically by stripping qualifiers and converting arrays to pointers.

```APIDOC
type              ltype
------            ----------------
int               int
const int         int
const int *       int *
int [4]           int *
int [4][5]        int (*)[5]
```

---

### SWIG C++ Overloaded Constructors Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how SWIG supports C++ overloaded constructors for a `Foo` class, allowing creation and copy construction in Python.

```C++
class Foo {
public:
  Foo();
  Foo(const Foo &);
  ...
};
```

```Python
>>> f = Foo()          # Create a Foo
>>> g = Foo(f)         # Copy f
```

---

### C++ Class with Default Parameters for Director Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a C++ class `Defaults` with a virtual method `DefaultMethod` that includes a default parameter. This class serves as an example to illustrate a subtle caveat when using directors with methods that have default parameters, particularly concerning how overloaded methods are generated and called.

```C++
class Defaults {
public:
  virtual ~Defaults();
  virtual void DefaultMethod(int a=-100);
};
```

---

### Install SWIG Module into Tcl Namespace

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command illustrates the use of the `-namespace` option in SWIG to install the generated Tcl module into its own namespace. By default, the namespace name matches the module name, improving organization and preventing name clashes by requiring access via 'ModuleName::functionName'.

```Shell
swig -tcl -namespace example.i
```

---

### SWIG C Module Command Line Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Documentation for additional command-line options available for the SWIG C module, including -namespace, -nocxx, and -noexcept.

```APIDOC
-namespace <nspace>: Generate wrappers with the prefix based on the provided namespace, e.g. if the option value is  outer::inner, the prefix outer_inner_ will be used. Notice that this is different from using SWIG nspace feature, as it applies the prefix to all the symbols, regardless of the namespace they were actually declared in. Notably, this provides a way to export instantiations of templates defined in the std namespace, such as std::vector, using a custom prefix rather than std_ .
-nocxx: Don't generate C++ wrappers, even when the  -c++ option is used. See [C++ Wrappers](#C_cxx_wrappers) section for more details.
-noexcept: generate wrappers with no support for exception handling; see [Exceptions](#C_exceptions) chapter for more details
```

---

### C++ Typedef for Unnamed Struct as Base Class Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ example illustrates how an unnamed `struct` defined via `typedef` can serve as a base class. `Foo` is a `typedef` for an anonymous struct, and `Bar` successfully inherits from it, demonstrating SWIG's compatibility with such C++ constructs.

```C++
typedef struct {
  ...
} Foo;

class Bar : public Foo {    // Ok.
...
};
```

---

### Running SWIG to Generate Ruby Wrapper Code

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This section demonstrates how to invoke SWIG to generate wrapper code for Ruby modules. It shows options for both C and C++ extensions, producing example_wrap.c or example_wrap.cxx respectively.

```Bash
$ swig -ruby example.i
```

```Bash
$ swig -c++ -ruby example.i
```

---

### SWIG Interface with %array_class Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example SWIG interface file (`.i`) demonstrating the use of `%array_class`. It includes the `carrays.i` module and applies `%array_class` to wrap `double` arrays as a class named `doubleArray`. It also declares the `print_array` C function for wrapping, enabling object-oriented interaction with C arrays in target scripting languages.

```SWIG
%module example
%include "carrays.i"
%array_class(double, doubleArray);

void print_array(double x[10]);
```

---

### Compile and Link SWIG Wrapper for Scilab using GCC

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These commands demonstrate how to compile the SWIG-generated C wrapper file (`example_wrap.c`) and link it into a shared library (`libexample.so`) using GCC. The `-fPIC` flag is used for position-independent code, and `-I` specifies the Scilab include directory.

```Bash
$ gcc -fPIC -c -I/usr/local/include/scilab example_wrap.c
$ gcc -shared example_wrap.o -o libexample.so
```

---

### SWIG Typemap: Initial javapackage Example for Director Classes (Incorrect)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a scenario where a class (`Foo`) imported from another interface file is used in a director method (`ping` in `Example`). Without `%typemap("javapackage")`, SWIG incorrectly assumes `Foo` belongs to the current interface file's Java package, leading to potential issues.

```SWIG
// class Foo is handled in a different interface file:
%import "Foo.i"

%feature("director") Example;

%inline {
  class Bar { };

  class Example {
  public:
    virtual ~Example();
    virtual void ping(Foo *arg1, Bar *arg2);
  };
}
```

---

### SWIG C# Pragma Equivalents to Java

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Lists the equivalent pragma directives when transitioning from SWIG's Java module to the C# module.

```APIDOC
%pragma(java)               -> %pragma(csharp)
```

---

### Implement C++ Shape Class Methods (example.cpp)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides the concrete implementations for the methods declared in 'example.h', including 'move' for Shape, and 'area'/'perimeter' for Circle and Square. It also initializes the static member 'nshapes'.

```C++
/* File : example.cpp */

#include "example.h"
#define M_PI 3.14159265358979323846

/* Move the shape to a new location */
void Shape::move(double dx, double dy) {
  x += dx;
  y += dy;
}

int Shape::nshapes = 0;

double Circle::area() {
  return M_PI*radius*radius;
}

double Circle::perimeter() {
  return 2*M_PI*radius;
}

double Square::area() {
  return width*width;
}

double Square::perimeter() {
  return 4*width;
}

```

---

### Scilab Example: Manipulate PersonPtrSet and Call Find Persons Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Scilab code demonstrates the usage of the wrapped `PersonPtrSet` and `findPersonsByAge` function. It shows how to initialize the module, create `Person` objects, populate a `PersonPtrSet`, call the search function, and access properties of the returned `Person` pointers from the resulting Scilab list.

```Scilab
--> example_Init();

--> joe = new_Person("Joe", 25);
--> susan = new_Person("Susan", 32);
--> bill = new_Person("Bill", 50);

--> p = new_PersonPtrSet();
--> PersonPtrSet_insert(p, susan);
--> PersonPtrSet_insert(p, joe);
--> PersonPtrSet_insert(p, bill);

--> l = findPersonsByAge(p, 20, 40);

--> size(l)
 ans  =

    2.

--> Person_name_get(l(1))
ans  =

    Susan

--> Person_name_get(l(2))
 ans  =

    Joe

--> delete_PersonPtrSet(p);
```

---

### SWIG Command Line for Hobbit4D Guile Linkage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides examples of SWIG command-line options to generate shared object libraries compatible with hobbit's `(hobbit4d link)` Guile module. It illustrates how to specify the package and module names for the generated Guile module.

```Shell/SWIG CLI
swig -guile -package my/lib foo.i
swig -guile -package my/lib -module foo foo.i
```

---

### Scilab ilib_build Function API Reference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Documentation for the `ilib_build` Scilab function, which is central to creating shared libraries and generating loader files for dynamic loading. It details the purpose and parameters required for successful library compilation.

```APIDOC
ilib_build(lib_name, table, files, libs)
  Description: Used to create shared libraries and generate a loader file for dynamic loading.
  Parameters:
    ilib_name: string - The generic name of the library without path and extension.
    files: string matrix - Object files needed for shared library creation.
    libs: string matrix - Extra libraries needed for shared library creation.
    table: two-column string matrix - A table of pairs of 'scilab function name' and 'C function name'.
```

---

### SWIG Generated Code: Fragment Usage Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the structure of the code generated by SWIG when fragments are used. The `AsMyClass` helper function is defined only once, even if called multiple times within the wrapper function `_wrap_foo`.

```C
MyClass *AsMyClass(PyObject *obj) {
  ...
}

void _wrap_foo(...) {
  ....
  arg1 = AsMyClass(obj1);
  arg2 = AsMyClass(obj2);
  ...
  foo(arg1, arg2);
}
```

---

### SWIG Interface File: Exposing C Code to Target Languages

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file (`example.i`) defines the `example` module. It uses the `%{ %}` block to include external C declarations and explicitly declares the `My_variable`, `fact`, and `my_mod` elements from the C code, making them available for SWIG to generate wrappers.

```SWIG
/* File : example.i */
%module example
%{
/* Put headers and other declarations here */
extern double My_variable;
extern int    fact(int);
extern int    my_mod(int n, int m);
%}

extern double My_variable;
extern int    fact(int);
extern int    my_mod(int n, int m);

```

---

### Compiling Dynamic Module with GCC (C Input)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Steps to compile a dynamically loadable module using GCC for a C input file, including SWIG, compilation, and linking.

```Shell
$ swig -c example.i
$ gcc -fPIC -c example_wrap.c
$ gcc -shared example_wrap.o -o libexample.so
```

---

### Java Proxy Ownership Flag (swigCMemOwn) Behavior

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how the `swigCMemOwn` flag is set for Java proxy objects based on the C++ method used to obtain them. Objects created by constructors or returned by value get `true` ownership, while those returned by reference or pointer get `false`.

```Java
Foo f = new Foo();   //  f.swigCMemOwn = true
Foo f1 = f.bar1();   // f1.swigCMemOwn = true
Foo f2 = f.bar2();   // f2.swigCMemOwn = false
Foo f3 = f.bar3();   // f3.swigCMemOwn = false
```

---

### SWIG Interface File for C File I/O

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

An example SWIG interface file defining standard C library functions for file operations and memory allocation. This demonstrates how SWIG handles unknown types like 'FILE\*' by treating them as opaque pointers, simplifying the wrapping process.

```C
%module fileio
FILE *fopen(char *, char *);
int fclose(FILE *);
unsigned fread(void *ptr, unsigned size, unsigned nobj, FILE *);
unsigned fwrite(void *ptr, unsigned size, unsigned nobj, FILE *);
void *malloc(int nbytes);
void free(void *);
```

---

### Node-webkit package.json Configuration

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This JSON snippet shows a basic package.json configuration file for a node-webkit application. It defines the application's name, the main HTML file to be loaded, and initial window properties such as visibility, width, and height.

```JSON
{
  "name": "example",
  "main": "app.html",
  "window": {
    "show": true,
    "width": 800,
    "height": 600
  }
}
```

---

### Verify Python Stable ABI Conformance with abi3audit (Failure Example)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example shows the output of `abi3audit` when a SWIG-generated Python extension does not conform to the Python Stable ABI, typically due to `Py_LIMITED_API` not being set during compilation. The tool reports an ABI version mismatch, indicating the computed ABI version (e.g., 3.10) differs from the assumed baseline (3.4) and lists non-ABI3 compliant symbols.

```Shell

~/swig/Examples/python/class $ mv _example.so _example.abi3.so
~/swig/Examples/python/class $ abi3audit --report --assume-minimum-abi3 3.4 _example.abi3.so
[22:22:27] WARNING  no wheel to infer abi3 version from; assuming (3.4)
[22:22:27] _example.abi3.so: 1 extensions scanned; 1 ABI version mismatches and 0 ABI violations found
{"specs": {"_example.abi3.so": {"kind": "object", "object": {"name": "_example.abi3.so",
"result": {"is_abi3": true, "is_abi3_baseline_compatible": false, "baseline": "3.4", "computed": "3.10",
"non_abi3_symbols": [], "future_abi3_objects": {"PyUnicode_AsUTF8AndSize": "3.10"}}}}}}

```

---

### SWIG Typemap: Setting up Loop for Key Extraction

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Continues the typemap development by adding code to extract the keys from the Ruby hash. It calls the hash's `keys` method to get a Ruby array of keys and sets up a `for` loop to iterate through them.

```SWIG
%typemap(in) (int nattributes, const char **names, const int *values)
  (VALUE keys_arr, int i, VALUE key, VALUE val) {
    Check_Type($input, T_HASH);
    $1 = NUM2INT(rb_funcall($input, rb_intern("size"), 0, Qnil));
    $2 = NULL;
    $3 = NULL;
    if ($1 > 0) {
      $2 = (char **) malloc($1*sizeof(char *));
      $3 = (int *) malloc($1*sizeof(int));
      keys_arr = rb_funcall($input, rb_intern("keys"), 0, Qnil);
      for (i = 0; i < $1; i++) {
      }
    }
}
```

---

### SWIG $typemap with Attribute Access Example in C#

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This C# example demonstrates how to use `$typemap` to access a typemap attribute, specifically the `out` attribute of the `cstype` method, to determine the return type of a function. The `cstype` method for `XClass` is defined with an `out="object"` attribute.

```SWIG
%typemap(cstype, out="object") XClass "XClass"
%typemap(cscode) BarClass %{
  $typemap(cstype:out, XClass) bar()
  {
    return null;
  }

```

```SWIG
  object bar()
  {
    return null;
  }

```

---

### Expanded SWIG %exception for Perl Overloaded Method Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Customization

This example shows the concrete expansion of special variables for the first overloaded Special::something method when wrapped for Perl. It illustrates how $symname, $overname, $wrapname, $decl, and $fulldecl are substituted with actual values during SWIG's code generation.

```Perl
  log("symname: Special_something");
  log("overname: __SWIG_0");
  log("wrapname: _wrap_Special_something__SWIG_0");
  log("decl: Special::something(char const *)");
  log("fulldecl: void Special::something(char const *)");
  try {
    (arg1)->something((char const *)arg2);
  }
  catch (MemoryError) {
    croak("Out of memory in Special::something(char const *)");
  }
```

---

### SWIG %template and C++ Explicit Instantiation Scoping Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates various scenarios for SWIG's %template directive and C++ explicit template instantiation, demonstrating valid and ill-formed usage within different namespace scopes. This highlights the importance of correct template definition visibility for successful instantiation.

```C++
namespace N {
  template<typename T> class C {};
}

// valid
%template(cin) N::C<int>;
template class N::C<int>;

// valid
namespace N {
  %template(cin) C<int>;
  template class C<int>;
}

// valid
using namespace N;
%template(cin) C<int>;
template class C<int>;

// valid
using N::C;
%template(cin) C<int>;
template class C<int>;

// ill-formed
namespace unrelated {
  using N::C;
  %template(cin) C<int>;
  template class C<int>;
}

// ill-formed
namespace unrelated {
  using namespace N;
  %template(cin) C<int>;
  template class C<int>;
}

// ill-formed
namespace unrelated {
  namespace N {
    %template(cin) C<int>;
    template class C<int>;
  }
}

// ill-formed
namespace unrelated {
  %template(cin) N::C<int>;
  template class N::C<int>;
}
```

---

### Python Example: Catching SWIG-Wrapped C++ Exceptions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a Python code example demonstrating how to catch exceptions that originate from SWIG-wrapped C++ code. When a C++ method with an exception specification (like blah() from the Foo class) throws an exception, SWIG converts it into a Python exception that can be handled using a standard try-except block.

```Python
f = Foo()
try:
    f.blah()
except Error, e:
    # e is a wrapped instance of "Error"
```

---

### Configure Visual Studio Debugging for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Example command arguments for configuring debugging of a SWIG project in Visual Studio, specifically for processing a test-suite interface file.

```Shell
-python -c++ -o C:\Temp\doxygen_parsing.cpp C:\swig\Examples\test-suite\doxygen_parsing.i
```

---

### Expanded Polymorphic Example with Multiple Vehicle Types

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This snippet expands the original example by introducing a new `FireEngine` class and a more flexible `vehicle_factory` that can return different `Vehicle` subtypes. It sets the stage for a more general solution to Java downcasting when the exact return type is not always known at compile time.

```C++
class FireEngine : public Vehicle {
public:
  FireEngine() {}
  virtual void start() {
    cout << "FireEngine started" << endl;
  }
  void roll_out_hose() {
    cout << "Hose rolled out" << endl;
  }
  ...
};
Vehicle *vehicle_factory(int vehicle_number) {
  if (vehicle_number == 0)
    return new Ambulance("Very loud");
  else
    return new FireEngine();
}
```

```Java
FireEngine fireengine = (FireEngine)example.vehicle_factory(1);
fireengine.roll_out_hose();
Ambulance ambulance = (Ambulance)example.vehicle_factory(0);
ambulance.sound_siren();
```

---

### Generating C++ and Java Wrappers with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to run SWIG, generating both C++ and Java wrapper files from a SWIG interface definition.

```Shell
$ swig -c++ -java example.i
```

---

### Java Example: Demonstrating Dangling Pointer with Garbage Collection

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Highlights the memory management problem in Java-C++ integration. This example explicitly simulates garbage collection after an `Element` is set in the `Container`, showing how the temporary Java `Element` object can be collected, leading to a dangling pointer in the underlying C++ `Container` and unexpected output.

```Java
Container container = new Container();
container.setElement(new Element(20));
// Simulate a garbage collection
System.gc();
System.runFinalization();
System.out.println("element value: " + container.getElement().getValue());
```

---

### Compile SWIG C++ Extensions with Sun C++ Compiler

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the compilation of SWIG-generated C++ extensions using the Sun C++ compiler, specifically on Solaris. This example highlights the necessity of including an additional library, -lCrun, for successful linking on this platform.

```Shell
$ swig -c++ -python example.i
$ CC -c example.cxx
$ CC -c example_wrap.cxx -I/usr/local/include/python2.5
$ CC -G example.o example_wrap.o -L/opt/SUNWspro/lib -o _example.so -lCrun
```

---

### SWIG Command to Generate C++ Wrapper and Python Proxy

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command demonstrates how to use SWIG to generate a C++ wrapper file (example_wrap.cpp) and Python proxy classes for an interface file (example.i). The -c++ option specifies C++ output, -python targets Python, and -o sets the name of the generated C/C++ wrapper file.

```Shell
$ swig -c++ -python -o example_wrap.cpp example.i
```

---

### Example: Converting Pointers with SWIG_ConvertPtr and SWIG_MakePtr

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to use `SWIG_ConvertPtr` to convert a Perl input to a C pointer and `SWIG_MakePtr` to create a new Perl pointer object from a C pointer, using `SWIGTYPE_p_Foo` for type descriptors.

```C
Foo *f;
if (!SWIG_IsOK(SWIG_ConvertPtr($input, (void **) &f, SWIGTYPE_p_Foo, 0))) {
  SWIG_exception_fail(SWIG_TypeError, "in method '$symname', expecting type Foo");
}

SV *sv = sv_newmortal();
SWIG_MakePtr(sv, f, SWIGTYPE_p_Foo, 0);
```

---

### Document C++ Function Parameters with Doxygen

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of a C++ function ('SetBreakpoint') with Doxygen comments detailing its parameters. This snippet highlights how parameter descriptions are structured in C++ for translation into Python documentation using Sphinx conventions.

```C++
/**
    Set a breakpoint at the given location.

    @param filename The full path to the file.
    @param line_number The line number in the file.
 */
bool SetBreakpoint(const char* filename, int line_number);
```

---

### C/C++ Function Signature Example: `foo(int argc, char *argv[])`

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Illustrates a common C/C++ function signature that takes an integer argument count (`argc`) and an array of character pointers (`argv`), typically used for command-line arguments. This function serves as the motivating example for the need for multi-argument typemaps.

```C++
int foo(int argc, char *argv[]);
```

---

### SWIG Example: Using %pointer_functions for Integer Pointers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the %pointer_functions macro in a SWIG interface file to create wrappers for "int \*" pointers, and then how to interact with these generated functions in Python to create, manipulate, and delete integer pointers.

```SWIG
%module example
%include "cpointer.i"

/* Create some functions for working with "int *" */
%pointer_functions(int, intp);

/* A function that uses an "int *" */
void add(int x, int y, int *result);
```

```Python
>>> import example
>>> c = example.new_intp()     # Create an "int" for storing result
>>> example.add(3, 4, c)       # Call function
>>> example.intp_value(c)      # Dereference
7
>>> example.delete_intp(c)     # Delete
```

---

### SWIG Template Instantiation for Smart Pointer

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to use the SWIG `%template` directive to instantiate the `SmartPtr` template for the `Foo` class, making it available for wrapping in the SWIG module.

```SWIG
%module example
...
%template(SmartPtrFoo) SmartPtr<Foo>;
...
```

---

### Example C++ Class for SWIG Proxy Generation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a basic C++ class `Foo` with a constructor, destructor, a member function, and a public data member. This class serves as the source for demonstrating how SWIG generates target language proxy classes.

```C++
class Foo {
  public:
    Foo();
    ~Foo();
    int  bar(int x);
    int  x;
};
```

---

### C `strcat` Example for `char *` Caution

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Presents the `strcat` function as a classic example of a C function that modifies string data in place. SWIG will wrap this, but its use with strings passed from scripting languages (e.g., Python) is undefined and likely to cause crashes due to attempts to modify immutable or internal interpreter data.

```C
char *strcat(char *s, const char *t)
```

---

### SWIG Example: Wrapping C++ Protected Members with Allprotected Mode

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This comprehensive SWIG example demonstrates the use of 'directors' and 'allprotected' modes to wrap a C++ class containing various protected members, including constructors, destructors, virtual/non-virtual methods, and static/instance variables. It also shows how to ignore unsupported types defined within protected scope.

```SWIG
%module(directors="1", allprotected="1") example

%feature("director") ProtectedBase;

// Ignore use of unsupported types (those defined in the protected section)
%ignore ProtectedBase::typedefs;

%inline %{

class ProtectedBase {
protected:
  ProtectedBase() {}
  virtual ~ProtectedBase() {}
  virtual void virtualMethod() const {}
  void nonStaticMethod(double d) const {}
  static void staticMethod(int i) {}
  int instanceMemberVariable;
  static int staticMemberVariable;

  // unsupported: types defined with protected access and the methods/variables which use them
  typedef int IntegerType;
  IntegerType typedefs(IntegerType it) { return it; }
};
int ProtectedBase::staticMemberVariable = 10;

%}
```

---

### C++ Overloaded Functions Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a simple case of overloaded functions in C++ where argument types differ, posing a challenge for dynamic language binding.

```C++
void foo(char *x);
void foo(int x);
```

---

### SWIG Interface Definition for cmalloc.i Usage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

This SWIG interface example demonstrates how to use the `cmalloc.i` module macros to generate wrappers for `int` and `int *` types, and all allocators for `double`.

```SWIG
// SWIG interface
%module example
%include "cmalloc.i"

%malloc(int);
%free(int);

%malloc(int *, intp);
%free(int *, intp);

%allocators(double);
```

---

### SWIG Macro for Batch Template Instantiation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

This example shows how to define and use a SWIG macro (%define) to simplify the process of wrapping multiple template instantiations. This approach is particularly useful for handling many different types or complex template arguments efficiently.

```SWIG
%define TEMPLATE_WRAP(prefix, T...)
%template(prefix ## Foo) Foo<T >;
%template(prefix ## Bar) Bar<T >;
...
%enddef

TEMPLATE_WRAP(int, int)
TEMPLATE_WRAP(double, double)
TEMPLATE_WRAP(String, char *)
TEMPLATE_WRAP(PairStringInt, std::pair<string, int>)
...
```

---

### C++ SWIG Python Module Wrapper File Initialization

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ code snippet from the SWIG Python language module demonstrates the initialization and management of the five core sections (begin, runtime, header, wrapper, init) that constitute a SWIG-generated wrapper file. It shows how file pointers are created, registered with the SWIG file handler, and subsequently used to dump content into the final output file, ensuring proper module I/O.

```C++
class PYTHON : public Language {
protected:
  /* General DOH objects used for holding the strings */
  File *f_begin;
  File *f_runtime;
  File *f_header;
  File *f_wrappers;
  File *f_init;

public:
  ...

};

int Python::top(Node *n) {

  ...

  /* Initialize I/O */
  f_begin = NewFile(outfile, "w", SWIG_output_files());
  if (!f_begin) {
    FileErrorDisplay(outfile);
    Exit(EXIT_FAILURE);
  }
  f_runtime = NewString("");
  f_init = NewString("");
  f_header = NewString("");
  f_wrappers = NewString("");

  /* Register file targets with the SWIG file handler */
  Swig_register_filebyname("begin", f_begin);
  Swig_register_filebyname("header", f_header);
  Swig_register_filebyname("wrapper", f_wrappers);
  Swig_register_filebyname("runtime", f_runtime);
  Swig_register_filebyname("init", f_init);

  /* Output module initialization code */
  Swig_banner(f_begin);
  ...

  /* Emit code for children */
  Language::top(n);

  ...
  /* Write all to the file */
  Dump(f_runtime, f_begin);
  Dump(f_header, f_begin);
  Dump(f_wrappers, f_begin);
  Wrapper_pretty_print(f_init, f_begin);

  /* Cleanup files */
  Delete(f_runtime);
  Delete(f_header);
  Delete(f_wrappers);
  Delete(f_init);
  Delete(f_begin);

  return SWIG_OK;
}
```

---

### SWIG Support for C++ `sizeof` on Class Members

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus11

This example shows the C++11 feature allowing `sizeof` to be used on members of classes without an explicit object instance. SWIG correctly parses this syntax. The constant value computed at compile time is then accessible from target languages, as demonstrated by the Python example.

```C++
struct A {
  int member;
};

const int SIZE = sizeof(A::member); // does not work with C++03. Okay with C++11
```

```Python
>>> SIZE
8
```

---

### SWIG C++ Unrestricted Unions Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus11

Demonstrates SWIG's full support for C++ unions containing types with non-trivial constructors, such as the 'point' struct. This feature became legal in C++11. The example shows the 'point' struct definition and a 'P' union utilizing placement new for its 'point' member.

```C++
struct point {
  point() {}
  point(int x, int y) : x_(x), y_(y) {}
  int x_, y_;
};

#include <new> // For placement 'new' in the constructor below
union P {
  int z;
  double w;
  point p; // Illegal in C++03; legal in C++11.
  // Due to the point member, a constructor definition is required.
  P() {
    new(&p) point();
  }
} p1;
```

---

### Generated Java Proxy Code from Typemap Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

Presents the actual Java code generated by SWIG based on the previous example, illustrating how the `$typemap` macro and special variables like `$javaclassname` are expanded. This output confirms the successful translation of C++ template types and SWIG directives into functional Java proxy code.

```Java
public class ValueUnsignedInt {
  ...
  public String toString() {
    long val = getValue();
    return "ValueUnsignedInt value: " + val + " Java type: long JNI type: jlong";
  }

}
```

---

### C++ Example: Using a Smart Pointer with Foo

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how a `SmartPtr<Foo>` instance `p` is used in C++. It shows accessing the `x` member and calling the `bar()` method of the underlying `Foo` object through the smart pointer's `operator->()`.

```C++
SmartPtr<Foo> p = CreateFoo(); // Created somehow (not shown)
...
p->x = 3; // Foo::x
int y = p->bar(); // Foo::bar
```

---

### C++ Smart Pointer Member Access Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates typical C++ syntax for accessing members of an object through a smart pointer, which are transparently mapped by `operator->()`.

```C++
f->x
f->bar()
```

---

### C++17 Hexadecimal Floating Literals Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the syntax for hexadecimal floating-point literals, a feature added in C++17.

```C++
double f = 0xF.68p2;
```

---

### SWIG C# Namespace Generation Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

Demonstrates how the '-namespace' command-line option in SWIG generates C# namespaces, including support for nested namespaces.

```C#
namespace com.bloggs.widget {
  ...
}
```

---

### Define C++ Window Class

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a simple C++ `Window` class with a constructor that takes position and size parameters. This class serves as an example for demonstrating Ruby block integration.

```C++
class Window
{
public:
  Window(int x, int y, int w, int h);
  // .... other methods here ....
};
```

---

### SWIG C Accessors for Global Structure Variable

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

SWIG maps global structure variables to a pair of `get` and `set` functions. The `get` function returns a pointer to the global variable, while the `set` function assigns a new value by dereferencing the input pointer. Users must be cautious not to free the returned pointer.

```C
Vector *unit_i_get() {
  return &unit_i;
}
void unit_i_set(Vector *value) {
  unit_i = *value;
}
```

---

### SWIG Interface Definition for MzScheme Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines the SWIG interface for the 'example' module, specifying that it should be generated for MzScheme. It includes the C header and declares the 'fact' function to be wrapped, making it accessible from MzScheme.

```SWIG
/* File: example.i */
%module example

%{
#include "example.h"
%}

int fact(int n);
```

---

### Ruby Example Call with Hash Arguments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how the `setVitalStats` C function is intended to be called from Ruby, using a hash to pass key-value pairs for vital statistics like 'weight' and 'age'.

```Ruby
setVitalStats("Fred",
  'weight' => 270,
  'age' => 42
)
```

---

### Build Node.js Extension using Node-GYP Command

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command-line instruction to configure and build the Node.js extension using `node-gyp`. This step compiles the C++ source and SWIG-generated wrapper files into a native Node.js module.

```Shell
$ node-gyp configure build
```

---

### Using SWIG %newobject with Reference Counted Types

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG example demonstrates the `%newobject` feature, which instructs the target language to take ownership of the returned object. When applied to a type that also has the `%feature("ref")` defined, `%newobject` additionally emits the 'ref' code into the C++ wrapper. The example shows how wrapping a factory function `AFactory` with `%newobject` makes its memory handling analogous to a constructor call for reference-counted objects.

```SWIG
%newobject AFactory;
A *AFactory() {
  return new A();
}
```

---

### Lua Example Usage of SWIG-Wrapped Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how the SWIG-wrapped C functions (`add`, `sub`, `swap`) are called from Lua. It illustrates how output and input/output parameters are handled in Lua, where output parameters are returned and input/output parameters result in new return values, as Lua does not support pass-by-reference.

```Lua
> require "example"
> print(example.add(1, 2))
3
> print(demo.sub(1, 2))
-1
> a, b=1, 2
> c, d=demo.swap(a, b)
> print(a, b, c, d)
1	2	2	1
```

---

### Manual Compilation and Dynamic Linking for Ruby Module (Linux)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

For platforms where mkmf is not suitable, this sequence of commands demonstrates how to manually compile and link a Ruby extension module on Linux. It involves SWIG, GCC compilation of source and wrapper files, and shared library creation.

```Bash
$ swig -ruby example.i
$ gcc -O2 -fPIC -c example.c
$ gcc -O2 -fPIC -c example_wrap.c -I/usr/include/ruby-2.1.0
$ gcc -shared example.o example_wrap.o -o example.so
```

---

### SWIG Typemap Attribute Access with $typemap Macro (C# Example)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates the use of `$typemap(method:attribute, typepattern)` to access specific attributes of a typemap, such as the `out` attribute. It shows how `$typemap(cstype:out, XClass)` expands to `object` in the generated C# code within the SWIG typemap, demonstrating advanced typemap customization.

```SWIG
%typemap(cstype, out="object") XClass "XClass"
%typemap(cscode) BarClass %{
  $typemap(cstype:out, XClass) bar()
  {
    return null;
  }

```

```SWIG
  object bar()
  {
    return null;
  }

```

---

### SWIG Interface: Importing System Headers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of a SWIG interface file importing a standard system header (`sys/types.h`) to obtain type definitions like `size_t`. This can be complex due to system header intricacies.

```SWIG
%module example
%import "sys/types.h"
```

---

### C Example: Iterating over a SWIG List

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Demonstrates how to traverse the elements of a SWIG List using the First and Next iterator functions. Each item in the list is printed to standard output.

```C
List *l = (some list);
Iterator i;

for (i = First(l); i.item; i = Next(i)) {
  Printf(stdout, "%s\n", i.item);
}
```

---

### Python Call Example for Multi-argument Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Python code demonstrates how the `foo` function, when wrapped with multi-argument typemaps, can be called with a single list of strings, which will be internally converted to `argc` and `argv`.

```Python
>>> foo(["ale", "lager", "stout"])
```

---

### Minimal C Program for Embedded Lua Interpreter

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C code provides a minimal stand-alone Lua interpreter. It demonstrates how to initialize the Lua state, load standard Lua libraries, register a SWIG-wrapped module (e.g., luaopen_example), and execute a Lua script file. This serves as a basic template for embedding Lua into a C/C++ application.

```C
#include <stdio.h>
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

extern int luaopen_example(lua_State* L); // declare the wrapped module

int main(int argc, char* argv[])
{
 lua_State *L;
 if (argc<2)
 {
  printf("%s: <filename.lua>\n", argv[0]);
  return 0;
 }
 L=lua_open();
 luaopen_base(L);       // load basic libs (eg. print)
 luaopen_example(L);    // load the wrapped module
 if (luaL_loadfile(L, argv[1])==0) // load and run the file
  lua_pcall(L, 0, 0, 0);
 else
  printf("unable to load %s\n", argv[1]);
 lua_close(L);
 return 0;
}
```

---

### C++ Namespace Definition Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the basic definition of a C++ namespace named 'math' containing function declarations and a class definition. This shows how to encapsulate related functionality within a namespace.

```C++
namespace math {
  double sin(double);
  double cos(double);

  class Complex {
    double im, re;
  public:
    ...
  };
  ...
};
```

---

### SWIG `shared_ptr` Macro and `boost::shared_ptr` Integration Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates the integration of `boost::shared_ptr` with SWIG using the `%shared_ptr(T)` macro. It defines a simple `IntValue` struct and two functions, one taking `IntValue` by const reference and another by `boost::shared_ptr`, showcasing how SWIG handles smart pointers. The `%shared_ptr` macro must be declared after the `boost_shared_ptr.i` include and before the type's usage.

```SWIG
%module example
%include <boost_shared_ptr.i>
%shared_ptr(IntValue)

%inline %{
#include <boost/shared_ptr.hpp>

struct IntValue {
  int value;
  IntValue(int v) : value(v) {}
};

static int extractValue(const IntValue &t) {
  return t.value;
}

static int extractValueSmart(boost::shared_ptr<IntValue> t) {
  return t->value;
}
%}
```

---

### SWIG Typemap Expansion with $typemap Macro (C# Example)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how the `$typemap(method, typepattern)` macro is used within a `cscode` typemap to dynamically resolve C# types based on C/C++ type patterns. It shows the initial SWIG typemap definition and its resulting expanded form, illustrating how `unsigned long` and `unsigned long bb` are mapped to `uint` and `bool` respectively.

```SWIG
%typemap(cstype) unsigned long    "uint"
%typemap(cstype) unsigned long bb "bool"
%typemap(cscode) BarClass %{
  void foo($typemap(cstype, unsigned long aa) var1,
           $typemap(cstype, unsigned long bb) var2,
           $typemap(cstype, (unsigned long bb)) var3,
           $typemap(cstype, unsigned long) var4)
  {
    // do something
  }
%}
```

```SWIG
%typemap(cstype) unsigned long    "uint"
%typemap(cstype) unsigned long bb "bool"
%typemap(cscode) BarClass %{
  void foo(uint var1,
           bool var2,
           bool var3,
           uint var4)
  {
    // do something
  }
%}
```

---

### Define C Source Code for SWIG Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

C source file `example.c` containing a global `double` variable `Foo` and a `gcd` function. This code is intended to be exposed to Java via SWIG for native method calls.

```c
/* File : example.c */

/* A global variable */
double Foo = 3.0;

/* Compute the greatest common divisor of positive integers */
int gcd(int x, int y) {
  int g;
  g = y;
  while (x > 0) {
    g = x;
    x = y % x;
    y = g;
  }
  return g;
}
```

---

### SWIG: Initial Python Module Loading

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An introductory Python code snippet demonstrating basic module loading and output, often found at the beginning of SWIG-generated Python modules.

```Python
from __future__ import print_function
print("Loading", "Whizz", "Bang", sep=' ... ')
```

---

### SWIG Module Definition with C++ Namespace

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a SWIG module 'example' that includes a C++ namespace 'foo' containing a function 'fact' and a struct 'Vector'.

```SWIG
%module example

namespace foo {
  int fact(int n);
  struct Vector {
    double x, y, z;
  };
};
```

---

### SWIG: Module Initialization for Backends Without Init Functions (C#/Java)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to perform module initialization for language backends like C# or Java that lack a dedicated initialization function. It uses a static global object with a constructor to call `init_variables()`.

```SWIG
%init %{
  static struct MyInit { MyInit() { init_variables(); } } myInit;
%}
```

---

### Ruby Usage of SWIG-Wrapped C++ Namespace Members

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to access functions and structs defined within a C++ namespace 'foo' through the SWIG-generated Ruby module 'Example'.

```Ruby
irb(main):001:0> require 'example'
true
irb(main):002:0> Example.fact(3)
6
irb(main):003:0> v = Example::Vector.new
#<Example::Vector:0x4016f4d4>
irb(main):004:0> v.x = 3.4
3.4
irb(main):004:0> v.y
0.0
```

---

### Instantiate Smart Pointer Template for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to use the `%template` directive in SWIG to instantiate a specific version of the `SmartPtr` class (e.g., `SmartPtr<Foo>`) for wrapping, making it accessible in the target language.

```SWIG
%module example
...
%template(SmartPtrFoo) SmartPtr<Foo>;
...
```

---

### Generated Simpler Java Enum Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This Java enum `HairType` is an example of the simplified output generated by SWIG when using the custom typemaps. It represents a basic Java enum structure without the additional methods typically generated by SWIG's default verbose enum wrapping, making it more concise.

```Java
public enum HairType {
  blonde,
  ginger,
  brunette;
}
```

---

### Cloning SWIG Source from GitHub

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Commands to create the /usr/src directory and clone the latest SWIG source code repository from GitHub into it.

```Shell
mkdir /usr/src
cd /usr/src
git clone https://github.com/swig/swig.git
```

---

### Scilab Loader Script (loader.sce) Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Scilab code snippet illustrates the structure of a `loader.sce` script, which is responsible for dynamically loading module functions into Scilab. It determines the script's path, lists the functions to be loaded, and uses `addinter` to link the shared library.

```Scilab
// ------------------------------------------------------
// generated by builder.sce: Please do not edit this file
// ------------------------------------------------------

libexamplelib_path = get_file_path('loader.sce');
list_functions = [             'fact';
            'Foo_set';
            'Foo_get';
];
addinter(libexamplelib_path+'/libexamplelib.so', 'libexamplelib', list_functions);
// remove temp. variables on stack
clear libexamplelib_path;
clear list_functions;
clear get_file_path;
// ------------------------------------------------------
```

---

### Examples of SwigType_typedef_resolve() Behavior

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how `SwigType_typedef_resolve()` transforms various original types into their resolved forms, showing the reduction process for simple and pointer types.

```text
Original type            After typedef_resolve()
------------------------ -----------------------
Integer                  int
a(30).Integer            int
p.IntegerPtr             p.p.Integer
p.p.Integer              p.p.int
```

---

### SWIG C++ Overloaded Functions Basic Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how SWIG handles basic C++ overloaded functions `void foo(int)` and `void foo(char *)` and their straightforward usage in Python.

```C++
void foo(int);
void foo(char *c);
```

```Python
>>> foo(3)           # foo(int)
>>> foo("Hello")     # foo(char *c)
```

---

### SWIG Typemaps for Racket Native Structure Creation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the use of SWIG `%typemap` directives (`argout` and `in`) to facilitate the creation and handling of native C structures within Racket/MzScheme. It defines a reusable macro `handle_ptr` to simplify the setup for different structure types, enabling seamless data transfer between C and Racket.

```SWIG
/* define a macro for the struct creation */
%define handle_ptr(TYPE, NAME)
%typemap(argout) TYPE *NAME{
  Scheme_Object *o = SWIG_NewStructFromPtr($1, $*1_mangle);
  SWIG_APPEND_VALUE(o);
}

%typemap(in, numinputs=0) TYPE *NAME (TYPE temp) {
  $1 = &temp;
}
%enddef

/* setup the typemaps for the pointer to an output parameter cntrs */
handle_ptr(struct diag_cntrs, cntrs);
```

---

### Tcl Dynamic Loading and Module Usage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to dynamically load a shared library (e.g., `example.so`) into a Tcl interpreter and then call a function (e.g., `fact`) from the loaded module, enabling extension usage.

```Tcl
% load ./example.so
% fact 4
24
%
```

---

### Display SWIG Python Command-Line Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command shows all available additional command-line options specific to the SWIG Python module. It provides a quick reference for configuring the SWIG wrapper generation process.

```Shell
swig -python -help
```

---

### Define SWIG Module with Director Feature and C Callback Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

This snippet initializes the SWIG module 'example' and explicitly enables the director feature. It also includes a standard C function, 'binary_op', which takes a function pointer, demonstrating a typical C callback mechanism that will later be integrated with the director pattern.

```SWIG
%module(directors="1") example

%{
int binary_op(int a, int b, int (*op)(int, int)) {
  return op(a, b);
}
%}
```

---

### Configure eLua platform_conf.h for New Modules

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows a sample platform_conf.h file for eLua, demonstrating how to register new modules, such as AUXLIB_MOD, within the LUA_PLATFORM_LIBS_ROM macro. This ensures the module is included in the eLua ROM image.

```C
/* Sample platform_conf.h */
#define LUA_PLATFORM_LIBS_ROM\
  _ROM( AUXLIB_PIO, luaopen_pio, pio_map )\
  _ROM( AUXLIB_TMR, luaopen_tmr, tmr_map )\
  _ROM( AUXLIB_MOD, luaopen_mod, mod_map )\
  ....
```

---

### Run SWIG Test-Suite with Parallel Make

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Examples of using parallel make (`-jN`) to accelerate the execution speed of the test-suite. This is recommended for systems with multiple CPUs to run multiple jobs concurrently.

```Shell
make -j2 check-test-suite
make -j2 check-python-test-suite
make -j2 partialcheck-java-test-suite
```

---

### SWIG C# Default Arguments Feature Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

This example demonstrates the 'cs:defaultargs' feature in SWIG, which allows binding C++ default arguments to C# named arguments with default values. It shows how to apply the feature to constructors and methods, including overriding default values and handling string literals. The Foo class in C++ is provided as the source for the SWIG interface.

```SWIG
    %feature("cs:defaultargs") Foo::Foo;
    %feature("cs:defaultargs", x=0, z=4) Foo::bar;
    %feature("cs:defaultargs", x="\"five\"") Foo::zoo;
```

```C++
    %inline %{
    class Foo {
    public:
        Foo(int a, int b=1, int c=2)
        {
        }
        int bar(int x, int y=2, int z=3)
        {
            return x+y+z;
        }
        int bat(int x=1, int y=2, int z=3)
        {
            return x+y+z;
        }
        int zoo(std::string x="four")
        {
            return (int)x.size();
        }
    };
    %}
```

---

### SWIG Parsing of C++11 Lambda Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Examples of C++11 lambda function syntax that SWIG can correctly parse, including no-argument, arguments, and explicit return type lambdas.

```C++
auto val = [] { return something; };
auto sum = [](int x, int y) { return x+y; };
auto sum = [](int x, int y) -> int { return x+y; };
```

---

### SWIG decltype() Type Deduction Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates basic decltype() usage where SWIG can successfully deduce types for variables and expressions.

```C++
int i;
decltype(i) j;
decltype(i+j) k;
```

---

### SWIG: Basic Module Initialization Block

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates a basic SWIG `%init` block used to execute `init_variables()` when the module is loaded. This code is directly copied into the module's initialization function.

```SWIG
%init %{
  init_variables();
%}
```

---

### Java Usage Example Demonstrating Thread Safety Crash

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example Java code snippet that repeatedly creates instances of the `Test` class and explicitly triggers garbage collection. This pattern, when the underlying JNI compiled code is linked against single-thread C runtime libraries, can quickly lead to crashes on multiprocessor machines due to concurrent C++ memory allocation/deallocation operations.

```Java
for (int i=0; i<100000; i++) {
  System.out.println("Iteration " + i);
  for (int k=0; k<10; k++) {
    Test test = new Test();
  }
  System.gc();
}
```

---

### SWIG: Applying %newobject with Specific Matching Rules

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Customization

This example illustrates how %newobject can be applied with different matching rules, similar to %rename and %exception. It shows how to target global functions, specific methods within a class with particular signatures, or methods across all classes using wildcards, providing precise control over object ownership hints.

```SWIG
%newobject ::blah();                   // Only applies to global blah
%newobject Object::blah(int, double);  // Only blah(int, double) in Object
%newobject *::copy;                    // Copy method in all classes
```

---

### SWIG Interface File: Wrapping C Declarations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

An example of a SWIG interface file (`.i`) demonstrating how to wrap C functions (`sin`, `strcmp`), a global variable (`Foo`), and constants (`STATUS`, `VERSION`) using `%module` and `%inline` directives for integration into scripting languages.

```C/C++
%module example

%inline %{
extern double sin(double x);
extern int strcmp(const char *, const char *);
extern int Foo;
%}
#define STATUS 50
#define VERSION "1.1"
```

---

### C/C++ Function Signature for Argument Reordering Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A C/C++ function signature demonstrating that typemaps cannot be used to rearrange or transform the order of arguments during function calls.

```C++
void foo(int, char *);
```

---

### SWIG I/O Example: Printing to String and File

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Demonstrates how to use SWIG's internal I/O functions to print content first into a String object and then print that String object into a File. This illustrates the flexibility of SWIG's I/O system with its custom String and File types.

```C
/* Print into a string */
String *s = NewString("");
Printf(s, "Hello\n");
for (i = 0; i < 10; i++) {
  Printf(s, "%d\n", i);
}
...
/* Print string into a file */
Printf(f, "%s\n", s);
```

---

### Compile SWIG-generated C++ and Java Wrappers with g++ on Unix

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates the compilation and linking process for SWIG-generated C++ and Java wrapper files into a shared library (.so) using the GNU C++ compiler (g++) on Unix-like systems. It covers invoking SWIG, compiling C++ source and the wrapper file, and linking them with necessary Java Development Kit (JDK) include paths.

```Shell
% swig -c++ -java example.i
% g++ -c -fPIC example.cxx
% g++ -c -fPIC example_wrap.cxx -I/usr/java/j2sdk1.4.1/include -I/usr/java/j2sdk1.4.1/include/linux
% g++ -shared example.o example_wrap.o -o libexample.so
```

---

### C# Usage Example of ExtendMe Partial Class with Managed and Unmanaged Methods

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to instantiate and use the `ExtendMe` partial class in C#. It calls both `Part1()` (unmanaged, from C++) and `Part2()` (managed, from the partial C# definition), proving the successful integration.

```C#
ExtendMe em = new ExtendMe();
Console.WriteLine("part1: {0}", em.Part1());
Console.WriteLine("part2: {0}", em.Part2());
```

---

### Python Example: Using %cstring_output_withsize Wrapped Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Demonstrates calling a C function, `get_data`, wrapped by SWIG using %cstring_output_withsize, from Python. It illustrates passing a buffer size and receiving the string output, which may contain binary data.

```Python
>>> get_data(1024)
'x627388912'
>>> get_data(1024)
'xyzzy'
>>>
```

---

### C++17 UTF-8 Character Literals Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates the 'u8' prefix for UTF-8 character literals introduced in C++17, which are of type 'char'.

```C++
char a = u8'a';
```

---

### SWIG Template Specialization Examples: Primary, Explicit, and Partial

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows a set of C++ template definitions including a primary template, an explicit specialization, and a partial specialization for the `Foo` class, demonstrating the different forms of template specialization supported by SWIG.

```C++
template<class T1, class T2> class Foo { };                     // (1) primary template
template<>                   class Foo<double *, int *> { };    // (2) explicit specialization
template<class T1, class T2> class Foo<T1, T2 *> { };           // (3) partial specialization
```

---

### SWIG Typedef Reduction Process Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This example clarifies that SWIG's typedef matching is a reduction process only; it does not search for every possible typedef. Given a type in a declaration, SWIG will only reduce the type, not build it up looking for typedefs. For instance, a typemap for 'StructTypedef' will not be used for a parameter of type 'Struct' if 'Struct' is already fully reduced.

```C++
struct Struct {...};
typedef Struct StructTypedef;

%typemap(in) StructTypedef {
  ...
}

void go(Struct aStruct);
```

---

### SWIG: Typemap with Default Delimiters and Preprocessor Macro

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example shows a typemap definition using standard `{...}` delimiters. The code within these delimiters, including the `SWIG_macro`, is run through the preprocessor. The generated output will include the `{...}` block.

```SWIG
#define SWIG_macro(CAST) (CAST)$input
%typemap(in) Int {$1= SWIG_macro(int);}
```

---

### SWIG Pointer Conversion Example in C

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to convert a Tcl object to a C pointer (`Foo *`) using `SWIG_ConvertPtr` and create a new Tcl pointer object from a C pointer using `SWIG_NewPointerObj`.

```C
Foo *f;
if (!SWIG_IsOK(SWIG_ConvertPtr($input, (void **) &f, SWIGTYPE_p_Foo, 0))) {
  SWIG_exception_fail(SWIG_TypeError, "in method '$symname', expecting type Foo");
}

Tcl_Obj *;
obj = SWIG_NewPointerObj(f, SWIGTYPE_p_Foo, 0);
```

---

### Typical JDK JNI Header File Locations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Common directory paths where `jni.h` and `jni_md.h` header files, required for compiling C/C++ wrappers, are typically found within a JDK installation.

```Shell
/usr/java/include
/usr/java/include/<operating_system>
```

---

### SWIG D Module Command Line Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Documentation for the D-specific command-line options available when invoking SWIG, detailing their purpose and behavior for configuring wrapper generation.

```APIDOC
-d2:
  Description: Prior to SWIG 4.2.0, SWIG generated wrappers for D1/Tango by default and -d2 could be used to generate D2/Phobos wrappers instead. SWIG 4.2.0 dropped support for D1, and D2 wrappers are now produced by default. This option is still recognised to allow existing build systems calling SWIG to work, but is now a no-op.
-splitproxy:
  Description: By default, SWIG generates two D modules: the *proxy* module, named like the source module (either specified via the %module directive or via the module command line option), which contains all the proxy classes, functions, enums, etc., and the *intermediary* module (named like the proxy module, but suffixed with _im), which contains all the extern(C) function declarations and other private parts only used internally by the proxy module. If the split proxy mode is enabled by passing this option at the command line, all proxy classes and enums are emitted to their own D module instead. The main proxy module only contains free functions and constants in this case.
-package <pkg>:
  Description: By default, the proxy D modules and the intermediary D module are written to the root package. Using this option, you can specify another target package instead.
-wrapperlibrary <wl>:
  Description: The code SWIG generates to dynamically load the C/C++ wrapper layer looks for a library called $module_wrap by default. With this option, you can override the name of the file the wrapper code loads at runtime (the lib prefix and the suffix for shared libraries are appended automatically, depending on the OS). This might especially be useful if you want to invoke SWIG several times on separate modules, but compile the resulting code into a single shared library.
```

---

### Example Usage of SWIG Python Proxy Class

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to interact with an instance of the SWIG-generated Python proxy class `Foo` from a user's perspective. It shows object instantiation, assigning a value to a wrapped C++ member variable, and calling a wrapped C++ method.

```Python
>>> f = example.Foo()
>>> f.x = 3
>>> y = f.spam(5)

```

---

### Java Example: Calling C/C++ Matrix Helper Functions via SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the SWIG-generated Java interface to interact with the C/C++ helper functions. This code allocates a matrix, sets its elements, passes it to `set_transform`, and then frees the allocated memory, illustrating the full lifecycle of matrix manipulation from Java.

```Java
Image im = new Image();
SWIGTYPE_p_a_4__double a = example.new_mat44();
example.mat44_set(a, 0, 0, 1.0);
example.mat44_set(a, 1, 1, 1.0);
example.mat44_set(a, 2, 2, 1.0);
...
example.set_transform(im, a);
example.free_mat44(a);
```

---

### C/C++ Function Signature Example for Argument Handling

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a typical C/C++ function signature used to demonstrate various argument handling typemaps such as 'in', 'typecheck', 'argout', 'check', 'arginit', 'default', and 'freearg'.

```C++
int foo(int x, double y, char *s);
```

---

### Tcl Usage of C-style Vector Accessors

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the C-style accessor functions for the Vector struct from a Tcl interpreter, showing object creation, member setting, getting, and deletion.

```Tcl
% set v [new_Vector]
% Vector_x_set $v 3.5
% Vector_y_get $v
% delete_Vector $v
% ...
```

---

### Build SWIG Release Version with CMake and Visual Studio

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

PowerShell commands to configure, build, and install a Release version of SWIG using CMake and Visual Studio. It sets up environment variables, specifies the Visual Studio generator and architecture, and includes steps to verify the build.

```PowerShell
cd C:\swig

$env:PATH="C:\Tools\CMake\CMake-win64.3.15.5\bin;C:\Tools\bison\Bison.3.7.4\bin;" + $env:PATH
$PCRE_ROOT="C:\Tools\pcre2\PCRE2.10.39.0"

cmake -G "Visual Studio 16 2019" -A "x64" `
-DCMAKE_INSTALL_PREFIX="C:/swig/install2" `
-DCMAKE_C_FLAGS="/DPCRE2_STATIC" `
-DCMAKE_CXX_FLAGS="/DPCRE2_STATIC" `
-DPCRE2_INCLUDE_DIR="$PCRE_ROOT/include" `
-DPCRE2_LIBRARY="$PCRE_ROOT/lib/pcre2-8-static.lib" `
-S . -B build

cmake --build build --config Release
cmake --install build --config Release

# to test the exe built correctly
cd install2/bin
./swig.exe -version
./swig.exe -help
```

---

### Configure Microsoft Visual Studio for SWIG Custom Build

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This section provides step-by-step instructions for configuring Microsoft Visual Studio 6 to integrate SWIG as a custom build step. It details how to set up a DLL project, add SWIG interface and wrapper files, define custom build commands, specify include directories for JNI headers, set output file names, disable precompiled headers, and add a post-build step for Java compilation.

```Configuration
* Open up a new workspace and use the AppWizard to select a DLL project.
* Add both the SWIG interface file (the .i file), any supporting C files, and the name of the wrapper file that will be created by SWIG (ie. example_wrap.c). Don't worry if the wrapper file doesn't exist yet--Visual Studio will keep a reference to it.
* Select the SWIG interface file and go to the settings menu. Under settings, select the "Custom Build" option.
* Enter "SWIG" in the description field.
* Enter "swig -java -o $(ProjDir)\$(InputName)_wrap.c $(InputPath)" in the "Build command(s) field"
* Enter "$(ProjDir)\$(InputName)_wrap.c" in the "Output files(s) field".
* Next, select the settings for the entire project and go to C/C++ tab and select the Preprocessor category. Add the include directories to the JNI header files under "Additional include directories", eg "C:\jdk1.3\include, C:\jdk1.3\include\win32".
* Next, select the settings for the entire project and go to Link tab and select the General category. Set the name of the output file to match the name of your Java module (ie. example.dll).
* Next, select the example.c and example_wrap.c files and go to the C/C++ tab and select the Precompiled Headers tab in the project settings. Disabling precompiled headers for these files will overcome any precompiled header errors while building.
* Finally, add the java compilation as a post build rule in the Post-build step tab in project settings, eg, "c:\jdk1.3\bin\javac *.java"
```

---

### SWIG $typemap Macro Usage Example in C#

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This C# example demonstrates the use of the `$typemap` macro within `%cscode` to dynamically determine C# types based on C/C++ `unsigned long` types. It shows how different type patterns (`unsigned long aa`, `unsigned long bb`, `(unsigned long bb)`, `unsigned long`) map to `uint` or `bool` based on defined typemaps.

```SWIG
%typemap(cstype) unsigned long    "uint"
%typemap(cstype) unsigned long bb "bool"
%typemap(cscode) BarClass %{
  void foo($typemap(cstype, unsigned long aa) var1,
           $typemap(cstype, unsigned long bb) var2,
           $typemap(cstype, (unsigned long bb)) var3,
           $typemap(cstype, unsigned long) var4)
  {
    // do something
  }
%}
```

```SWIG
%typemap(cstype) unsigned long    "uint"
%typemap(cstype) unsigned long bb "bool"
%typemap(cscode) BarClass %{
  void foo(uint var1,
           bool var2,
           bool var3,
           uint var4)
  {
    // do something
  }
%}
```

---

### C Function Declaration Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

A simple C function declaration used to illustrate the need for type conversion in wrapper code generation.

```C
int factorial(int n);
```

---

### Initial C Structure Definition for Person

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Defines a basic C structure `Person` with a character array for the name, serving as a starting point for demonstrating data member processing.

```C
typedef struct Person {
  char name[50];
  ...
} Person;
```

---

### SWIG Command: Including System Headers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command-line instruction to run SWIG, specifying an include path (`-I`) and the `-includeall` option to process all included files, which is necessary when importing system headers.

```Shell
$ swig -I/usr/include -includeall example.i
```

---

### Perl Module Usage Example with SWIG Extension

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to load and use a SWIG-generated Perl module, including calling a function within it. This snippet shows the basic interaction with a SWIG extension from a Perl script.

```Perl
$ perl5
use example;                      # load the example module
print example::fact(4), "\n"      # Call a function in it
24
```

---

### C Function Declaration for GCD Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

A simple C function declaration for `gcd` used to demonstrate how SWIG typemaps are applied in a generated wrapper function.

```C
int gcd(int x, int y);
```

---

### Guile Dynamic Module Loading (Older Method)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to dynamically link a SWIG-generated Guile module (libfoo) and initialize its bindings using `dynamic-call`. This method creates a new Guile module and places the C-level bindings within it.

```Guile/Scheme
(define my-so (dynamic-link "./libfoo"))
;; create new module and put bindings there:
(dynamic-call "scm_init_my_modules_foo_module" my-so)
```

---

### Node.js Interactive Session Output for SWIG Class Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the output of an interactive Node.js shell session demonstrating the usage of SWIG-wrapped C++ classes. It includes successful method calls, property access, and the expected error when attempting to instantiate an abstract C++ class (`Shape`).

```Shell
$ node -i
& var example = require("./build/Release/example");
undefined
& var Shape = example.Shape;
undefined
& var Circle = example.Circle;
undefined
& var Square = example.Square;
undefined
& var c = new Circle(10);
undefined
& var s = new Square(10);
undefined
& Shape.nshapes;
2
& c.x = 20;
20
& c.y = 30;
30
& s.x = -10;
-10
& s.y = 5;
5
& c.area();
314.1592653589793
& c.perimeter();
62.83185307179586
& s.area();
100
& s.perimeter();
40
& c.move(40, 40)
undefined
& c.x
60
& c.y
70
& new Shape()
Error: Class Shape can not be instantiated
at repl:1:2
at REPLServer.self.eval (repl.js:110:21)
at Interface.<anonymous> (repl.js:239:12)
at Interface.EventEmitter.emit (events.js:95:17)
at Interface._onLine (readline.js:202:10)
at Interface._line (readline.js:531:8)
at Interface._ttyWrite (readline.js:760:14)
at ReadStream.onkeypress (readline.js:99:10)
at ReadStream.EventEmitter.emit (events.js:98:17)
at emitKey (readline.js:1095:12)
```

---

### SWIG Warning for Overload Ambiguity

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of the warning message issued by SWIG when it encounters ambiguous overloaded methods that it cannot disambiguate.

```Console Output
example.i:12: Warning 509: Overloaded method spam(short) effectively ignored,
example.i:11: Warning 509: as it is shadowed by spam(int).
```

---

### SWIG: Illustrating Java Package Assumption Without javapackage Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This example shows a SWIG interface file where a class `Foo` is imported from another file and used in a director method of `Example`. Without the `%typemap(javapackage)`, SWIG incorrectly assumes `Foo` belongs to the same Java package as the current interface file, leading to potential issues in the generated Java code.

```SWIG
// class Foo is handled in a different interface file:
%import "Foo.i"

%feature("director") Example;

%inline {
  class Bar { };

  class Example {
  public:
    virtual ~Example();
    virtual void ping(Foo *arg1, Bar *arg2);
  };
}
```

---

### insert Node Attributes

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Code insertion directive. For example, %{ ... %} or %insert(section).

```APIDOC
"code"          - Inserted code
"section"       - Section name ("header", "wrapper", etc.)
```

---

### Ruby usage of SWIG-wrapped C functions with INPUT/OUTPUT typemaps

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how C functions wrapped with SWIG's `INPUT` and `OUTPUT` typemaps are called from Ruby. This example highlights that simple values are passed and return values are handled automatically, abstracting away the underlying pointer mechanics.

```Ruby
a = Example.add(3, 4)
puts a
7
b = Example.sub(7, 4)
puts b
3
```

---

### SWIG Language Module main() Configuration

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

This C code snippet demonstrates the initial configuration steps within the `main()` method of a SWIG language module. It sets the language-specific library directory, defines preprocessor symbols (e.g., `SWIGPYTHON`), specifies a configuration file (`python.swg`), and sets the typemap language. These actions register the module, provide target language information, and define a start-up file for parsing.

```C
void main(int argc, char *argv[]) {
  ... command line options ...

  /* Set language-specific subdirectory in SWIG library */
  SWIG_library_directory("python");

  /* Set language-specific preprocessing symbol */
  Preprocessor_define("SWIGPYTHON 1", 0);

  /* Set language-specific configuration file */
  SWIG_config_file("python.swg");

  /* Set typemap language (historical) */
  SWIG_typemap_lang("python");
}
```

---

### SWIG Fragment Specialization in Templates

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of using type-specialized fragments within C++ templates, showing how a fragment can be defined and then referenced in a typemap for a specific template instantiation.

```C++/SWIG
template <class T>
struct A {
  %fragment("incode"{A<T>}, "header") {
    ... 'incode' specialized fragment ...
  }

  %typemap(in, fragment="incode"{A<T>}) {
    ... here we use the 'type specialized' fragment "incode"{A<T>} ...
  }
};
```

---

### Define C++ ExtendMe Class for Partial C# Proxy Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a simple C++ class `ExtendMe` with a `Part1` method. This class is used to demonstrate how to generate a partial C# proxy class using SWIG.

```C++
class ExtendMe {
public:
  int Part1() { return 1; }
};
```

---

### C/C++ Global Variable Declaration Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A simple C/C++ global variable declaration used to illustrate typemaps for global variable assignment ('varin') and reading ('varout').

```C++
int foo;
```

---

### SWIG Typedef Resolution Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Demonstrates how `SwigType_typedef_resolve()` simplifies types by resolving typedef aliases, showing the transformation from original types to their resolved forms.

```C
Original type            After typedef_resolve()
------------------------ -----------------------
Integer                  int
a(30).Integer            int
p.IntegerPtr             p.p.Integer
p.p.Integer              p.p.int
```

---

### SWIG Interface File for C++ std::vector Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file (`.i`) demonstrates how to wrap the C++ functions defined in `example.h`. It includes the necessary header, the `std_vector.i` library, and instantiates `std::vector` templates for `int` and `double` to ensure proper type mapping and function exposure in the target scripting language.

```SWIG
%module example
%{
#include "example.h"
%}

%include "std_vector.i"
// Instantiate templates used by example
namespace std {
  %template(IntVector) vector<int>;
  %template(DoubleVector) vector<double>;
}

// Include the header file with above prototypes
%include "example.h"
```

---

### Load SWIG Module with loadlib (Lua 5.0.x - Concise)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet provides a more concise, single-line method to load and initialize a SWIG module using loadlib for Lua 5.0.x. It directly calls the returned initialization function.

```Lua
assert(loadlib("example.so", "luaopen_example"))()
```

---

### Python Usage of SWIG-Wrapped Smart Pointer

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example demonstrating how the SWIG-wrapped C++ smart pointer can be used in Python, showing transparent access to members `x` and `bar()` similar to C++.

```Python
>>> f = make_Foo()
>>> print(f.x)
0
>>> f.bar()
>>>
```

---

### C Standard Library Functions with Variable Arguments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides examples of common C standard library functions like printf, fprintf, and sprintf that accept a variable number of arguments, typically indicated by '...'.

```C
int printf(const char *fmt, ...)
int fprintf(FILE *, const char *fmt, ...);
int sprintf(char *s, const char *fmt, ...);
```

---

### Call Wrapped C Function (Lua)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates how to call a C function (fact) wrapped by SWIG and exposed through the 'example' Lua module. The function is accessed as example.fact.

```Lua
print example.fact(4)
```

---

### Python Example Using SWIG cdata.i Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A Python script demonstrating the use of `intArray`, `cdata`, and `memmove` functions generated by SWIG from the `cdata.i` module. It illustrates packing an integer array into a binary string and then unpacking it back into another array.

```Python
>>> a = intArray(10)
>>> for i in range(0, 10):
...    a[i] = i
>>> b = cdata(a, 40)
>>> b
'\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\t'
>>> c = intArray(10)
>>> memmove(c, b)
>>> print c[4]
4
>>>
```

---

### Add PHP Include Statements to Generated Files with SWIG Pragma

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates using the "pragma(php) include" directive as a shortcut to add PHP include statements to the generated 'example.php' file. It's equivalent to using the code pragma for includes.

```SWIG
%module example
%pragma(php) code="\ninclude \"include.php\";\n"
%pragma(php) include="include.php"   // equivalent.

```

---

### C Example: Iterating over a SWIG Hash

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Illustrates how to iterate through the key-value pairs of a SWIG Hash table using the First and Next iterator functions. Both the key and the item for each entry are printed.

```C
Hash *h = (some hash);
Iterator j;

for (j = First(j); j.item; j= Next(j)) {
  Printf(stdout, "%s : %s\n", j.key, j.item);
}
```

---

### C Function for Querying Multiple Values

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of a C function that populates multiple output parameters, such as dimensions of a matrix, via pointers, representing another common scenario for multiple return values.

```C
void get_dimensions(Matrix *m, int *rows, int *columns);
```

---

### SWIG decltype() Type Deduction Warning Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates a decltype() expression that SWIG cannot deduce, resulting in a warning. This often requires a workaround.

```C++
int foo(int);
decltype(foo(0)) k;  // Warning 344: Unable to deduce decltype for 'foo(0)'.
```

---

### Registering SWIG Generated Documentation Files in Guile

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Guile code demonstrates how to load the ice-9 documentation module and register a SWIG-generated documentation file with Guile's documentation-files list, making the procedure documentation accessible within the Guile environment.

```Guile
(use-modules (ice-9 documentation))
(set! documentation-files
      (cons "file" documentation-files))
```

---

### insert Parse Tree Node Attributes

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Code insertion directive. For example, %{ ... %} or %insert(section).

```APIDOC
"code"          - Inserted code
"section"       - Section name ("header", "wrapper", etc.)
```

---

### Scilab Module Initialization Function Call

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet illustrates the standard way to initialize a SWIG-wrapped module in Scilab. Executing this function, typically at the start of a script, is crucial for setting up the SWIG runtime and making the wrapped library's types and functions available.

```Scilab
--> example_Init();
```

---

### SWIG Multi-line Module Docstring using Macro

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG example shows how to define a multi-line documentation string for a module using a `%define` macro. This improves readability for longer docstrings while still associating them with the `%module` directive.

```SWIG
%define DOCSTRING
"The `XmlResource` class allows program resources defining menus,
controls on a panel, etc. to be loaded from an XML file."
%enddef

%module(docstring=DOCSTRING) xrc
```

---

### C execlp Function with NULL-Terminated Variable Arguments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the execlp function, which takes a variable number of arguments terminated by NULL, commonly used for executing programs. An example call demonstrates its usage.

```C
int execlp(const char *path, const char *arg1, ...);

/* Example */
execlp("ls", "ls", "-l", NULL);
```

---

### Define module initializer functions for Javascript engines

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These function signatures represent the entry points for registering a SWIG-generated module with different Javascript interpreters. The 'example_initialize' function is called to register the module with JavascriptCore or V8, depending on the target engine.

```C
bool example_initialize(JSGlobalContextRef context, JSObjectRef *exports)
```

```C++
void example_initialize(v8::Handle<v8::Object> exports)
```

---

### Example Usage of SWIG argout Typemap in Tcl

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates calling the `mypow` function from Tcl, showing how the `argout` typemap causes the function to return two values: a status and the calculated result.

```Tcl
% mypow 2 3     # Returns two values, a status value and the result
0 8
```

---

### Basic SWIG Interface File Structure

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the typical inclusion order for SWIG configuration files in an interface file, starting with global and language-specific configurations before the user's interface file. This structure is fundamental for SWIG's internal processing and can lead to cryptic errors if misconfigured.

```SWIG Configuration
%include "swig.swg"             // Global SWIG configuration
%include "langconfig.swg"       // Language specific configuration
%include "yourinterface.i"      // Your interface file
```

---

### Scilab addinter Function API Reference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Documentation for the `addinter` Scilab function, which facilitates dynamic linking of compiled C interface functions. It outlines the parameters required to specify the object files, the interface routine entry point name, and the new Scilab function names.

```APIDOC
addinter(files, spname, fcts)
  Description: Performs dynamic linking of a compiled C interface function.
  Parameters:
    files: string or vector of strings - Object files (containing C interface functions) to link with.
    spname: string - Name of interface routine entry point.
    fcts: vector of strings - Names of new Scilab functions.
```

---

### Compiling and Linking SWIG Module for Static Tcl Interpreter

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These shell commands demonstrate the compilation and linking process for creating a statically linked Tcl interpreter. First, SWIG generates Tcl wrapper code from `example.i`. Then, `gcc` compiles the original C code, the generated SWIG wrapper, and links them with Tcl libraries, including specific linker flags (`-Xlinker -export-dynamic`) and include/library paths, to produce a new executable Tcl interpreter (`mytclsh`) with the extension built-in.

```Shell
$ swig -tcl example.i
$ gcc example.c example_wrap.c \
        -Xlinker -export-dynamic \
        -DHAVE_CONFIG_H -I/usr/local/include/ \
        -L/usr/local/lib -ltcl -lm -ldl \
        -o mytclsh
```

---

### SWIG Raw Type String Insertion Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Demonstrates how raw SWIG type strings can be directly inserted into an interface file using backticks, illustrating a complex and unusual type declaration.

```SWIG
`p.a(10).p.f(int, p.f(int).int)` foo(int, int (*x)(int));
```

---

### Run Entire SWIG Test-Suite

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Executes all test cases for all configured target languages. This command should be run from the top-level directory and can take a significant amount of time to complete.

```Shell
make -k check-test-suite
```

---

### SWIG Typemap Scope Redefinition Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how typemaps can be redefined for different sections of an input file, showing that subsequent declarations are affected by the most recently defined typemap.

```SWIG
// typemap1
%typemap(in) int {
...
}

int fact(int);                    // typemap1
int gcd(int x, int y);            // typemap1

// typemap2
%typemap(in) int {
...
}

int isprime(int);                 // typemap2
```

---

### SWIG Wrapping of C++ Templates with %template

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Explains how to wrap C++ templates using the %template directive in SWIG. This is necessary to tell SWIG to create wrappers for specific template instantiations. Includes a SWIG interface file example for a pair template and its Python usage.

```SWIG
%module example
%{
#include "pair.h"
%}

template<class T1, class T2>
struct pair {
  typedef T1 first_type;
  typedef T2 second_type;
  T1 first;
  T2 second;
  pair();
  pair(const T1&, const T2&);
 ~pair();
};

%template(pairii) pair<int, int>;
```

```Python
>>> import example
>>> p = example.pairii(3, 4)
>>> p.first
3
>>> p.second
4
```

---

### C Function Wrapping: Helper Function Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Provides a helper C function `my_get_data` that wraps the `get_data` function. This helper modifies the prototype to return the string via a `char **` parameter, making it compatible with SWIG's string output macros for safer and more reliable binary string data return.

```C
void my_get_data(char **result, int *len) {
  *result = get_data(len);
}
```

---

### SWIG: Not Wrapping Protected/Private C++ Constructors

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

SWIG does not generate wrappers for constructors declared as protected or private in C++ classes, as demonstrated by this example.

```C++
class Foo {
protected:
  Foo();         // Not wrapped.
public:
  ...
};
```

---

### Perl Example: Calling SWIG Renamed Overloaded Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to call C++ overloaded functions and methods in Perl after they have been disambiguated and renamed using SWIG's `%rename` directive.

```Perl
use example;
example::foo_i(3);
$s = example::new_Spam();
example::Spam_foo_i($s, 3);
example::Spam_foo_d($s, 3.14);
```

---

### Low-Level Struct Manipulation in Target Language

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of how a SWIG-wrapped structure can be minimally manipulated in a target language using the generated low-level accessor functions and constructor/destructor.

```Python
v = new_Vector()
Vector_x_set(v, 2)
Vector_y_set(v, 10)
Vector_z_set(v, -5)
...
delete_Vector(v)
```

---

### Class Square Definition (Incomplete)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines the 'Square' class, inheriting from 'Shape'. The provided snippet is incomplete, showing only the start of its private members.

```APIDOC
class Square : Shape {
  private:
    // ... (definition incomplete in source)
}
```

---

### C Usage Example: Calling Pointer-Pointer Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the typical C code pattern for calling a function like `Create_Math` that uses a pointer-to-pointer to return an object. It shows variable declaration, function call, and explicit memory deallocation.

```C
iMath* ptr;
int ok;
ok=Create_Math(&ptr);
// do things with ptr
//...
free(ptr); // dispose of iMath
```

---

### C++ Friend Function Operator Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows a C++ `friend` function declaration for an overloaded `operator+` that SWIG cannot automatically handle when defined outside the class.

```C++
class Complex {
...
friend Complex operator+(double, const Complex &c);
...
};
```

---

### Compiling Dynamic Module with G++ (C++ Input)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Steps to compile a dynamically loadable module using G++ for a C++ input file, including SWIG, compilation, and linking.

```Shell
$ swig -c++ -c example.i
$ g++ -fPIC -c example_wrap.cxx
$ g++ -shared example_wrap.o -o libexample.so
```

---

### C++ Function Prototype for SWIG Docstring Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a C++ function prototype that would benefit from SWIG's docstring features, showing a complex signature that is often simplified to `(*args)` in default SWIG-generated Python wrappers, making IDE call-tips less useful.

```C++
bool function_name(int x, int y, Foo* foo=NULL, Bar* bar=NULL);
```

---

### Define a C++ struct for SWIG wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ struct `Go` serves as an example for SWIG wrapping, demonstrating methods with different numbers of parameters. It is used to illustrate how SWIG generates proxy classes for C++ code.

```C++
struct Go {
  void callme0() {}
  void callme4(int a, int b, int c, int d) {}
  void callme8(double a, double b, double c, double d, double e, double f, double g, double i) {};
}
```

---

### C: SWIG printf Wrapper Implementation Details with libffi

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a fragment of the internal C implementation of a SWIG wrapper for a printf-like function, demonstrating the use of libffi to handle variable arguments. It shows argument type mapping, ffi_prep_cif, ffi_call, and error handling within the wrapper's logic.

```C
    case VT_POINTER:
      types[1+i] = &ffi_type_pointer;
      values[1+i] = &args[i].val.pvalue;
      break;
    default:
      abort();    /* Whoa! We're seriously hosed */
      break;
    }
  }
  if (ffi_prep_cif(&cif, FFI_DEFAULT_ABI, vc+1,
                   &ffi_type_uint, types) == FFI_OK) {
    ffi_call(&cif, (void (*)()) printf, &result, values);
  } else {
    free(types);
    free(values);
    free(args);
    PyErr_SetString(PyExc_RuntimeError, "Whoa!!!!!");
    SWIG_fail;
  }
  free(types);
  free(values);
  free(args);
}
```

---

### SWIG Typemap Ltype Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how various C types are converted to their 'ltype' (left-hand side type) equivalent in SWIG typemaps, which can legally appear on the left-hand side of a C assignment.

```APIDOC
type              ltype
------            ----------------
int               int
const int         int
const int *       int *
int [4]           int *
int [4][5]        int (*)[5]
```

---

### Format SWIG C++ Source Code with Indent Tool

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of how to format a specific C++ source file (`Modules/emit.cxx`) using the `make beautify-file` target, which applies K&R C style formatting with 2-space indentation.

```bash
cd Source
make beautify-file INDENTFILE=Modules/emit.cxx
```

---

### SWIG Interface File for Static Perl Module with perlmain.i

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file demonstrates how to include the `perlmain.i` directive to automatically generate a `main()` function for a static Perl executable. It initializes the SWIG-generated module and starts the Perl interpreter, simplifying static builds.

```SWIG
%module example

%inline %{
extern double My_variable;
extern int fact(int);
%}

// Include code for rebuilding Perl
%include <perlmain.i>
```

---

### Cloning SWIG Source from GitHub

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Commands to create the /usr/src directory and clone the latest SWIG source code repository from GitHub into it. This is an alternative to downloading a zip file.

```Shell
mkdir /usr/src
cd /usr/src
git clone https://github.com/swig/swig.git
```

---

### Copy SWIG Module Contents to Global Environment (Lua)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Lua snippet shows how to iterate through the 'example' module's contents (functions, constants, classes) and copy them into the global Lua environment (\_G). This allows direct access without the module prefix, but should be used with caution due to potential name collisions.

```Lua
for k, v in pairs(example) do _G[k]=v end
print(fact(4))
```

---

### C Function Wrapping: Original Prototype Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Shows a common C function prototype `get_data` that returns a `char *` and takes an `int *` for length. This pattern often requires a helper function for optimal wrapping with SWIG's string output macros.

```C
char  *get_data(int *len);
```

---

### Importing System Headers and Running SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Demonstrates how to import system header files like `sys/types.h` into a SWIG interface file using `%import` to collect type information. It also provides the corresponding command-line invocation for SWIG, specifying include directories (`-I`) and the `-includeall` option.

```SWIG
%module example
%import "sys/types.h"
```

```Shell
$ swig -I/usr/include -includeall example.i
```

---

### Uninstall Android Application via ADB

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to uninstall the Android application from a connected device, useful for clean installations or removing old versions before updating.

```Shell
$ adb uninstall org.swig.simple
```

---

### Guile: Shorthand for Dynamic Module Loading

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows a more concise way to load a shared library and initialize SWIG bindings in newer Guile versions, using `load-extension` as a shorthand for `dynamic-link` and `dynamic-call`.

```Scheme
(load-extension \"./libexample.so\" \"SWIG_init\")
```

---

### C++ Custom Exception Class for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ class `MyException` is an example of a custom exception that can be wrapped by SWIG. It includes a constructor, destructor, and a `what()` method to retrieve the error message.

```C++
class MyException {
public:
  MyException (const char *msg_);
  ~MyException ();

  const char *what () const;

private:
  char *msg;
};
```

---

### Define SWIG Module with Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the general syntax for the `%module` directive in SWIG, allowing specification of a module name along with optional key-value pairs for additional features.

```SWIG
%module(option1="value1", option2="value2", ...) modulename
```

---

### C++ Overloaded Addition Operator Declaration

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of a C++ class 'Complex' declaring an overloaded addition operator 'operator+'.

```C++
class Complex {
  ...
  Complex operator+(Complex &);
  ...
};
```

---

### Configure PHP Extension in php.ini

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to load a PHP extension by adding an 'extension' directive to the php.ini configuration file. It shows examples for both default and custom paths, differentiating between Linux (.so) and Windows (.dll) module naming conventions.

```PHP
extension=modulename
```

```PHP
extension=/path/to/modulename.so
```

```PHP
extension=/path/to/php_modulename.dll
```

---

### SWIG interface using INPUT and OUTPUT typemaps for C functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the `typemaps.i` file and the `INPUT` and `OUTPUT` directives in a SWIG interface file to automatically handle C pointer parameters for input and output, simplifying the generated wrapper code.

```SWIG
%module Example
%include "typemaps.i"

void add(int, int, int *OUTPUT);
int sub(int *INPUT, int *INPUT);
```

---

### SWIG Typemap Scoping Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Illustrates how typemaps remain in effect for subsequent declarations and can be redefined for different sections of an input file, affecting declarations that follow their definition.

```SWIG
// typemap1
%typemap(in) int {
...
}

int fact(int);                    // typemap1
int gcd(int x, int y);            // typemap1

// typemap2
%typemap(in) int {
...
}

int isprime(int);                 // typemap2
```

---

### C/C++: Examples of const Declarations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates various ways the `const` qualifier can be used in C/C++ variable declarations, showing how its position affects the constant nature of the variable or the pointer.

```C/C++
const char a;           // A constant character
char const b;           // A constant character (the same)
char *const c;          // A constant pointer to a character
const char *const d;    // A constant pointer to a constant character
```

---

### Iterating SWIG Lists and Hashes with Iterator API

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

C code examples demonstrating how to use the First and Next functions with the Iterator object to traverse elements in SWIG List and Hash data structures, printing their contents to standard output.

```C
List *l = (some list);
Iterator i;

for (i = First(l); i.item; i = Next(i)) {
  Printf(stdout, "%s\n", i.item);
}

Hash *h = (some hash);
Iterator j;

for (j = First(j); j.item; j= Next(j)) {
  Printf(stdout, "%s : %s\n", j.key, j.item);
}
```

---

### Example SWIG Warning Message Output

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Warnings

Illustrates a typical warning message generated by SWIG during compilation, specifically Warning 501 regarding an ignored overloaded declaration.

```SWIG Output
example.i:16: Warning 501: Overloaded declaration ignored.  bar(double)
example.i:15: Warning 501: Previous declaration is bar(int)
```

---

### SWIG Encoded Pointer String Representation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows an example of how a C++ pointer, such as Foo \*, is internally represented by SWIG as a string for its run-time type checking mechanism.

```Text
_108e688_p_Foo
```

---

### SWIG Interface File for Simple Node.js Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a SWIG interface file (`example.i`) for a simple Node.js extension. It declares external C functions (`gcd`) and global variables (`Foo`) that will be wrapped by SWIG for Node.js.

```SWIG
/* File : example.i */
%module example

%inline %{
extern int    gcd(int x, int y);
extern double Foo;
%}
```

---

### SWIG Warning for Ambiguous Overloaded Methods

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of the warning message issued by SWIG when it encounters ambiguous overloaded methods that it cannot disambiguate, indicating that one method might be ignored.

```SWIG
example.i:12: Warning 509: Overloaded method spam(short) effectively ignored,
example.i:11: Warning 509: as it is shadowed by spam(int).
```

---

### Define C Function with Pointer Parameters

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C function `add` takes three integer pointers as arguments. It serves as a base example to demonstrate various SWIG wrapping strategies for handling pointers in PHP.

```C
void add( int *in1, int *in2, int *result);
```

---

### Generate SWIG Javascript/Node.js Wrapper

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG command generates the necessary C++ wrapper code (`example_wrap.cxx`) and Javascript interface for a Node.js module from the `example.i` interface file. It specifies Javascript and Node.js as targets and C++ as the output language.

```bash
$ swig -javascript -node -c++ example.i
```

---

### Define a C function for scripting language access

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C function calculates the factorial of an integer. It serves as an example of a native C function that needs to be exposed to a scripting language.

```C
int fact(int n) {
  if (n <= 1)
    return 1;
  else
    return n*fact(n-1);
}
```

---

### Uninstall Android Application via ADB

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

Command to uninstall the Android application from a connected device using ADB. This is useful for clean installations or when updating the app.

```bash
$ adb uninstall org.swig.simple
Success
```

---

### SWIG: Interface File with Explicit Declarations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example SWIG interface file (`interface.i`) that explicitly declares the functions from `header.h` after including it. It defines `mymodule` as the target module name.

```SWIG
/* File : interface.i */
%module mymodule
%{
#include "header.h"
%}
extern int foo(double);
extern double bar(int, int);
extern void dump(FILE *f);
```

---

### SWIG Runtime Support Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Common functions typically needed for SWIG runtime support, used for pointer conversion and object creation.

```APIDOC
SWIG Runtime Functions:
  - SWIG_ConvertPtr(): Converts a SWIG pointer.
  - SWIG_NewPointerObj(): Creates a new SWIG pointer object.
```

---

### Calling std::vector Constructor from Python

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus11

Example of how to instantiate a Container object in Python, utilizing the alternative constructor that accepts a std::vector (which Python lists can map to), demonstrating seamless integration.

```Python
>>> c = Container( [1, 2, 3, 4] )
```

---

### SWIG Constant and Enum Definition Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates various ways to define constants in SWIG, including C preprocessor defines, SWIG-specific '%constant' directives, and C-style enumerations, all handled by 'consttab' or 'constcode' typemaps.

```SWIG
#define FOO 3
%constant int BAR = 42;
enum { ALE, LAGER, STOUT };
```

---

### Generate Tcl Wrapper for C++ Code with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command runs SWIG to generate a Tcl wrapper file (example_wrap.cxx) for a C++ interface file. The -c++ option ensures proper C++ extension handling.

```Shell
$ swig -c++ -tcl example.i
```

---

### Python Usage with SWIG Binary Data Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of calling a C function `parity` from Python after applying a SWIG typemap for binary data. Demonstrates passing a Python string containing binary content.

```Python
>>> parity("e\x09ffss\x00\x00\x01\nx", 0)
```

---

### Examples of SwigType_ltype() Conversion

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how `SwigType_ltype()` converts complex types like multi-dimensional arrays and const-qualified pointers into their lvalue representations, showing the original type and the resulting ltype.

```C
typedef double Matrix4[4][4];
Matrix4 x;    // type = 'Matrix4', ltype='p.a(4).double'

typedef const char * Literal;
Literal y;    // type = 'Literal', ltype='p.char'
```

---

### Tcl Overloaded Function Calls Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Illustrates how overloaded C++ functions are called from Tcl, showing different argument types for the 'foo' function and their corresponding C++ signatures.

```Tcl
foo 3            # foo(int)
foo 3.5          # foo(double)
foo hello 5      # foo(char *, int)
```

---

### Get Nth Array Dimension of SwigType

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Retrieves the string representation of the nth array dimension from a SwigType object. This function does not modify the SwigType object.

```APIDOC
SwigType_array_getdim(ty: SwigType*, n: int)
  ty: The SwigType object to query.
  n: The index of the array dimension to retrieve (0-based).
Returns: String* - The nth array dimension as a string.
Description: Returns nth array dimension of ty.
```

---

### C Functions with Pointer Parameters

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates common C function patterns where parameters are passed as simple pointers for output or input, requiring special handling when wrapped by tools like SWIG.

```C
void add(int x, int y, int *result) {
  *result = x + y;
}
```

```C
int sub(int *x, int *y) {
  return *x+*y;
}
```

---

### Python: Multi-Line Docstring Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet illustrates the format for a multi-line docstring in Python. For improved readability, especially with longer descriptions, SWIG outputs docstrings with multiple lines in this expanded format.

```Python
"""
This is a multi-line docstring
with more than one line.
"""
```

---

### SWIG: Applying typemaps with specific patterns (named)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how %apply can be used with more specific typemap patterns, including those with names. This example copies the 'int *output' typemap to 'Integer *output', preserving the named pattern.

```SWIG
%apply int *output { Integer *output };
```

---

### Java Wrapper for C++ Wobble Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the Java wrapper class `example` generated by SWIG. It shows how the `wobble` method calls the JNI layer, passing both the C++ pointer (obtained via `Wibble.getCPtr`) and the Java `Wibble` object itself.

```Java
public class example {
  ...
  public static void wobble(Wibble w) {
    exampleJNI.wobble(Wibble.getCPtr(w), w);
  }
}
```

---

### Get Number of Array Dimensions for SwigType

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Returns the total number of array dimensions applied to a SwigType object. This function does not modify the SwigType object.

```APIDOC
SwigType_array_ndim(ty: SwigType*)
  ty: The SwigType object to query.
Returns: int - The number of array dimensions.
Description: Returns number of array dimensions of ty.
```

---

### C++ Overloaded Function Signature

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows an example of a C++ function 'foo' that is overloaded, highlighting the need for specific SWIG typecheck typemaps to correctly resolve which overload to call from Python.

```C++
int foo(int argc, char **argv);
int foo();
```

---

### SWIG Multiple Multi-argument Typemaps in a Single Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates that multiple multi-argument typemaps can be applied within a single C/C++ function declaration, allowing for complex argument transformations.

```SWIG
%typemap(in) (int scount, char *swords[]) { ... }
%typemap(in) (int wcount, char *words[]) { ... }

void search_words(int scount, char *swords[], int wcount, char *words[], int maxcount);
```

---

### Example of Inlined C Accessor Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Provides a simple C function `Vector_x_get` that would typically be generated by SWIG for direct structure member access, illustrating the high-level view before inlining.

```C
double Vector_x_get(Vector *v) {
  return v->x;
}
```

---

### C++ Overloaded Function Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Illustrates a simple case of overloaded 'foo' functions in C++ with different parameter types, 'char\*' and 'int', highlighting the challenge for typeless scripting languages.

```C++
void foo(char *x);
void foo(int x);
```

---

### SWIG Example: Function Declaration Using MyClass Pointers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A C/C++ function declaration `void foo(MyClass *a, MyClass *b);` used to demonstrate how SWIG processes multiple arguments of the same type with fragments.

```C++
void foo(MyClass *a, MyClass *b);
```

---

### C++ Function with Multiple std::string Pointer Arguments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example C++ function signature demonstrating multiple arguments of type `std::string*`, which SWIG handles by renaming local variables.

```C++
void foo(std::string *x, std::string *y, std::string *z);
```

---

### SWIG Wrapping of C++ Namespaces

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how SWIG processes C++ namespaces. Namespace names do not appear in the module directly, but their contents are accessible. Includes an example of a SWIG interface file defining a namespace and its Python usage.

```SWIG
%module example

namespace foo {
  int fact(int n);
  struct Vector {
    double x, y, z;
  };
};
```

```Python
>>> import example
>>> example.fact(3)
6
>>> v = example.Vector()
>>> v.x = 3.4
>>> print(v.y)
0.0
>>>
```

---

### SWIG Command-line Options Reference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This section lists and describes the various command-line options available for the SWIG tool. These options control aspects like dependency generation, output file naming, optimization, warning suppression, and language standards.

```APIDOC
SWIG_Options:
  -MP: Generate phony targets for all dependencies
  -MT <target>: Set the target of the rule emitted by dependency generation
  -nocontract: Turn off contract checking
  -nocpperraswarn: Do not treat the preprocessor #error statement as #warning
  -nodefaultctor: Do not generate implicit default constructors
  -nodefaultdtor: Do not generate implicit default destructors
  -nodirprot: Do not wrap director protected members
  -noexcept: Do not wrap exception specifiers
  -nofastdispatch: Disable fast dispatch mode (default)
  -nopreprocess: Skip the preprocessor step
  -notemplatereduce: Disable reduction of the typedefs in templates
  -O: Enable the optimization options: -fastdispatch -fvirtual
  -o <outfile>: Set name of C/C++ output file to <outfile>
  -oh <headfile>: Set name of C++ output header file for directors to <headfile>
  -outcurrentdir: Set default output dir to current dir instead of input file's path
  -outdir <dir>: Set language specific files output directory to <dir>
  -pcreversion: Display PCRE2 version information
  -small: Compile in virtual elimination and compact mode
  -std=<standard>: Set the C or C++ language <standard> for inputs
  -swiglib: Report location of SWIG library and exit
  -templatereduce: Reduce all the typedefs in templates
  -U<symbol>: Undefine symbol <symbol>
  -v: Run in verbose mode
  -version: Display SWIG version number
  -Wall: Remove all warning suppression, also implies -Wextra
  -Wallkw: Enable keyword warnings for all the supported languages
  -Werror: Treat warnings as errors
  -Wextra: Adds the following additional warnings: 309,403,405,512,321,322
  -w<list>: Suppress/add warning messages, eg -w401,+321 - see Warnings.html
  -xmlout <file>: Write XML version of the parse tree to <file> after normal processing
```

---

### SWIG Command-line Argument Response File Usage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Demonstrates how to pass command-line arguments to SWIG using a response file, which is useful for long argument lists. The example shows the basic syntax, and the description clarifies how arguments are parsed within the file, including handling whitespace and special characters.

```Shell
swig @file
```

---

### SWIG Template Scoping Error Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the specific error message generated by SWIG when a %template directive is incorrectly instantiated in a scope where the template definition is not properly visible or accessible.

```Text
cpp_template_scope.i:34: Error: 'C' resolves to 'N::C' and was incorrectly instantiated
in scope 'unrelated' instead of within scope 'N'.
```

---

### SWIG Template Specialization Examples: Primary, Explicit, and Partial

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Presents a set of C++ template definitions including a primary template, an explicit specialization, and a partial specialization for the `Foo` class, demonstrating the different forms of template specialization supported by SWIG.

```C++
template<class T1, class T2> class Foo { };                     // (1) primary template
template<>                   class Foo<double *, int *> { };    // (2) explicit specialization
template<class T1, class T2> class Foo<T1, T2 *> { };           // (3) partial specialization
```

---

### C Function Example for %cstring_output_allocate

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Provides a C function `foo` that allocates memory for a string using `malloc` and populates it. This function is designed to be wrapped by SWIG's %cstring_output_allocate macro, returning the string via a `char **` parameter.

```C
void foo(char **s) {
  *s = (char *) malloc(64);
  sprintf(*s, "Hello world\n");
}
```

---

### Java Example: Using SWIG-Wrapped boost::shared_ptr

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Illustrates how to interact with the SWIG-wrapped C++ code that uses `boost::shared_ptr` from Java. It demonstrates creating an `IntValue` object and calling functions that accept it, showing seamless integration from the target language.

```Java
IntValue iv = new IntValue(1234);
int val1 = example.extractValue(iv);
int val2 = example.extractValueSmart(iv);
System.out.println(val1 + " " + val2);
```

---

### Mapped Java Intermediary JNI Class Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

The Java native method signature in the intermediary JNI class, reflecting the type mappings for the example C function parameters.

```Java
public final static native void func(int jarg1, String jarg2, int jarg3,
                                     java.math.BigInteger jarg4);
```

---

### Basic SWIG Command Line Execution

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet illustrates the fundamental command structure for invoking SWIG. It requires a SWIG interface file or a C/C++ header file as input, optionally preceded by various command-line options.

```bash
swig [ options ] filename
```

---

### C Function with Mutating Pointer Parameter

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of a C function that modifies one of its pointer parameters in place, a common pattern requiring special handling for language bindings.

```C
void negate(int *x) {
  *x = -(*x);
}
```

---

### C++ Global Variable Declaration Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This C++ global variable declaration illustrates the context for SWIG typemaps used for assigning to ('varin') and reading from ('varout') global variables.

```C++
int foo;
```

---

### Inject Custom Code into Generated C# Files using %module(csbegin)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Details the usage of the csbegin option in the %module directive to insert arbitrary code at the beginning of every generated C# file. Examples include enabling nullable reference types and using a macro for multi-line code injection.

```SWIG
%module(csbegin="#nullable enable\n") mymodule
```

```SWIG
%define CSBEGIN_CODE
"\n/* Copyright statement */\nusing System.Text;\n#nullable enable\n"
%enddef

%module(csbegin=CSBEGIN_CODE) mymodule
```

---

### Using SWIG %template with Namespaces and Templates

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates how to use the `%template` directive to expand templates defined within namespaces. It shows successful template expansion using both unqualified and fully qualified names, as well as within nested `using namespace` contexts.

```C++
namespace foo {
  template<typename T> T max(T a, T b) { return a > b ? a : b; }
}

using foo::max;

%template(maxint)   max<int>;           // Okay.
%template(maxfloat) foo::max<float>;    // Okay (qualified name).

namespace bar {
  using namespace foo;
  %template(maxdouble)  max<double>;    // Okay.
}
```

---

### Example C Application Using SWIG-Generated Circle Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C code demonstrates how to use the SWIG-generated functions to interact with a `Circle` object from C. It shows creating an instance, accessing its radius, calling the `area` method, and finally deleting the object.

```C
  Circle *c = Circle_new(1.5);
  printf("radius: %f\narea: %f\n", Circle_radius_get(c), Circle_area(c));
  Circle_delete(c);
```

---

### Python: printf Wrapper Limitation Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a limitation of the wrapped printf function when incorrect argument types are provided from Python, leading to a segmentation fault in the underlying C code.

```Python
>>> example.printf("la de da de da %s", 42)
Segmentation fault (core dumped)
```

---

### SWIG Wrapping C++ Classes to Ruby with Methods and Properties

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how SWIG wraps a C++ class, creating a corresponding Ruby class with instance methods for public member functions, accessors for public data members, and singleton methods for static functions. The Ruby example demonstrates usage.

```C++
class List {
public:
  List();
  ~List();
  int search(char *item);
  void insert(char *item);
  void remove(char *item);
  char *get(int n);
  int length;
  static void print(List *l);
};
```

```Ruby
require 'Example'

l = Example::List.new

l.insert("Ale")
l.insert("Stout")
l.insert("Lager")
Example.print(l)
l.length()
----- produces the following output
Lager
Stout
Ale
3
```

---

### Scilab Examples for printArray Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These Scilab commands demonstrate how the 'printArray' function, exposed via SWIG, handles different types of Scilab matrices (row, column, 2D) as input, showcasing Scilab's column-major ordering and implicit type conversions.

```Scilab
--> printArray([0 1 2 3], 4)
[ 0  1  2  3 ]

--> printArray([0.2; -1.8; 2; 3.7], 4)
[ 0  -1  2  3 ]

--> printArray([0 1; 2 3], 4)
[ 0  2  1  3 ]

--> printArray([0; 1; 2; 3], 4)
[ 0  1  2  3 ]
```

---

### ISO C Separate Tag Name Space Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a valid ISO C construct where a struct tag and a function name can share the same identifier because they reside in different name spaces.

```C
struct Foo {
  int bar;
};

int Foo(void) { return 42; }
```

---

### Java Example of SWIG-Wrapped Move Constructor

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how a SWIG-wrapped C++ move constructor behaves in Java, showing that a proxy instance can only be moved once before becoming unusable. The second call to the move constructor will fail as the 'mc' proxy instance has been moved.

```Java
MyClass mc = new MyClass();
MyClass mc1 = new MyClass(mc); // move constructor
MyClass mc2 = new MyClass(mc); // move constructor fails
```

---

### SWIG Interface Definition for C/C++ File Operations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a SWIG interface module 'example' that exposes standard C file I/O functions (fopen, fputs, fclose) to target languages like Python. This demonstrates how SWIG wraps C/C++ functions that operate on pointers (FILE\*).

```SWIG
%module example

FILE *fopen(const char *filename, const char *mode);
int fputs(const char *, FILE *);
int fclose(FILE *);
```

---

### C Pointer to `const` Data Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Demonstrates a C declaration where the pointer itself is not `const`, but the data it points to is. This highlights that the pointer `e` can be reassigned, even though the value at `*e` is read-only.

```C
const char *e;          // A pointer to a constant character.  The pointer
                        // may be modified.
```

---

### Compile and Link SWIG Generated Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates the command-line process for compiling application code and linking it against a SWIG-generated shared module using GCC. It also provides guidance on setting environment variables like LD_LIBRARY_PATH or PATH to ensure the operating system can locate the module at runtime.

```bash
$ gcc runme.c -L. -lexample -o runme
```

---

### Define Second Part of C# Partial Class for ExtendMe

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of how to define another part of the `ExtendMe` partial class in C#, adding a new method `Part2()`. This demonstrates the utility of partial classes for extending SWIG-generated code.

```C#
public partial class ExtendMe : global::System.IDisposable {
  public int Part2() {
    return 2;
  }
}
```

---

### Define C Function and Global Variable in SWIG for Scilab

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file (`example.i`) defines a Scilab module named 'example'. It demonstrates the use of the `%inline` directive to embed C code directly, including a global `double` variable `Foo` and a recursive `int` function `fact`. This code is parsed by SWIG and inserted into the generated wrapper file, making the C entities accessible from Scilab.

```SWIG Interface
%module example

%inline %{
double Foo = 3.0;

int fact(int n) {
  if (n < 0) {
    return 0;
  }
  else if (n == 0) {
    return 1;
  }
  else {
    return n * fact(n-1);
  }
}
%}
```

---

### Python Implicit Namespace Packages for Flexible Module Distribution

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates the flexibility of Python's implicit namespace packages (PEP 0420, Python 3.3+), allowing modules to be physically distributed across multiple file system paths or loaded from a combination of .zip files and directories, which is highly beneficial for deploying SWIG-generated Python and native modules.

```Python
/fragment1/pkg1/mod1.py
/fragment2/pkg1/mod2.py
/fragment3/pkg1/mod3.py
```

```Python
/some/path/brave/sir/robin.py
/some/path/brave/sir/_robin.so
```

```Python
/some/path/brave/sir/robin.py
/some/other/path/brave/sir/_robin.so
```

```Python
brave/
brave/sir/
brave/sir/robin.py
```

```Python
/some/other/path/brave/sir/_robin.so
```

---

### C/C++ Example: Converting and Creating SWIG Pointers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C/C++ code snippet demonstrates the practical usage of `SWIG_ConvertPtr` to convert a Python input to a C pointer of type `Foo*`, including error handling. It also shows how to use `SWIG_NewPointerObj` to create a new Python object from the C pointer.

```C
Foo *f;
if (!SWIG_IsOK(SWIG_ConvertPtr($input, (void **) &f, SWIGTYPE_p_Foo, 0))) {
  SWIG_exception_fail(SWIG_TypeError, "in method '$symname', expecting type Foo");
}

PyObject *obj;
obj = SWIG_NewPointerObj(f, SWIGTYPE_p_Foo, 0);
```

---

### C++17 UTF-8 Character Literal Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus17

C++17 introduced UTF-8 (u8) character literals, which are of type char. This code snippet demonstrates the syntax for defining such a literal.

```C++
char a = u8'a';
```

---

### SWIG Typemaps for Input and Output Parameters

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use `typemaps.i` and the `INPUT`/`OUTPUT` directives in a SWIG interface file to simplify the handling of C pointer parameters, making them appear as simple values in target languages.

```SWIG
%module example
%include "typemaps.i"

void add(int, int, int *OUTPUT);
int  sub(int *INPUT, int *INPUT);
```

---

### Python: Single-Line Docstring Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows the format for a single-line docstring in Python. When a 'docstring' feature is applied to a node in the parse tree and its content is on a single line, SWIG outputs it in this compact format.

```Python
"""This is the docstring"""
```

---

### Console Output of Java Example Execution

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

The command-line execution and output of the runme.java program, showing the status code and the two output values successfully retrieved from the C function via the MyDouble objects.

```Shell
$ java runme
1 12.0  340.0
```

---

### Console Output of Java Array Wrapping Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

Displays the expected output when running the Java code that utilizes SWIG-wrapped C arrays. It confirms the successful population and retrieval of array elements, demonstrating the integration.

```Text
array: 100 101 102 103
global_array: 100 101 102 103
```

---

### SWIG Module and Global C Function Definition

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface definition declares a module named 'example' and a global C function `fact` that takes an integer and returns an integer. SWIG will wrap this C function as a static method in the generated Java module class.

```SWIG
%module example
int fact(int n);
```

---

### C/C++: Example of Non-Constant Pointer to Constant Character

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates a C/C++ declaration where the pointer itself is modifiable, but the data it points to is constant. This highlights the distinction between a constant pointer and a pointer to constant data.

```C/C++
const char *e;          // A pointer to a constant character.  The pointer
                        // may be modified.
```

---

### C/C++ Function Signature Example for Return Value Handling

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows a C/C++ function signature relevant to return value typemaps like 'out', 'ret', and 'newfree', which manage function return values and newly allocated objects.

```C++
int foo(int x, double y, char *s);
```

---

### Wrap C/C++ Constants to Ruby Module Constants

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Explains how SWIG wraps C/C++ constants (defined via #define, %constant, or const) into Ruby module constants. Includes examples of constant declarations in SWIG and their access in Ruby.

```C
#define PI 3.14159
#define VERSION "1.0"

%constant int FOO = 42;
%constant const char *path = "/usr/local";

const int BAR = 32;
```

```Ruby
$ irb
irb(main):001:0> require 'Example'
true
irb(main):002:0> Example::PI
3.14159
```

---

### Verify SWIG-Wrapped C++ Inheritance in Python

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how Python's built-in functions like 'isinstance' (represented as 'instance' in the example) and 'issubclass' correctly reflect the inheritance relationships of SWIG-wrapped C++ classes.

```Python
>>> b = Bar()
>>> instance(b, Foo)
1
>>> issubclass(Bar, Foo)
1
>>> issubclass(Foo, Bar)
0
```

---

### SWIG Wrapping of Simple Pointers using cpointer.i Library

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Explores the `cpointer.i` library as an alternative for wrapping simple C/C++ pointers. It demonstrates generating helper functions or a class-like interface for creating, manipulating, and dereferencing pointers in the target language.

```SWIG
%module example
%include "cpointer.i"

%inline %{
extern void add(int x, int y, int *result);
%}

%pointer_functions(int, intp);
```

```C
int  *new_intp();
int  *copy_intp(int *x);
void  delete_intp(int *x);
void  intp_assign(int *x, int value);
int   intp_value(int *x);
```

```Java
SWIGTYPE_p_int intPtr = example.new_intp();
example.add(3, 4, intPtr);
int result = example.intp_value(intPtr);
System.out.println("3 + 4 = " + result);
```

```SWIG
%pointer_class(int, intp)
```

```Java
intp intPtr = new intp();
example.add(3, 4, intPtr.cast());
int result = intPtr.value();
System.out.println("3 + 4 = " + result);
```

---

### SWIG Warning for Initializer List Usage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

SWIG detects the use of `std::initializer_list` and emits an informative warning. This snippet shows an example of such a warning message generated by SWIG.

```SWIG Output
example.i:33: Warning 476: Initialization using std::initializer_list.
```

---

### Java Usage of SWIG Generated Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java code demonstrates how to call a C function, 'fact', exposed through a SWIG-generated module named 'example'. It passes an integer argument, which will trigger the previously defined SWIG typemap for 'int'.

```Java
System.out.println(example.fact(6));
```

---

### SWIG Example: Using %pointer_class for Integer Pointers (Proxy Classes)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to use the %pointer_class macro in a SWIG interface file to create a class-based wrapper for "int \*" pointers, and then how to interact with this proxy class in Python to create, manipulate, and dereference integer pointers more conveniently.

```SWIG
%module example
%include "cpointer.i"

/* Wrap a class interface around an "int *" */
%pointer_class(int, intp);

/* A function that uses an "int *" */
void add(int x, int y, int *result);
```

```Python
>>> import example
>>> c = example.intp()         # Create an "int" for storing result
>>> example.add(3, 4, c)       # Call function
>>> c.value()                  # Dereference
7
```

---

### Example C++ Class for SWIG Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

A simple C++ class `Foo` used to illustrate how SWIG generates proxy classes for C++ functionality, including a constructor, destructor, method, and public member.

```C++
class Foo {
  public:
    Foo();
    ~Foo();
    int  bar(int x);
    int  x;
};
```

---

### Debug SWIG Multi-Argument Typemap Search

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example of `-debug-tmsearch` output specifically illustrates how SWIG identifies and reports multi-argument typemaps. It shows that these typemaps are only listed if a successful match is found, providing concise feedback on their application.

```Shell
...
example.h:39: Searching for a suitable 'in' typemap for: char *buffer
  Looking for: char *buffer
  Multi-argument typemap found...
  Using: %typemap(in) (char *buffer, int len)
...
```

---

### Complex C++ Namespace Combinations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Presents an advanced example combining nested namespaces, `using` directives, `typedef`, and namespace aliasing to demonstrate the complexity of C++ namespace interactions and symbol accessibility.

```C++
namespace A {
  class Foo {
  };
}

namespace B {
  namespace C {
    using namespace A;
  }
  typedef C::Foo FooClass;
}

namespace BIGB = B;

namespace D {
  using BIGB::FooClass;
  class Bar : public FooClass {
  }
};

class Spam : public D::Bar {
};

void evil(A::Foo *a, B::FooClass *b, B::C::Foo *c, BIGB::FooClass *d,
          BIGB::C::Foo *e, D::FooClass *f);
```

---

### Example Usage of SWIG Generated Java Proxy Class

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java code snippet demonstrates how a user would interact with a SWIG-generated 'Foo' proxy class. It shows object instantiation, setting a member variable, and calling a method, illustrating the type safety and Java-like feel provided by the proxy layer, making the C++ object behave as if it were a native Java class.

```Java
Foo f = new Foo();
f.setX(3);
int y = f.spam(5, new Foo());
```

---

### Defining Nested C Structures for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Illustrates the definition of two C structures, `Foo` and `Bar`, where `Bar` contains an instance of `Foo` as a data member. This serves as an example for how SWIG processes nested structure members.

```C
typedef struct Foo {
  int x;
} Foo;

typedef struct Bar {
  int y;
  Foo f;           /* struct member */
} Bar;
```

---

### Mapped Java Module Class Method for C Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

The corresponding Java module class method signature generated by SWIG for the example C function, showing how C types are mapped to Java types.

```Java
public static void func(int a, String b, int c, java.math.BigInteger d) {...}
```

---

### Scilab Example: Manipulate IntVector and Call Average Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Scilab code demonstrates the usage of the wrapped `IntVector` and `average` function. It shows how to initialize the module, create and populate an `IntVector`, pass it to the `average` function, and also illustrates passing a native Scilab matrix directly to the wrapped function.

```Scilab
--> example_Init();

--> v = new_IntVector();

--> for i = 1:4
-->     IntVector_push_back(v, i);
--> end;

--> average(v)
 ans  =

    2.5

--> average([0 1 2 3])
 ans  =

    2.5

--> delete_IntVector();
```

---

### ISO C Name Space Example with Struct and Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

This C code demonstrates valid ISO C where a struct tag and a function can share the same name because they reside in different name spaces. SWIG, however, does not fully implement this separation.

```C
struct Foo {
  int bar;
};

int Foo(void) { return 42; }
```

---

### C++14 Binary Integer Literal Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus14

Demonstrates the use of C++14 binary integer literals, which are fully supported by SWIG. This snippet shows a simple integer declaration using the '0b' prefix.

```C++
int b = 0b101011;
```

---

### Building PCRE2 Static Library

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Commands to navigate to the SWIG source directory and execute the pcre-build.sh script to build the PCRE2 third-party library as a static library, which is required by SWIG.

```Shell
cd /usr/src/swig
Tools/pcre-build.sh
```

---

### Example usage of JavascriptCore exception extraction

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C snippet demonstrates how to use the `script_exception_to_string` function to process a JavascriptCore exception. It checks for an exception, calls the extraction function, and prints the resulting error string.

```C
if(js_exception)
{
  char return_error_string[256];
  script_exception_to_string(js_context, js_exception, return_error_string, 256);
  printf("Compile error is %s", return_error_string);
}
```

---

### C++ Function with 2D Array Parameter

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of a C++ function taking a 2D array as a parameter, which can be challenging to call directly from scripting languages like Python without helper functions.

```C++
void set_transform(Image *im, double m[4][4]);
```

---

### Perl Usage Example for C++ Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Shows how the `foo` function would ideally be called in Perl, highlighting the need for a mechanism to convert Perl strings to C++ `std::string`.

```Perl
$x = foo("Hello World");
```

---

### Direct Tcl Usage of SWIG Low-Level Wrappers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to directly call the low-level C-style wrapper functions generated by SWIG from Tcl after loading the extension module, showing explicit access to members and methods.

```Tcl
% load ./example.so
% set f [new_Foo]
% Foo_x_get $f
0
% Foo_spam $f 3
1
%
```

---

### C++ Class Definition for SWIG Ownership Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a C++ class `Foo` with a constructor and methods returning `Foo` by value, reference, and pointer, serving as a basis to illustrate SWIG's ownership flag behavior in Java.

```C++
class Foo {
public:
  Foo();
  Foo bar1();
  Foo &bar2();
  Foo *bar2();
};
```

---

### SWIG Preprocessor Conditional Compilation Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a complex conditional compilation directive using SWIG's preprocessor, including C++ specific checks and string comparisons for `__VA_ARGS__` and `TYPE`.

```C/C++ Preprocessor
#if defined __cplusplus && (#__VA_ARGS__ != "" || #TYPE == "void")
```

---

### Python Example: Calling C Function with Tuple

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how the `set_direction` C function, exposed via SWIG, can be called from Python by passing a standard Python tuple. The typemap handles the conversion to a C array transparently.

```Python
set_direction((0.5, 0.0, 1.0, -0.25))
```

---

### Generate C++ Wrappers for Lua Extension

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

To build a C++ extension for Lua, use the -c++ option in addition to -lua. This command instructs SWIG to generate C++ wrapper code (example_wrap.cxx) that can be compiled and linked with your C++ application.

```Shell
$ swig -c++ -lua example.i
```

---

### Define C++ Classes for SWIG Proxy Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines simple C++ classes `Foo` and `Spam` to illustrate memory management challenges when wrapped by SWIG proxy classes. `Foo` has basic members and methods, while `Spam` contains a pointer to `Foo`.

```C++
class Foo {
public:
  Foo();
  ~Foo();
  int bar(int x);
  int x;
};

class Spam {
public:
  Foo *value;
  ...
};
```

---

### SWIG Multi-Argument Typemap Syntax Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Shows the basic syntax for defining a SWIG multi-argument typemap, where the arguments are enclosed in parentheses. This snippet highlights the structural requirement for multi-argument typemap declarations.

```SWIG
%typemap(in) (int argc, char *argv[]) { ... }
```

---

### Tcl Error: Couldn't Find Module Initialization Procedure

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a common error encountered when loading a SWIG module where the `Example_Init` procedure is not found. This typically indicates a mismatch between the shared object file name and the module name supplied using the SWIG `%module` directive, or forgetting to link the SWIG-generated wrapper code with the rest of the application.

```Tcl
% load ./example.so
couldn't find procedure Example_Init
%
```

---

### Tcl Example: Calling SWIG Wrapped C Function with Default String

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how a C function wrapped by SWIG with default string handling would be called in Tcl, where the argument points to the internal Tcl string representation.

```Tcl
% foo Hello
```

---

### C++ Class Template Full Specialization Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Demonstrates C++ class template full specialization. Shows that only the exact type matches the fully specialized template, unlike partial specialization.

```C++
template <typename T> struct Y       { void a(); };
template <> struct Y< int const & >  { void b(); };

Y< int & >             y1;  y1.a();
Y< int *const& >       y2;  y2.a();
Y< int const *const& > y3;  y3.a();
Y< int const& >        y4;  y4.b(); // fully specialized match
```

---

### Define C Source Code for JNI Integration

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

C source file `example.c` containing a global variable `Foo` and a `gcd` function. This code will be exposed to Java via SWIG and JNI for native calls.

```C
/* File : example.c */

/* A global variable */
double Foo = 3.0;

/* Compute the greatest common divisor of positive integers */
int gcd(int x, int y) {
  int g;
  g = y;
  while (x > 0) {
    g = x;
    x = y % x;
    y = g;
  }
  return g;
}
```

---

### SWIG Type Encoding Examples for C Datatypes

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Illustrates how various C data types are represented as SWIG internal type encoding strings, showing the mapping between C declarations and their SWIG string equivalents.

```SWIG Encoding
C datatype                     SWIG encoding (strings)
-----------------------------  --------------------------
int                            "int"
int *                          "p.int"
const int *                    "p.q(const).int"
int (*x)(int, double)          "p.f(int, double).int"
int [20][30]                   "a(20).a(30).int"
int (F::*)(int)                "m(F).f(int).int"
vector<int> *                  "p.vector<(int)>"
```

---

### SWIG Ambiguous Overload Resolution and Warnings

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates C++ function overloads that SWIG may struggle to disambiguate, leading to warning messages. Shows examples of problematic declarations and the resulting warning.

```C++
void spam(int);
void spam(short);
```

```C++
void foo(Bar *b);
void foo(Bar &b);
```

```Log
example.i:12: Warning 509: Overloaded method spam(short) effectively ignored,
example.i:11: Warning 509: as it is shadowed by spam(int).
```

---

### ccache-swig Command Line Options Summary

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CCache

Provides a quick reference for the most common command-line options available when invoking ccache-swig directly.

```APIDOC
-s                      show statistics summary
-z                      zero statistics
-c                      run a cache cleanup
-C                      clear the cache completely
-F <n>                  set maximum files in cache
-M <n>                  set maximum size of cache (use G, M or K)
-h                      this help page
-V                      print version number
```

---

### Python Passing String to SWIG-Wrapped C Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of calling a SWIG-wrapped C function `foo` from Python, passing a string literal. Demonstrates the direct mapping of Python strings to `char *` in C.

```Python
>>> foo("Hello")
```

---

### Example Usage of SWIG Generated Java Proxy Class

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This snippet demonstrates how to instantiate and interact with a SWIG-generated Java proxy class, 'Foo'. It shows creating an object, setting a member variable, and calling a method, illustrating the type-safe Java interface that abstracts the underlying C++ implementation.

```Java
Foo f = new Foo();
f.setX(3);
int y = f.spam(5, new Foo());
```

---

### Compile C JNI Layer with ndk-build

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command invokes `ndk-build` to compile the C source files (`example_wrap.c`, `example.c`) into a shared object library (`libexample.so`) for the Android platform. It shows the typical output of the compilation process.

```bash
$ ndk-build
Compile thumb  : example <= example_wrap.c
Compile thumb  : example <= example.c
SharedLibrary  : libexample.so
Install        : libexample.so => libs/armeabi/libexample.so
```

---

### SWIG: Custom exception handler using SWIG_exception

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Example of using SWIG_exception within a SWIG %exception directive to catch a C++ std::out_of_range exception and re-throw it as a language-independent SWIG_IndexError.

```SWIG
%include "exception.i"
%exception std::vector::getitem {
  try {
    $action
  } catch (std::out_of_range& e) {
    SWIG_exception(SWIG_IndexError, const_cast<char*>(e.what()));
  }
}
```

---

### Tcl Encoded C++ Pointer Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Illustrates how a C++ pointer is encoded as a string in Tcl, including a type tag for identification, which is crucial for SWIG's type checking.

```Tcl
_808fea88_p_Circle
```

---

### NMAKE Makefile for SWIG Tcl Extension

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Makefile provides a template for building SWIG-generated Tcl extensions using NMAKE. It defines source files, interface files, wrapper files, and specifies paths to Visual C++ tools, include directories, and libraries required for compilation and linking into a DLL.

```Makefile
# Makefile for building various SWIG generated extensions

SRCS          = example.c
IFILE         = example
INTERFACE     = $(IFILE).i
WRAPFILE      = $(IFILE)_wrap.c

# Location of the Visual C++ tools (32 bit assumed)

TOOLS         = c:\msdev
TARGET        = example.dll
CC            = $(TOOLS)\bin\cl.exe
LINK          = $(TOOLS)\bin\link.exe
INCLUDE32     = -I$(TOOLS)\include
MACHINE       = IX86

# C Library needed to build a DLL

DLLIBC        = msvcrt.lib oldnames.lib

# Windows libraries that are apparently needed
WINLIB        = kernel32.lib advapi32.lib user32.lib gdi32.lib comdlg32.lib
winspool.lib

# Libraries common to all DLLs
LIBS          = $(DLLIBC) $(WINLIB)

# Linker options
LOPT      = -debug:full -debugtype:cv /NODEFAULTLIB /RELEASE /NOLOGO /
MACHINE:$(MACHINE) -entry:_DllMainCRTStartup@12 -dll

# C compiler flags

CFLAGS    = /Z7 /Od /c /nologo
TCL_INCLUDES  = -Id:\tcl8.0a2\generic -Id:\tcl8.0a2\win
TCLLIB        = d:\tcl8.0a2\win\tcl80.lib

tcl:
        ..\..\swig -tcl -o $(WRAPFILE) $(INTERFACE)
        $(CC) $(CFLAGS) $(TCL_INCLUDES) $(SRCS) $(WRAPFILE)
        set LIB=$(TOOLS)\lib
        $(LINK) $(LOPT) -out:example.dll $(LIBS) $(TCLLIB) example.obj example_wrap.obj
```

---

### Correct Order for SWIG Template Definition and Instantiation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates the correct order for defining a C++ class template and then instantiating it using the SWIG `%template` directive. The template definition must appear before its instantiation for SWIG to process it successfully.

```SWIG
template<class T> class List { ... };
%template(intList) List<int>;
```

---

### SWIG Typemap Application with Typedef

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG example shows how typemaps follow 'typedef' declarations. The typemap defined for 'int nonnegative' will also apply to 'Integer nonnegative' because 'Integer' is a 'typedef' for 'int'.

```SWIG
%typemap(in) int nonnegative {
  $1 = $input;
  printf("Received an integer : %d\n",  $1);
}
%inline %{
typedef int Integer;
extern int fact(Integer nonnegative);    // Above typemap is applied
%}
```

---

### Declare a C global variable for scripting language linking

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C global variable `Foo` is an example of a variable that can be linked to a scripting language interpreter, allowing scripts to read and modify its value.

```C
double Foo = 3.5;
```

---

### Define a simple C function for factorial calculation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C function calculates the factorial of an integer. It serves as a basic example to illustrate how SWIG handles type conversion for simple C declarations.

```C
int factorial(int n);
```

---

### Example Usage of SWIG-Generated GOOPS Proxy Classes

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Scheme code demonstrates how to interact with the SWIG-generated GOOPS proxy classes. It shows two approaches: direct `slot-ref`/`slot-set!` for accessing members, and using the generated accessor methods (when `-emit-slot-accessors` is enabled) for a more idiomatic GOOPS style.

```Scheme
;; not using getters and setters
(define foo (make <Foo> #:args '(45)))
(slot-ref foo 'a)
(slot-set! foo 'a 3)
(getMultBy foo 4)
(define foo2 (getFooMultBy foo 7))
(slot-ref foo 'a)
(slot-ref (getFooPlus foo 4) 'a)

;; using getters and setters
(define foo (make <Foo> #:args '(45)))
(a foo)
(set! (a foo) 5)
(getMultBy foo 4)
(a (getFooMultBy foo 7))
```

---

### Node-webkit Project Directory Structure

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet illustrates the typical directory structure for a simple node-webkit application. It highlights the placement of the package.json configuration file, the main HTML and JavaScript files, and the node_modules directory for native extensions.

```Plaintext
- package.json
- app.html
- app.js
- node_modules
  / example
  ... (as known from node.js)
```

---

### Compile SWIG C++ Extensions with Sun C++ Compiler

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example shows how to compile SWIG-generated C++ extensions using the Sun C++ compiler (CC) on Solaris. It highlights the use of specific options like -KPIC for position-independent code and the inclusion of additional libraries such as -lCrun, which may be necessary for proper linking on Sun systems.

```Shell
% swig -c++ -tcl example.i
% CC -KPIC -c example.cxx
% CC -KPIC -c example_wrap.cxx -I/usr/local/include
% CC -G example.o example_wrap.o -L/opt/SUNWspro/lib -o example.so -lCrun
```

---

### SWIG: Rename wx Prefix in Identifiers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG %rename directive removes the 'wx' prefix from identifiers, except for those starting with 'wxEVT', effectively transforming 'wxSomeWidget' to 'SomeWidget' while preserving 'wxEVT_PAINT'.

```SWIG
%rename("%(regex:/wx(?!EVT)(.*)/\\1/)s") ""; // wxSomeWidget -> SomeWidget
                                             // wxEVT_PAINT -> wxEVT_PAINT
```

---

### SWIG Simple Default Typemap Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Shows the specific SWIGTYPE typemap rule that handles simple types not covered by more specialized rules, often triggered when values are passed or returned by value.

```SWIG Typemap
%typemap(in) SWIGTYPE              { ... simple default handling ...                          }
```

---

### SWIG C# Named and Optional Arguments with cs:defaultargs

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how to use the `cs:defaultargs` feature in SWIG to enable C# named and optional arguments for C++ functions and constructors. It shows how to apply the feature to specific methods, override default argument values, and handle string literals.

```SWIG
    %feature("cs:defaultargs") Foo::Foo;
    %feature("cs:defaultargs", x=0, z=4) Foo::bar;
    %feature("cs:defaultargs", x="\"five\"") Foo::zoo;
```

```C++
    %inline %{
    class Foo {
    public:
        Foo(int a, int b=1, int c=2)
        {
        }
        int bar(int x, int y=2, int z=3)
        {
            return x+y+z;
        }
        int bat(int x=1, int y=2, int z=3)
        {
            return x+y+z;
        }
        int zoo(std::string x="four")
        {
            return (int)x.size();
        }
    };
    %}
```

---

### Python: Resulting Module and Package Names from Directory Structure

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet lists the fully qualified names of the Python packages and modules derived from the example directory structure. It demonstrates how the file system hierarchy translates into the logical module and package names used in Python imports.

```Python
pkg1            # package
pkg1.pkg2       # package
mod1            # module
pkg1.mod2       # module
pkg1.pkg2.mod3  # module
```

---

### C Example: Functions and Global Variable for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C code snippet defines a global double variable `My_variable` and two integer functions, `fact` for calculating factorial and `my_mod` for modulo. These elements are intended to be wrapped by SWIG to be accessible from other target languages like Tcl.

```C
/* File : example.c */

double My_variable = 3.0;

/* Compute factorial of n */
int fact(int n) {
  if (n <= 1)
    return 1;
  else
    return n*fact(n-1);
}

/* Compute n mod m */
int my_mod(int n, int m) {
  return(n % m);
}

```

---

### Define SWIG Module and Wrap C Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file snippet defines a Python module named 'example' and declares a C function 'fact' for wrapping. The '%module' directive specifies the target Python module name, and the C function signature indicates what will be exposed.

```SWIG
%module example
int fact(int n);
```

---

### C Function to Sum Array Elements

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a C function `sumitems` that takes an integer pointer and the number of items, then calculates and returns their sum. This function serves as the target for SWIG wrapping examples.

```C
int sumitems(int *first, int nitems) {
  int i, sum = 0;
  for (i = 0; i < nitems; i++) {
    sum += first[i];
  }
  return sum;
}
```

---

### C++ Class Definitions for Proxy Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Defines simple C++ classes `Foo` and `Spam` to illustrate memory management challenges when wrapped by scripting language proxies. `Foo` is a basic class, and `Spam` contains a pointer to `Foo`.

```C++
class Foo {
public:
  Foo();
  ~Foo();
  int bar(int x);
  int x;
};

class Spam {
public:
  Foo *value;
  ...
};
```

---

### Building SWIG Executable

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Commands to navigate to the SWIG source directory and execute the standard autotools build process: autogen.sh to generate build files, configure to prepare the build, and make to compile swig.exe.

```Shell
cd /usr/src/swig
./autogen.sh
./configure
make
```

---

### SWIG C# Typemap 'null' Attribute Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to use the 'null' attribute in an 'out' typemap to specify a custom value for $null, particularly when changing the return type to void.

```SWIG Typemap
%typemap(ctype) Status "void"
%typemap(out, null="") Status { ... }
```

---

### Run Individual Testcases Verbose Output

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Executes individual test cases without the `-s` option, which allows seeing the exact commands being executed during the build and run process. This is useful for debugging.

```Shell
make [testcase].ctest
make [testcase].cpptest
make [testcase].multicpptest
```

---

### C++ Using Declarations for Overloaded Methods and SWIG Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how C++ `using` declarations introduce overloaded methods from base classes into a derived class, making them accessible. Includes examples of the C++ class structure, how the methods are invoked in C++, and how SWIG successfully wraps this functionality for Python.

```C++
class Foo {
public:
  int blah(int x);
};

class Bar {
public:
  double blah(double x);
};

class FooBar : public Foo, public Bar {
public:
  using Foo::blah;
  using Bar::blah;
  char *blah(const char *x);
};
```

```C++
FooBar *f;
f->blah(3);         // Ok. Invokes Foo::blah(int)
f->blah(3.5);       // Ok. Invokes Bar::blah(double)
f->blah("hello");   // Ok. Invokes FooBar::blah(const char *);
```

```Python
>>> import example
>>> f = example.FooBar()
>>> f.blah(3)
>>> f.blah(3.5)
>>> f.blah("hello")
```

---

### Python Usage Example for Setting Structure Array Member

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Demonstrates how to create an instance of `SomeObject` in Python and successfully set its array member `x` using a Python list. This functionality is enabled by the 'memberin' typemap.

```Python
>>> s = SomeObject()
>>> s.x = [1, 2.5, 5, 10]
```

---

### SWIG Typemap Precedence and Longest-Match Rules

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how SWIG applies typemaps based on precedence and longest-match rules. Multi-argument typemaps take precedence over simple ones, and the most specific match is chosen for a given function signature.

```SWIG
%typemap(in) int argc                              { ... typemap 1 ... }
%typemap(in) (int argc, char *argv[])              { ... typemap 2 ... }
%typemap(in) (int argc, char *argv[], char *env[]) { ... typemap 3 ... }

int foo(int argc, char *argv[]);                   // Uses typemap 2
int bar(int argc, int x);                          // Uses typemap 1
int spam(int argc, char *argv[], char *env[]);     // Uses typemap 3
```

---

### SWIG: Feature Application with Default Arguments (All Overloads)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Customization

This example demonstrates how a SWIG feature applies to all generated overloaded methods when default arguments are specified in the %feature directive. The feature for hello(int i=0, double d=0.0) will apply to hello(int i, double d), hello(int i), and hello().

```SWIG
%feature("except") hello(int i=0, double d=0.0) { ... }
void hello(int i=0, double d=0.0);
```

```SWIG
void hello(int i, double d);
void hello(int i);
void hello();
```

---

### Console Output of SWIG Java-C String Array Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet displays the expected output when the `runme.java` program is executed, confirming the successful conversion and printing of string arrays passed between Java and C via the SWIG interface.

```Shell
$ java runme
argv[0] = Cat
argv[1] = Dog
argv[2] = Cow
argv[3] = Goat
0:Dave
1:Mike
2:Susan
3:John
4:Michelle
```

---

### Running SWIG for C Target Language

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to run SWIG to generate a C module from an interface file using the -c option.

```Shell
$ swig -c example.i
```

---

### C Function Example for %cstring_output_allocate_size

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Presents a C function `foo` that allocates memory for a string and returns both the string and its size via `char **` and `int *` parameters. This function is suitable for wrapping with SWIG's %cstring_output_allocate_size macro and can handle binary data.

```C
void foo(char **s, int *sz) {
  *s = (char *) malloc(64);
  *sz = 64;
  // Write some binary data
  ...
}
```

---

### Verify Android Device Connection with ADB

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

Command to check if an Android device is properly connected and recognized by the Android Debug Bridge (ADB) before attempting to install applications. It lists attached devices.

```bash
$ adb devices
List of devices attached
A32-6DBE0001-9FF80000-015D62C3-02018028 device
```

---

### SWIG Command Line Options Reference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

A comprehensive reference of command-line options for the SWIG tool, categorized by their function: supported target languages, experimental languages, deprecated options, and general configuration flags. Each option's purpose is briefly described.

```APIDOC
Supported Target Language Options:
  -csharp: Generate C# wrappers
  -d: Generate D wrappers
  -go: Generate Go wrappers
  -guile: Generate Guile wrappers
  -java: Generate Java wrappers
  -javascript: Generate Javascript wrappers
  -lua: Generate Lua wrappers
  -octave: Generate Octave wrappers
  -perl5: Generate Perl 5 wrappers
  -php7: Generate PHP 8 or later wrappers
  -python: Generate Python wrappers
  -r: Generate R (aka GNU S) wrappers
  -ruby: Generate Ruby wrappers
  -scilab: Generate Scilab wrappers
  -tcl8: Generate Tcl 8 wrappers
  -xml: Generate XML wrappers

Experimental Target Language Options:
  -c: Generate C wrappers
  -ocaml: Generate OCaml wrappers

Deprecated Target Language Options:
  -mzscheme: Generate MzScheme/Racket wrappers

General Options:
  -addextern: Add extra extern declarations
  -c++: Enable C++ processing
  -co <file>: Check <file> out of the SWIG library
  -copyctor: Automatically generate copy constructors wherever possible
  -cpperraswarn: Treat the preprocessor #error statement as #warning (default)
  -cppext <ext>: Change file extension of generated C++ files to <ext> (default is cxx)
  -copyright: Display copyright notices
  -debug-classes: Display information about the classes found in the interface
  -debug-module <n>: Display module parse tree at stages 1-4, <n> is a csv list of stages
  -debug-symtabs: Display symbol tables information
  -debug-symbols: Display target language symbols in the symbol tables
  -debug-csymbols: Display C symbols in the symbol tables
  -debug-lsymbols: Display target language layer symbols
  -debug-quiet: Display less parse tree node debug info when using other -debug options
  -debug-tags: Display information about the tags found in the interface
  -debug-template: Display information for debugging templates
  -debug-top <n>: Display entire parse tree at stages 1-4, <n> is a csv list of stages
  -debug-typedef: Display information about the types and typedefs in the interface
  -debug-typemap: Display typemap debugging information
  -debug-tmsearch: Display typemap search debugging information
  -debug-tmused: Display typemaps used debugging information
  -directors: Turn on director mode for all the classes, mainly for testing
  -dirprot: Turn on wrapping of protected members for director classes (default)
  -D<symbol>[=<value>]: Define symbol <symbol> (for conditional compilation)
  -E: Preprocess only, does not generate wrapper code
  -external-runtime [file]: Export the SWIG runtime stack
  -fakeversion <v>: Make SWIG fake the program version number to <v>
  -fcompact: Compile in compact mode
  -features <list>: Set global features, where <list> is a comma separated list of features, eg -features directors,autodoc=1. If no explicit value is given to the feature, a default of 1 is used
  -fastdispatch: Enable fast dispatch mode to produce faster overload dispatcher code
  -Fmicrosoft: Display error/warning messages in Microsoft format
  -Fstandard: Display error/warning messages in commonly used format
  -fvirtual: Compile in virtual elimination mode
  -help: Display help
  -I-: Don't search the current directory
  -I<dir>: Look for SWIG files in directory <dir>
  -ignoremissing: Ignore missing include files
  -importall: Follow all #include statements as imports
  -includeall: Follow all #include statements
  -l<ifile>: Include SWIG library file <ifile>
  -macroerrors: Report errors inside macros
  -M: List all dependencies
  -MD: Is equivalent to `-M -MF <file>', except `-E' is not implied
  -MF <file>: Generate dependencies into <file> and continue generating wrappers
  -MM: List dependencies, but omit files in SWIG library
  -MMD: Like `-MD', but omit files in SWIG library
  -module <name>: Set module name to <name>
```

---

### SWIG Interface Definition for C++ Classes and Templates

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file defines a module named 'example', declares a C++ class 'SomeClass' and a template class 'SomeTemplateClass'. It also instantiates 'SomeTemplateClass' for 'int' as 'SomeIntTemplateClass', preparing them for SWIG's wrapper generation process.

```SWIG
%module example

%inline
%{
  class SomeClass{};
  template <typename T> class SomeTemplateClass{};
  SomeClass someFunction(SomeTemplateClass<int> &someParameter, int simpleInt);
%}

%template (SomeIntTemplateClass) SomeTemplateClass<int>;
```

---

### Load SWIG Module with loadlib (Lua 5.0.x)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

For Lua 5.0.x, this snippet shows how to explicitly load a dynamic module using the loadlib function. It loads the shared library and calls the exported initialization function (luaopen_example) to make the module available.

```Lua
my_init=loadlib("example.so", "luaopen_example") -- for Unix/Linux
--my_init=loadlib("example.dll", "luaopen_example") -- for Windows
assert(my_init) -- make sure it's not nil
my_init()       -- call the init fn of the lib
```

---

### C++ Constexpr Example in SWIG Context

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ snippet demonstrates the use of `constexpr` for defining compile-time constants and functions. While SWIG parses `constexpr`, it exposes these as runtime constants in target languages, meaning a runtime call is made to obtain their values.

```C++
constexpr int XXX() { return 10; }
constexpr int YYY = XXX() + 100;
```

---

### SWIG Module Import Customization Using a Macro

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

For multi-line or more complex custom import logic, this snippet demonstrates defining a SWIG macro (`%define`) to encapsulate the import code. This approach improves the readability and organization of the `%module` directive, allowing for more elaborate Python setup code to be injected.

```SWIG
%define MODULEIMPORT
"print('Loading low-level module $module')
import $module
print('Module has loaded')"
%enddef

%module(moduleimport=MODULEIMPORT) foo
```

---

### SWIG Language Module: Initial Configuration and Preprocessing in C

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C code snippet demonstrates how to configure a SWIG language module's initial settings within the `main()` method. It shows how to set the language-specific library directory, define preprocessor symbols (e.g., `SWIGPYTHON 1`), specify a configuration file (`python.swg`), and set the typemap language, all crucial for tailoring SWIG's behavior for a target language like Python.

```C
void main(int argc, char *argv[]) {
  ... command line options ...

  /* Set language-specific subdirectory in SWIG library */
  SWIG_library_directory("python");

  /* Set language-specific preprocessing symbol */
  Preprocessor_define("SWIGPYTHON 1", 0);

  /* Set language-specific configuration file */
  SWIG_config_file("python.swg");

  /* Set typemap language (historical) */
  SWIG_typemap_lang("python");
}
```

---

### Java Example: Using Move Constructor with SWIG Proxy

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus11

Demonstrates the use of a move constructor with a SWIG-generated Java proxy class. The second call to the move constructor fails because the `mc` instance has already been moved, transferring ownership, making it unusable.

```Java
MyClass mc = new MyClass();
MyClass mc1 = new MyClass(mc); // move constructor
MyClass mc2 = new MyClass(mc); // move constructor fails
```

---

### C Functions with Pointer Parameters for SWIG Typemaps

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates C functions (`add`, `sub`, `swap`) that use integer pointers for input, output, or input/output parameters. These functions serve as examples for demonstrating how SWIG's typemaps handle different parameter roles when generating language bindings.

```C
void add(int x, int y, int *result) {
  *result = x + y;
}

int sub(int *x1, int *y1) {
  return *x1-*y1;
}

void swap(int *sx, int *sy) {
  int t=*sx;
  *sx=*sy;
  *sy=t;
}
```

---

### SWIG: Defining a C Helper Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of defining a static C helper function within a SWIG input file using the %{ ... %} block. This function is typically used for interface building and is placed in the generated wrapper's header section.

```SWIG

%{
/* Create a new vector */
static Vector *new_Vector() {
  return (Vector *) malloc(sizeof(Vector));
}

%}
// Now wrap it
Vector *new_Vector();

```

---

### SWIG General Command Line Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This section provides a comprehensive list of general command-line options for SWIG. These options control various aspects of the wrapper generation process, including C++ processing, debugging output, conditional compilation, dependency generation, and error reporting formats.

```APIDOC
General Options:
     -addextern      - Add extra extern declarations
     -c++            - Enable C++ processing
     -co <file>      - Check <file> out of the SWIG library
     -copyctor       - Automatically generate copy constructors wherever possible
     -cpperraswarn   - Treat the preprocessor #error statement as #warning (default)
     -cppext <ext>   - Change file extension of generated C++ files to <ext>
                       (default is cxx)
     -copyright      - Display copyright notices
     -debug-classes  - Display information about the classes found in the interface
     -debug-module <n>- Display module parse tree at stages 1-4, <n> is a csv list of stages
     -debug-symtabs  - Display symbol tables information
     -debug-symbols  - Display target language symbols in the symbol tables
     -debug-csymbols - Display C symbols in the symbol tables
     -debug-lsymbols - Display target language layer symbols
     -debug-quiet    - Display less parse tree node debug info when using other -debug options
     -debug-tags     - Display information about the tags found in the interface
     -debug-template - Display information for debugging templates
     -debug-top <n>  - Display entire parse tree at stages 1-4, <n> is a csv list of stages
     -debug-typedef  - Display information about the types and typedefs in the interface
     -debug-typemap  - Display typemap debugging information
     -debug-tmsearch - Display typemap search debugging information
     -debug-tmused   - Display typemaps used debugging information
     -directors      - Turn on director mode for all the classes, mainly for testing
     -dirprot        - Turn on wrapping of protected members for director classes (default)
     -D<symbol>[=<value>] - Define symbol <symbol> (for conditional compilation)
     -E              - Preprocess only, does not generate wrapper code
     -external-runtime [file] - Export the SWIG runtime stack
     -fakeversion <v>- Make SWIG fake the program version number to <v>
     -fcompact       - Compile in compact mode
     -features <list>- Set global features, where <list> is a comma separated list of
                       features, eg -features directors,autodoc=1
                       If no explicit value is given to the feature, a default of 1 is used
     -fastdispatch   - Enable fast dispatch mode to produce faster overload dispatcher code
     -Fmicrosoft     - Display error/warning messages in Microsoft format
     -Fstandard      - Display error/warning messages in commonly used format
     -fvirtual       - Compile in virtual elimination mode
     -help           - Display help
     -I-             - Don't search the current directory
     -I<dir>         - Look for SWIG files in directory <dir>
     -ignoremissing  - Ignore missing include files
     -importall      - Follow all #include statements as imports
     -includeall     - Follow all #include statements
     -l<ifile>       - Include SWIG library file <ifile>
     -macroerrors    - Report errors inside macros
     -M              - List all dependencies
     -MD             - Is equivalent to `-M -MF <file>', except `-E' is not implied
     -MF <file>      - Generate dependencies into <file> and continue generating wrappers
     -MM             - List dependencies, but omit files in SWIG library
     -MMD            - Like `-MD', but omit files in SWIG library
     -module <name>  - Set module name to <name>
```

---

### Python C API: String Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides C functions for interacting with Python string objects, including creation from C strings, getting string size, converting to C char\*, and type checking.

```C
PyObject *PyString_FromString(char *);
PyObject *PyString_FromStringAndSize(char *, lint len);
int       PyString_Size(PyObject *);
char     *PyString_AsString(PyObject *);
int       PyString_Check(PyObject *);
```

---

### SWIG Standard Directives as Macros in swig.swg

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how common SWIG directives like `%begin`, `%wrapper`, `%immutable`, and `%ignore` are defined as macros using more primitive directives such as `%insert` and `%feature` within the `swig.swg` file. This approach simplifies the internal implementation by reducing the number of special directives to support.

```SWIG Configuration
... /* Code insertion directives such as %wrapper %{ ... %} */

#define %begin       %insert("begin")
#define %runtime     %insert("runtime")
#define %header      %insert("header")
#define %wrapper     %insert("wrapper")
#define %init        %insert("init")

/* Access control directives */

#define %immutable   %feature("immutable", "1")
#define %mutable     %feature("immutable")

/* Directives for callback functions */

#define %callback(x) %feature("callback") `x`;
#define %nocallback  %feature("callback");

/* %ignore directive */

#define %ignore         %rename($ignore)
#define %ignorewarn(x)  %rename("$ignore:" x)
...
```

---

### SWIG Wrapping C/C++ Structs to Ruby Classes with Accessors

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how SWIG converts a C/C++ struct into a Ruby class, automatically generating getter and setter methods for its members. The Ruby example shows how to instantiate the wrapped class and access its properties.

```C/C++
struct Vector {
  double x, y;
};
```

```Ruby
$ irb
irb(main):001:0> require 'Example'
true
irb(main):002:0> f = Example::Vector.new
#<Example::Vector:0x4020b268>
irb(main):003:0> f.x = 10
nil
irb(main):004:0> f.x
10.0
```

---

### Building and Using SWIG-Generated Perl5 Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Introduction

Commands to compile the C source and SWIG-generated wrapper for Perl5, create a shared library, and then load and use the module within a Perl5 interpreter to call the wrapped C functions and access the variable.

```Shell
unix > swig -perl5 example.i
unix > gcc -c example.c example_wrap.c \
        -I/usr/local/lib/perl5/sun4-solaris/5.003/CORE
unix > ld -G example.o example_wrap.o -o example.so # This is for Solaris
```

```Perl
perl5.003
use example;
print example::fact(4), "\n";
print example::my_mod(23, 7), "\n";
print $example::My_variable + 4.5, "\n";
<ctrl-d>
```

---

### SWIG: Section-Specific Code Insertion Directives

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the common macro directives (%begin, %runtime, %header, %wrapper, %init) that provide a more direct way to insert code into specific, predefined sections of the SWIG-generated C/C++ wrapper file, often preferred over the general %insert.

```SWIG

%begin %{
  ... code in begin section ...
%}

%runtime %{
  ... code in runtime section ...
%}

%header %{
  ... code in header section ...
%}

%wrapper %{
  ... code in wrapper section ...
%}

%init %{
  ... code in init section ...
%}

```

---

### Define C++ Class and Factory Function for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a simple C++ class `Foo` with a constructor and destructor, along with a global function `CreateFoo` that returns a `Foo` object by value. This setup is used to demonstrate SWIG's automatic ownership management.

```C++
class Foo {
public:
  Foo();
  ~Foo();
};
Foo CreateFoo();
```

---

### SWIG %feature Directive Example for Exception Handling

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Demonstrates the use of the SWIG %feature directive to define custom behavior, specifically for exception handling. It shows how to associate a try-catch block with a C++ method getitem that throws badindex.

```SWIG
%feature("except") getitem(int) {
  try {
     $action
  } catch (badindex) {
     ...
  }
}

...
class Foo {
public:
  Object *getitem(int index) throws(badindex);
  ...
};
```

---

### C++ Non-Assignable Class Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a C++ class 'NonAssignable' with a private assignment operator, making it non-assignable. This demonstrates how SWIG automatically wraps such members as read-only, as seen with 'non_assignable' in 'ImmutableVars'.

```C++
class NonAssignable {
private:
  NonAssignable & operator=(const NonAssignable &);
public:
  NonAssignable();
};

struct ImmutableVars {
  NonAssignable non_assignable;
};
```

---

### Example Usage of High-Level Perl set_transform

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Perl code demonstrates how to use the high-level `set_transform` function defined previously. It shows a simplified way to pass a 4x4 matrix to the underlying C function through the custom Perl wrapper.

```Perl
my $a =
  [[1, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 1]];
set_transform($im, $a);

```

---

### SWIG Helper Function for Argument Reordering

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a SWIG example using '%rename' and '%inline' to create a helper function ('wrap_foo') that reorders arguments before calling the original C/C++ function ('foo'), demonstrating a workaround for typemap limitations in argument reordering.

```SWIG
%rename(foo) wrap_foo;
%inline %{
void wrap_foo(char *s, int x) {
  foo(x, s);
}
%}
```

---

### Lua Interaction: Using SWIG Module with Custom Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Lua snippet demonstrates loading the SWIG-generated 'example' module and calling the 'fact' function. It shows the output from the custom typemap's 'printf' statement, confirming the integer conversion rule is applied.

```Lua
> require "example"
> print(example.fact(6))
Received an integer : 6
720
```

---

### C++ Class Template Partial Specialization Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Illustrates C++ class template partial specialization using `T const&`. Shows how different types match either the generic template or the partially specialized version.

```C++
template <typename T> struct X             { void a(); };
template <typename T> struct X< T const& > { void b(); };

X< int & >            x1;  x1.a();

X< int *const& >      x2;  x2.b();
X< int const*const& > x3;  x3.b();
X< int const& >       x4;  x4.b();
```

---

### Example Output of Premature Garbage Collection

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the console output when premature garbage collection occurs, demonstrating the `~Wheel` destructor call followed by an attempt to access `wheel.size` resulting in a garbage value, indicating memory corruption.

```Text
wheel size: 10
~Wheel
wheel size: 135019664
```

---

### Tcl: Load SWIG Package using package require

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Tcl shell commands to load a SWIG-generated package using `package require` and demonstrate its usage.

```Tcl
unix > tclsh
% package require example
% fact 4
24
%
```

---

### C++ Function for SWIGTYPE Matching Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

A C++ function declaration illustrating how SWIG's default SWIGTYPE typemap is typically matched for custom types like Vector when they are passed by value.

```C++
double dot_product(Vector a, Vector b);
```

---

### Example Java Stack Trace with Director Exception

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This output snippet shows a typical Java stack trace when a `RuntimeException` is thrown from a director method and correctly handled by the `%catches` directive. It demonstrates how the original Java exception is preserved and propagated, including its origin in the `DirectorDerived.upcall_method` and its journey through the JNI and SWIG layers.

```Java
DirectorDerived.upcall_method() invoked.
Exception in thread "main" java.lang.RuntimeException: There was a problem!
    at DirectorDerived.upcall_method(runme.java:4)
    at exampleJNI.SwigDirector_DirectorBase_upcall_method(exampleJNI.java:20)
    at exampleJNI.callup(Native Method)
    at example.callup(example.java:12)
    at runme.main(runme.java:21)
```

---

### SWIG %feature Directive for New Object Property

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows a concise use of the `%feature` directive to apply a 'new' property with value '1' to all methods named 'copy'. This is an example of how `%newobject` is internally defined using `%feature`.

```SWIG
%feature("new", "1") *::copy;
```

---

### C# Usage of Marshalled CDate Property

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

Demonstrates how the 'ImportantDate' variable, after being wrapped by SWIG, can be accessed and manipulated as a 'System.DateTime' property in C#. It shows both setting and getting the date value.

```C#
example.ImportantDate = new System.DateTime(2000, 11, 22);
System.DateTime importantDate = example.ImportantDate;
Console.WriteLine("Important date: " + importantDate);
```

---

### Python Access and Modification of SWIG Global Variables

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to import a SWIG-generated module and access/modify C global variables through the module's 'cvar' object. Includes examples of printing, setting, and using variables in mathematical operations.

```Python
import example
# Print out value of a C global variable
print(example.cvar.My_variable)
# Set the value of a C global variable
example.cvar.density = 0.8442
# Use in a math operation
example.cvar.density = example.cvar.density*1.10
```

---

### Example C Function Signature for SWIG Mapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

A sample C function signature used to demonstrate SWIG's default type mappings for various primitive and pointer types when generating Java bindings.

```C
void func(unsigned short a, char *b, const long &c, unsigned long long d);
```

---

### Handle Argument Passing with SWIG Typemaps for Scilab

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how to use `typemaps.i` to specify argument passing conventions (INPUT, OUTPUT, INOUT) for C functions wrapped by SWIG. This is crucial for handling pointers and references correctly, as Scilab parameters are passed by value.

```SWIG
%module example

%include <typemaps.i>

extern void sub(int *INPUT, int *INPUT, int *OUTPUT);
extern void inc(int *INOUT, int *INPUT);

%{
void sub(int *x, int *y, int *result) {
  *result = *x - *y;
}
void inc(int *x, int *delta) {
  *x = *x + *delta;
}
%}
```

```Scilab
--> sub(5, 3)
 ans  =

    2.

--> inc(4, 3)
 ans  =

    7.
```

---

### SWIG Command-line Options Reference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

A comprehensive list of command-line options available in SWIG, detailing their purpose and effect on the code generation process. Options cover aspects like dependency generation, error handling, optimization, and output file configuration.

```APIDOC
-MP             - Generate phony targets for all dependencies
-MT <target>    - Set the target of the rule emitted by dependency generation
-nocontract     - Turn off contract checking
-nocpperraswarn - Do not treat the preprocessor #error statement as #warning
-nodefaultctor  - Do not generate implicit default constructors
-nodefaultdtor  - Do not generate implicit default destructors
-nodirprot      - Do not wrap director protected members
-noexcept       - Do not wrap exception specifiers
-nofastdispatch - Disable fast dispatch mode (default)
-nopreprocess   - Skip the preprocessor step
-notemplatereduce - Disable reduction of the typedefs in templates
-O              - Enable the optimization options:
                   -fastdispatch -fvirtual
-o <outfile>    - Set name of C/C++ output file to <outfile>
-oh <headfile>  - Set name of C++ output header file for directors to <headfile>
-outcurrentdir  - Set default output dir to current dir instead of input file's path
-outdir <dir>   - Set language specific files output directory to <dir>
-pcreversion    - Display PCRE2 version information
-small          - Compile in virtual elimination and compact mode
-std=<standard> - Set the C or C++ language <standard> for inputs
-swiglib        - Report location of SWIG library and exit
-templatereduce - Reduce all the typedefs in templates
-U<symbol>      - Undefine symbol <symbol>
-v              - Run in verbose mode
-version        - Display SWIG version number
-Wall           - Remove all warning suppression, also implies -Wextra
-Wallkw         - Enable keyword warnings for all the supported languages
-Werror         - Treat warnings as errors
-Wextra         - Adds the following additional warnings: 309,403,405,512,321,322
-w<list>        - Suppress/add warning messages, eg -w401,+321 - see Warnings.html
-xmlout <file>  - Write XML version of the parse tree to <file> after normal processing
```

---

### Example C++ Class with Default Arguments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Defines a C++ class 'Spam' with a method 'bar' that includes default argument values for 'i' and 'd'. This serves as the base for demonstrating SWIG's renaming behavior.

```C++
class Spam {
public:
  ...
  void bar(int i=-1, double d=0.0);
  ...
};
```

---

### C++03 vs C++11 Template Instantiation Scoping Difference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of a C++ template instantiation that was considered valid under the C++03 standard but became ill-formed in C++11 due to changes in how using declarations and directives resolve template names.

```C++
// valid C++03, ill-formed C++11
using N::C;
template class C<int>;
```

---

### C++ Function with Doxygen Parameter Documentation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Doxygen

An example of a C++ function `SetBreakpoint` with Doxygen comments that include `@param` tags. These tags provide descriptions for each function parameter, which SWIG uses for Python docstring generation.

```C++
/**
    Set a breakpoint at the given location.

    @param filename The full path to the file.
    @param line_number The line number in the file.
 */
bool SetBreakpoint(const char* filename, int line_number);
```

---

### SWIG Generated Python Proxy Class Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Shows a conceptual Python proxy class generated by SWIG, demonstrating how it maps C++ class methods and members to Python equivalents using low-level functions and Python's special methods.

```Python
class Foo:
    def __init__(self):
        self.this = new_Foo()
    def __del__(self):
        delete_Foo(self.this)
    def bar(self, x):
        return Foo_bar(self.this, x)
    def __getattr__(self, name):
        if name == 'x':
            return Foo_x_get(self.this)
        ...
    def __setattr__(self, name, value):
        if name == 'x':
            Foo_x_set(self.this, value)
        ...

```

---

### Python Usage Example for Setting Array Structure Member

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Python code demonstrates how to instantiate `SomeObject` and assign a Python list to its array member `s.x` after the `memberin` typemap has been applied. This allows direct assignment of a sequence to the C array member.

```Python
s = SomeObject()
s.x = [1, 2.5, 5, 10]
```

---

### Java Example Program Calling SWIG Wrapped Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

A Java runme class demonstrating how to load the SWIG-generated native library and call the spam function. It instantiates MyDouble objects to pass as output parameters and retrieves the results using getValue() after the function call.

```Java
// File: runme.java

public class runme {

  static {
    try {
      System.loadLibrary("example");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native code library failed to load. " + e);
      System.exit(1);
    }
  }

  public static void main(String argv[]) {
    MyDouble out1 = new MyDouble();
    MyDouble out2 = new MyDouble();
    int ret = example.spam(1.2, 3.4, out1, out2);
    System.out.println(ret + "  " + out1.getValue() + "  " + out2.getValue());
  }
}
```

---

### SWIG/C++: Custom exception handler using `exception.i`

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of using `exception.i` to write a language-independent exception handler within a SWIG `%exception` block. It catches a `std::out_of_range` exception and re-throws it as a `SWIG_IndexError`.

```SWIG/C++
%include "exception.i"
%exception std::vector::getitem {
  try {
    $action
  } catch (std::out_of_range& e) {
    SWIG_exception(SWIG_IndexError, const_cast<char*>(e.what()));
  }
}
```

---

### Insert Custom PHP Code into Generated Files with SWIG Pragma

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to use the "pragma(php) code" directive in SWIG to insert arbitrary PHP code directly into the generated 'example.php' file. This allows for custom initialization or utility code.

```SWIG
%module example
%pragma(php) code="\n# This code is inserted into example.php\necho \"example.php execution\\n\";\n"

```

```PHP
# This code is inserted into example.php
echo "example.php execution\n";

```

---

### Clone SWIG Source Code

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Windows

Command to clone the SWIG source code repository from GitHub, which is required for building SWIG.

```Git
git clone https://github.com/swig/swig.git
```

---

### Define C/C++ Functions with Raw Pointer Parameters

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

Shows example C/C++ functions that take integer pointers as parameters, either for output (`add`), input (`sub`), or in-place modification (`negate`), illustrating common scenarios where SWIG's typemaps can simplify wrapping.

```C
void add(int x, int y, int *result) {
  *result = x + y;
}
```

```C
int sub(int *x, int *y) {
  return *x-*y;
}
```

```C
void negate(int *x) {
  *x = -(*x);
}
```

---

### SWIG Python Module Command-Line Options Reference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A comprehensive list of additional command-line options available for the SWIG Python module. These options control various aspects of the wrapper generation, including performance, debugging, and feature enablement.

```APIDOC
SWIG Python Command-Line Options:
  -builtin: Create Python built-in types rather than proxy classes, for better performance
  -castmode: Enable the casting mode, which allows implicit cast between types in Python
  -debug-doxygen-parser: Display doxygen parser module debugging information
  -debug-doxygen-translator: Display doxygen translator module debugging information
  -dirvtable: Generate a pseudo virtual table for directors for faster dispatch (warning: currently the vtable is per-object and never freed so this option causes memory leaks)
  -doxygen: Convert C++ doxygen comments to pydoc comments in proxy classes
  -extranative: Return extra native wrappers for C++ std containers wherever possible
  -fastproxy: Use fast proxy mechanism for member methods
  -flatstaticmethod: Generate additional flattened Python methods for C++ static methods
  -globals <name>: Set <name> used to access C global variable (default: 'cvar')
  -interface <mod>: Set low-level C/C++ module name to <mod> (default: module name prefixed by '_')
  -keyword: Use keyword arguments
  -nofastunpack: Use traditional UnpackTuple method to parse the argument functions
  -noh: Don't generate the output header file
  -noproxy: Don't generate proxy classes
  -nortti: Disable the use of the native C++ RTTI with directors
  -nothreads: Disable thread support for the entire interface
  -olddefs: Keep the old method definitions when using -fastproxy
  -relativeimport: Use relative Python imports
  -threads: Add thread support for all the interface
  -O: Enable the following optimization options: -fastdispatch -fastproxy -fvirtual
```

---

### Compile SWIG C++ Perl Extension with Sun C++ Compiler

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how to compile a SWIG-generated C++ wrapper for Perl using the Sun C++ compiler (CC), often found on Solaris systems. It highlights the necessity of including additional library files, such as -lCrun, during the linking phase to ensure proper functionality.

```Shell
$ swig -c++ -perl example.i
$ CC -Kpic -c example.cxx
$ CC -Kpic -c example_wrap.cxx -I/usr/lib/perl/5.14/i386-linux/CORE
$ CC -shared example.o example_wrap.o -o example.so -lCrun
```

---

### Incorrect SWIG Typemap for Multiple Types with Single Local Variable

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of an incorrect typemap declaration for multiple types where only one type is associated with a local variable, leading to errors for the other types.

```SWIG Typemap
%typemap(in) const std::string *, std::string * (std::string temp) // NO!
// only std::string * has a local variable
// const std::string * does not (oops)
....
```

---

### Compiling SWIG C++ Extensions for Ruby on Unix

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates the command-line steps to compile a SWIG-generated C++ extension for Ruby on Unix-like systems. It involves using `swig` to generate wrapper code, then `g++` for compiling and linking the C++ and wrapper files into a shared library (`.so`).

```Shell
$ swig -c++ -ruby example.i
$ g++ -fPIC -c example.cxx
$ g++ -fPIC -c example_wrap.cxx -I/usr/include/ruby-2.1.0
$ g++ -shared example.o example_wrap.o -o example.so
```

---

### SWIG Handling: C++ Friend Class Declarations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Shows an example of C++ friend class declarations. SWIG parses these declarations but effectively ignores them as they do not influence the generation of wrappers for the class members.

```C++
class X;
class Y;
class C {
  // Friend classes have no effect on generated wrappers
  friend class X;
  friend Y;
  ...
};
```

---

### Define C/C++ Enumeration for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C/C++ code defines a simple enumeration 'colour' with specified integer values. This enumeration serves as an example to demonstrate how SWIG processes and translates C/C++ enumerations when generating R bindings.

```C++
enum colour { red=-1, blue, green = 10 };
```

---

### Use C++ Attributes with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows examples of C++ attributes like `[[attr1]]` and `[[noreturn]]`. SWIG 4.1.0+ supports parsing these, but they are currently ignored by the parser's tokenizer and have no effect on code generation.

```C++
int [[attr1]] i [[attr2, attr3]];

[[noreturn, nothrow]] void f [[noreturn]] ();
```

---

### Loading and Using a SWIG Module in Tcl

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to successfully load a SWIG-generated shared object module (`.so`) into a Tcl shell using the `load` command and then call a wrapped function (`fact`). Shows the expected output upon successful execution.

```Tcl
$ tclsh
% load ./example.so
% fact 4
24
%
```

---

### C++ Structure Definition with Nested Objects

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a C++ structure `Particle` that contains instances of the `Vector` class. This serves as a foundational example for how SWIG handles structures with complex, nested object members.

```C++
struct Particle {
  Vector r;
  Vector v;
  Vector f;
  int type;
}
```

---

### SWIG and C++ Constant Creation Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This snippet shows various ways to define constants in C++ and SWIG, including preprocessor defines, SWIG's '%constant' directive, and C++ enums, which are handled by 'consttab' or 'constcode' typemaps.

```SWIG
#define FOO 3
%constant int BAR = 42;
enum { ALE, LAGER, STOUT };
```

---

### Finding Ruby Header Files for Compilation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

To compile SWIG-generated wrapper code, the Ruby header files (ruby.h, ruby/config.h) are required. This snippet shows how to use Ruby itself to determine the correct include paths for the compiler.

```Bash
$ ruby -rrbconfig -e 'puts "-I#{RbConfig::CONFIG[%q{rubyhdrdir}]} -I#{RbConfig::CONFIG[%q{rubyarchhdrdir}]}"'
```

---

### Iterate Through SWIG Parameter List in C

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Provides a C code example demonstrating how to traverse a parameter list using a 'for' loop and the 'nextSibling' function. It shows how to extract the type, name, and value attributes of each parameter node.

```C
Parm *parms;
Parm *p;
for (p = parms; p; p = nextSibling(p)) {
  SwigType *type  = Getattr(p, "type");
  String   *name  = Getattr(p, "name");
  String   *value = Getattr(p, "value");
  ...
}
```

---

### Standard SWIG Interface File Structure

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This code example illustrates the typical structure of a SWIG interface file, commonly denoted with a .i or .swg suffix. It shows the use of the %module directive to define the module name and the %{...%} block for verbatim inclusion of C/C++ headers and declarations into the generated wrapper code.

```SWIG Interface
%module mymodule
%{
#include "myheader.h"
%}
// Now list ISO C/C++ declarations
int foo;
int bar(int x);
...
```

---

### Executing Ruby Script with SWIG Extension on Windows

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows the command-line execution of a Ruby script that utilizes a SWIG-generated extension. It demonstrates how to run the `run.rb` file from the command prompt, assuming the compiled extension is accessible, and displays the output from the C function call.

```Shell
C:\swigtest> ruby run.rb
Foo = 3.0
```

---

### Python Example: Using %array_functions Generated API

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Demonstrates how to use the functions generated by `%array_functions` (e.g., `new_doubleArray`, `doubleArray_setitem`, `delete_doubleArray`) from a scripting language (Python) to create, manipulate, and pass C arrays to wrapped C functions.

```Python
a = new_doubleArray(10)               # Create an array
for i in range(0, 10):
    doubleArray_setitem(a, i, 2 * i)  # Set a value
print_array(a)                        # Pass to C
delete_doubleArray(a)                 # Destroy array
```

---

### Full Reduction of a Function Pointer Type

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the step-by-step reduction of a complex function pointer type using SWIG's typedef resolution, showing how all aliases are resolved to primitive types from start to end.

```text
p.f(Integer, p.IntegerPtr, Size).Integer          : Start
p.f(Integer, p.IntegerPtr, Size).int
p.f(int, p.IntegerPtr, Size).int
p.f(int, p.p.Integer, Size).int
p.f(int, p.p.int, Size).int
p.f(int, p.p.int, int).int                        : End
```

---

### SWIG: Defining and Wrapping a C Helper Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Demonstrates how to define a C helper function within a SWIG input file using a code block (%{...%}) and then wrap it to make it accessible from the target language.

```SWIG/C
%{
/* Create a new vector */
static Vector *new_Vector() {
  return (Vector *) malloc(sizeof(Vector));
}

%}
// Now wrap it
Vector *new_Vector();
```

---

### SWIG Generated Accessor for Typedef Struct

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of an accessor function generated by SWIG for a structure defined using `typedef struct { ... } Name;`, where the `struct` keyword is dropped in the generated C code.

```C
double Vector_x_get(Vector *obj) {
  return obj->x;
}
```

---

### Ruby Usage of SWIG-Wrapped C++ Template Instantiation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates creating and interacting with an instance of the SWIG-wrapped 'pair<int, int>' template ('Pairii') from Ruby.

```Ruby
irb(main):001:0> require 'example'
true
irb(main):002:0> p = Example::Pairii.new(3, 4)
#<Example:Pairii:0x4016f4df>
irb(main):003:0> p.first
3
irb(main):004:0> p.second
4
```

---

### SWIG: Example of Missing shared_ptr Macro in Inheritance Hierarchy

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows a SWIG interface file where `%shared_ptr` macros are omitted for `GrandParent` and `Child` classes in an inheritance hierarchy, leading to SWIG warnings (Warning 520).

```SWIG
%include "boost_shared_ptr.i"
%shared_ptr(Parent);

%inline %{
  #include <boost/shared_ptr.hpp>
  struct GrandParent {
    virtual ~GrandParent() {}
  };

  struct Parent : GrandParent {
    virtual ~Parent() {}
  };

  struct Child : Parent {
    virtual ~Child() {}
  };
%}
```

---

### Define C++ Foo and Bar Classes for Ownership Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines Foo and Bar C++ classes. Foo is a simple class. Bar contains a Foo pointer, demonstrating different ways to return or set Foo objects, which are crucial for illustrating object ownership scenarios in Ruby.

```C++
/* File "RubyOwernshipExample.h" */

class Foo
{
public:
  Foo() {}
  ~Foo() {}
};

class Bar
{
  Foo *foo_;
public:
  Bar(): foo_(new Foo) {}
  ~Bar() { delete foo_; }
  Foo* get_foo() { return foo_; }
  Foo* get_new_foo() { return new Foo; }
  void set_foo(Foo *foo) { delete foo_; foo_ = foo; }
};
```

---

### Python Example: Using %array_class Generated API

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Demonstrates how to use the class generated by `%array_class` (e.g., `example.doubleArray`) from a scripting language (Python) to create, manipulate, and pass C arrays to wrapped C functions using a more object-oriented syntax.

```Python
import example
c = example.doubleArray(10)  # Create double[10]
for i in range(0, 10):
    c[i] = 2 * i             # Assign values
example.print_array(c)       # Pass to C
```

---

### Tcl: Create pkgIndex.tcl for SWIG Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Tcl shell commands to create the `pkgIndex.tcl` file for a SWIG-generated module using `pkg_mkIndex`.

```Tcl
unix > tclsh
% pkg_mkIndex . example.so
% exit
```

---

### SWIG: Example Internal Parse Tree Output

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a sample output from SWIG's internal parse tree when using the '-debug-module 1 -debug-quiet' command-line options. This output reveals the structure of a node (e.g., a destructor) and its attributes, which can be used for advanced matching with %rename directives.

```SWIG Debug Output
            +++ destructor ----------------------------------------
            | access       - "public"
            | decl         - "f()."
            | ismember     - "1"
            | name         - "~Shape"
            | storage      - "virtual"
            | sym:name     - "~Shape"
```

---

### Define C++ Circle Class for SWIG Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet defines a simple C++ `Circle` class with a public `radius` member, a constructor, and an `area` method. This class serves as an example for SWIG to generate C wrappers.

```C++
class Circle {
public:
  double radius;

  Circle(double r) : radius(r) { };
  double area(void);
};
```

---

### SWIG C++ Template Class Usage Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ snippet demonstrates how to use the 'Template' class to retrieve, modify, and print code templates. It shows methods like 'getTemplate' to fetch a template by name, 'replace' to substitute variables, 'trim' to clean whitespace, and 'print' to output the final string to a 'DOH' object.

```C++
Template t_register = getTemplate("jsv8_register_static_variable");
t_register.replace("$jsparent", state.clazz(NAME_MANGLED))
    .replace("$jsname", state.variable(NAME))
    .replace("$jsgetter", state.variable(GETTER))
    .replace("$jssetter", state.variable(SETTER))
    .trim().
    print(f_init_static_wrappers);
```

---

### SWIG Java Module Command-line Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Lists additional command-line options available for customizing SWIG's Java module generation.

```APIDOC
Options:
-nopgcpp: suppress the premature garbage collection prevention parameter
-noproxy: generate the low-level functional interface instead of proxy classes
-package <name>: set name of the Java package to <name>
```

---

### C Exception Handling Setup with setjmp/longjmp

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Customization

Defines global variables and preprocessor macros for a basic C-style exception handling mechanism using `setjmp.h`. Includes declarations for `jmp_buf`, `exception_status`, and macros for `try`, `catch`, `throw`, and `finally`, along with exception codes.

```C
/* File : except.c
   Just the declaration of a few global variables we're going to use */

#include <setjmp.h>
jmp_buf exception_buffer;
int exception_status;

/* File : except.h */
#include <setjmp.h>
extern jmp_buf exception_buffer;
extern int exception_status;

#define try if ((exception_status = setjmp(exception_buffer)) == 0)
#define catch(val) else if (exception_status == val)
#define throw(val) longjmp(exception_buffer, val)
#define finally else

/* Exception codes */

#define RangeError     1
#define DivisionByZero 2
#define OutOfMemory    3
```

---

### C Preprocessor Header Guard Example in SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Preprocessor

Demonstrates a standard C preprocessor header guard. SWIG processes these macros, but warns that #define statements might lead to constants like FOO_H appearing in the scripting interface.

```C
#ifndef FOO_H 1
#define FOO_H 1
...
#endif
```

---

### Define C++ NotABaseClass for Sealed C# Proxy Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a simple C++ struct `NotABaseClass` with a constructor and destructor. This class is used to demonstrate how to generate a sealed C# proxy class using SWIG.

```C++
struct NotABaseClass {
  NotABaseClass();
  ~NotABaseClass();
};
```

---

### Use Static Assertions in C++ with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows an example of `static_assert` in C++ to perform compile-time checks. SWIG correctly parses these declarations, but since they are compile-time directives, SWIG does not perform any specific actions with them during wrapping.

```C++
template <typename T>
struct Check {
  static_assert(sizeof(int) <= sizeof(T), "not big enough");
};
```

---

### SWIG Template Base Class Instantiation Order

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates the critical importance of instantiating base class templates before derived class templates using %template. SWIG relies on this order to correctly set up the inheritance hierarchy in the generated wrapper code, ensuring proper type resolution.

```C++
template<class T> class Foo {
...
};

template<class T> class Bar : public Foo<T> {
...
};

// Instantiate base classes first
%template(intFoo) Foo<int>;
%template(doubleFoo) Foo<double>;

// Now instantiate derived classes
%template(intBar) Bar<int>;
%template(doubleBar) Bar<double>;
```

---

### SWIG Generated Python Wrapper for Factorial

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

An example of a SWIG-generated C wrapper function for a Python module, demonstrating how Python C API functions are used internally to handle type conversion for input arguments and return values.

```C
PyObject *wrap_factorial(PyObject *self, PyObject *args) {
  int       arg1;
  int       result;
  PyObject *obj1;
  PyObject *resultobj;

  if (!PyArg_ParseTuple("O:factorial", &obj1)) return NULL;
  arg1 = PyInt_AsLong(obj1);
  result = factorial(arg1);
  resultobj = PyInt_FromLong(result);
  return resultobj;
}
```

---

### SWIG Warning for Ignored Multiple Inheritance

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of the warning message generated by SWIG when it encounters a C++ class with multiple inheritance, indicating that additional base classes beyond the first are ignored in the Ruby wrapper.

```Log
example.i:5: Warning 802: Warning for Derived: Base Base2 ignored.
Multiple inheritance is not supported in Ruby.
```

---

### C++ Class Definitions for SWIG Director Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines `Foo` and `FooContainer` classes in C++. `FooContainer` includes a method `addFoo` that takes a `Foo` pointer, illustrating a common pattern for managing objects that might be disowned by Python and handled by C++.

```C++
class Foo {
public:
  ...
};
class FooContainer {
public:
  void addFoo(Foo *);
  ...
};
```

---

### SWIG Interface File: Wrapping Simple C Declarations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file example demonstrates how to wrap simple C declarations, including functions (sin, strcmp), a global variable (Foo), and constants (STATUS, VERSION). The '%module' and '%inline' directives are used to define the module and embed C code directly.

```SWIG Interface
%module example

%inline %{
extern double sin(double x);
extern int strcmp(const char *, const char *);
extern int Foo;
%}
#define STATUS 50
#define VERSION "1.1"
```

---

### Building and Using SWIG-Generated Tcl Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Introduction

Commands to compile the C source and SWIG-generated wrapper for Tcl, create a shared library, and then load and use the module within a Tcl shell to call the wrapped C functions and access the variable.

```Shell
$ swig -tcl example.i
$ gcc -c -fPIC example.c example_wrap.c -I/usr/include/tcl8.7
$ gcc -shared example.o example_wrap.o -o example.so
```

```Tcl
tclsh
% load ./example.so
% fact 4
24
% my_mod 23 7
2
% expr $My_variable + 4.5
7.5
%
```

---

### C++ Namespace Name Conflict Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Illustrates a scenario where two different C++ namespaces (`A` and `B`) define functions with the same name (`foo`), which can lead to name conflicts when SWIG flattens namespaces.

```C++
namespace A {
  void foo(int);
}
namespace B {
  void foo(double);
}
```

---

### SWIG Generated Accessor for Anonymous Typedef Struct

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

An example of an accessor function generated by SWIG for an anonymous typedef struct. Notice that the 'struct' keyword is omitted in the parameter type, reflecting the typedef's usage.

```C
double Vector_x_get(Vector *obj) {
  return obj->x;
}
```

---

### Format CXX File with SWIG Beautifier

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Example of using the SWIG make targets to format a C++ source file (emit.cxx) according to the project's K&R coding style guidelines, specifically setting indentation to 2 spaces.

```bash
cd Source
make beautify-file INDENTFILE=Modules/emit.cxx
```

---

### Compile SWIG Java Dynamic Module on Solaris

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This snippet provides the shell commands to compile a SWIG-generated Java wrapper (example_wrap.c) and a C source file (example.c) into a shared library (libexample.so) suitable for Java's JNI. It uses swig, gcc with -fPIC, and ld for linking, specifically tailored for Solaris.

```Shell
$ swig -java example.i
$ gcc -fPIC -c example_wrap.c -I/usr/java/include -I/usr/java/include/solaris
$ gcc -fPIC -c example.c
$ ld -G example_wrap.o example.o -o libexample.so
```

---

### Java Usage of SWIG-Wrapped C Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java line demonstrates how to invoke the `fact` function, which was originally a C function, through the SWIG-generated `example` module class. It shows the typical static method call pattern for global C functions wrapped by SWIG.

```Java
System.out.println(example.fact(4));
```

---

### Running SWIG Doxygen Tests for Java

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command demonstrates how to run a specific Doxygen test case for Java within the SWIG test suite. It uses the make -s command to execute doxygen_parsing.cpptest in the Examples/test-suite/java directory, allowing individual test execution.

```Shell
  Examples/test-suite/java $ make -s doxygen_parsing.cpptest
```

---

### SWIG: Helper Functions for C/C++ Pointer Casting and Arithmetic

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides examples of C/C++ helper functions, wrapped with SWIG's `%inline` directive, for safely performing pointer casts (C-style and C++ `dynamic_cast`) and pointer arithmetic. It emphasizes using C++-style casts for better safety and error handling.

```C++
%inline %{
/* C-style cast */
Bar *FooToBar(Foo *f) {
  return (Bar *) f;
}

/* C++-style cast */
Foo *BarToFoo(Bar *b) {
  return dynamic_cast<Foo*>(b);
}

Foo *IncrFoo(Foo *f, int i) {
  return f+i;
}
%}
```

---

### SWIG Typemap Declaring Local Variable with Type Substitution

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of declaring a local variable `temp` within a typemap using `$*1_type` to derive its type, then assigning to it and setting the typemap argument `$1` to its address.

```SWIG
%typemap(in) int * ($*1_type temp) {
  temp = PyInt_AsLong($input);
  $1 = &temp;
}
```

---

### Java Program to Interact with SWIG-wrapped C Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java `runme.java` program demonstrates how to load a native SWIG-generated library and call C functions (`print_args` and `get_args`) that handle `char **` arguments and return values, showcasing the Java `String[]` to C `char **` conversion implemented via SWIG typemaps.

```Java
// File runme.java

public class runme {

  static {
    try {
      System.loadLibrary("example");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native code library failed to load. " + e);
      System.exit(1);
    }
  }

  public static void main(String argv[]) {
    String animals[] = {"Cat", "Dog", "Cow", "Goat"};
    example.print_args(animals);
    String args[] = example.get_args();
    for (int i=0; i<args.length; i++)
      System.out.println(i + ":" + args[i]);
  }
}
```

---

### Ocaml Interactive Session: Using SWIG-Wrapped Enums

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the SWIG-generated Ocaml enum types and conversion functions (`C_enum`, `enum_to_int`, `int_to_enum`) in an Ocaml interactive session, including compilation setup.

```Ocaml Console
bash-2.05a$ ocamlmktop -custom enum_test_wrap.o enum_test.cmo -o enum_test_top
bash-2.05a$ ./enum_test_top
        Objective Caml version 3.04

# open Enum_test ;;
# let x = C_enum `a ;;
val x : Enum_test.c_obj = C_enum `a
# enum_to_int `c_enum_type x ;;
- : Enum_test.c_obj = C_int 1
# int_to_enum `c_enum_type 4 ;;
- : Enum_test.c_obj = C_enum `c
```

---

### SWIG Interface File: Including C/C++ Headers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

This SWIG snippet demonstrates how to include necessary C/C++ header files within a SWIG interface (.i) file using the %{ %} block. This ensures that the code generated by SWIG compiles correctly by providing access to required declarations, such as OpenGL headers in this example.

```C
%module graphics
%{
#include <GL/gl.h>
#include <GL/glu.h>
%}

// Put the rest of the declarations here
...
```

---

### Compile and Link SWIG Lua Module with GCC

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This sequence of gcc commands illustrates the typical compilation and linking process for a SWIG-generated Lua module. It involves generating the wrapper file, compiling the minimal interpreter, the wrapper, and the original C source, then linking them all together with the Lua library to create an executable.

```Shell
$ swig -lua example.i -o example_wrap.c
$ gcc -I/usr/include/lua -c min.c -o min.o
$ gcc -I/usr/include/lua -c example_wrap.c -o example_wrap.o
$ gcc -c example.c -o example.o
$ gcc -I/usr/include/lua -L/usr/lib/lua min.o example_wrap.o example.o -o my_lua
```

---

### Define C++ Classes for SWIG Director Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines simple C++ classes, `Foo` and `FooContainer`, to illustrate memory management concepts when using SWIG directors. `FooContainer` is intended to manage `Foo` pointers, highlighting scenarios where explicit ownership transfer is necessary.

```C++
class Foo {
public:
  ...
};
class FooContainer {
public:
  void addFoo(Foo *);
  ...
};
```

---

### C Array of Pointers Declaration for SWIG Parsing

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Presents a standard C declaration for an array of pointers, used as an example to explain how SWIG's parser decomposes and reconstructs type strings from base types and declarators.

```C
int *a[30];
```

---

### Load PHP Extension at Runtime using dl()

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to dynamically load a PHP extension at runtime using the `dl()` function. This method is not recommended and is only supported by the PHP CLI SAPI, not when running PHP through a web server.

```PHP
dl("modulename"); // Load the module
```

---

### Handle NULL Pointers from SWIG in Lua

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Explains how SWIG translates a NULL C/C++ pointer return value into a Lua `nil`. This snippet shows an example of `fopen` returning NULL for a non-existent file and how Lua represents it.

```Lua
> f=example.fopen("not there", "r") -- this will return a NULL in C
> print(f)
nil
```

---

### SWIG: Use Template Type Names in Interface Files

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows examples of how template type names, such as vector<int> and std::array<int, 100>, can be used in SWIG interface files where a type is expected.

```C++
void foo(vector<int> *a, int n);
void bar(std::array<int, 100> *x);
```

---

### SWIG: Handling Windows Calling Conventions with windows.i

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to include the `windows.i` interface file in SWIG to manage Microsoft-specific function calling conventions like `__declspec(dllexport)` and `__stdcall`. This allows SWIG to correctly parse and wrap C/C++ functions using these proprietary conventions.

```SWIG

%include <windows.i>

__declspec(dllexport) ULONG __stdcall foo(DWORD, __int32);

```

---

### C Function Accepting Double Pointers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A simple C function 'add' that takes two double pointers, dereferences them, and returns their sum. This function serves as an example for demonstrating SWIG's input typemap functionality.

```C
double add(double *a, double *b) {
  return *a+*b;
}
```

---

### Adding New Members to SWIG Module Table in Lua

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates that new functions or variables can be added to a SWIG-generated module table in Lua, treating it like a normal Lua table. This example adds a `PI` constant.

```Lua
-- example.PI does not exist
print(example.PI)
nil
example.PI=3.142 -- new value added
print(example.PI)
3.142
```

---

### Build Ruby Extension Module for Shape

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These commands execute the `extconf.rb` script to generate the Makefile, then run `make` to compile the SWIG wrapper and link it into a shared library (`shape.so`). This completes the build process for the `Shape` extension.

```Shell
$ ruby extconf.rb
creating Makefile
$ make
g++ -fPIC -g -O2 -I. -I/usr/include/ruby-2.1.0 \
-I. -c shape_wrap.cxx
gcc -shared -L/usr/local/lib -o shape.so shape_wrap.o -L. \
-lruby -lruby -lc
```

---

### Python Example: Using SWIG-Wrapped Vector Class

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how the Vector structure, extended with methods via SWIG, behaves as a class in Python. It shows object instantiation, calling the magnitude() and print() methods, and explicit object destruction using del.

```Python
>>> v = Vector(3, 4, 0)                 # Create a new vector
>>> print(v.magnitude())                # Print magnitude
5.0
>>> v.print()                  # Print it out
[ 3, 4, 0 ]
>>> del v                      # Destroy it
```

---

### SWIG Command for Separate Output Directories

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command shows how to specify different output directories for the generated C/C++ wrapper file and the target language proxy files. -outdir pyfiles directs Python proxy files to 'pyfiles', while -o cppfiles/example_wrap.cpp places the C++ wrapper in 'cppfiles'.

```Shell
$ swig -c++ -python -outdir pyfiles -o cppfiles/example_wrap.cpp example.i
```

---

### SWIG %attributeref with Custom Accessor Name

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Library

Illustrates how to use %attributeref when the internal C++ reference methods have a different name than the desired attribute name in the target language. It provides the general syntax and a specific example.

```SWIG
%attributeref(Class, AttributeType, AttributeName, AccessorMethod)
```

```SWIG
%attributeref(B, int, d, c);
```

---

### SWIG Template Base Class Inheritance Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This code demonstrates how SWIG handles inheritance when a class derives from a template instantiation. It highlights that SWIG saves information about instantiated templates, allowing it to correctly manage the inheritance hierarchy in the generated wrapper code.

```C++
...
%template(intList) List<int>;
...
class UltraList : public List<int> {
  ...
};
```

---

### C# Constructor with SWIGPendingException Handling

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

This C# constructor demonstrates how to initialize an object using a SWIG-generated helper function (`SwigConstructAction`) and includes a standard pattern for checking and re-throwing pending SWIG exceptions, ensuring proper error propagation from the underlying C++ layer.

```C#
: this(Action.SwigConstructAction(dateIn, out dateOut), true) {
    if (examplePINVOKE.SWIGPendingException.Pending)
      throw examplePINVOKE.SWIGPendingException.Retrieve();
  }
}
```

---

### Tcl Example: Using Multi-Argument Typemap with `count` Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Tcl snippet demonstrates calling the `count` function, which utilizes a multi-argument typemap. It shows how the `len` parameter is implicitly handled by the typemap, allowing the function to be called with only the character and the string.

```Tcl
% count e "Hello World"
1
```

---

### C: Manual Copy Constructor Wrapper for Non-Overloading Languages

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Provides an example of a C-style function that can be used as a copy constructor wrapper when the target language does not support constructor overloading. It explicitly creates a new List object from an existing one.

```C
List *copy_List(List *f) {
  return new List(*f);
}
```

---

### Java Code to Invoke Director Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This Java code instantiates `DirectorDerived` and passes it to the `callup` C++ function via the `example` module. This triggers the director mechanism, leading to the invocation of the Java-overridden `upcall_method`.

```Java
DirectorDerived director = new DirectorDerived();
example.callup(director);
```

---

### Tcl: Calling Functions with Optional Arguments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

This Tcl example illustrates how to call a function (wrapped by SWIG from C/C++) that has optional arguments. The function can be invoked either by omitting the optional argument to use its default value or by providing an explicit value.

```Tcl
% plot -3.4 7.5    # Use default value
% plot -3.4 7.5 10 # set color to 10 instead
```

---

### SWIG C# Typemap 'null' Attribute Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

Illustrates the use of the 'null' attribute in an 'out' typemap to specify a return value for non-void functions, particularly when changing the return type to void.

```SWIG
%typemap(ctype) Status "void"
%typemap(out, null="") Status { ... }
```

---

### SWIG Handling of Duplicate Template Instantiations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates how SWIG manages duplicate %template instantiations, particularly when default parameters are involved. SWIG ignores subsequent identical instantiations to prevent code bloat, even if the wrapped name differs.

```C++
%template(vec) vector<double>;            // OK
%template(vec100) vector<double, 100>;    // Ignored
```

---

### SWIG C API: Pointer Conversion Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates the usage of `SWIG_ConvertPtr` to convert a Ruby input object to a C pointer of type `Foo*`, and `SWIG_NewPointerObj` to create a new Ruby object from a C pointer `f`. It highlights the use of `SWIGTYPE_p_Foo` for type descriptors.

```C
Foo *foo;
SWIG_ConvertPtr($input, (void **) &foo, SWIGTYPE_p_Foo, 1);

VALUE obj;
obj = SWIG_NewPointerObj(f, SWIGTYPE_p_Foo, 0);
```

---

### Doxygen Comment Placement for Function Parameters

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates Doxygen comments used to document individual function parameters. The comments are placed inline with the parameter declaration, providing specific details about its purpose and usage within the function signature.

```C++
void someFunction(
         int a ///< Some parameter
     );
```

---

### C++: `std::unique_ptr` returned by reference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Examples of C++ function signatures returning `std::unique_ptr` by lvalue and rvalue reference. Move semantics are not provided, and the target language proxy does not own the underlying C++ object.

```C++
std::unique_ptr<Klass> & LvalueRefReturn();
std::unique_ptr<Klass> && RvalueRefReturn();
```

---

### Octave: Basic Subclassing and Method Definition

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates the basic usage of `subclass()` in Octave to create an object, assign a variable, and define a method using an anonymous function. Shows how to call the defined method and its output.

```Octave
octave:1> a=subclass();
octave:2> a.my_var = 4;
octave:3> a.my_method = @(self) printf("my_var = ", self.my_var);
octave:4> a.my_method();
my_var = 4
```

---

### C Function Declarations Using Generic Array Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Examples of C function signatures that can utilize the `double[ANY]` typemap. SWIG automatically determines the array size (`$1_dim0`) from these declarations, allowing the generic typemap to apply.

```C
void foo(double x[10]);
void bar(double a[4], double b[8]);
```

---

### SWIG Macro: Defining a Type-Specific Array Helper

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to use SWIG's %define to create a macro that generates C functions for array manipulation (new, delete, get, set) for a given type, and its usage.

```SWIG
%define ARRAYHELPER(type, name)
%inline %{
type *new_ ## name (int nitems) {
  return (type *) malloc(sizeof(type)*nitems);
}
void delete_ ## name(type *t) {
  free(t);
}
type name ## _get(type *t, int index) {
  return t[index];
}
void name ## _set(type *t, int index, type val) {
  t[index] = val;
}
%}
%enddef

ARRAYHELPER(int, IntArray)
ARRAYHELPER(double, DoubleArray)
```

---

### Perl: Checking for NULL Pointers from SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a Perl code example demonstrating how to use the `defined()` function to check if a SWIG-wrapped pointer is NULL. It also notes that `undef` should be passed to functions to represent a NULL pointer.

```Perl
if (defined($ptr)) {
  print "Not a NULL pointer.";
} else {
  print "Is a NULL pointer.";
}
```

---

### Wrapping C Functions with Multiple Output Arguments for Scilab

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to define a C function with multiple output parameters and wrap it using SWIG's `typemaps.i` for Scilab. It shows how all return values (including the C function's return and output parameters) are accessed in Scilab.

```SWIG
%module example

%include <typemaps.i>

int divide(int n, int d, int *OUTPUT, int *OUTPUT);

%{
  int divide(int n, int d, int q*, int *r) {
    if (d != 0) {
      *q = n / d;
      *r = n % d;
      return 1;
    } else {
      return 0;
    }
  }
}%
```

```Scilab
--> [ret, q, r] = divide(20, 6)
 r  =

    2.
 q  =

    3.
 ret  =

    1.
```

---

### Loading SWIG Tcl Extension DLL in MSDOS

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates how to load a SWIG-generated Tcl extension DLL (e.g., 'example.dll') into the tclsh interpreter and then call a function ('fact') from it. It shows the typical command-line interaction for testing a built extension.

```MSDOS
MSDOS > tclsh80
% load example.dll
% fact 4
24
%
```

---

### Scripting Language Proxy Usage Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Demonstrates how a scripting language interacts with C++ objects wrapped by proxies, highlighting object creation, reference assignment, and destruction (`del f`), which can lead to memory management issues due to shared ownership.

```Scripting
f = Foo()               # Creates a new Foo
s = Spam()              # Creates a new Spam
s.value = f             # Stores a reference to f inside s
g = s.value             # Returns stored reference
g = 4                   # Reassign g to some other value
del f                   # Destroy f
```

---

### SWIG: Basic %insert Directive Syntax

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Illustrates the two primary syntaxes for the %insert directive in SWIG, allowing code insertion from a file or directly from an inline block into a specified section of the generated wrapper file.

```SWIG
%insert("section") "filename"
%insert("section") %{ ... %}
```

---

### SWIG C Code for Java Array Wrapping with `arrays_java.i`

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C code snippet demonstrates including the `arrays_java.i` library for SWIG to enable Java-style array wrapping. It defines a global `int array[4]` and a `populate` function that fills an integer array passed by reference, illustrating the C-side setup.

```C
%include "arrays_java.i";
int array[4];
void populate(int x[]) {
  int i;
  for (i=0; i<4; i++)
    x[i] = 100 + i;
}
```

---

### C Preprocessor: Basic Variadic Macro with **VA_ARGS**

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates a standard C99/C++11 variadic macro using **VA_ARGS** for a debug print function.

```C
#define DEBUGF(fmt, ...)   fprintf(stderr, fmt, __VA_ARGS__)
```

---

### SWIG %extend Usage with Anonymous Structs

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

This example shows the exception to the "%extend" naming rule: when a struct is anonymously named and only accessible via its typedef, the typedef name can be used with "%extend".

```SWIG
typedef struct {
  double value;
} Double;
%extend Double { ...  } /* Okay */
```

---

### SWIG Typemaps for C Primitive Types

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates how SWIG language modules define typemaps for fundamental C primitive types. It shows examples for `int`, `short`, and `float`, both by value and by `const` reference, illustrating their conversion within the SWIG wrapping process.

```SWIG
%typemap(in) int           "... convert to int ..."
%typemap(in) short         "... convert to short ..."
%typemap(in) float         "... convert to float ..."
...
%typemap(in) const int &   "... convert ..."
%typemap(in) const short & "... convert ..."
%typemap(in) const float & "... convert ..."
...
```

---

### Declare Functions with Noexcept in C++ for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides examples of the `noexcept` specifier in C++ function declarations, indicating whether a function throws exceptions. SWIG understands these specifications but does not leverage this information in the wrapping process for target languages.

```C++
static void noex1() noexcept;
int noex2(int) noexcept(true);
int noex3(int, bool) noexcept(false);
```

---

### Generate SWIG Java Wrapper Files

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command uses SWIG to generate Java wrapper files and a C JNI wrapper file from an interface definition file (.i) for Android integration. It specifies the Java package, output directory for Java files, and the output C wrapper file.

```bash
$ swig -java -package org.swig.simple -outdir src/org/swig/simple -o jni/example_wrap.c jni/example.i
```

---

### Bash: Compiling a SWIG-generated shared library

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This GCC command demonstrates how to compile a shared library for a SWIG extension module, linking object files and an external library. This is a common step in preparing a SWIG module for use.

```Bash
gcc -shared example.o example_wrap.o -L/home/beazley/projects/lib -lfoo \
      -o example.so
```

---

### Calling Custom Setter Function from Python

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Provides an example of how to invoke a custom SWIG-wrapped C function, set_foo, from a Python scripting language. This illustrates that custom assist functions are called like regular functions, not accessed as variables.

```Python
>>> set_foo("Hello World")
```

---

### SWIG Support for decltype() in C++11 Alternate Function Return Types

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows an example of using decltype() as a trailing return type in C++11 alternate function syntax, which SWIG supports with the same limitations as general decltype() usage.

```C++
auto square(float a, float b) -> decltype(a);
```

---

### Demonstrate SWIG C# Directors with C++ and C# Instances

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

This C# `runme` class provides a main application to demonstrate the SWIG director feature. It creates instances of both the pure C++ `Base` class and the C# `CSharpDerived` class, then uses the `Caller` to invoke `UIntMethod`, showcasing how calls are correctly dispatched to either the C++ or C# implementation via directors.

```C#
public class runme
{
  static void Main()
  {
    Caller myCaller = new Caller();

    // Test pure C++ class
    using (Base myBase = new Base())
    {
      makeCalls(myCaller, myBase);
    }

    // Test director / C# derived class
    using (Base myBase = new CSharpDerived())
    {
      makeCalls(myCaller, myBase);
    }
  }

  static void makeCalls(Caller myCaller, Base myBase)
  {
    myCaller.set(myBase);
    myCaller.UIntMethodCall(123);
    myCaller.reset();
  }
}
```

---

### C++ Struct Definition for Member Variable Handling

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This C++ struct definition provides an example of a structure with a member variable, used to demonstrate SWIG's 'memberin' typemap for assigning data to class/structure members.

```C++
struct Foo {
  int x[20];
};
```

---

### SWIG Fragment Inclusion in C/C++ Struct with Extend

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example demonstrating forced fragment inclusion within a C/C++ struct's %extend block. It includes a header fragment and uses a definition from it to implement a check method.

```C++/SWIG
%fragment("<limits.h>", "header") %{
  #include <limits.h>
%}

struct X {
  ...
  %extend {
    %fragment("<limits.h>");
    bool check(short val) {
      if (val < SHRT_MIN /*defined in <limits.h>*/) {
        return true;
      } else {
        return false;
      }
    }
  }
};
```

---

### Build and Load a Tcl Module with SWIG on Linux

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates the complete process of building a Tcl module using SWIG on Linux. It includes generating the C wrapper file, compiling the source and wrapper with GCC, linking into a shared library, and then loading and interacting with the module within a Tcl shell to call C functions and access variables.

```Shell
$ swig -tcl example.i
$ gcc -c -fPIC example.c example_wrap.c -I/usr/include/tcl8.7
$ gcc -shared example.o example_wrap.o -o example.so
$ tclsh
% load ./example.so
% fact 4
24
% my_mod 23 7
2
% expr $My_variable + 4.5
7.5
%
```

---

### Using SWIG exception.i Library for Portable Exception Handling

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how to include and utilize the 'exception.i' library in SWIG interface files. It shows a generic %exception block that catches various C++ exceptions and re-raises them as portable scripting language exceptions using the SWIG_exception() function, ensuring consistent error handling across different target languages.

```SWIG
// Language independent exception handler
%include exception.i

%exception {
  try {
    $action
  } catch(RangeError) {
    SWIG_exception(SWIG_ValueError, "Range Error");
  } catch(DivisionByZero) {
    SWIG_exception(SWIG_DivisionByZero, "Division by zero");
  } catch(OutOfMemory) {
    SWIG_exception(SWIG_MemoryError, "Out of memory");
  } catch(...) {
    SWIG_exception(SWIG_RuntimeError, "Unknown exception");
  }
}
```

---

### C Function Declarations for Array Sorting

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines external C functions `sort_int` and `sort_double` that take an array pointer and its length, serving as examples for SWIG wrapping challenges due to unknown array size and direction.

```C
extern void sort_int(int* arr, size_t len);
extern void sort_double(double* arr, size_t len);
```

---

### C# Example Calling SWIG-Wrapped Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

This C# code demonstrates how to call the SWIG-wrapped 'positivesonly' method with a negative input. This call is expected to trigger the exception defined in the SWIG typemap, showcasing the exception propagation from C++ to C#.

```C#
public class runme {
  static void Main() {
    example.positivesonly(-1);
  }
}
```

---

### SWIG: Module Definition and Header/Helper Inclusion

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to define a SWIG module and include C/C++ header files and custom helper functions using the bare %{ ... %} directive. This block is equivalent to %header %{ ... %} and its content is copied verbatim into the output.

```SWIG

%module mymodule
%{
#include "my_header.h"
%}
... Declare functions here
%{

void some_extra_function() {
  ...
}
%}

```

---

### SWIG Module Definition for C Function Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This SWIG interface definition declares a module named 'example' and specifies a C function `fact` that takes an integer and returns an integer. SWIG will generate Java bindings for this function, making it accessible from Java.

```SWIG
%module example
int fact(int n);
```

---

### SWIG Preprocessor: Handling of %{ ... %} Blocks

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates that content within %{ ... %} blocks is copied verbatim to the output without further preprocessor evaluation by SWIG.

```SWIG
%{
#ifdef NEED_BLAH
int blah() {
  ...
}
#endif
%}
```

---

### C++ Class Definition for SWIG Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a simple C++ class `Foo` with a public member variable `x` and a method `spam`, which serves as an example for SWIG's wrapping process. This class is then transformed by SWIG into language-specific wrappers.

```C++
class Foo {
public:
  int x;
  int spam(int);
  ...

```

---

### Generated Java Enum `HairType`

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of the simplified Java enum `HairType` generated by SWIG using the custom typemaps. This enum is concise and directly reflects the C++ enum without additional SWIG-specific helper methods.

```Java
public enum HairType {
  blonde,
  ginger,
  brunette;
}
```

---

### C++ Example: Struct and Class with Member Reference Return

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a `Wheel` struct and a `Bike` class in C++. The `Bike::getWheel()` method returns a reference to its `wheel` member, which is the source of the memory management challenge when exposed via SWIG to Java.

```C++
struct Wheel {
  int size;
  Wheel(int sz = 0) : size(sz) {}
};

class Bike {
  Wheel wheel;
public:
  Bike(int val) : wheel(val) {}
  Wheel& getWheel() { return wheel; }
};
```

---

### Java Example: Exception on Re-using Moved Proxy

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus11

Illustrates the `RuntimeException` thrown in Java when attempting to re-use or release ownership of a SWIG proxy class instance that has already been moved, indicating the underlying C++ memory is no longer owned.

```Java
Exception in thread "main" java.lang.RuntimeException: Cannot release ownership as memory is not owned
        at MyClass.swigRelease(MyClass.java:27)
        at MyClass.<init>(MyClass.java:55)
        at runme.main(runme.java:18)
```

---

### Guile: Portable Dynamic Module Loading

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This code provides a more portable approach for loading dynamic modules in Guile by omitting the shared library extension, allowing the system to determine the correct extension.

```Scheme
(load-extension \"./libexample\" \"SWIG_init\")
```

---

### SWIG Wrapping C++ Templates with %template for Java

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

Explains how to wrap C++ template instantiations for Java using the %template directive. This example shows the definition of a C++ 'pair' template and its specific instantiation for 'int, int' which is then accessible in Java.

```SWIG
%module example
%{
#include <utility>
%}

template<class T1, class T2>
struct pair {
  typedef T1 first_type;
  typedef T2 second_type;
  T1 first;
  T2 second;
  pair();
  pair(const T1&, const T2&);
  ~pair();
};

%template(pairii) pair<int, int>;
```

```Java
pairii p = new pairii(3, 4);
int first = p.getFirst();
int second = p.getSecond();
```

---

### Ruby Usage of SWIG-Wrapped Overloaded Constructors

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates creating 'Foo' objects in Ruby using the default and copy constructors wrapped by SWIG.

```Ruby
irb(main):001:0> f = Foo.new # Create a Foo
irb(main):002:0> g = Foo.new(f) # Copy f
```

---

### SWIG Example: Renaming Move Assignment Operator

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus11

Demonstrates how to use the `%rename` directive in a SWIG interface file to expose a C++ move assignment operator (`operator=`) to target languages, resolving the default warning and making it callable.

```SWIG
%rename(MoveAssign) MyClass::operator=(MyClass &&);
```

---

### Displaying SWIG Java Module Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to display a list of additional command-line options specific to the SWIG Java module.

```Shell
swig -java -help
```

---

### SWIG Generated Python Wrapper with Typemap Application

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

An example of a SWIG-generated C wrapper function for a Python module, illustrating how 'in' and 'out' typemaps are inserted and expanded to handle type conversion for arguments and return values of the `gcd` function.

```C
PyObject *wrap_gcd(PyObject *self, PyObject *args) {
  int arg1;
  int arg2;
  int result;
  PyObject *obj1;
  PyObject *obj2;
  PyObject *resultobj;

  if (!PyArg_ParseTuple("OO:gcd", &obj1, &obj2)) return NULL;

  /* "in" typemap, argument 1 */
  {
    arg1 = PyInt_AsLong(obj1);
  }

  /* "in" typemap, argument 2 */
  {
    arg2 = PyInt_AsLong(obj2);
  }

  result = gcd(arg1, arg2);

  /* "out" typemap, return value */
  {
    resultobj = PyInt_FromLong(result);
  }

  return resultobj;
}
```

---

### Compile C++ Code with SWIG for R (PKG_LIBS for CXX)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to compile C++ code with a .cxx extension using PKG_LIBS when R CMD SHLIB might not recognize it directly, ensuring the correct library is linked.

```Shell
swig -c++ -r -o example_wrap.cpp example.i
PKG_LIBS="example.cxx" R CMD SHLIB -o example example_wrap.cpp
```

---

### SWIG General Exception Handler Definition

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates the basic syntax for defining a general-purpose exception handler using the SWIG %exception directive. The $action variable is a placeholder for the actual operation being wrapped, allowing custom try-catch blocks to be inserted around it.

```SWIG
%exception {
  try {
    $action
  }
  catch (RangeError) {
    ... handle error ...
  }
}
```

---

### Running SWIG for C Code with Octave

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command demonstrates how to run SWIG to generate a wrapper for C code intended for Octave. The `-octave` option specifies the target language, and `-o` sets the output wrapper file name.

```Shell
$ swig -octave -o example_wrap.cpp example.i
```

---

### C++ Typedef as Base Class Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ code demonstrates that a `typedef`-name can be successfully used as a base class in C++. Here, `FooObj` is a `typedef` for `Foo`, and `Bar` inherits from `FooObj`, which SWIG correctly interprets as inheriting from `Foo`.

```C++
class Foo {
...
};

typedef Foo FooObj;
class Bar : public FooObj {     // Ok.  Base class is Foo
...
};
```

---

### Python Desired Call Example for `foo` with a List of Strings

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Demonstrates the desired Python-side invocation of the `foo` function, where a single Python list of strings is passed. SWIG's multi-argument typemap will convert this list into the `argc` and `argv` parameters in C/C++.

```Python
>>> foo(["ale", "lager", "stout"])
```

---

### Java Client for SWIG-Wrapped Spam Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java program demonstrates how to call the `spam` function exposed via SWIG. It loads the native library, instantiates `MyDouble` objects to receive output values, calls `example.spam`, and then retrieves and prints the results using `getValue()`.

```Java
// File: runme.java

public class runme {

  static {
    try {
      System.loadLibrary("example");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native code library failed to load. " + e);
      System.exit(1);
    }
  }

  public static void main(String argv[]) {
    MyDouble out1 = new MyDouble();
    MyDouble out2 = new MyDouble();
    int ret = example.spam(1.2, 3.4, out1, out2);
    System.out.println(ret + "  " + out1.getValue() + "  " + out2.getValue());
  }
}
```

---

### Define Doxygen Alias in Doxyfile

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of defining a custom Doxygen command alias 'sideeffect' in the Doxyfile. This alias expands to a paragraph 'Side Effects:' followed by a newline, allowing Doxygen to process custom documentation tags.

```Doxygen
ALIASES = "sideeffect=\par Side Effects:\n"
```

---

### SWIG C# Feature Equivalents to Java

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a mapping of equivalent feature directives between SWIG's Java module and its C# module.

```APIDOC
%javaconst                  -> %csconst
%javaconstvalue             -> %csconstvalue
%javamethodmodifiers        -> %csmethodmodifiers
```

---

### Android UI Layout for Main Activity

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This XML snippet defines the user interface layout for the Android main activity. It includes a 'Run' button that triggers the `onRunButtonClick` method and a scrollable `TextView` (`OutputText`) to display output from the application. This layout provides the visual structure for the example application's interaction.

```XML
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    >
<Button
    android:id="@+id/RunButton"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:text="Run..."
    android:onClick="onRunButtonClick"
    />
<ScrollView
    android:id="@+id/Scroller"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    >
<TextView
    android:id="@+id/OutputText"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    />
</ScrollView>
</LinearLayout>
```

---

### SWIG Default 'out' Typemap and C++ Class Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet shows the default 'out' typemap used by SWIG for returning objects by value, along with a C++ class `XX` designed to illustrate object construction, copying, and destruction. The `XX::create()` method returns an `XX` object by value, demonstrating the overhead of default SWIG code generation.

```SWIG
%typemap(out) SWIGTYPE %{
  $result = new $1_ltype($1);
%}

%inline %{
#include <iostream>
using namespace std;

struct XX {
  XX() { cout << "XX()" << endl; }
  XX(int i) { cout << "XX(" << i << ")" << endl; }
  XX(const XX &other) { cout << "XX(const XX &)" << endl; }
  XX & operator =(const XX &other) { cout << "operator=(const XX &)" << endl; return *this; }
  ~XX() { cout << "~XX()" << endl; }
  static XX create() {
    return XX(0);
  }
};
%}
```

---

### Compile Android NDK Shared Library

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

This command invokes ndk-build to compile the C/C++ source files specified in Android.mk. It generates a shared object library (.so file) for the Android application, showing the compilation and installation steps.

```Shell
$ ndk-build
Compile thumb  : example <= example_wrap.c
Compile thumb  : example <= example.c
SharedLibrary  : libexample.so
Install        : libexample.so => libs/armeabi/libexample.so
```

---

### SWIG C# Asymmetric Type Marshalling with imtype Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how to use the 'imtype' typemap with the 'out' attribute in SWIG to achieve asymmetric type marshalling. It shows how a C/C++ 'char \*' can be marshalled as a 'string' for input and 'global::System.IntPtr' for output in C#.

```SWIG
%typemap(imtype, out="global::System.IntPtr") char * "string"
char * function(char *);
```

```C#
public static extern global::System.IntPtr function(string jarg1);
```

---

### SWIG: Interface File Using %include Directive

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A more concise SWIG interface file (`interface.i`) that uses the `%include` directive to process the entire `header.h` file. This approach reduces maintenance overhead when the header file changes.

```SWIG
/* File : interface.i */
%module mymodule
%{
#include "header.h"
%}
%include "header.h"
```

---

### Defining C File Pointers in a SWIG Interface

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This SWIG interface file defines a module 'example' and declares standard C file I/O functions (fopen, fputs, fclose). It demonstrates how SWIG processes C function signatures involving pointers (FILE\*) to generate wrappers for target languages, enabling their use in a natural way.

```SWIG
%module example

FILE *fopen(const char *filename, const char *mode);
int fputs(const char *, FILE *);
int fclose(FILE *);
```

---

### C Function to Sum Array Elements

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

Defines a simple C function `sumitems` that takes an integer pointer and the number of items, then calculates and returns their sum. This function serves as the target for SWIG wrapping examples.

```C
int sumitems(int *first, int nitems) {
  int i, sum = 0;
  for (i = 0; i < nitems; i++) {
    sum += first[i];
  }
  return sum;
}
```

---

### Implement Factorial Function in C

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C source file (`example.c`) implements a simple factorial function `fact(int n)`. It includes the 'example.h' header and handles base cases for n=0 and negative n, returning 0 for negative input and 1 for n=0.

```C
/* File: example.c */

#include "example.h"

int fact(int n) {
  if (n < 0) { /* This should probably return an error, but this is simpler */
    return 0;
  }
  if (n == 0) {
    return 1;
  } else {
    /* testing for overflow would be a good idea here */
    return n * fact(n-1);
  }
}
```

---

### Illustrate Octave's Pass-by-Value Semantics for Built-in Structs

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example shows Octave's default pass-by-value (copy-on-write) behavior for built-in types like structs. Modifying a copy (`b`) does not affect the original variable (`a`).

```Octave
octave:7> a=struct('x', 4)
a =
{
  x =  4
}

octave:8> b=a
b =
{
  x =  4
}

octave:9> b.y=4
b =
{
  x =  4
  y =  4
}

octave:10> a
a =
{
  x =  4
}

```

---

### SWIG Scilab-Specific Command Line Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This table lists command-line options specific to SWIG when targeting Scilab. These options control aspects like builder script generation, compiler/linker flags, source files, verbosity, and gateway XML generation.

```APIDOC
-builder: Generate the Scilab builder script
-buildercflags <cflags>: Add <cflags> to the builder compiler flags
-builderldflags <ldflags>: Add <ldlags> to the builder linker flags
-buildersources <files>: Add the (comma separated) files <files> to the builder sources
-builderverbositylevel <level>: Set the build verbosity level to <level> (default 0: off, 2: high)
-builderflagscript <file>: Use the Scilab script <file> to configure the compiler and linker flags
-gatewayxml <gateway_id>: Generate the gateway XML with the given <gateway_id>
-gatewayxml6: Generate a gateway XML file compatible with Scilab 6
```

---

### C++ User-Defined Literal Usage Syntax Error in SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates examples of using user-defined literals in C++ code that currently result in a syntax error when parsed by SWIG, indicating a limitation in direct usage wrapping.

```C++
OutputType var1 = "1234"_suffix;
OutputType var2 = 1234_suffix;
OutputType var3 = 3.1416_suffix;
```

---

### Attempting to Access C++ Static Members via Instance in Lua (Invalid)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates that, currently, it is not possible to access static members of a SWIG-wrapped C++ class through an instance of that class in Lua. The example shows an attempt that will not work.

```Lua
> s=example.Spam()              -- s is a Spam instance
> s.foo()                       -- Spam::foo() via an instance
                                -- does NOT work
```

---

### Compile and Link Dynamic Tcl Module on Linux

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

These commands demonstrate the process of compiling and linking a dynamic Tcl extension module on Linux. It involves running SWIG, compiling source and wrapper files with position-independent code (PIC), and linking them into a shared object (.so) file.

```Shell
$ swig -tcl example.i
$ gcc -fPIC -c example.c
$ gcc -fPIC -c example_wrap.c -I/usr/local/include
$ gcc -shared example.o example_wrap.o -o example.so
```

---

### Using Wrapped C File Pointers in Java with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java example demonstrates how to utilize C file I/O functions after they have been wrapped by SWIG. It illustrates opening a file, writing a string to it, and closing it, showcasing the use of the SWIGTYPE_p_FILE class which wraps the underlying C FILE\* pointer for type safety in Java.

```Java
SWIGTYPE_p_FILE f = example.fopen("junk", "w");
example.fputs("Hello World\n", f);
example.fclose(f);
```

---

### C Functions with Pointer Parameters

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates common C functions where parameters are passed as simple pointers for input, output, or both. These functions demonstrate the need for special handling when integrated with other languages.

```C
void add(int x, int y, int *result) {
  *result = x + y;
}
```

```C
int sub(int *x, int *y) {
  return *x-*y;
}
```

---

### C open Function with Optional Variable Arguments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Presents the open system call, which uses varargs to support an optional third argument (mode) for file creation, effectively faking default arguments in older C libraries. Examples show both two and three-argument calls.

```C
int open(const char *path, int oflag, ...);

/* Examples */
f = open("foo", O_RDONLY);
g = open("bar", O_WRONLY | O_CREAT, 0644);
```

---

### SWIG Optimized CPython Reference Management with Singleton

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An optimized version of the CPython reference management, using `%fragment` directives to create a thread-safe singleton `__bike_reference` string object. This reduces overhead by creating the string only once during module initialization, then reusing it in the `PyObject_SetAttr` call within the `%typemap`.

```SWIG
%fragment("bike_reference_init", "init") {
  // Thread-safe initialization - initialize during Python module initialization
  bike_reference();
}

%fragment("bike_reference_function", "header", fragment="bike_reference_init") {

static PyObject *bike_reference() {
  static PyObject *bike_reference_string = SWIG_Python_str_FromChar("__bike_reference");
  return bike_reference_string;
}

}

%extend Wheel {
// A reference to the parent class is added to ensure the underlying C++
// object is not deleted while the item is in use
%typemap(ret, fragment="bike_reference_function") Wheel& getWheel %{
  PyObject_SetAttr($result, bike_reference(), $self);
%}
}
```

---

### Java Example: Testing Custom equals() Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

Illustrates the usage of the custom `equals()` method, demonstrating how two Java proxy objects referencing the same underlying C++ object are correctly identified as equal after applying the SWIG `javacode` typemap.

```Java
Foo foo1 = new Foo();
Foo foo2 = example.returnFoo(foo1);
System.out.println("foo1? " + foo1.equals(foo2));
```

---

### C++ Shape Class with Doxygen Comments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Doxygen

An example C++ class definition (`Shape`) demonstrating the use of Doxygen comments for class, member variables, and methods. These comments are later translated into Javadoc by SWIG.

```C++
/*! This is describing class Shape
 \author Bob
 */

class Shape {
public:
  Shape() {
    nshapes++;
  }
  virtual ~Shape() {
    nshapes--;
  };
  double  x, y; /*!< Important Variables */
  void    move(double dx, double dy); /*!< Moves the Shape */
  virtual double area(void) = 0; /*!< \return the area */
  virtual double perimeter(void) = 0; /*!< \return the perimeter */
  static  int nshapes;
};
```

---

### SWIG interface with INPUT/OUTPUT typemaps

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to define a SWIG interface file using `typemaps.i` to automatically handle C pointer parameters as simple input/output values in target languages like Tcl.

```SWIG
%module example
%include "typemaps.i"

void add(int, int, int *OUTPUT);
int  sub(int *INPUT, int *INPUT);
```

---

### Console Output of SWIG Java Example Execution

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

Displays the command line output when the Java `runme` program is executed. It confirms that the `print_args` function correctly received and printed the Java `String[]` elements, and that the `get_args` function successfully returned a C `char**` as a Java `String[]`.

```Shell
$ java runme
argv[0] = Cat
argv[1] = Dog
argv[2] = Cow
argv[3] = Goat
0:Dave
1:Mike
2:Susan
3:John
4:Michelle
```

---

### SWIG Support for C++ Function Overloading

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how SWIG handles C++ overloaded functions, allowing them to be called from Lua based on argument types. Includes an example of Lua's type coercion affecting overload resolution.

```C++
void foo(int);
void foo(char *c);
```

```Lua
foo(3)           -- foo(int)
foo("Hello")     -- foo(char *c)
```

```Lua
foo("3")           -- "3" can be coerced into an int, so it calls foo(int)!
```

---

### C++ Doxygen Comment with HTML Table

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Doxygen

An example of a C++ Doxygen comment block containing an HTML table. This demonstrates how SWIG processes and translates structured content like tables while preserving whitespace for readability.

```C++
/**
 * <table border = '1'>
 * <caption>Animals</caption>
 * <tr><th> Column 1 </th><th> Column 2 </th></tr>
 * <tr><td> cow      </td><td> dog      </td></tr>
 * <tr><td> cat      </td><td> mouse    </td></tr>
 * <tr><td> horse    </td><td> parrot   </td></tr>
 * </table>
 */
```

---

### Guile: Dynamic Module Mix-in with SWIG Bindings

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Scheme code demonstrates how to create a dynamic Guile module that incorporates SWIG-generated bindings. It defines a module, dynamically links a shared library containing SWIG bindings, and then calls the `SWIG_init` function to make those bindings available within the module.

```Scheme
(define-module (my module))\n(define my-so (dynamic-link \"./libexample.so\"))\n(dynamic-call \"SWIG_init\" my-so) ; make SWIG bindings\n;; Scheme definitions can go here
```

---

### Configure C++ STL for Android NDK Projects

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how to configure the Application.mk file to enable the C++ Standard Template Library (STL) for Android NDK projects. By setting APP_STL := gnustl_static, the STLport static library becomes available for use in C++ code, which is often required for advanced C++ features.

```Makefile
# File: Application.mk
APP_STL := gnustl_static
```

---

### C++ Smart Pointer Member Name Precedence Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates a scenario where both the smart pointer class and the underlying object define a member with the same name. SWIG's wrapper will prioritize the member defined in the smart pointer class.

```C++
class Foo {
public:
  int x;
};

class Bar {
public:
  int x;
  Foo *operator->();
};
```

---

### Run Testcase with Valgrind for Memory Checking

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Extending

Example of using the 'RUNTOOL' make variable to integrate external tools like Valgrind for advanced test-suite usage. This command checks for memory leaks when running a C testcase in the target language interpreter.

```Shell
make ret_by_value.ctest RUNTOOL="valgrind --leak-check=full"
```

---

### SWIG Typemap for Returning Values via Arguments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates how to use SWIG's 'argout' and 'in' typemaps to allow C functions to return values through pointer arguments. It defines a 'double \*OUTPUT' typemap to handle output parameters, showing how to set the result on the Perl stack and ignore input for output-only parameters. Includes a C function 'multout' and its SWIG interface definition, followed by Perl usage examples.

```SWIG
%module return

// This tells SWIG to treat an double * argument with name 'OutDouble' as
// an output value.

%typemap(argout) double *OUTPUT {
  $result = sv_newmortal();
  sv_setnv($result, *$input);
  argvi++;                     /* Increment return count -- important! */
}

// We don't care what the input value is. Ignore, but set to a temporary variable

%typemap(in, numinputs=0) double *OUTPUT(double junk) {
  $1 = &junk;
}

// Now a function to test it
%{
/* Returns the first two input arguments */
int multout(double a, double b, double *out1, double *out2) {
  *out1 = a;
  *out2 = b;
  return 0;
};
%}

// If we name both parameters OutDouble both will be output

int multout(double a, double b, double *OUTPUT, double *OUTPUT);
```

```Perl
@r = multout(7, 13);
print "multout(7, 13) = @r\n";
($x, $y) = multout(7, 13);
```

---

### SWIG %varargs with Numerical Argument Count

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how %varargs can specify a fixed number of uniform arguments, such as three optional char\* arguments for execlp, and how SWIG expands these into distinct parameters.

```SWIG
%varargs(3, char *str = NULL) execlp;
...
int execlp(const char *path, const char *arg, ...);
```

```C
int execlp(const char *path, const char *arg,
           char *str1 = NULL,
           char *str2 = NULL,
           char *str3 = NULL);
```

---

### C/C++ Typedef Example for SWIG Typemap Debugging

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This C/C++ code defines a typedef for an integer and a multi-dimensional array, which serves as the input for demonstrating SWIG's typemap debugging capabilities. It highlights how complex types are handled.

```C
typedef int Integer;
typedef Integer Row4[4];
void foo(Row4 rows[10]);
```

---

### Defining Nested C Structures for SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the definition of two C structures, `Foo` and `Bar`, where `Bar` contains an instance of `Foo` as a data member. This setup demonstrates a common scenario for SWIG's structure wrapping, especially concerning nested types.

```C
typedef struct Foo {
  int x;
} Foo;

typedef struct Bar {
  int y;
  Foo f;           /* struct member */
} Bar;
```

---

### C#: Using `std::auto_ptr` returned object

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of how to use an object returned by a C++ function that uses `std::auto_ptr` from a target language, specifically C#. It shows calling a factory method and then accessing a member function.

```C#
Klass k = Klass.Create(17);
int value = k.getValue();
```

---

### SWIG Language Module configure.ac Configuration Guidelines

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Guidelines for configuring configure.ac for new SWIG language modules, focusing on the use of Autoconf macros like AC_ARG_WITH, AC_MSG_CHECKING, and AC_SUBST for detecting language-specific development support. It also specifies variable naming conventions.

```APIDOC
Autoconf Macros for configure.ac:
  - AC_ARG_WITH: Used to detect presence of language support.
  - AC_MSG_CHECKING: For displaying status messages during configuration.
  - AC_SUBST: To define variables for use in Makefiles.
    - Variable Naming: Variables passed to AC_SUBST should start with the upcased language nickname (e.g., QUX99INCLUDE).
  - Shell Script Fragments: Avoid using '[' and ']' characters.
```

---

### SWIG/C++: Apply %nspacemove and %feature for Namespace Relocation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Demonstrates the application of `%nspace`, `%nspacemove`, and `%feature("nspace", ...)` directives to move various C++ structs into different target language namespaces. This example showcases renaming, moving to entirely different namespaces, and maintaining existing hierarchies, along with the inline C++ definitions of the structs.

```SWIG/C++
// Enable the nspace feature flag for all symbols
%nspace;

// Override the nspace feature for a subset of symbols by moving them into different namespaces
%nspacemove(A) A::B::C::Struct1;
%feature("nspace", "A::B::X") A::B::C::Struct2;
%nspacemove(A::B::C::D) A::B::C::Struct4;
%nspacemove(Somewhere::Else) A::B::C::Struct5;

%inline %{
namespace A {
  namespace B {
    namespace C {
      struct Struct1 {
        // ...
      };
      struct Struct2 {
        // ...
      };
      struct Struct3 {
        // ...
      };
      struct Struct4 {
        // ...
      };
      struct Struct5 {
        // ...
      };
    }
  }
}
%}
```

---

### SWIG Language Module: Entry Point for Code Generation in C++

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ code snippet illustrates the `top()` method, which serves as the primary entry point for wrapper code generation in a SWIG language module. Invoked after parsing and semantic analysis, it outlines the essential steps: retrieving module and output file names, initializing I/O, emitting module initialization code, recursively generating code for child nodes via `Language::top(n)`, and performing final cleanup. This method is central to the multi-pass compilation process.

```C++
int Python::top(Node *n) {

  /* Get the module name */
  String *module = Getattr(n, "name");

  /* Get the output file name */
  String *outfile = Getattr(n, "outfile");

  /* Initialize I/O (see next section) */
  ...

  /* Output module initialization code */
  ...

  /* Emit code for children */
  Language::top(n);

  ...
  /* Cleanup files */
  ...

  return SWIG_OK;
}
```

---

### C Function Implementing Varargs with stdarg.h

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a detailed C implementation of a make_list function that accepts a variable number of string arguments, demonstrating the use of va_list, va_start, va_arg, and va_end from <stdarg.h>.

```C
List make_list(const char *s, ...) {
  va_list ap;
  List    x;
  ...
  va_start(ap, s);
  while (s) {
    x.append(s);
    s = va_arg(ap, const char *);
  }
  va_end(ap);
  return x;
}
```

---

### Generated C Accessor Functions for Nested SWIG Structures

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Illustrates the type of C accessor functions SWIG generates for nested structures, providing methods to get the nested union and its individual members (e.g., `ivalue`, `dvalue`).

```C
Object_intRep *Object_intRep_get(Object *o) {
  return (Object_intRep *) &o->intRep;
}
int Object_intRep_ivalue_get(Object_intRep *o) {
  return o->ivalue;
}
int Object_intRep_ivalue_set(Object_intRep *o, int value) {
  return (o->ivalue = value);
}
double Object_intRep_dvalue_get(Object_intRep *o) {
  return o->dvalue;
}
... etc ...
```

---

### Python Usage of SWIG-Wrapped Unbounded Array

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of creating and manipulating an `intArray` object in Python, demonstrating how to set values and pass the array to a SWIG-wrapped C function like `sumitems`. Highlights the low-level nature and lack of bounds checking.

```Python
>>> a = intArray(10000000)         # Array of 10-million integers
>>> for i in xrange(10000):        # Set some values
...     a[i] = i
>>> sumitems(a, 10000)
49995000
```

---

### SWIG `%insert(go_wrapper)` for Go Class Methods

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to extend a SWIG-generated Go class interface using `%insert(go_wrapper)` to provide a more idiomatic Go method, `GetAValue`, which handles an output argument as a return value.

```SWIG
%rename(Wrapped_MyClass) MyClass;
%rename(Wrapped_GetAValue) MyClass::GetAValue(int *x);
%apply int *OUTPUT { int *x };

class MyClass {
 public:
  MyClass();
  int AFineMethod(const char *arg); // Swig's wrapping is fine for this one.
  bool GetAValue(int *x);
};

%insert(go_wrapper) %{

type MyClass interface {
  Wrapped_MyClass
  GetAValue() (int, bool)
}

func (arg SwigcptrWrapped_MyClass) GetAValue() (int, bool) {
  ip := []int{0}
  ok := arg.Wrapped_GetAValue(ip);
  return ip[0], ok
}

%}
```

---

### SWIG Go Binding for C++ Classes

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how SWIG translates a C++ class definition, including instance methods and static factory functions, into a Go interface and corresponding Go functions. It shows the `Swigcptr` method for accessing the underlying C++ pointer and the mapping of static C++ methods to Go functions.

```cpp
class MyClass {
  int MyMethod();
  static MyClass *MyFactoryFunction();
};
```

```go
type MyClass interface {
  Swigcptr() uintptr
  SwigIsMyClass()
  MyMethod() int
}

func MyClassMyFactoryFunction() MyClass {
  // swig magic here
}
```

---

### Example Output of Extended Vector toString() Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This snippet shows the expected output when printing an instance of the `Vector` class in Java, demonstrating the effect of the custom `toString()` method added via SWIG's %extend directive.

```Plaintext
Vector(2, 3, 4)
```

---

### C Function Definition with Fixed-Size Array Parameter

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Defines a C function `set_vector` that takes an integer `type` and a fixed-size array of 4 floats `value`. This function signature is used as an example for applying SWIG typemaps.

```C
void set_vector(int type, float value[4]);
```

---

### Demonstrating Global SWIG %feature Flags with %immutable

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example uses the %immutable feature flag to demonstrate how features are enabled, disabled, and cleared globally. It shows how the mutability of C integer variables changes based on the global %feature("immutable") directive, highlighting that features are disabled by default.

```SWIG
                                // features are disabled by default
int red;                        // mutable

%feature("immutable");          // global enable
int orange;                     // immutable

%feature("immutable", "0");     // global disable
int yellow;                     // mutable

%feature("immutable", "1");     // another form of global enable
int green;                      // immutable

%feature("immutable", "");      // clears the global feature
int blue;                       // mutable
```

---

### SWIG `%insert(go_wrapper)` for Improved Go `modf` API

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates using `%insert(go_wrapper)` to create a more idiomatic Go function `Modf` that wraps the SWIG-generated `Wrapped_modf`, converting its output argument into a second return value.

```SWIG
%include <typemaps.i>
// Change name of what swig generates to Wrapped_modf.  This function will
// have the following signature in go:
//   func Wrapped_modf(float64, []float64) float64
%rename(wrapped_modf) modf(double x, double *ip);

%apply double *OUTPUT { double *ip };
double modf(double x, double *ip);

%insert(go_wrapper) %{

// The improved go interface to this function, which has two return values,
// in the more natural go idiom:
func Modf(x float64) (fracPart float64, intPart float64) {
  ip := []float64{0.0}
  fracPart = Wrapped_modf(x, ip)
  intPart = ip[0]
  return
}

%}
```

---

### SWIG Generated C Accessors for Nested Struct Member

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the C accessor functions generated by SWIG for a nested struct member (`f`), providing methods to get a pointer to the nested struct and set its value.

```C
Foo *Bar_f_get(Bar *b) {
  return &b->f;
}

void Bar_f_set(Bar *b, Foo *val) {
  b->f = *val;
}
```

---

### Doxygen Comment Placement Before C/C++ Expressions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how Doxygen comments can be placed on separate lines directly preceding C/C++ function declarations or class definitions. SWIG parses these comments and associates them with the subsequent code items, enabling documentation for functions and classes.

```C++
/**
 * Some comment
 */
void someOtherFunction();
/**
 * Some comment
 */
void someFunction();

class Shape {
  /*
   * Calculate the area in cm^2
   */
  int getArea();
}
```

---

### Generated Code with SWIG Fragment Reuse Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Shows how SWIG generates wrapper code when a fragment's support function is used by multiple arguments in a single function call (e.g., 'void foo(MyClass *a, MyClass *b);'). The 'AsMyClass' method, defined in the fragment, is generated only once, even though its calls are duplicated for each argument, demonstrating effective code bloat reduction.

```SWIG

void foo(MyClass *a, MyClass *b);

```

```SWIG

MyClass *AsMyClass(PyObject *obj) {
  ...
}

void _wrap_foo(...) {
  ....
  arg1 = AsMyClass(obj1);
  arg2 = AsMyClass(obj2);
  ...
  foo(arg1, arg2);
}

```

---

### Python Example of SWIG **disown** Method Usage

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the `__disown__` method in Python to reverse object ownership, allowing C++ to manage the lifetime of Python-created objects. It shows creating `Foo` instances, disowning them, and adding them to a `FooContainer` without retaining hard references in Python.

```Python
>>> c = FooContainer()
>>> a = Foo().__disown__()
>>> c.addFoo(a)
>>> b = Foo()
>>> b = b.__disown__()
>>> c.addFoo(b)
>>> c.addFoo(Foo().__disown__())
```

---

### SWIG Interface with Input Value Constraints

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example SWIG interface file demonstrating how to apply constraints to input values using the constraints.i library. Constraints like POSITIVE, NONNEGATIVE, NONZERO, and NONNULL can be applied to function arguments, raising scripting language exceptions if violated.

```SWIG
// Interface file with constraints
%module example
%include "constraints.i"

double exp(double x);
double log(double POSITIVE);         // Allow only positive values
double sqrt(double NONNEGATIVE);     // Non-negative values only
double inv(double NONZERO);          // Non-zero values
int    fclose(FILE *NONNULL);        // Non-NULL pointers only
```

---

### SWIG C# Typemap Macro Equivalents to Java

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Lists the equivalent typemap macros when transitioning from SWIG's Java module to the C# module.

```APIDOC
SWIG_JAVABODY_PROXY         -> SWIG_CSBODY_PROXY
SWIG_JAVABODY_TYPEWRAPPER   -> SWIG_CSBODY_TYPEWRAPPER
```

---

### Configure SWIG Java Proxy and Typewrapper Visibility

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example usage of SWIG macros SWIG_JAVABODY_PROXY and SWIG_JAVABODY_TYPEWRAPPER to set the visibility of generated getCPtr() methods and pointer constructors to public. These macros are the preferred method for ensuring forward compatibility with future SWIG versions.

```SWIG
SWIG_JAVABODY_PROXY(public, public, SWIGTYPE)
SWIG_JAVABODY_TYPEWRAPPER(public, public, public, SWIGTYPE)
```

---

### SWIG-generated Python proxy class with -fastproxy and -olddefs

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Python proxy class `Go` is generated with both `-fastproxy` and `-olddefs` SWIG options. It defines each method twice: first with a standard Python wrapper for user-friendliness (e.g., docstrings), and then with `_swig_new_instance_method` for direct C API calls. The second definition overrides the first, providing a balance between performance and usability, albeit with a minor increase in module import time.

```Python
class Go(object):
    def callme0(self):
        return _example.Go_callme0(self)
    callme0 = _swig_new_instance_method(_example.Go_callme0)

    def callme4(self, a, b, c, d):
        return _example.Go_callme4(self, a, b, c, d)
    callme4 = _swig_new_instance_method(_example.Go_callme4)

    def callme8(self, a, b, c, d, e, f, g, i):
        return _example.Go_callme8(self, a, b, c, d, e, f, g, i)
    callme8 = _swig_new_instance_method(_example.Go_callme8)
    ...
```

---

### SWIG Backwards Compatibility for Constants Interface

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Java

This Java snippet demonstrates SWIG's approach to maintaining backwards compatibility. The module class example implements the exampleConstants interface, allowing constants to be accessed either directly from the module class or through the interface.

```Java
public class example implements exampleConstants {
}
```

---

### Tcl Calls to SWIG-Wrapped Overloaded Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how overloaded C++ functions, wrapped by SWIG, are called from Tcl. The examples show calls to 'foo' with different argument types (integer, double, string and integer) to match various C++ signatures.

```Tcl
foo 3            # foo(int)
foo 3.5          # foo(double)
foo hello 5      # foo(char *, int)
```

---

### Python TypeError for Missing Typecheck Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of the traceback and error message Python generates when an overloaded C/C++ function is called via SWIG without a proper typecheck typemap, leading to ambiguity in argument matching.

```Python Traceback
Traceback (most recent call last):
  File "runme.py", line 3, in >module<
    example.foo(["foo", "bar", "spam", "1"])
TypeError: Wrong number or type of arguments for overloaded function 'foo'.
  Possible C/C++ prototypes are:
    foo(int, char **)
    foo()
```

---

### SWIG Interface File: Enabling Object Tracking

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file demonstrates how to enable the `%trackobjects` feature, which ensures a one-to-one mapping between Ruby objects and their corresponding C++ instances. It also uses `%newobject` to correctly manage objects created by C++ factory methods, preventing premature garbage collection and memory errors.

```SWIG
%module example

%{
#include "example.h"
%}

/* Tell SWIG that create_animal creates a new object */
%newobject Zoo::create_animal;

/* Tell SWIG to keep track of mappings between C/C++ structs/classes. */
%trackobjects;

%include "example.h"
```

---

### SWIG Wrapping Nested C/C++ Struct Members

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how SWIG handles nested C/C++ structs, generating accessor functions that treat the nested struct as a pointer. This allows for getting and setting the nested struct's value.

```C/C++
struct Foo {
  ...
};

struct Bar {
  Foo f;
};
```

```C/C++
Foo *Bar_f_get(Bar *b) {
  return &b->f;
}

void Bar_f_set(Bar *b, Foo *val) {
  b->f = *val;
}
```

---

### Generate SWIG Python Runtime Header for External C Access

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command-line example demonstrates how to use the `swig -external-runtime` option to generate a language-specific header file (e.g., `swigpyrun.h` for Python). This header allows external C code to call SWIG runtime functions like `SWIG_TypeQuery` and `SWIG_NewPointerObj` without linking against SWIG libraries. The `<filename>` argument is optional, and the generated header should be regenerated alongside `_wrap` files.

```Shell
$ swig -python -external-runtime <filename>
```

---

### Generated Python Function with Sphinx Parameter Docs

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the Python function ('SetBreakpoint') generated from the C++ source, showing how Doxygen parameter comments are translated into Sphinx-style ':type:' and ':param:' conventions for improved documentation within Python.

```Python
def SetBreakpoint(filename, line_number):
    r"""
    Set a breakpoint at the given location.

    :type filename: string
    :param filename: The full path to the file.
    :type line_number: int
    :param line_number: The line number in the file.
    """
```

---

### C++14 Binary Integer Literal Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ code snippet demonstrates the use of a binary integer literal, a feature introduced in C++14. The `0b` prefix indicates that the following digits are binary, allowing for direct representation of binary values in source code.

```C++
int b = 0b101011;
```

---

### Node-webkit Main HTML Page (app.html)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This HTML snippet represents the main web page (app.html) for a node-webkit application. It includes a script tag to load app.js and defines placeholders for displaying calculated values within the body.

```HTML
<html>
  <head>
    <script src="app.js"></script>
  </head>
  <body>
    <div>
      The greatest common divisor of
      <span id="x"></span> and
      <span id="y"></span> is
      <span id="z"></span>.
    </div>
  </body>
</html>
```

---

### Scripting Language Runtime Error for Undeclared Types

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Illustrates a common runtime error in the scripting language interface when an undeclared C type (like `size_t` used as a value) is expected by SWIG as a pointer, resulting in a `TypeError`.

```Scripting Language Example
foo(40);
TypeError: expected a _p_size_t.
```

---

### Build and Use a Python Module with SWIG on Linux

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates the process of building a Python module with SWIG on Linux. It includes generating the C wrapper, compiling the source and wrapper with GCC, linking into a shared library, and then importing and using the module within a Python interpreter to call C functions and access variables.

```Shell
$ swig -python example.i
$ gcc -c -fPIC example.c example_wrap.c -I/usr/include/python3.12
$ gcc -shared example.o example_wrap.o -o _example.so
$ python3
Python 3.12.4 (main, Jun 12 2024, 19:06:53) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import example
>>> example.fact(4)
24
>>> example.my_mod(23, 7)
2
>>> example.cvar.My_variable + 4.5
7.5
```

---

### Python 3 Relative Import for Nested Modules

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides an example of how to achieve a similar effect to Python 2's relative imports in Python 3, by explicitly importing the package first and then the module. This ensures the `pkg2.mod3.M3` symbol is available as desired.

```Python
# pkg1/mod2.py
from . import pkg2
from .pkg2 import mod3
class M2(pkg2.mod3.M3): pass
```

---

### ccache-swig Command Line Synopsis

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CCache

Illustrates the various ways to invoke ccache-swig, either with its own options or by acting as a wrapper for other compilers.

```Shell
ccache-swig [OPTION]

ccache-swig <compiler> [COMPILER OPTIONS]

<compiler> [COMPILER OPTIONS]
```

---

### Generated Java Module Class for C Function

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Java code snippet shows the structure of the `example` module class generated by SWIG. It contains a static method `fact` that corresponds to the wrapped C function, facilitating calls to the underlying C implementation via JNI.

```Java
public class example {
  public static int fact(int n) {
    // makes call using JNI to the C function
  }
}
```

---

### SWIG Configuration for JavaDoc Comments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to add JavaDoc comments to generated Java proxy classes and methods using SWIG's `%javamethodmodifiers` and `%typemap(javaimports)` directives. This example applies a method comment to `Barmy::lose_marbles()` and a class comment to the `Barmy` class itself.

```SWIG
%javamethodmodifiers Barmy::lose_marbles() "
  /**
    * Calling this method will make you mad.
    * Use with <b>utmost</b> caution.
    */
  public";

%typemap(javaimports) Barmy "
/** The crazy class. Use as a last resort. */"

class Barmy {
public:
  void lose_marbles() {}
};
```

---

### Remove Outdated GYP Package

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command removes the `gyp` package installed via distribution package manager, which can sometimes be outdated and cause build errors with `node-gyp`. Removing it often resolves 'module' object has no attribute 'script_main' errors.

```bash
$ sudo apt-get remove gyp
```

---

### SWIG %varargs for Simple Argument Replacement

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates the basic usage of %varargs to replace a variable argument list with a single, specific argument, showing the original C function signature and its SWIG-generated equivalent.

```SWIG
%varargs(int mode = 0) open;
...
int open(const char *path, int oflags, ...);
```

```C
int open(const char *path, int oflags, int mode = 0);
```

---

### SWIG Generated Java Constants Interface

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows an example of a SWIG-generated Java interface that holds C/C++ constants as `final static` members. This includes integer, long, and `BigInteger` types, demonstrating how SWIG maps C/C++ constants to Java.

```Java
public interface exampleConstants {
  public final static int EXPRESSION = (0x100+5);
  public final static long BIG = exampleJNI.BIG_get();
  public final static java.math.BigInteger LARGE = exampleJNI.LARGE_get();
}
```

---

### Define C Function in SWIG Interface File

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates how to define a C function within a SWIG interface file (.i) for wrapping. It shows the basic syntax for declaring a module and a C function 'fact' that takes an integer argument.

```SWIG Interface
%module example
int fact(int a);
...
```

---

### SWIG Support for C++ Explicit Constructors and Conversion Operators

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Details SWIG's ability to parse the `explicit` keyword for both constructors and conversion operators in C++. It provides an example of an implicit constructor, an explicit constructor, and an explicit boolean conversion operator.

```C++
class U {
public:
  int u;
};

class V {
public:
  int v;
};

class TestClass {
public:
  //implicit converting constructor
  TestClass(U const &val) { t=val.u; }

  // explicit constructor
  explicit TestClass(V const &val) { t=val.v; }

  int t;
};

struct Testable {
  // explicit conversion operator
  explicit operator bool() const {
    return false;
  }
};
```

---

### SWIG Handling of C++ `using namespace` Declarations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

SWIG's internal type system correctly tracks type aliases introduced by `using namespace` declarations. This example shows how `Integer` is recognized as `A::Integer` and ultimately `int`.

```C++
namespace A {
  typedef int Integer;
}
using namespace A;
void foo(Integer x);
```

---

### SWIG Command-Line Debugging Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Lists various command-line options for debugging SWIG interfaces and language module development, providing insights into internal SWIG processes such as class discovery, symbol table contents, and typemap usage.

```APIDOC
-debug-classes    - Display information about the classes found in the interface
-debug-module <n> - Display module parse tree at stages 1-4, <n> is a csv list of stages
-debug-symtabs    - Display symbol tables information
-debug-symbols    - Display target language symbols in the symbol tables
-debug-csymbols   - Display C symbols in the symbol tables
-debug-lsymbols   - Display target language layer symbols
-debug-quiet      - Display less parse tree node debug info when using other -debug options
-debug-tags       - Display information about the tags found in the interface
-debug-template   - Display information for debugging templates
-debug-top <n>    - Display entire parse tree at stages 1-4, <n> is a csv list of stages
-debug-typedef    - Display information about the types and typedefs in the interface
-debug-typemap    - Display information for debugging typemaps
-debug-tmsearch   - Display typemap search debugging information
-debug-tmused     - Display typemaps used debugging information
```

---

### Define C/C++ Typedefs and Function for SWIG Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C/C++ code defines nested typedefs for an integer array and a function `foo` that accepts a multi-dimensional array. This structure serves as the base for demonstrating SWIG's typemap debugging capabilities.

```C
typedef int Integer;
typedef Integer Row4[4];
void foo(Row4 rows[10]);
```

---

### Wrapping C Constants as Scilab Getter Functions via SWIG (Default Mode)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates SWIG's default behavior for wrapping C `#define` constants, where each constant is exposed as a getter function in Scilab. Examples include various data types like integers, floats, characters, and strings.

```SWIG
%module example
#define    ICONST      42
#define    FCONST      2.1828
#define    CCONST      'x'
#define    CCONST2     '\n'
#define    SCONST      "Hello World"
#define    SCONST2     "\"Hello World\""
```

```Scilab
--> exec loader.sce;
--> ICONST_get();
 ans  =

    42.

--> FCONST_get();
 ans  =

    2.1828

--> CCONST_get();
 ans  =

    x

--> CCONST2_get();
 ans  =


--> SCONST_get();
 ans  =

    Hello World

--> SCONST2_get();
 ans  =

    "Hello World"

--> EXPR_get();
 ans  =

    48.5484

--> iconst_get();
 ans  =

    37.

--> fconst_get();
 ans  =

    3.14
```

---

### Handle C++ Namespaces in SWIG Scilab

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Explains that SWIG flattens C++ namespaces, making their contents directly accessible in the Scilab module without namespace qualification. It provides an example of a C++ namespace containing a function and a struct, and their direct usage in Scilab.

```SWIG/C++
%module example

%inline %{

namespace foo {
  int fact(int n) {
    if (n > 1)
      return n * fact(n-1);
    else
      return 1;
  }

  struct Vector {
    double x, y, z;
  };
};

%}
```

```Scilab
--> fact(3)
 ans  =

   6.

--> v = new_Vector();
--> Vector_x_set(v, 3.4);
--> Vector_y_get(v)
 ans  =

   0.
```

---

### Example of Doxygen Comment with Structural Indicators

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Doxygen

This snippet shows a typical Doxygen comment block containing structural indicators such as \param, \author, and \return. SWIG parses these individual 'blobs' of Doxygen content and passes them to the Doxygen Translator module for further processing into the target documentation language.

```Doxygen
/*! This is describing function Foo
 \param x some random variable
 \author Bob
 \return Foo
 */
```

---

### SWIG Empty Template Instantiation for Type Information

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates the use of %template() (an empty template instantiation) to inform SWIG about a template class's type information without actually wrapping the class itself. This is particularly useful when a template type is used in a function signature, ensuring SWIG correctly understands the parameter type.

```C++
template<typename T> struct Traits {
  typedef T type;
};
%}

%template() Traits<int>; // instantiate Traits<int>, but don't wrap it

void traitor(Traits<int>::type val);
```

---

### C function returning multiple values via output pointers

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

An example of a C function that communicates multiple results, including a success code and an error code, through output pointer parameters. This is a common pattern that SWIG can simplify for scripting languages.

```C
/* send message, return number of bytes sent, success code, and error_code */
int send_message(char *text, int *success, int *error_code);
```

---

### Displaying SWIG C Module Options

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Command to display additional command-line options specific to the SWIG C module.

```Shell
$ swig -c -help
```

---

### C++ Point Class Definition for SWIG Wrapping

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines a simple C++ `Point` class with x, y coordinates, constructor, destructor, and a virtual Print method. This class is used as an example to demonstrate how SWIG wraps C++ classes into Lua userdata.

```C++
%module excpp;

class Point
{
public:
 int x, y;
 Point(){x=y=0;}
 ~Point(){}
 virtual void Print(){printf("Point @%p (%d, %d)\n", this, x, y);}
};
```

---

### SWIG-generated Python proxy class with -fastproxy

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Python proxy class `Go` is generated using the `-fastproxy` SWIG option. It utilizes `_swig_new_instance_method` to establish direct C API calls to the underlying C/C++ functions, aiming to reduce call overhead. Note that this approach might not be suitable for all methods, especially when additional code is added via `%pythonprepend`.

```Python
%module example
class Go(object):
    callme0 = _swig_new_instance_method(_example.Go_callme0)
    callme4 = _swig_new_instance_method(_example.Go_callme4)
    callme8 = _swig_new_instance_method(_example.Go_callme8)
    ...
```

---

### Example Java Usage with GregorianCalendar (Before Custom Typemaps)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates the desired Java API usage where java.util.GregorianCalendar objects are used directly. This code snippet shows how the user intends to interact with the wrapped C++ API from Java, passing and receiving standard Java Date objects.

```Java
java.util.GregorianCalendar calendarIn =
  new java.util.GregorianCalendar(2011, java.util.Calendar.APRIL, 13, 0, 0, 0);
java.util.GregorianCalendar calendarOut = new java.util.GregorianCalendar();

// Note in calls below, calendarIn remains unchanged and calendarOut
// is set to a new value by the C++ call
Action.doSomething(calendarIn, calendarOut);
Action action = new Action(calendarIn, calendarOut);
```

---

### Wrap C++ Templates for Scilab with SWIG

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to wrap C++ class templates for use in Scilab using SWIG's %template directive. It shows the C++ template definition and its instantiation, followed by Scilab code to create objects, access members, and manage memory.

```SWIG/C++
%module example

template<class T1, class T2, class T3>
struct triplet {
  T1 first;
  T2 second;
  T3 third;
  triplet(const T1& a, const T2& b, const T3& c) {
    third = a; second = b; third = c;
  }
};

%template(IntTriplet) triplet<int, int, int>;
```

```Scilab
--> t = new_IntTriplet(3, 4, 1);

--> IntTriplet_first_get(t)
 ans  =

    3.

--> IntTriplet_second_get(t)
 ans  =

    4.

--> IntTriplet_third_get(t)
 ans  =

    1.

--> delete_IntTriplet(t);
```

---

### SWIG Generated C Accessors for Primitive Member Data

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates the C accessor functions automatically generated by SWIG for a simple integer member variable, showing both get and set operations for a 'List' object's 'length' member.

```C
int List_length_get(List *obj) {
  return obj->length;
}
int List_length_set(List *obj, int value) {
  obj->length = value;
  return value;
}
```

---

### SWIG Typemap for Ruby to C Integer Conversion with Type System Integration

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates an 'in' typemap for converting Ruby integers to C integers using `NUM2INT()`. This example demonstrates SWIG's ability to apply typemaps correctly across `typedef` aliases and `namespace` declarations, ensuring the typemap for `int` is applied to `Integer` and `foo::Number`.

```SWIG
%typemap(in) int {
  $1 = NUM2INT($input);
}
```

```C
typedef int Integer;
namespace foo {
  typedef Integer Number;
};

int foo(int x);
int bar(Integer y);
int spam(foo::Number a, foo::Number b);
```

---

### Define SWIG Attribute for Reference Accessors (%attributeref)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows the usage of the %attributeref macro for C++ classes or structs that provide const/non-const reference access methods for primitive or complex types. Includes an example of how the attribute is accessed in Python.

```SWIG/C++
%attributeref(A, int, b);

struct A {
  const int & b() const;
  int & b();
};

%attributeref(B, int, c);

struct B {
  int & c();
};
```

```Python
x = A()
x.b = 3        # calls A::b()
print(x.b)     # calls A::b() const
```

---

### Accessing SWIG-Wrapped C Structures in Racket

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a practical example of how to access fields of a C structure (`diag_cntrs`) that has been wrapped by SWIG and exposed to Racket/MzScheme. It demonstrates using standard Racket procedures like `format` to retrieve and display values from the wrapped C struct's fields.

```Racket
        ; suppose a function created a struct foo as
        ; (define foo (make-diag-cntrs (#x1 #x2 #x3) (make-inspector))
        ; Then you can do
        (format "0x~x" (diag-cntrs-field1 foo))
        (format "0x~x" (diag-cntrs-field2 foo))
        ;etc...
```

---

### SWIG Exception Handling with %exception Directive

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example demonstrates how to use the `%exception` directive in SWIG to convert C/C++ errors into OCaml exceptions. It shows a C `malloc` function wrapped to throw an OCaml `Failure` exception if `malloc` returns `NULL`, and the corresponding OCaml call.

```C
%exception malloc {
  $action
  if (result == NULL) {
    caml_failwith("Not enough memory");
  }
}
void *malloc(size_t nbytes);
```

```OCaml
# let a = _malloc (C_int 20000000000);;
Exception: Failure "Not enough memory".
```

---

### Tcl: Using SWIG-Wrapped Functions with Optional Arguments

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Tcl example demonstrates how to call a SWIG-wrapped function that was originally defined with default arguments in C/C++. The function can be invoked either by omitting the optional argument to use its default value or by providing an explicit value.

```Tcl
% plot -3.4 7.5    # Use default value
% plot -3.4 7.5 10 # set color to 10 instead
```

---

### Extracting MinGW/MSYS Auxiliary Packages

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Commands executed within the MSYS command prompt to extract the downloaded automake, autoconf, and bison packages into the root directory.

```Shell
cd /
tar -jxf msys-automake-1.8.2.tar.bz2
tar -jxf msys-autoconf-2.59.tar.bz2
tar -zxf bison-2.0-MSYS.tar.gz
```

---

### SWIG Interface for Tcl Static Linking

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This SWIG interface file (`example.i`) defines external C functions (`fact`, `mod`) and a variable (`My_variable`) to be exposed to Tcl. It includes `tclsh.i`, a SWIG library file essential for generating the necessary wrapper code to rebuild the Tcl interpreter with the module statically linked.

```SWIG
%module example

%inline %{
extern int fact(int);
extern int mod(int, int);
extern double My_variable;
%}

%include "tclsh.i"       // Include code for rebuilding tclsh
```

---

### C++ Class Template Partial Specialization for T const&

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ example illustrates partial template specialization for T const&. It defines a generic template X and a partial specialization for T const&, demonstrating how different types match either the generic or the specialized template.

```C++
template <typename T> struct X             { void a(); };
template <typename T> struct X< T const& > { void b(); };

X< int & >            x1;  x1.a();
X< int *const& >      x2;  x2.b();
X< int const*const& > x3;  x3.b();
X< int const& >       x4;  x4.b();
```

---

### SWIG: Renaming Format String Functions Reference

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Comprehensive reference for SWIG's extended format string functions used in %rename directives, including their purpose, return values, and examples. Functions allow case conversion, prefix/suffix stripping, and regular expression-based transformations.

```APIDOC
Function: uppercase or upper
  Returns: Upper case version of the string.
  Example (in/out): Print -> PRINT

Function: lowercase or lower
  Returns: Lower case version of the string.
  Example (in/out): Print -> print

Function: title
  Returns: String with first letter capitalized and the rest in lower case.
  Example (in/out): print -> Print

Function: firstuppercase
  Returns: String with the first letter capitalized and the rest unchanged.
  Example (in/out): printIt -> PrintIt

Function: firstlowercase
  Returns: String with the first letter in lower case and the rest unchanged.
  Example (in/out): PrintIt -> printIt

Function: camelcase or ctitle
  Returns: String with capitalized first letter and any letter following an underscore (which are removed in the process) and rest in lower case.
  Example (in/out): print_it -> PrintIt

Function: lowercamelcase or lctitle
  Returns: String with every letter following an underscore (which is removed in the process) capitalized and rest, including the first letter, in lower case.
  Example (in/out): print_it -> printIt

Function: undercase or utitle
  Returns: Lower case string with underscores inserted before every upper case letter in the original string and any number not at the end of string. Logically, this is the reverse of camelcase.
  Example (in/out): PrintIt -> print_it

Function: schemify
  Returns: String with all underscores replaced with dashes, resulting in more Lispers/Schemers-pleasing name.
  Example (in/out): print_it -> print-it

Function: strip:[prefix]
  Returns: String without the given prefix or the original string if it doesn't start with this prefix. Note that square brackets should be used literally, e.g. %rename("strip:[wx]")
  Example (in/out): wxPrint -> Print

Function: rstrip:[suffix]
  Returns: String without the given suffix or the original string if it doesn't end with this suffix. Note that square brackets should be used literally, e.g. %rename("rstrip:[Cls]")
  Example (in/out): PrintCls -> Print

Function: regex:/pattern/subst/
  Returns: String after (Perl-like) regex substitution operation. This function allows applying arbitrary regular expressions to the identifier names. The *pattern* part is a regular expression in Perl syntax (as supported by the [Perl Compatible Regular Expressions](https://www.pcre.org/)) (PCRE2 library) and the *subst* string can contain back-references of the form \\N where N is a digit from 0 to 9, or one of the following escape sequences: \\l, \\L, \\u, \\U or \\E. The back-references are replaced with the contents of the corresponding capture group while the escape sequences perform the case conversion in the substitution string: \\l and \\u convert to the lower case, while \\L and \\U do it for all the remaining characters or until \\E is encountered. Finally please notice that backslashes need to be escaped in C strings, so in practice "\\" must be used in all these escape sequences. For example, to remove any alphabetic prefix before an underscore and capitalize the remaining part you could use the following directive: %rename("regex:/(\\w+)\_(.)/\\u\\2/")
  Example (in/out): prefix_print -> Print
```

---

### Create Android Project for SWIG C++ Integration

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Android

This shell command initializes a new Android project named 'SwigClass' in a specified path, configuring the main activity and package name. It then navigates into the newly created project directory, preparing it for JNI C++ development.

```Shell
$ android create project --target 1 --name SwigClass --path ./class --activity SwigClass --package org.swig.classexample
$ cd class
```

---

### Use SWIG-Wrapped C/C++ File Pointers in Octave

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the SWIG-wrapped C file I/O functions (fopen, fputs, fclose) from Octave. It opens a file, writes 'Hello world', and then closes the file.

```Octave
octave:1> swigexample;
octave:2> f=swigexample.fopen("w", "junk");
octave:3> swigexample.fputs("Hello world", f);
octave:4> swigexample.fclose(f);

```

---

### Define SWIG Typemap for Single Pointer Input

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Illustrates a basic SWIG typemap definition for a single input type `int *INPUT`. This example shows how the `$1` special variable refers to the first (and only) type in the typemap pattern.

```SWIG
%typemap(in) int *INPUT {

}
```

---

### SWIG Generated Accessors for C Struct Member

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Demonstrates the low-level C accessor functions automatically generated by SWIG for a 'length' member of a 'List' structure. These functions allow getting and setting the value of the member.

```C
int List_length_get(List *obj) {
  return obj->length;
}
int List_length_set(List *obj, int value) {
  obj->length = value;
  return value;
}
```

---

### SWIG: Clearing All Typemaps for a Type with %clear

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates the use of the %clear directive to remove all defined typemaps for a given type, including examples for single and multiple types. A note warns about making fundamental types unusable if not immediately redefined.

```SWIG
%clear int; // Removes all types for int
%clear int *output, long *output;
```

---

### SWIG Warning 401: Unknown Base Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of SWIG Warning 401, indicating that a base class's module name is unknown. This typically occurs when `%import` is used without specifying the module name or importing the correct interface file.

```SWIG
derived_module.i:8: Warning 401: Base class 'base' ignored - unknown module name for base. Either
import
the appropriate module interface file or specify the name of the module in the %import directive.
```

---

### SWIG Directives for Immutable/Mutable Class Members

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to use SWIG's `%immutable` and `%mutable` directives within a C++ class definition to control the mutability of member variables. In this example, the 'length' member is explicitly made read-only.

```C++
class List {
public:
...
%immutable;
  int length;
%mutable;
...
};
```

---

### C++ Overloaded Functions Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ code snippet defines three overloaded functions named `foo`. They demonstrate function overloading based on different parameter types and counts, a common feature in C++ that SWIG supports for various target languages.

```C++
int foo(int x);
int foo(double x);
int foo(char *s, int y);
```

---

### Python Example: Using Multi-Argument Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates calling a C function (`count`) from Python where a multi-argument typemap handles the conversion of a single Python string into two C arguments (`char *str`, `int len`), omitting the explicit length parameter in Python.

```Python
>>> example.count('e', 'Hello World')
1
>>>
```

---

### SWIG Handling of Duplicate Template Instantiations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

This example illustrates SWIG's mechanism for preventing duplicate template instantiations. It shows that if a template has already been instantiated, even with an explicit default parameter, subsequent identical instantiations will be ignored to reduce code bloat.

```SWIG
%template(vec) vector<double>;            // OK
%template(vec100) vector<double, 100>;    // Ignored
```

---

### Incorrect SWIG Template Instantiation with Typedef

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This example illustrates an incorrect attempt to use a typedef (`ListOfInt`) as the template argument for the `%template` directive. SWIG requires the actual template (`List<int>`) for instantiation, not a typedef to it. The second `%template` line will result in a syntax error.

```SWIG
typedef List<int> ListOfInt;

%template(intList) List<int>; // ok
%template(intList) ListOfInt; // illegal - Syntax error
```

---

### Use Wrapped C FILE\* Functions in Scilab

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Scilab code demonstrates how to use the C `FILE*` functions wrapped by SWIG. It shows initializing the module, opening a file, writing to it, checking the pointer type (`_p_FILE`), and closing the file.

```Scilab
--> example_Init();

--> f = fopen("junk", "w");
--> typeof(f)
 ans  =

  _p_FILE

--> fputs("Hello World", f);
--> fclose(f);
```

---

### SWIG Python Buffer Interface for Mutable Strings (get_path example)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how to use the %pybuffer_mutable_string typemap macro from pybuffer.i to allow a C function expecting a char\* to accept a Python bytearray. This enables handling mutable string buffers from Python.

```C
void get_path(char *s);
```

```SWIG
%include <pybuffer.i>
%pybuffer_mutable_string(char *str);
void get_path(char *str);
```

```Python
>>> p = bytearray(10)
>>> get_path(p)
>>> print(p)
bytearray(b'/Foo/Bar/\x00')
```

---

### Define C Structures with Nested Structure Members

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C code defines two structures: `Foo` with an integer member `a`, and `Bar` which contains an instance of `Foo` as its member `f`. This setup demonstrates how SWIG handles structures nested within other structures.

```C
struct Foo {
  int a;
};

struct Bar {
  Foo f;
};
```

---

### SWIG Unification of C++ Parameter Passing and Return Types

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Illustrates how SWIG simplifies C++'s distinct parameter passing mechanisms (pointer, reference, value, array) and return types into a unified 'object' concept for wrapped languages like Lua. It also explains memory management for returned values.

```C++
void spam1(Foo *x);      // Pass by pointer
void spam2(Foo &x);      // Pass by reference
void spam3(Foo x);       // Pass by value
void spam4(Foo x[]);     // Array of objects
```

```Lua
f = Foo()           -- Create a Foo
spam1(f)            -- Ok. Pointer
spam2(f)            -- Ok. Reference
spam3(f)            -- Ok. Value.
spam4(f)            -- Ok. Array (1 element)
```

```C++
Foo *spam5();
Foo &spam6();
Foo  spam7();
```

---

### SWIG Template Argument Deduction for Partial Specialization

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Provides examples of template argument deduction for partial specialization in SWIG, demonstrating that SWIG's behavior for matching these instantiations (`Foo<int *, int *>`, `Foo<int *, const int *>`, `Foo<int *, int **>`) aligns with a standard C++ compiler.

```C++
Foo<int *, int *>        // partial specialization matching (3)
Foo<int *, const int *>  // partial specialization matching (3)
Foo<int *, int **>       // partial specialization matching (3)
```

---

### C Function Returning Multiple Values (Error Code)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Example of a C function designed to return a primary result and an additional status or error code via a pointer parameter, a common use case for multiple return values.

```C
/* send message, return number of bytes sent, along with success code */
int send_message(char *text, int *success);
```

---

### Compile SWIG-generated C++ and Java Wrappers with Sun C++ Compiler on Solaris

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet illustrates how to compile and link SWIG-generated C++ and Java wrapper files into a shared library (.so) using the Sun C++ compiler (CC) on Solaris. It highlights the inclusion of specific JDK include paths and the -lCrun library often required for Sun C++ applications.

```Shell
% swig -c++ -java example.i
% CC -c example.cxx
% CC -c example_wrap.cxx -I/usr/java/include -I/usr/java/include/solaris
% CC -G example.o example_wrap.o -L/opt/SUNWspro/lib -o libexample.so -lCrun
```

---

### SWIG Transformation of C++ Reference Parameters

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGPlus

Illustrates how SWIG transforms C++ methods taking references into low-level accessors that use pointers. This example shows a C++ class method `Foo::bar` taking a `double&` and its corresponding SWIG-generated C-style wrapper.

```C++
class Foo {
public:
  double bar(double &a);
}
```

```C++
double Foo_bar(Foo *obj, double *a) {
  obj->bar(*a);
}
```

---

### C++ Function Signature for Return Value Handling Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This C++ function signature is used to exemplify typemaps related to return value processing in SWIG, such as function return value conversion and resource management for returned objects.

```C++
int foo(int x, double y, char *s);
```

---

### Perl: Using a SWIG-generated module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates how to successfully load and use a SWIG-generated Perl module, showing a simple function call and its expected output.

```Perl
use example;
print example::fact(4), "\n";
```

---

### C/C++ Function Returning Newly Allocated Object

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

A C/C++ function signature example used to explain that typemaps cannot define properties for entire declarations, such as indicating a newly allocated object for memory management, which requires SWIG's '%feature' mechanism.

```C++
Foo *make_Foo(int n);
```

---

### SWIG Parsing of C++ User-Defined Literal Declarations

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Presents examples of C++ user-defined literal declarations, including raw, numeric (integral and float), and cooked string literals, demonstrating how SWIG parses the `operator "" _suffix()` function syntax.

```C++
OutputType operator "" _myRawLiteral(const char * value);

OutputType operator "" _mySuffixIntegral(unsigned long long);
OutputType operator "" _mySuffixFloat(long double);

OutputType operator "" _mySuffix(const char * string_values, size_t num_chars);
OutputType operator "" _mySuffix(const wchar_t * string_values, size_t num_chars);
OutputType operator "" _mySuffix(const char16_t * string_values, size_t num_chars);
OutputType operator "" _mySuffix(const char32_t * string_values, size_t num_chars);
```

---

### Expand SWIG Member Templates in Class Templates

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides a complex example of expanding a member template (`bar`) that resides within a class template (`Foo`). It shows how to use %extend to expand the member template and then %template to instantiate the outer class template, resulting in specialized member functions for each `Foo` instantiation.

```swig
// A template
template<class T> class Foo {
public:
  // A member template
  template<class S> T bar(S x, S y) { ... };
  ...
};

// Expand a few member templates
%extend Foo {
  %template(bari) bar<int>;
  %template(bard) bar<double>;
}

// Create some wrappers for the template
%template(Fooi) Foo<int>;
%template(Food) Foo<double>;
```

---

### Define C++ CDate and Action Classes for SWIG Director Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Defines the C++ `CDate` class with setter methods for year, month, and day, and the `Action` struct with a virtual `someCallback` method that takes a `CDate` reference. These classes are used to demonstrate SWIG director functionality and custom marshalling.

```C++
class CDate {
  ...
  void setYear(int);
  void setMonth(int);
  void setDay(int);
};
struct Action {
  virtual void someCallback(CDate &date);
  virtual ~Action();
  ...
};
```

---

### SWIG Typemap for Integer Input with Block Scope

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

Defines an 'in' typemap for 'int' where the code is inserted into the wrapper function within a new block scope, allowing temporary variable declarations. The example uses 'PyInt_AsLong' for conversion.

```SWIG
%typemap(in) int {
  $1 = PyInt_AsLong($input);
}
```

---

### Ruby Usage of SWIG Multi-Argument Typemap and Output

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how a C function with multiple arguments (`char *str, int len`) can be called from Ruby using a multi-argument typemap. The example shows that the length parameter can be implicitly handled by the typemap, simplifying the Ruby call, and includes the resulting output.

```Ruby
puts Example.count('o', 'Hello World')
```

```Text
2
```

---

### C# ArgumentOutOfRangeException Console Output

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CSharp

This snippet shows the console output when the C# example code attempts to call 'positivesonly' with an invalid (negative) argument. It confirms that the System.ArgumentOutOfRangeException is successfully thrown and caught by the C# runtime.

```Console Output
Unhandled Exception: System.ArgumentOutOfRangeException: only positive numbers accepted
Parameter name: number
in <0x00034> example:positivesonly (int)
in <0x0000c> runme:Main ()
```

---

### SWIG Typemap Search with Parameterized Typedef Reductions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This example demonstrates the search patterns for types involving typedefs of C++ templates. SWIG systematically reduces both the typedef alias and the template parameters to their base types, expanding the search space.

```C++
typedef int Integer;
typedef foo<Integer, Integer> fooii;
void blah(fooii *x);
```

```Conceptual
fooii *x
fooii *

# Reduce fooii --> foo<Integer, Integer>
foo<Integer, Integer> *x
foo<Integer, Integer> *

# Reduce Integer -> int
foo<int, Integer> *x
foo<int, Integer> *
```

---

### Python Usage Example with Fixed-Size Array Typemap

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Python code demonstrates how to call the `set_vector` function after applying the SWIG 'in' typemap for fixed-size arrays. It shows passing a Python list directly, which is then converted to a C `float` array by the typemap.

```Python
set_vector(type, [ 1, 2.5, 5, 20 ])
```

---

### Java Example: Using Renamed Move Assignment Operator

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/CPlusPlus11

Illustrates the usage of a renamed move assignment operator (`MoveAssign`) in Java. Similar to the move constructor, attempting to use the `mc` proxy instance after it has been moved will result in a failure, as ownership has been transferred.

```Java
MyClass mc = new MyClass();
MyClass mc2 = mc.MoveAssign(mc);
MyClass mc3 = mc.MoveAssign(mc); // Use of mc again will fail
```

---

### Declare Factorial Function Header

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C header file (`example.h`) declares the `fact` function, providing its signature for use in other C files and for SWIG to generate wrappers.

```C
/* File: example.h */

int fact(int n);
```

---

### Define SWIG Attribute for Class/Struct Types by Value (%attributeval)

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Introduces the %attributeval macro, which is similar to %attribute but specifically designed for non-primitive class/struct types where the get and set methods return or pass values by copy, rather than by reference.

```SWIG/C++
%attributeval(MyClassVal, MyFoo, ReadWriteFoo, GetFoo, SetFoo);
%attributeval(MyClassVal, MyFoo, ReadOnlyFoo, GetFoo);
%inline %{
  class MyClassVal {
    MyFoo foo;
  public:
    MyFoo GetFoo() { return foo; }
    void SetFoo(MyFoo other) { foo = other; }
  };
%}
```

---

### C++ Overloaded Functions Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Typemaps

This C++ code snippet illustrates a set of overloaded functions named `foo`, demonstrating different parameter types and counts. SWIG supports such overloading, allowing target languages to access these functions based on the arguments provided.

```C++
int foo(int x);
int foo(double x);
int foo(char *s, int y);
```

---

### Import and Use SWIG Wrapped C Function in Python

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Python code demonstrates how to import a SWIG-generated module and call a wrapped C function in an interactive session. It shows the typical interaction with a C function 'fact' exposed through the 'example' Python module, returning the factorial of 4.

```Python
>>> import example
>>> print(example.fact(4))
24
>>>
```

---

### SWIG Inline Helper Functions for Pointer Casting and Manipulation

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Provides examples of defining inline C/C++ helper functions within a SWIG interface to perform safe pointer casting (both C-style and C++ `dynamic_cast`) and arithmetic operations, which are not directly possible from Tcl.

```SWIG/C++
%inline %{
/* C-style cast */
Bar *FooToBar(Foo *f) {
  return (Bar *) f;
}

/* C++-style cast */
Foo *BarToFoo(Bar *b) {
  return dynamic_cast<Foo*>(b);
}

Foo *IncrFoo(Foo *f, int i) {
  return f+i;
}
%}
```

---

### C++: Const-Correctness Violation Example

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ code demonstrates a common const-correctness violation where a `const Object*` returned by `foo()` is passed to `bar(Object*)`, which discards the const qualifier. This would result in a compile-time error in C++.

```C++
const Object * foo();
void bar(Object *);

...
// C++ code
void blah() {
  bar(foo());         // Error: bar discards const
};
```

---

### SWIG Wrapper for C Pointer-Pointer Functions

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows how to wrap C functions that use pointer-to-pointer arguments for object creation. It utilizes `%include <typemaps.i>` and `%apply SWIGTYPE** OUTPUT` to correctly handle the output pointer and enable automatic garbage collection in the target scripting language.

```SWIG
%include <typemaps.i>
%apply SWIGTYPE** OUTPUT{iMath **pptr }; // tell SWIG it's an output

struct iMath;    // some structure
int Create_Math(iMath** pptr); // its creator (assume it mallocs)
```

---

### Generate C++ Python Wrapper with Custom Output Name

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

This command demonstrates how to use SWIG to generate a C++ wrapper file for Python. The `-c++` option specifies C++ output, `-python` targets Python, and `-o` renames the output C++ wrapper file to `example_wrap.cpp` instead of the default `example_wrap.cxx`.

```bash
$ swig -c++ -python -o example_wrap.cpp example.i
```

---

### SWIG: Parse Tree Node Structure for Destructor

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIG

Example output of SWIG's internal parse tree for a destructor node, showing attributes like access, declaration, name, and storage. This structure is crucial for understanding and applying advanced matching rules based on internal node properties.

```APIDOC
            +++ destructor ----------------------------------------
            | access       - "public"
            | decl         - "f()."
            | ismember     - "1"
            | name         - "~Shape"
            | storage      - "virtual"
            | sym:name     - "~Shape"
```

---

### Define C++ Base Class with Virtual Method and Caller

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This C++ header file defines a 'Base' class with a virtual 'UIntMethod' and a 'Caller' class designed to interact with 'Base' objects. This setup is used to demonstrate SWIG's director feature for cross-language polymorphism.

```C++
// file: example.h
class Base {
public:
  virtual ~Base() {}

  virtual unsigned int UIntMethod(unsigned int x) {
    std::cout << "Base - UIntMethod(" << x << ")" << std::endl;
    return x;
  }
  virtual void BaseBoolMethod(const Base &b, bool flag) {}
};

class Caller {
public:
  Caller(): m_base(0) {}
  ~Caller() { delBase(); }
  void set(Base *b) { delBase(); m_base = b; }
  void reset() { m_base = 0; }
  unsigned int UIntMethodCall(unsigned int x) { return m_base->UIntMethod(x); }

private:
  Base *m_base;
  void delBase() { delete m_base; m_base = 0; }
};
```

---

### SWIG %newobject Directive Scope Examples

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Shows different ways to apply the `%newobject` directive to specific declarations: globally, to a specific method with a signature within a class, and to methods named 'copy' across all classes. This highlights the directive's flexibility in targeting specific functions or methods.

```SWIG
%newobject ::blah();                   // Only applies to global blah
%newobject Object::blah(int, double);  // Only blah(int, double) in Object
%newobject *::copy;                    // Copy method in all classes
...
```

---

### Compile SWIG-generated C++ and C files into Octave Module

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This snippet demonstrates the command-line steps to compile a SWIG-generated C++ wrapper file and a C implementation file into an Octave dynamic module (.oct file) using `swig` and `mkoctfile`.

```Shell
$ swig -octave -c++ -o example_wrap.cpp example.i
$ mkoctfile example_wrap.cpp example.c
```

---

### Running SWIG for C++ Code with Octave

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This command shows how to run SWIG to generate a wrapper for C++ code for Octave. In addition to `-octave`, the `-c++` option is required to indicate C++ source code, and `-o` sets the output wrapper file name.

```Shell
$ swig -octave -c++ -o example_wrap.cpp example.i
```

---

### Define Ruby Class with Each Method

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

This Ruby class `Set` demonstrates a basic implementation with an `initialize` method and an `each` method. This pattern is common for classes that can be mixed in with Ruby's `Enumerable` module.

```Ruby
class Set
  def initialize
  @members = []
  end

  def each
  @members.each { |m| yield m }
  end
end
```

---

### SWIG Typemap for Smart Pointers with 'equivalent' Attribute

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to manually specify an equivalent underlying type (X \*) for a custom smart pointer (MySmartPtr<X>) using the 'equivalent' attribute in a typecheck typemap, allowing SWIG to correctly handle its overloading. Includes an example of C++ functions that would be affected.

```SWIG
%typemap(typecheck, precedence=SWIG_TYPECHECK_POINTER, equivalent="X *") MySmartPtr<X> " ... "
```

```C++
void m(X &r);            // equivalent: void m(X *r);
void m(MySmartPtr<X> s); // equivalent: void m(X *s);
```

---

### Define SWIG Attribute for Primitive Types with Get/Set Methods

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/SWIGDocumentation

Demonstrates how to use the %attribute macro to expose C++ get/set methods for primitive types as a native attribute in target languages. The example shows the SWIG interface file definition and subsequent usage in Python.

```SWIG/C++
%include "attribute.i"
%attribute(A, int, a, get_a, set_a);

struct A {
  int get_a() const;
  void set_a(int aa);
};
```

```Python
x = A()
x.a = 3        # calls A::set_a(3)
print(x.a)     # calls A::get_a() const
```

---

### C Function Demonstrating Exception Throwing

Source: https://www.swig.org/Doc4.4/SWIGDocumentation.html/Customization

An example C function `inv` that performs division. It includes error checking for division by zero and calls `throw_exception` to signal an error, returning 0 in case of an invalid operation. This demonstrates how the custom C exception utilities are used.

```C
double inv(double x) {
  if (x != 0)
    return 1.0/x;
  else {
    throw_exception("Division by zero");
    return 0;
  }
}
```
