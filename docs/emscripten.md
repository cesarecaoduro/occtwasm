### Installing SDK Toolchains

Source: https://emscripten.org/docs/tools_reference/emsdk

Demonstrates how to install specific SDK toolchains using the emsdk. The first example shows installing a pre-defined SDK release, while the second illustrates installing individual components that constitute a full SDK, such as Git, Clang, Node.js, Python, and LLVM.

```shell
./emsdk install sdk-upstream-main-64bit
```

```shell
./emsdk install git-1.8.3 clang-upstream-main-64bit node-0.10.17-64bit python-2.7.5.3-64bit java-7.45-64bit llvm-git-main-64bit emscripten-main-64bit
```

---

### Install and Activate Emscripten SDK Tools

Source: https://emscripten.org/docs/getting_started/downloads

Commands to fetch the latest SDK tools, install them, activate a specific version, and set up environment variables for the current terminal session. These commands assume you are in the 'emsdk' directory.

```bash
# Fetch the latest version of the emsdk (not needed the first time you clone)
git pull

# Download and install the latest SDK tools.
./emsdk install latest

# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
./emsdk activate latest

# Activate PATH and other environment variables in the current terminal
source ./emsdk_env.sh
```

---

### Install Specific Emscripten SDK Version

Source: https://emscripten.org/docs/tools_reference/emsdk

This example demonstrates how to install and activate a specific version of the Emscripten SDK. It shows how to install a standard release version and an 'asserts' version, which includes more runtime checks.

```bash
# Install and activate a specific version.
./emsdk install 4.0.7
./emsdk activate 4.0.7

# Install and activate an 'asserts' version.
./emsdk install 4.0.7-asserts
./emsdk activate 4.0.7-asserts
```

---

### Clone Emscripten SDK Repository

Source: https://emscripten.org/docs/getting_started/downloads

Initial step to obtain the Emscripten SDK driver script from GitHub. Requires Git to be installed.

```bash
# Get the emsdk repo
git clone https://github.com/emscripten-core/emsdk.git

# Enter that directory
cd emsdk
```

---

### Install and Activate Tip-Of-Tree (TOT) Emscripten SDK

Source: https://emscripten.org/docs/tools_reference/emsdk

This demonstrates how to install and activate the 'tot' version, which represents the latest changes in Emscripten and LLVM. It also shows how to install and activate 'sdk-main-64bit' by building from the very latest sources.

```bash
# Install and activate the latest tip-of-tree version.
./emsdk install tot
./emsdk activate tot

# Install git if not present.
./emsdk install git-1.8.3

# Install and activate the main branch SDK.
./emsdk install sdk-main-64bit
./emsdk activate sdk-main-64bit
```

---

### Emscripten SDK Installation on Windows (Batch)

Source: https://emscripten.org/docs/getting_started/downloads

Equivalent commands for Windows users, utilizing batch scripts instead of shell scripts. This includes installing and activating SDK tools and setting environment variables.

```batch
emsdk install latest
emsdk activate latest
emsdk_env.bat
```

---

### Install Tip-of-Tree Emscripten Build

Source: https://emscripten.org/docs/getting_started/downloads

Installs the latest code from the repository that has passed integration tests. This build is updated frequently but may be less stable than tagged releases. Requires specifying the backend.

```bash
# Get a tip-of-tree
./emsdk install tot
```

---

### Example of Module JS API Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference

Demonstrates how to configure the INCOMING_MODULE_JS_API setting to specify which JavaScript values provided on the Module object at runtime should be recognized by the compiler for optimization. This example includes 'print' and 'preRun'.

```javascript
var Module = {
  print: (x) => console.log("print: " + x),
  preRun: [() => console.log("pre run")],
};

// In Emscripten configuration:
// INCOMING_MODULE_JS_API = ['print', 'preRun']
```

---

### Install a Specific Emscripten SDK Version

Source: https://emscripten.org/docs/getting_started/downloads

Installs a particular tagged release of the Emscripten SDK. Replace '1.38.45' with the desired version number.

```bash
./emsdk install 1.38.45
```

---

### Quick Emscripten Toolchain Profiling Example

Source: https://emscripten.org/docs/optimizing/Profiling-Toolchain

This example demonstrates the basic steps to enable and run the Emscripten toolchain profiler. It involves setting an environment variable, compiling a C file, and then running the profiler script to generate a results file.

```bash
cd path/to/emscripten
export EMPROFILE=1
emcc test/hello_world.c -O3 -o a.html
emprofile

```

```batch
cd path/to/emscripten
set EMPROFILE=1
emcc test/hello_world.c -O3 -o a.html
emprofile

```

---

### Initialize Web Audio Context and Start Wasm Audio Worklet Thread (C/C++)

Source: https://emscripten.org/docs/api_reference/wasm_audio_worklets

This snippet initializes a Web Audio context using `emscripten_create_audio_context` and then starts a Wasm Audio Worklet thread asynchronously. It requires the `<emscripten/webaudio.h>` header. The `audioThreadStack` array is used for the thread's stack.

```c++
#include <emscripten/webaudio.h>

uint8_t audioThreadStack[4096];

int main()
{
  EMSCRIPTEN_WEBAUDIO_T context = emscripten_create_audio_context(0);

  emscripten_start_wasm_audio_worklet_thread_async(context, audioThreadStack, sizeof(audioThreadStack),
                                                   &AudioThreadInitialized, 0);
}
```

---

### Complete .gitlab-ci.yml for Emscripten Deployment (YAML)

Source: https://emscripten.org/docs/compiling/GitLab

This is a complete example of a .gitlab-ci.yml file configured for building and deploying an Emscripten project on GitLab Pages. It specifies the Docker image, installs dependencies in 'before_script', runs the build in 'script', and defines artifacts and deployment conditions.

```yaml
image: alpine:3.9

before_script:
  - apk add emscripten make --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

pages:
  script:
    - make
  artifacts:
    paths:
      - public
  only:
    - main
```

---

### Verify Emscripten Installation

Source: https://emscripten.org/docs/getting_started/Tutorial

This command verifies the Emscripten installation by invoking the compiler frontend with the verbose flag. It helps ensure that Emscripten is set up correctly and all necessary tools are accessible. No specific inputs are required, and the output indicates the compiler version and configuration.

```shell
./emcc -v

```

---

### Set Binaryen Root Path in .emscripten

Source: https://emscripten.org/docs/building_from_source/configuring_emscripten_settings

Example of how to specify the Binaryen installation directory within the .emscripten configuration file. Ensure the path points to your Binaryen installation, using forward slashes.

```python
BINARYEN_ROOT = 'C:\\tools\\binaryen\\'

```

---

### Install Emscripten SDK Tool or SDK Version

Source: https://emscripten.org/docs/tools_reference/emsdk

This snippet shows the command to download and install a new tool or SDK version from the Emscripten registry. An installed tool is available locally but may not be the active environment.

```bash
# Install a specific tool or SDK version.
./emsdk install <tool/sdk name>

# Example: Install a specific SDK version.
./emsdk install sdk-1.38.21-64bit
```

---

### Install Latest Emscripten SDK Release

Source: https://emscripten.org/docs/tools_reference/emsdk

This snippet shows how to fetch the latest available SDK tools, download and install the most recent SDK release, and then activate it for use. It involves three sequential commands to ensure the latest version is ready.

```bash
# Fetch the latest registry of available tools.
./emsdk update

# Download and install the latest SDK tools.
./emsdk install latest

# Set up the compiler configuration to point to the "latest" SDK.
./emsdk activate latest
```

---

### Emscripten File System API Overview

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Provides an overview of the Emscripten File System API, its inspiration from POSIX, synchronous nature, and default file system setup.

```APIDOC
## File System API

### Description
File operations in Emscripten are provided by the FS library. It is used internally for all of Emscripten’s **libc** and **libcxx** file I/O. The API is inspired by the Linux/POSIX File System API, with each presenting a very similar interface.

The underlying behaviour is also similar, except where differences between the native and browser environments make this unreasonable. For example, user and group permissions are defined but ignored in `FS.open()`.

Emscripten predominantly compiles code that uses synchronous file I/O, so the majority of the `FS` member functions offer a synchronous interface (with errors being reported by raising exceptions of type FS.ErrnoError).

File data in Emscripten is partitioned by mounted file systems. Several file systems are provided. An instance of MEMFS is mounted to `/` by default. The subdirectories /home/web_user and /tmp are also created automatically, in addition to several other special devices and streams (e.g. /dev/null, /dev/random, /dev/stdin, /proc/self/fd); see FS.staticInit() in the FS library for full details. Instances of NODEFS and IDBFS can be mounted to other directories if your application needs to persist data.

### Key Concepts
- **POSIX-like Interface**: Emulates Linux/POSIX file system operations.
- **Synchronous Operations**: Most functions operate synchronously, raising `FS.ErrnoError` on failure.
- **Mounted File Systems**: Emscripten uses mounted file systems to partition data. MEMFS is mounted at `/` by default. NODEFS and IDBFS can be mounted for persistence.
- **Default Setup**: Includes MEMFS mounted at `/`, with subdirectories like `/home/web_user` and `/tmp`, and special devices like `/dev/null`.

### Resources
- **Examples**: The `test/test_core.py` (search for `test_files`) and the tutorial provide usage examples.
- **File System Overview**: For a high-level understanding, refer to the File System Overview documentation.
```

---

### Install and Activate Emscripten SDK Binaries (emsdk)

Source: https://emscripten.org/docs/contributing/developers_guide

This command-line snippet installs the latest development binaries for Emscripten using the emsdk tool. It's a prerequisite for running Emscripten with a git checkout of the repository, especially when contributing to core Python or JavaScript components.

```bash
emsdk install tot
emsdk activate tot
```

---

### SDL Example for HTML Output

Source: https://emscripten.org/docs/getting_started/Tutorial

An example C code using the SDL library to draw a colored cube within an HTML canvas element when compiled with Emscripten. It includes Emscripten-specific directives and demonstrates SDL initialization, surface manipulation, and display.

```c
// Copyright 2011 The Emscripten Authors.  All rights reserved.
// Emscripten is available under two separate licenses, the MIT license and the
// University of Illinois/NCSA Open Source License.  Both these licenses can be
// found in the LICENSE file.

#include <stdio.h>
#include <SDL/SDL.h>

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

int main(int argc, char** argv) {
  printf("hello, world!\n");

  SDL_Init(SDL_INIT_VIDEO);
  SDL_Surface *screen = SDL_SetVideoMode(256, 256, 32, SDL_SWSURFACE);

#ifdef TEST_SDL_LOCK_OPTS
  EM_ASM("SDL.defaults.copyOnLock = false; SDL.defaults.discardOnLock = true; SDL.defaults.opaqueFrontBuffer = false;");
#endif

  if (SDL_MUSTLOCK(screen)) SDL_LockSurface(screen);
  for (int i = 0; i < 256; i++) {
    for (int j = 0; j < 256; j++) {
#ifdef TEST_SDL_LOCK_OPTS
      // Alpha behaves like in the browser, so write proper opaque pixels.
      int alpha = 255;
#else
      // To emulate native behavior with blitting to screen, alpha component is ignored. Test that it is so by outputting
      // data (and testing that it does get discarded)
      int alpha = (i+j) % 255;
#endif
      *((Uint32*)screen->pixels + i * 256 + j) = SDL_MapRGBA(screen->format, i, j, 255-i, alpha);
    }
  }
  if (SDL_MUSTLOCK(screen)) SDL_UnlockSurface(screen);
  SDL_Flip(screen);

  printf("you should see a smoothly-colored square - no sharp lines but the square borders!\n");
  printf("and here is some text that should be HTML-friendly: amp: |&| double-quote: |\"| quote: |'| less-than, greater-than, html-like tags: |<cheez></cheez>|\nanother line.\n");

  SDL_Quit();

  return 0;
}

```

---

### Install and Activate Old Emscripten SDK Versions

Source: https://emscripten.org/docs/tools_reference/emsdk

This snippet shows how to access and install older versions of the Emscripten SDK. It involves listing available old versions, installing a specific one, and then activating it for use.

```bash
# Get a list of old versions.
./emsdk list --old

# Install the required old version.
./emsdk install <name_of_tool>

# Activate the required old version.
./emsdk activate <name_of_tool>
```

---

### Install Emscripten Build with Hash

Source: https://emscripten.org/docs/contributing/developers_guide

This command installs a specific build of Emscripten identified by a hash. This is useful for bisection as it allows installing arbitrary historical builds without local compilation. It requires a successful build to exist for the given hash.

```bash
emsdk install [HASH]
```

---

### Install Emscripten and Make in GitLab CI/CD (Shell)

Source: https://emscripten.org/docs/compiling/GitLab

This snippet shows how to install the Emscripten SDK and the 'make' utility within a GitLab CI/CD environment using an Alpine Linux image. It fetches the packages from the Alpine Linux testing repository. This is a prerequisite for building Emscripten projects in GitLab CI/CD.

```shell
before_script:
  - apk add emscripten make --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
```

---

### List Installed Emscripten SDK Versions

Source: https://emscripten.org/docs/tools_reference/emsdk

This command retrieves a list of all currently installed Emscripten SDK versions and tools, as well as all available versions. It indicates which tools are installed and which is currently active with an asterisk.

```bash
# List all installed and available SDK versions and tools.
./emsdk list
```

---

### Check for Emscripten SDK Updates

Source: https://emscripten.org/docs/tools_reference/emsdk

This process involves first fetching the latest package information for all new tools and SDK versions, and then using the install command to download and install any desired new versions.

```bash
# Fetch the latest registry of available tools.
./emsdk update

# Download and install the specified new version.
./emsdk install <tool/sdk name>
```

---

### Applying JavaScript/WebAssembly Optimizations

Source: https://emscripten.org/docs/compiling/Building-Projects

Demonstrates how to apply JavaScript/WebAssembly-specific optimizations during the final linking step, using `-O1` as an example. This step converts compiled object files into the final executable format.

```bash
# Compile the object file to JavaScript with -O1 optimizations.
emcc -O1 project.o -o project.js
```

---

### Run with Emscripten's emrun Tool

Source: https://emscripten.org/docs/getting_started/FAQ

The 'emrun' tool can be used to serve your HTML file locally, automatically starting a Python web server for testing. This simplifies the process of testing Emscripten applications.

```bash
emrun your_file.html
```

---

### Building Projects with CMake and Emscripten

Source: https://emscripten.org/docs/compiling/Building-Projects

This example shows how to adapt the Emscripten build process for projects that use CMake. Instead of './configure', 'cmake .' is used with 'emconfigure'. The 'emmake make' command remains the same, followed by 'emcc' to finalize the JavaScript and WebAssembly output.

```bash
# Run emconfigure with the normal cmake command as an argument.
emconfigure cmake .

# Run emmake with the normal make to generate Wasm object files.
emmake make

# Compile the linked code generated by make to JavaScript + WebAssembly.
emcc [-Ox] project.o -o project.js
```

---

### emscripten_dlopen

Source: https://emscripten.org/docs/api_reference/emscripten.h

Starts an asynchronous dlopen operation to load a shared library. It returns immediately, and callbacks are used to signal success or failure.

````APIDOC
## emscripten_dlopen

### Description
Starts an asynchronous dlopen operation to load a shared library from a filename or URL. Returns immediately and requires the caller to return to the event loop. The `onsuccess` and `onerror` callbacks are used to signal success or failure of the request. Upon `onerror` callback the normal `dlerror` C function can be used get the error details. The flags are the same as those used in the normal `dlopen` C function.

### Method
Asynchronous Operation

### Endpoint
N/A (C function)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```c
void my_success_callback(void* arg, const char* filename) {
    // Handle success
}

void my_error_callback(void* arg) {
    // Handle error
}

// Example usage:
emscripten_dlopen("my_library.wasm", 1, NULL, my_success_callback, my_error_callback);
````

### Response

#### Success Response (Callback)

- **arg** (void\*) - User defined data passed to the callback.
- **filename** (const char\*) - A 'fake' filename usable with `IMG_Load`.

#### Response Example

Callback signature:
`void callback(void* arg, const char* filename);`

#### Error Response (Callback)

- **arg** (void\*) - User defined data passed to the callback.

#### Response Example

Callback signature:
`void callback(void* arg);`

````

--------------------------------

### Pre-Run and Initialization Hooks

Source: https://emscripten.org/docs/api_reference/module

Define functions to execute before the main Emscripten program runs. Includes setup tasks like file system initialization.

```APIDOC
## Module.preRun

### Description
An array of functions to be called right before `run()` is invoked, after the environment is set up. Useful for file system setup or other pre-execution tasks.

### Method
Configuration

### Endpoint
N/A (Module configuration property)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
Module.preRun = [
  () => {
    // Setup file system or other initial tasks
    FS.mkdir('/data');
  }
];
````

### Response

N/A

## Module.preInit

### Description

Allows code to affect global initializers. Functions provided here are run before `preRun` and environment setup.

### Method

Configuration

### Endpoint

N/A (Module configuration property)

### Parameters

#### Path Parameters

N/A

#### Query Parameters

N/A

#### Request Body

N/A

### Request Example

```javascript
Module.preInit = [
  () => {
    // Modify global initializers if needed
  },
];
```

### Response

N/A

````

--------------------------------

### Example WebGL Call Stream Optimization

Source: https://emscripten.org/docs/optimizing/Optimizing-WebGL

Demonstrates a sequence of WebGL calls for rendering, highlighting redundant calls that can be optimized through lazy state caching. These optimizations are crucial for CPU-side performance in WebGL.

```javascript
// First draw
bindBuffer(...);
glVertexAttribPointer(...);
glActiveTexture(0);
glBindTexture(GL_TEXTURE_2D, texture1);
glActiveTexture(1);
glBindTexture(GL_TEXTURE_2D, texture2);
glDrawArrays(...);

// Second draw (back-to-back)
bindBuffer(...);
glVertexAttribPointer(...);
glActiveTexture(0); // (*) Redundant
glBindTexture(GL_TEXTURE_2D, texture1); // (*) Redundant
glActiveTexture(1); // (*) Redundant
glBindTexture(GL_TEXTURE_2D, texture2); // (*) Redundant
glDrawArrays(...);
````

---

### WebAssembly Instantiation Control

Source: https://emscripten.org/docs/api_reference/module

Override the default WebAssembly instantiation process. Allows custom asynchronous setup or parallel downloads before instantiation.

````APIDOC
## Module.instantiateWasm()

### Description
An optional user-implemented callback function that controls the WebAssembly instantiation action. It receives `imports` and a `successCallback`, and should return the `exports` object of the instantiated Module, `{}` for async instantiation, or `false` on failure.

### Method
Configuration

### Endpoint
N/A (Module configuration property)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Arguments
- **imports** (object) - JS object containing function imports for the WebAssembly Module.
- **successCallback** (function) - Called with the instantiated WebAssembly Module object.

### Request Example
```javascript
Module.instantiateWasm = (imports, successCallback) => {
  // Perform custom async actions here
  return fetch('my.wasm').then(response => {
    return response.arrayBuffer();
  }).then(bytes => {
    return WebAssembly.instantiate(bytes, imports);
  }).then(results => {
    const instance = results.instance;
    successCallback(instance);
    return instance.exports;
  }).catch(e => {
    console.error('Wasm instantiation failed:', e);
    return false;
  });
};
````

### Response

- **object** - The `exports` object of the instantiated WebAssembly Module.
- **object** - An empty dictionary object `{}` if instantiation is asynchronous.
- **boolean** - `false` if instantiation failed.

````

--------------------------------

### C API Example for Emscripten Compilation

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

A simple C API example demonstrating functions intended for compilation with Emscripten. The `EMSCRIPTEN_KEEPALIVE` attribute prevents the compiler from optimizing away these functions, ensuring they are callable from JavaScript.

```c
#include <stdio.h>
#include <emscripten.h>

EMSCRIPTEN_KEEPALIVE
void sayHi() {
  printf("Hi!\n");
}

EMSCRIPTEN_KEEPALIVE
int daysInWeek() {
  return 7;
}

````

---

### Emscripten JavaScript Library Method Bindings

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Demonstrates binding methods from an Emscripten instance. Dependencies are declared using '\__deps' for other JavaScript libraries. Keys starting with '_' are prefixed, while keys starting with '$' have the prefix stripped.

```javascript
_method_01 = inst.getCallCount.bind(inst);
    _method_02 = inst.process.bind(inst);
    _method_03 = inst.reset.bind(inst);
  },
  method_01: function() {},
  method_01__deps: ['$method_support'],
  method_02: function() {},
  method_01__deps: ['$method_support'],
  method_03: function() {},
  method_01__deps: ['$method_support'],
 });
```

---

### Get Emscripten SDK Help Information

Source: https://emscripten.org/docs/tools_reference/emsdk

This command displays information about all available commands within the emsdk tool, providing a reference for its functionality.

```bash
# Display help information for emsdk.
./emsdk help

# Alternatively, just run emsdk without arguments.
./emsdk
```

---

### Parallel Compilation with Make

Source: https://emscripten.org/docs/getting_started/FAQ

To leverage multi-core processors for compiling source files, use parallel build systems like Make with the -j flag. For example, 'make -j8' will utilize 8 cores for compilation.

```bash
make -j8
```

---

### Emscripten Memory Profiler Setup

Source: https://emscripten.org/docs/porting/Debugging

This command compiles a C file and enables the Emscripten memory profiler, outputting an HTML file. Loading this HTML file in a browser will display memory usage visually, updating dynamically as memory is allocated.

```shell
emcc test/hello_world.c --memoryprofiler -o page.html
```

---

### Emscripten Linker Output Examples

Source: https://emscripten.org/docs/compiling/Building-Projects

Demonstrates how different `emcc` command-line flags influence the types and names of output files generated, including HTML launchers, JavaScript code, WebAssembly modules, symbol maps, source maps, and preloaded data files.

```bash
emcc ... -o output.html
# Produces: output.html, output.js, output.wasm

emcc ... -o output.js
# Produces: output.js, output.wasm

emcc ... -o output.wasm
# Produces: output.wasm (standalone WASI mode)

emcc ... -o output.{html,js} -sWASM=0
# Produces: output.html, output.js (targets JavaScript, no .wasm)

emcc ... -o output.{html,js} --emit-symbol-map
# Produces: output.{html,js}.symbols (if symbols minification occurred)

emcc ... -o output.{html,js} -gsource-map
# Produces: output.wasm.map (or output.{html,js}.map if -sWASM=0)

emcc ... -o output.{html,js} --preload-file xxx
# Produces: output.data

emcc ... -o output.{html,js} -sWASM={0,1} -sSINGLE_FILE
# Produces: output.{html,js} (single file, JS/WASM merged in base64)
```

---

### Get Emscripten Stack Base Address (C)

Source: https://emscripten.org/docs/api_reference/stack.h

Retrieves the starting address of the WebAssembly data stack. This is the address the stack pointer would point to when the stack is empty. It is a fundamental value for understanding stack boundaries.

```c
uintptr_t emscripten_stack_get_base(void);
```

---

### C++ File Access with Emscripten Virtual File System

Source: https://emscripten.org/docs/getting_started/Tutorial

This C++ code demonstrates how to open, read, and close a file using standard libc stdio functions within an Emscripten environment. It assumes the file 'test/hello_world_file.txt' is preloaded into the virtual file system. Errors in opening the file are handled by printing a message.

```cpp
// Copyright 2012 The Emscripten Authors.  All rights reserved.
// Emscripten is available under two separate licenses, the MIT license and the
// University of Illinois/NCSA Open Source License.  Both these licenses can be
// found in the LICENSE file.

#include <stdio.h>

int main() {
  FILE *file = fopen("test/hello_world_file.txt", "rb");
  if (!file) {
    printf("cannot open file\n");
    return 1;
  }
  while (!feof(file)) {
    char c = fgetc(file);
    if (c != EOF) {
      putchar(c);
    }
  }
  fclose (file);
  return 0;
}


```

---

### Define C++ Bindings Group - Embind

Source: https://emscripten.org/docs/api_reference/bind.h

The EMSCRIPTEN_BINDINGS macro is used to group related C++ class, function, and construct bindings for JavaScript. It takes a unique name as a label for the group, aiding in organization within the Embind system. Refer to the Embind guide for specific usage examples with different C++ constructs.

```cpp
#define EMSCRIPTEN_BINDINGS(name) ...
```

---

### Calling JavaScript Functions from C via Function Pointers (Emscripten)

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Explains how to use `addFunction` to get an integer representing a function pointer. This integer can be passed to C code, allowing it to call the JavaScript function. Building with `-sALLOW_TABLE_GROWTH` is recommended.

```c
extern "C" int _set_file_size(int handle, uint64_t size);

```

---

### Emscripten Trace Task Start

Source: https://emscripten.org/docs/api_reference/trace.h

Initiates a new task with a unique ID and a name. The application should manage the task ID.

````APIDOC
## emscripten_trace_task_start

### Description
A task is initiated. The task ID should be unique over the lifetime of the application. It should be managed / tracked by the application.
The current timestamp is associated with this data.

### Method
void

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```c
emscripten_trace_task_start(123, "DataProcessingTask");
````

### Response

#### Success Response (200)

N/A (void return type)

#### Response Example

N/A

````

--------------------------------

### Setting Up Emscripten Main Loop

Source: https://emscripten.org/docs/getting_started/FAQ

Demonstrates how to use `emscripten_set_main_loop` to repeatedly execute a C function. This is crucial for applications that need to run continuously in the browser environment, such as games or interactive simulations.

```c
#include <emscripten.h>

void render_frame() {
    // Code to render a single frame or perform one step of simulation
}

int main() {
    // Set render_frame to be called 60 times per second.
    // The last two arguments control whether to simulate main loop (0) or not (1),
    // and whether to allow async pre-run (1) or not (0).
    emscripten_set_main_loop(render_frame, 60, 1);
    return 0;
}
````

---

### Simple Hello World C Program

Source: https://emscripten.org/docs/getting_started/Tutorial

A basic C program that prints 'hello, world!' to the console and exits. This program is commonly used for initial testing of C compilers and environments. It includes the standard input/output library and a main function that performs the printing operation.

```c
/*
 * Copyright 2011 The Emscripten Authors.  All rights reserved.
 * Emscripten is available under two separate licenses, the MIT license and the
 * University of Illinois/NCSA Open Source License.  Both these licenses can be
 * found in the LICENSE file.
 */

#include <stdio.h>

int main() {
  printf("hello, world!\n");
  return 0;
}


```

---

### Start and End Tasks with Emscripten Tracing API

Source: https://emscripten.org/docs/api_reference/trace.h

Records the start and end of specific tasks using their unique integer IDs and names. Tasks are non-repeating units of work that may be suspended asynchronously.

```c
emscripten_trace_task_start(taskID, name);
emscripten_trace_task_end();

```

---

### Initialize Standard I/O Devices with Custom Callbacks (JavaScript)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Sets up the standard input, output, and error devices using custom callback functions. These callbacks define how Emscripten interacts with the host environment for stdin, stdout, and stderr, allowing for flexible I/O handling.

```javascript
FS.init(input, output, error);
```

---

### Build LLVM from Git Repository

Source: https://emscripten.org/docs/building_from_source/index

Instructions for building the LLVM project from its Git repository, including Clang and the Wasm backend. This process uses CMake for configuration and building. The resulting binaries are typically found in a 'build/bin' directory within the LLVM source tree. No installation is usually required, and the EM_LLVM_ROOT environment variable should be set to point to the build's bin directory.

```shell
mkdir build
cd build/
cmake ../llvm -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS='lld;clang' -DLLVM_TARGETS_TO_BUILD="host;WebAssembly" -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_TESTS=OFF
cmake --build .
```

---

### Configure and Build with Emscripten

Source: https://emscripten.org/docs/compiling/Building-Projects

This snippet demonstrates the standard Emscripten workflow for projects using configure and make. It replaces the typical './configure' and 'make' commands with 'emconfigure ./configure' and 'emmake make' respectively. Finally, 'emcc' is used to compile the project's output (e.g., project.o) into a runnable JavaScript file (project.js) with WebAssembly.

```bash
# Run emconfigure with the normal configure command as an argument.
emconfigure ./configure

# Run emmake with the normal make to generate Wasm object files.
emmake make

# Compile the linked code generated by make to JavaScript + WebAssembly.
# 'project.o' should be replaced with the make output for your project, and
# you may need to rename it if it isn't something emcc recognizes
# (for example, it might have a different suffix like 'project.so' or
# 'project.so.1', or no suffix like just 'project' for an executable).
# If the project output is a library, you may need to add your 'main.c' file
# here as well.
# [-Ox] represents build optimisations (discussed in the next section).
emcc [-Ox] project.o -o project.js
```

---

### Emscripten setjmp-longjmp Restriction Example (Indirect Call)

Source: https://emscripten.org/docs/porting/setjmp-longjmp

Illustrates a restriction in Emscripten's setjmp-longjmp support where indirect calls to setjmp are not permitted. This example shows a pattern that will not work.

```c
jmp_buf env;
int (*fp)(jmp_buf) = setjmp;
fp(env); // Doesn't work

```

---

### Fast Edit+Compile with Minimal Debug Info using -g2

Source: https://emscripten.org/docs/porting/Debugging

This example illustrates a fast build process where initial compilation produces an object file without debug information. The final linking step uses the -g2 flag, which embeds minimal debug information (specifically, the name section) into the WebAssembly binary. This results in more useful stack traces in browsers with minimal overhead during development and testing.

```bash
emcc source.c -c -o source.o
emcc source.o -o program.js -g2
```

---

### Emscripten: Alternative \_\_postset for Method Initialization

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Presents an alternative way to initialize methods using **postset with Emscripten's `addToLibrary`. This approach defines the core logic within a function assigned to a **postset property, which is then called to set up the desired methods.

```javascript
addToLibrary({
  $method_support__postset: 'method_support();',
  $method_support: function() {
    var SomeLib = function() {
      this.callCount = 0;
    };

    SomeLib.prototype.getCallCount = function() {
      return this.callCount;
    };

    SomeLib.prototype.process = function() {
      ++this.callCount;
    };

    SomeLib.prototype.reset = function() {
      this.callCount = 0;
    };

    var inst = new SomeLib();

```

---

### Get Orientation Status

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the current device orientation state.

````APIDOC
## GET /emscripten/orientation/status

### Description
Returns the current device orientation state.

### Method
GET

### Endpoint
/emscripten/orientation/status

### Parameters
#### Query Parameters
- **orientationStatus** (EmscriptenOrientationChangeEvent*) - Required - A pointer to store the orientation state.

### Request Example
```json
{
  "orientationStatus": null
}
````

### Response

#### Success Response (200)

- **result** (EMSCRIPTEN_RESULT) - Indicates success (`EMSCRIPTEN_RESULT_SUCCESS`) or an error.
- **orientationStatus** (EmscriptenOrientationChangeEvent) - Information about the current orientation.

#### Response Example

```json
{
  "result": "EMSCRIPTEN_RESULT_SUCCESS",
  "orientationStatus": {
    "timestamp": 1678886400,
    "width": 1080,
    "height": 1920,
    "orientation": 1
  }
}
```

````

--------------------------------

### C Code Example with JavaScript API Call

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

This C code defines an external JavaScript function `my_js` and calls it from the `main` function. It demonstrates the basic structure for invoking JavaScript functions from C/C++.

```c
extern void my_js(void);

int main() {
  my_js();
  return 1;
}

````

---

### Generate DWARF for Symbolication and Strip for Distribution

Source: https://emscripten.org/docs/porting/Debugging

This example shows how to compile C code to include DWARF debug information for symbolication purposes, then strip the DWARF information for a leaner production binary. The initial compilation with -g includes DWARF, and the subsequent stripping with `llvm-strip` removes it, creating a smaller file suitable for distribution while retaining the original for debugging.

```bash
emcc source.o -o program2.js -g
llvm-strip program2.wasm -o program2_stripped.wasm
```

---

### Get WebGL Context Attributes

Source: https://emscripten.org/docs/api_reference/html5.h

Fetches the context creation attributes used for a given WebGL context.

````APIDOC
## emscripten_webgl_get_context_attributes

### Description
Fetches the context creation attributes that were used to initialize the specified WebGL context and populates the provided `outAttributes` structure.

### Method
N/A (C function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (EMSCRIPTEN_RESULT_SUCCESS)
Returns `EMSCRIPTEN_RESULT_SUCCESS` on success.

#### Response Example
```json
{
  "status": "success",
  "attributes": {
    "alpha": true,
    "depth": true,
    "stencil": false,
    "antialias": true,
    "premultipliedAlpha": true,
    "preserveDrawingBuffer": false,
    "majorVersion": 1,
    "minorVersion": 0
  }
}
````

### Parameters:

- **context** (EMSCRIPTEN_WEBGL_CONTEXT_HANDLE) – The WebGL context to query.
- **outAttributes** (EmscriptenWebGLContextAttributes\*) – The context creation attributes of the specified context will be filled in here. This pointer cannot be null.

### Returns:

On success, `EMSCRIPTEN_RESULT_SUCCESS`.

````

--------------------------------

### Emscripten setjmp-longjmp Restriction Example (Setjmp in Catch Clause)

Source: https://emscripten.org/docs/porting/setjmp-longjmp

Demonstrates a restriction when using WebAssembly EH-based setjmp-longjmp support: calling setjmp directly within a C++ catch clause is not allowed. This example highlights the problematic code.

```c++
try {
  // ...
}
catch (int n) {
  setjmp(buf); // Doesn't work
}

````

---

### Divergent Optimization for Specific Files in Emscripten

Source: https://emscripten.org/docs/compiling/Building-Projects

Shows an example where different optimization levels are applied to individual source files before linking. This scenario optimizes one file for size (`-Oz`) while others use a higher optimization level (`-O2`).

```bash
# Optimize the first file for size, and the rest using -O2.
emcc -Oz a.cpp -c -o a.o
emcc -O2 b.cpp -c -o b.o
emcc -O2 a.o b.o -o project.js
```

---

### Emscripten: Handling Bind, Closures, and Curry with \_\_postset

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Demonstrates how to use the \_\_postset property in Emscripten's `addToLibrary` function to correctly implement function binding, closures, and currying. This approach circumvents limitations imposed by Emscripten's stringification of library properties.

```javascript
addToLibrary({
  // Solution for bind or referencing other functions directly
  good_02__postset: "_good_02();",
  good_02: function () {
    _good_02 = document.querySelector.bind(document);
  },

  // Solution for closures
  good_03__postset: "_good_03();",
  good_03: function () {
    var callCount = 0;
    _good_03 = function () {
      console.log("times called: ", ++callCount);
    };
  },

  // Solution for curry/transform
  good_05__postset: "_good_05();",
  good_05: function () {
    _good_05 = curry(scrollTo, 0);
  },
});
```

---

### Emscripten Path Manipulation

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Details functions for working with paths, including getting the current working directory, changing directories, and analyzing paths.

```APIDOC
## Path Manipulation

### Description
Emscripten provides functions for managing the current working directory and analyzing file paths.

### Functions

- **`FS.cwd()`**: Returns the current working directory.
  - **Returns**: (string) The path of the current working directory.

- **`FS.chdir(path)`**: Changes the current working directory.
  - **Parameters**:
    - `path` (string) - The new directory to change to.
  - **Returns**: `undefined` on success, throws `FS.ErrnoError` on failure.

- **`FS.readdir(path)`**: Reads the contents of a directory.
  - **Parameters**:
    - `path` (string) - The path of the directory to read.
  - **Returns**: (Array<string>) An array of names of the entries in the directory.

- **`FS.lookupPath(path, opts)`**: Translates a path into an absolute path and node. Allows for resolving symlinks.
  - **Parameters**:
    - `path` (string) - The path to look up.
    - `opts` (object, optional) - Options object.
  - **Returns**: An object containing `node` and `path`.

- **`FS.analyzePath(path)`**: Analyzes a path, returning components and resolving symlinks.
  - **Parameters**:
    - `path` (string) - The path to analyze.
  - **Returns**: An object with analyzed path components.

- **`FS.getPath(node)`**: Retrieves the path associated with a given file system node.
  - **Parameters**:
    - `node` (object) - The file system node.
  - **Returns**: (string) The path of the node.
```

---

### Get File System Node Statistics (C/C++ with Emscripten)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Retrieves a JavaScript object containing statistics about a file system node, such as size, mode, and timestamps. This is useful for inspecting file properties.

```c
#include <stdio.h>
#include <emscripten.h>

int main() {
  MAIN_THREAD_EM_ASM(
  FS.writeFile('file', 'foobar');
  console.log(FS.stat('file'));
  );
  return 0;
}
```

---

### Emscripten setjmp-longjmp Configuration Examples

Source: https://emscripten.org/docs/porting/setjmp-longjmp

Demonstrates how to configure Emscripten's setjmp-longjmp support using compiler flags. This includes enabling JavaScript-based support, WebAssembly exception handling-based support, and combining them with C++ exceptions.

```command-line
em++ -fexceptions test.cpp -o test.js

```

```command-line
em++ -fwasm-exceptions -sSUPPORT_LONGJMP=wasm test.cpp -o test.js

```

---

### FS.cwd() - Get Current Working Directory

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Retrieves the current working directory within the Emscripten file system.

````APIDOC
## FS.cwd()

### Description
Gets the current working directory.

### Method
GET

### Endpoint
/websites/emscripten/fs/cwd

### Parameters
None

### Request Example
```json
{
  "method": "GET",
  "endpoint": "/websites/emscripten/fs/cwd"
}
````

### Response

#### Success Response (200)

- **string** - The current working directory.

#### Response Example

```json
{
  "cwd": "/"
}
```

````

--------------------------------

### Display Emscripten Compiler Version

Source: https://emscripten.org/docs/tools_reference/emcc

This command displays the version of the Emscripten compiler (emcc) currently installed. It's a simple utility command to check the compiler version.

```bash
emcc --version
````

---

### Get Current WebGL Context

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the handle of the currently active WebGL rendering context.

````APIDOC
## emscripten_webgl_get_current_context

### Description
Returns the currently active WebGL rendering context handle. If no context is active, it returns 0. Calling WebGL functions without an active context results in undefined behavior.

### Method
N/A (C function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (EMSCRIPTEN_WEBGL_CONTEXT_HANDLE)
Returns the handle of the currently active WebGL rendering context, or 0 if no context is active.

#### Response Example
```json
{
  "currentContextHandle": 123
}
````

### Returns:

The currently active WebGL rendering context, or 0 if no context is active.

### Return type:

`EMSCRIPTEN_WEBGL_CONTEXT_HANDLE`

````

--------------------------------

### Serve Project with Python HTTP Server

Source: https://emscripten.org/docs/getting_started/FAQ

To avoid issues when testing locally, especially with file loading, use a local web server. Python 3 provides a simple HTTP server with 'python -m http.server'. This is a more reliable method than using 'file://' URLs.

```bash
python3 -m http.server 8000
````

---

### Calling Emscripten Function After Runtime Initialization (JavaScript)

Source: https://emscripten.org/docs/getting_started/FAQ

This example illustrates how to safely call an Emscripten-compiled function (e.g., `_foobar`) from JavaScript by defining the `onRuntimeInitialized` property on the `Module` object before loading the Emscripten output script. This ensures the function is called only when the runtime is fully initialized.

```javascript
<script type="text/javascript">
  var Module = {
    onRuntimeInitialized: function() {
      Module._foobar(); // foobar was exported
    }
  };
</script>
<script type="text/javascript" src="my_project.js"></script>
```

---

### Fast Iteration Builds with -O0

Source: https://emscripten.org/docs/getting_started/FAQ

For faster development cycles, use the -O0 optimization flag during the linking phase. This significantly speeds up linking, allowing for quicker iterations. Higher optimization levels can still be used for release builds.

```bash
emcc ... -O0 ...
```

---

### FS.getPath(node) - Get Path from Node

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Retrieves the absolute path for a given file system node, considering any mounted file systems.

````APIDOC
## FS.getPath(node)

### Description
Gets the absolute path to `node`, accounting for mounts.

### Method
POST

### Endpoint
/websites/emscripten/fs/getPath

### Parameters
#### Request Body
- **node** (object) - Required - The file system node for which to get the path.

### Request Example
```json
{
  "method": "POST",
  "endpoint": "/websites/emscripten/fs/getPath",
  "body": {
    "node": {"id": "123", "type": "file"}
  }
}
````

### Response

#### Success Response (200)

- **string** - The absolute path to the node.

#### Response Example

```json
{
  "absolutePath": "/mounted/path/to/node"
}
```

````

--------------------------------

### emscripten_get_element_css_size

Source: https://emscripten.org/docs/api_reference/html5.h

Gets the current CSS width and height of a specified HTML element.

```APIDOC
## emscripten_get_element_css_size

### Description
Gets the current CSS width and height of the element specified by `target`.

### Method
`EMSCRIPTEN_RESULT emscripten_get_element_css_size(const char *target, double *width, double *height)`

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
- **target** (const char*) - Element to get size of.
- **width** (double *) - Pointer to store the width of the element.
- **height** (double *) - Pointer to store the height of the element.

### Request Example
```c
double cssWidth, cssHeight;
EMSCRIPTEN_RESULT result = emscripten_get_element_css_size("#container", &cssWidth, &cssHeight);
if (result == EMSCRIPTEN_RESULT_SUCCESS) {
    // Use cssWidth and cssHeight
}
````

### Response

#### Success Response (EMSCRIPTEN_RESULT_SUCCESS)

Returns `EMSCRIPTEN_RESULT_SUCCESS` on success.

#### Response Example

```json
{
  "result": "EMSCRIPTEN_RESULT_SUCCESS"
}
```

````

--------------------------------

### Emscripten Compiler Configuration File (.emscripten) Example - Windows

Source: https://emscripten.org/docs/tools_reference/emsdk

This Python code snippet represents a typical .emscripten configuration file on Windows. It specifies the absolute paths to the LLVM root directory and the Node.js executable, which are essential for the Emscripten toolchain to function correctly.

```python
# .emscripten file from Windows SDK

import os
LLVM_ROOT='C:/Program Files/Emscripten/clang/e1.21.0_64bit'
NODE_JS='C:/Program Files/Emscripten/node/0.10.17_64bit/node.exe'
````

---

### Download File Asynchronously to Memory using Fetch API (C)

Source: https://emscripten.org/docs/api_reference/fetch

This snippet demonstrates how to download a file from a web server asynchronously into the application's memory heap using the Emscripten Fetch API. It requires compiling with the -sFETCH flag. The example defines success and failure callbacks to handle the downloaded data or report errors, respectively. The downloaded data is accessible via fetch->data.

```c
#include <stdio.h>
#include <string.h>
#include <emscripten/fetch.h>

void downloadSucceeded(emscripten_fetch_t *fetch) {
  printf("Finished downloading %llu bytes from URL %s.\n", fetch->numBytes, fetch->url);
  // The data is now available at fetch->data[0] through fetch->data[fetch->numBytes-1];
  emscripten_fetch_close(fetch); // Free data associated with the fetch.
}

void downloadFailed(emscripten_fetch_t *fetch) {
  printf("Downloading %s failed, HTTP failure status code: %d.\n", fetch->url, fetch->status);
  emscripten_fetch_close(fetch); // Also free data on failure.
}

int main() {
  emscripten_fetch_attr_t attr;
  emscripten_fetch_attr_init(&attr);
  strcpy(attr.requestMethod, "GET");
  attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY;
  attr.onsuccess = downloadSucceeded;
  attr.onerror = downloadFailed;
  emscripten_fetch(&attr, "myfile.dat");
}
```

---

### Emscripten Compilation with Preloaded File

Source: https://emscripten.org/docs/getting_started/Tutorial

This command compiles a C++ file ('test/hello_world_file.cpp') using Emscripten ('emcc') and generates an HTML output ('hello.html'). It specifically preloads 'test/hello_world_file.txt' into the Emscripten virtual file system, making it accessible to the compiled C++ code at runtime.

```bash
./emcc test/hello_world_file.cpp -o hello.html --preload-file test/hello_world_file.txt

```

---

### Export C functions for JavaScript access using emcc

Source: https://emscripten.org/docs/api_reference/preamble.js

Illustrates how to export C functions using the `emcc` compiler flag `-sEXPORTED_FUNCTIONS`. This is crucial for ensuring that functions like `_main` and `_myfunc` are not inlined or removed by optimizations, making them callable from JavaScript. The example shows the command-line syntax for exporting functions.

```bash
-sEXPORTED_FUNCTIONS=_main,_myfunc"
```

---

### Get Device Motion Status

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the most recently received device motion event state.

```APIDOC
## EMSCRIPTEN_RESULT emscripten_get_devicemotion_status

### Description
Returns the most recently received devicemotion event state. This function requires `emscripten_set_devicemotion_callback()` to have been called previously to enable state capture.

### Method
`emscripten_get_devicemotion_status`

### Parameters
- **motionState** (EmscriptenDeviceMotionEvent*) - A pointer to an `EmscriptenDeviceMotionEvent` structure where the latest event data will be stored.

### Returns
- `EMSCRIPTEN_RESULT_SUCCESS` on success.
- Other `EMSCRIPTEN_RESULT` values on failure.
```

---

### WebAssembly SIMD Intrinsics Example

Source: https://emscripten.org/docs/porting/simd

Demonstrates the usage of WebAssembly SIMD intrinsics for single-instruction, multiple-data operations. It includes type definitions for vector types and functions for vector creation and arithmetic. Compile with `-msimd128` to enable.

```c
#include <wasm_simd128.h>
#include <stdio.h>

int main() {
#ifdef __wasm_simd128__
  v128_t v1 = wasm_f32x4_make(1.2f, 3.4f, 5.6f, 7.8f);
  v128_t v2 = wasm_f32x4_make(2.1f, 4.3f, 6.5f, 8.7f);
  v128_t v3 = wasm_f32x4_add(v1, v2);
  // Prints "v3: [3.3, 7.7, 12.1, 16.5]"
  printf("v3: [%.1f, %.1f, %.1f, %.1f]\n",
         wasm_f32x4_extract_lane(v3, 0),
         wasm_f32x4_extract_lane(v3, 1),
         wasm_f32x4_extract_lane(v3, 2),
         wasm_f32x4_extract_lane(v3, 3));
#endif
}

```

---

### Get Preloaded Image Data from FILE Pointer

Source: https://emscripten.org/docs/api_reference/emscripten.h

Loads image data from an existing C 'FILE\*' pointer and retrieves its width and height. The returned pointer must be freed using 'free()'. Returns NULL if the data is invalid.

```c
FILE* img_file = fopen("image.jpg", "rb");
if (img_file) {
    int width, height;
    char* image_data = emscripten_get_preloaded_image_data_from_FILE(img_file, &width, &height);
    if (image_data) {
        // Use image_data, width, height
        free(image_data);
    }
    fclose(img_file);
}
```

---

### Detecting WebGL 2 Support via Feature Detection (JavaScript)

Source: https://emscripten.org/docs/compiling/Deploying-Pages

This snippet demonstrates the recommended way to check for WebGL 2 support by directly attempting to get a 'webgl2' context. It avoids relying on `navigator.userAgent`, which can lead to compatibility issues. This approach ensures future compatibility as browser support evolves.

```javascript
if (!canvas.getContext("webgl2"))
  alert("Your browser does not support WebGL 2!"); // And look for webglcontextcreationerror here for an error reason.
```

---

### Get Preloaded Image Data and Dimensions

Source: https://emscripten.org/docs/api_reference/emscripten.h

Loads image data from a specified file path and retrieves its width and height. The returned pointer must be freed using 'free()'. Returns NULL if the data is invalid.

```c
int width, height;
char* image_data = emscripten_get_preloaded_image_data("/path/to/image.png", &width, &height);
if (image_data) {
    // Use image_data, width, height
    free(image_data);
}
```

---

### Correct Audio Capture Loop in Emscripten

Source: https://emscripten.org/docs/porting/Audio

This illustrates the correct approach for audio capture in Emscripten. Instead of blocking, each query for audio samples should be performed once per main loop iteration, typically within a callback provided by `emscripten_set_main_loop()` or `emscripten_set_main_loop_arg()`.

```c
// Inside your emscripten_set_main_loop callback:
alcG GetIntegerv(device, ALC_CAPTURE_SAMPLES, 1, &nframes);
// Process nframes here

```

---

### Define C++ Classes for WebIDL Binding

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

This C++ code defines example classes, `Foo` and `Bar`, which will be exposed to JavaScript using the WebIDL Binder. These classes include methods and constructors that can be bound.

```cpp
class Foo {
public:
  int getVal();
  void setVal(int v);
};

class Bar {
public:
  Bar(long val);
  void doSomething();
};

```

---

### Emscripten Function Pointer Casting Example

Source: https://emscripten.org/docs/porting/guidelines/function_pointer_issues

Demonstrates a C code snippet that exhibits function pointer casting issues when compiled with Emscripten. The code defines functions with different signatures, casts them to a common type, and calls them, which results in a runtime exception in Emscripten.

```c
#include <stdio.h>

typedef void(*voidReturnType)(const char *);

void voidReturn(const char *message) {
  printf( "voidReturn: %s\n", message );
}


int intReturn(const char *message) {
  printf( "intReturn: %s\n", message );
  return 1;
}

void voidReturnNoParam() {
  printf( "voidReturnNoParam:\n" );
}

void callFunctions(const voidReturnType * funcs, size_t size) {
  size_t current = 0;
  while (current < size) {
    funcs[current]("hello world");
    current++;
  }
}

int main() {
  voidReturnType functionList[3];

  functionList[0] = voidReturn;
  functionList[1] = (voidReturnType)intReturn;         // Breaks in Emscripten.
  functionList[2] = (voidReturnType)voidReturnNoParam; // Breaks in Emscripten.

  callFunctions(functionList, 3);
}
```

---

### FS.mkdev

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Creates a new device node in the file system, referencing a registered device driver.

````APIDOC
## FS.mkdev

### Description
Creates a new device node in the file system referencing the registered device driver (`FS.registerDevice()`) for `dev`. The underlying implementation does not support user or group permissions; the caller is always treated as the owner.

### Method
FS.mkdev

### Parameters
#### Path Parameters
- **path** (string) - Required - The path name for the new device node.
- **mode** (integer) - Optional - File permissions for the new node. The default setting is 0777 (octal).
- **dev** (integer) - Required - The registered device driver.

### Request Example
```javascript
var id = FS.makedev(64, 0); // Assuming FS.makedev exists and creates a device ID
FS.registerDevice(id, {}); // Registering a dummy device driver
FS.mkdev('/dummy', id);
````

### Response

This function does not return a value.

````

--------------------------------

### Get Current Working Directory (JS)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Retrieves the current working directory within the Emscripten file system. This function takes no arguments and returns a string representing the current path.

```javascript
FS.cwd()
````

---

### Read Data from File Stream using FS.read

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Reads a specified number of bytes from a file stream into a buffer. The read operation can start from a specific offset within the stream.

```javascript
FS.read(_stream_ , _buffer_ , _offset_ , _length_[, _position_])
```

```javascript
var stream = FS.open("abinaryfile", "r");
var buf = new Uint8Array(4);
FS.read(stream, buf, 0, 4, 0);
FS.close(stream);
```

---

### Runtime and Filesystem Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference

Configuration options for exporting runtime methods, managing incoming JavaScript API values, and controlling filesystem support.

```APIDOC
## EXPORTED_RUNTIME_METHODS

### Description
A list of runtime elements that are exported on the `Module` object. Previously, many elements were exported by default; this option allows explicit declaration of desired exports, including JS library elements like the `FS` object.

### Default Value
`[]`

## INCOMING_MODULE_JS_API

### Description
A list of incoming values on the `Module` object in JavaScript that the compiler should be aware of. If a value is not in this list, code to check for its provision at runtime may not be emitted, aiding in code size optimization. Setting this to a concise list of used values is recommended.

### Default Value
(multi-line value, see settings.js)

## CASE_INSENSITIVE_FS

### Description
When enabled (non-zero), the virtual filesystem is treated as case-insensitive, similar to Windows and macOS. When disabled (0), it is case-sensitive, like on Linux.

### Default Value
`false`

## FILESYSTEM

### Description
Disables filesystem support when set to 0. This is useful for computation-only applications that do not interact with files or standard I/O streams. The compiler may automatically disable this if static analysis detects no filesystem syscalls. Use `FORCE_FILESYSTEM` to ensure filesystem support is included.

### Default Value
`true`

## FORCE_FILESYSTEM

### Description
Ensures full filesystem support is included, even if static analysis suggests it is not used. This is necessary if JavaScript code interacting with the filesystem is included.

### Default Value
`false`
```

---

### Get Current Callstack Programmatically

Source: https://emscripten.org/docs/api_reference/emscripten.h

Retrieves the current callstack as a null-terminated string. It can be used to query the required buffer size before writing. The output is truncated if 'maxbytes' is insufficient, but remains null-terminated.

```c
// Get required size
int required_size = emscripten_get_callstack(0, NULL, 0);
char* callstack_buffer = (char*)malloc(required_size);
// Get the callstack
emscripten_get_callstack(EM_LOG_NONE, callstack_buffer, required_size);
printf("Callstack: %s\n", callstack_buffer);
free(callstack_buffer);
```

---

### Record Frame Start and End

Source: https://emscripten.org/docs/api_reference/trace.h

Marks the beginning and end of a frame or event loop iteration. This is crucial for the tracing API to perform frame-based analysis and profiling.

```c
emscripten_trace_record_frame_start();

emscripten_trace_record_frame_end();

```

---

### Mount PROXYFS to Share Filesystems Between Modules (JavaScript)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Demonstrates how to mount the filesystem of one Emscripten module into another using PROXYFS. This allows modules to share and modify file content without manual synchronization. Module 2 accesses Module 1's filesystem at '/fs1'.

```javascript
module2.FS.mkdir("/fs1");
module2.FS.mount(
  module2.PROXYFS,
  {
    root: "/",
    fs: module1.FS,
  },
  "/fs1",
);
```

---

### Get Current Orientation Status (C)

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the most recent device orientation state. The current orientation information is populated into the provided `EmscriptenOrientationChangeEvent` structure.

```c
EMSCRIPTEN_RESULT emscripten_get_orientation_status(EmscriptenOrientationChangeEvent *orientationStatus);
```

---

### Emscripten SDK Maintenance Commands

Source: https://emscripten.org/docs/tools_reference/emsdk

This section outlines the core commands for interacting with the Emscripten SDK (emsdk). These commands are used for listing, updating, installing, uninstalling, and activating SDKs and tools. The syntax varies slightly between Linux/macOS and Windows.

```shell
./emsdk update
./emsdk install <tool/sdk>
./emsdk uninstall <tool/sdk>
./emsdk activate <tool/sdk>
./emsdk list [--old]
./emsdk help
```

```shell
emsdk update
emsdk install <tool/sdk>
emsdk uninstall <tool/sdk>
emsdk activate <tool/sdk>
emsdk list [--old]
emsdk help
```

---

### Configure Tracing API for Google WTF

Source: https://emscripten.org/docs/api_reference/trace.h

Configures the Emscripten tracing API specifically for use with the Google Web Tracing Framework (WTF). This simplifies setup when targeting that framework.

```c
emscripten_trace_configure_for_google_wtf();

```

---

### C File Operations with Emscripten

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Demonstrates standard C file I/O operations within an Emscripten environment. This includes opening, writing, closing, renaming, reading, and removing files, as well as creating directories and symbolic links. It showcases how Emscripten's FS layer interacts with these standard C library functions.

```c
#include <stdio.h>
#include <sys/stat.h>

int main() {
    FILE *file;
    file = fopen("/test.txt", "w");
    fputs("hello world", file);
    fclose(file);
    rename("/test.txt", "/renamed.txt");
    file = fopen("/renamed.txt", "r");
    char str[256] = {};
    fgets(str, 255, file);
    printf("File read returned \'%s\'\n", str);
    fclose(file);
    remove("/renamed.txt");
    mkdir("/home/test", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    symlink("/renamed.txt", "/file.txt");
    return 0;
}
```

---

### Set LLVM Root Path in .emscripten

Source: https://emscripten.org/docs/building_from_source/configuring_emscripten_settings

Example of how to set the LLVM root directory in the .emscripten configuration file. This path should point to the directory containing your LLVM binaries. Always use forward slashes in paths.

```python
LLVM_ROOT = '/home/ubuntu/a-path/llvm/build/bin'

```

---

### Build and Link Custom Library with Main Project (Emscripten)

Source: https://emscripten.org/docs/compiling/Building-Projects

This sequence demonstrates how to build a custom library (e.g., 'libstuff') and then link it with your main project ('project') to create a final executable. It involves configuring, making the library, compiling the main project, and finally linking them together using emcc.

```bash
# Compile libstuff to libstuff.a
emconfigure ./configure
emmake make

# Compile project to project.o
emconfigure ./configure
emmake make

# Link the library and code together.
emcc project.o libstuff.a -o final.html

```

---

### Get WebGL Context Attributes

Source: https://emscripten.org/docs/api_reference/html5.h

Fetches the attributes that were used to initialize a given WebGL context and populates the provided EmscriptenWebGLContextAttributes structure. The output structure pointer cannot be null.

```c
EMSCRIPTEN_RESULT emscripten_webgl_get_context_attributes(EMSCRIPTEN_WEBGL_CONTEXT_HANDLE context, EmscriptenWebGLContextAttributes *outAttributes);
```

---

### Record Emscripten Frame Start

Source: https://emscripten.org/docs/api_reference/trace.h

Marks the beginning of a frame or event loop iteration. The current timestamp is associated with this event, which is used by the server to track frame times and memory operations within the frame.

```c
void emscripten_trace_record_frame_start(void);
```

---

### Emscripten Compiler Configuration File (.emscripten) Example - Linux

Source: https://emscripten.org/docs/tools_reference/emsdk

This Python code snippet shows a common .emscripten configuration file on Linux systems. It defines the NODE_JS environment variable and the LLVM_ROOT path, which are crucial for Emscripten to locate the necessary tools for compilation.

```python
# .emscripten file from Linux SDK

import os
NODE_JS = 'nodejs'
LLVM_ROOT='/home/ubuntu/emsdk/upstream/bin'
```

---

### FS.mkdirTree

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Creates a new directory node and all necessary parent directories in the Emscripten file system.

````APIDOC
## FS.mkdirTree

### Description
Creates a new directory node and all parent directories in the file system. The underlying implementation does not support user or group permissions; the caller is always treated as the owner.

### Method
FS.mkdirTree

### Parameters
#### Path Parameters
- **path** (string) - Required - The path name for the new directory node.
- **mode** (integer) - Optional - File permissions for the new node. The default setting is 0777 (octal).

### Request Example
```javascript
FS.mkdirTree('/data/subdir1/subdir2');
````

### Response

This function does not return a value.

````

--------------------------------

### cwrap - Get a JavaScript Wrapper for a C Function

Source: https://emscripten.org/docs/api_reference/preamble.js

The `cwrap` function returns a reusable JavaScript function that wraps a compiled C function. This is useful when you need to call the same C function multiple times.

```APIDOC
## POST /_emscripten/cwrap

### Description
Returns a native JavaScript wrapper for a C function. This wrapper can be called multiple times. The C function must be C-compatible (e.g., defined in a .c file or using `extern "C"`).

### Method
POST

### Endpoint
/_emscripten/cwrap

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
- **ident** (string) - Required - The name of the C function to be wrapped.
- **returnType** (string) - Required - The return type of the function. Possible values: "number", "string", "array", "boolean", or null for void functions. Note: "array" is not supported for return types.
- **argTypes** (array of strings) - Optional - An array of the types of arguments for the function. Possible values: "number", "string", "array", "boolean".

### Request Example
```json
{
  "ident": "c_add",
  "returnType": "number",
  "argTypes": ["number", "number"]
}
````

### Response

#### Success Response (200)

- **wrapperFunction** (function) - A JavaScript function that wraps the C function.

#### Response Example

```javascript
// Assuming the response provides a way to execute the wrapper
// Example usage after obtaining the wrapper:
var c_javascript_add = Module.cwrap("c_add", "number", ["number", "number"]);
console.log(c_javascript_add(10, 20)); // 30
```

### Notes

- String arguments are stored on the stack and are only valid during the function call.
- For persistent strings, use `_malloc` and `stringToUTF8()`, and remember to manually delete them.

````

--------------------------------

### Running an HTML file without launching a browser using emrun

Source: https://emscripten.org/docs/compiling/Running-html-files-with-emrun

This command starts the local web server to host the HTML file but does not automatically open a web browser. This is useful for testing or when integrating with other tools.

```shell
emrun --no_browser page.html
````

---

### Get Gamepad Status

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves a snapshot of the current gamepad state for a gamepad at a given index. This function should be called after emscripten_sample_gamepad_data(). It populates the provided EmscriptenGamepadEvent structure with the gamepad's state.

```c
EMSCRIPTEN_RESULT emscripten_get_gamepad_status(int index, EmscriptenGamepadEvent *gamepadState);
```

---

### FS.mkdir

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Creates a new directory node in the Emscripten file system.

````APIDOC
## FS.mkdir

### Description
Creates a new directory node in the file system. The underlying implementation does not support user or group permissions; the caller is always treated as the owner.

### Method
FS.mkdir

### Parameters
#### Path Parameters
- **path** (string) - Required - The path name for the new directory node.
- **mode** (integer) - Optional - File permissions for the new node. The default setting is 0777 (octal).

### Request Example
```javascript
FS.mkdir('/data');
FS.mkdir('/data/subdir', 0o755); // Creates subdir with specific permissions
````

### Response

This function does not return a value.

````

--------------------------------

### Get Pointerlock Status API

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieve the current pointer lock status of the page. This function populates a provided structure with the latest pointer lock state information.

```APIDOC
## GET /emscripten_get_pointerlock_status

### Description
Returns the current page pointerlock state.

### Method
GET

### Endpoint
/emscripten_get_pointerlock_status

### Parameters
#### Query Parameters
- **pointerlockStatus** (EmscriptenPointerlockChangeEvent*) - Required - A pointer to a structure to be populated with the most recently received pointerlock state.

### Request Example
```json
{
  "pointerlockStatus": { /* structure to be filled by the API */ }
}
````

### Response

#### Success Response (200)

- **result** (EMSCRIPTEN_RESULT) - Indicates success or failure of the operation. Expected to be EMSCRIPTEN_RESULT_SUCCESS on successful retrieval.
- **pointerlockStatus** (EmscriptenPointerlockChangeEvent) - Contains the current pointerlock state, including 'hidden' (boolean) and 'visibilityState' (integer).

````

--------------------------------

### Get Current Battery Status

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the current battery status. The function populates an EmscriptenBatteryEvent structure with the latest battery state information. It returns EMSCRIPTEN_RESULT_SUCCESS on success.

```c
EMSCRIPTEN_RESULT emscripten_get_battery_status(EmscriptenBatteryEvent *batteryState);
````

---

### Linking OpenAL in Emscripten

Source: https://emscripten.org/docs/porting/Audio

To use Emscripten's OpenAL implementation, you must link with the `-lopenal` flag. This flag is mandatory for the OpenAL functionality to work correctly in your Emscripten-compiled application.

```bash
emcc ... -lopenal
```

---

### Emscripten: Using \_\_postset for Complex Method Initialization

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Shows an advanced usage of **postset in Emscripten's `addToLibrary` to initialize multiple methods. A main **postset defines a JavaScript class and its methods, then assigns bound versions of these methods to individual library functions.

```javascript
addToLibrary({
  $method_support: {},
  $method_support__postset: [
    '(function() {                                  ',
    '  var SomeLib = function() {                   ',
    '    this.callCount = 0;                        ',
    '  };
                                               ',
    '  SomeLib.prototype.getCallCount = function() {',
    '    return this.callCount;                     ',
    '  };
                                               ',
    '  SomeLib.prototype.process = function() {     ',
    '    ++this.callCount;                          ',
    '  };
                                               ',
    '  SomeLib.prototype.reset = function() {       ',
    '    this.callCount = 0;                        ',
    '  };
                                               ',
    '  var inst = new SomeLib();                    ',
    '  _method_01 = inst.getCallCount.bind(inst);   ',
    '  _method_02 = inst.process.bind(inst);        ',
    '  _method_03 = inst.reset.bind(inst);          ',
    '}());                                          ',
  ].join('\n'),
  method_01: function() {},
  method_01__deps: ['$method_support'],
  method_02: function() {},
  method_01__deps: ['$method_support'],
  method_03: function() {},
  method_01__deps: ['$method_support'],
 });
```

---

### Linking with Emscripten Libraries (SDL2 Audio)

Source: https://emscripten.org/docs/getting_started/FAQ

Shows how to enable SDL2 audio support when compiling with Emscripten. This involves including the appropriate header and using a specific Emscripten compiler flag.

```c
#include <SDL2/SDL_mixer.h>

// Your SDL audio code here
// ...

// Compile with: emcc your_code.c -o your_app.js -sUSE_SDL_MIXER=2
```

---

### Get Current Time with Emscripten

Source: https://emscripten.org/docs/api_reference/emscripten.h

Retrieves the highest-precision representation of the current time provided by the browser. It uses either `Date.now` or `performance.now`. The returned value is relative and only meaningful when compared to other calls to this function. The result is in milliseconds.

```c
double emscripten_get_now(void)
```

---

### Get Fullscreen Status - C/C++

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the current fullscreen status of the page. The status is populated into the provided EmscriptenFullscreenChangeEvent structure. This function returns an EMSCRIPTEN_RESULT indicating success or failure.

```c
EMSCRIPTEN_RESULT emscripten_get_fullscreen_status(EmscriptenFullscreenChangeEvent *fullscreenStatus)
{
    // Implementation details for retrieving fullscreen status
    return EMSCRIPTEN_RESULT_SUCCESS;
}
```

---

### Bundle Everything into a Single File

Source: https://emscripten.org/docs/getting_started/FAQ

For local testing, you can bundle all assets into a single file using the -sSINGLE_FILE option. This prevents the need for XHR requests to 'file://' URLs, which can cause issues in some browsers.

```bash
emcc ... -sSINGLE_FILE ...
```

---

### Apache Pre-compression and Content Negotiation for .wasm

Source: https://emscripten.org/docs/compiling/WebAssembly

This Apache configuration optimizes serving of large .wasm files by pre-compressing them to .wasm.gz. It uses content negotiation to serve the appropriate file based on the client's capabilities.

```apache
Options Multiviews
RemoveType .gz
AddEncoding x-gzip .gz
AddType application/wasm .wasm

```

---

### C++ Example: Returning STL Container Data

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

This C++ code showcases how to define functions that return instances of std::vector, std::map, and std::optional, which can then be exposed to JavaScript using Embind. It includes necessary headers and the EMSCRIPTEN_BINDINGS macro for exporting these functions and types.

```cpp
#include <emscripten/bind.h>
#include <string>
#include <vector>
#include <optional>

using namespace emscripten;

std::vector<int> returnVectorData () {
  std::vector<int> v(10, 1);
  return v;
}

std::map<int, std::string> returnMapData () {
  std::map<int, std::string> m;
  m.insert(std::pair<int, std::string>(10, "This is a string."));
  return m;
}

std::optional<std::string> returnOptionalData() {
  return "hello";
}

EMSCRIPTEN_BINDINGS(module) {
  function("returnVectorData", &returnVectorData);
  function("returnMapData", &returnMapData);
  function("returnOptionalData", &returnOptionalData);

  // register bindings for std::vector<int>, std::map<int, std::string>, and
  // std::optional<std::string>.
  register_vector<int>("vector<int>");
  register_map<int, std::string>("map<int, string>");
  register_optional<std::string>();
}
```

---

### Remove Emscripten SDK Tool or Version

Source: https://emscripten.org/docs/tools_reference/emsdk

This command is used to delete a specified tool or SDK version from your local machine. For complete removal, refer to the Emscripten SDK uninstallation guide.

```bash
# Uninstall a specific tool or SDK.
./emsdk uninstall <tool/sdk name>
```

---

### Build Main Module with Emscripten

Source: https://emscripten.org/docs/compiling/Dynamic-Linking

Builds a part of your code as the main module, which includes system libraries. The output suffix should typically be .js.

```bash
emcc -sMAIN_MODULE main.c libsomething.wasm
```

---

### Instantiate and Connect Noise Generator Node (C/C++)

Source: https://emscripten.org/docs/api_reference/wasm_audio_worklets

This callback is invoked after the AudioWorkletProcessor is created. It configures the node's input/output channels and instantiates the Wasm Audio Worklet node using `emscripten_create_wasm_audio_worklet_node`. The node is then connected to the audio context's destination, and a click handler is set up for the canvas to resume the audio context.

```c++
void AudioWorkletProcessorCreated(EMSCRIPTEN_WEBAUDIO_T audioContext, bool success, void *userData)
{
  if (!success) return; // Check browser console in a debug build for detailed errors

  int outputChannelCounts[1] = { 1 };
  EmscriptenAudioWorkletNodeCreateOptions options = {
    .numberOfInputs = 0,
    .numberOfOutputs = 1,
    .outputChannelCounts = outputChannelCounts
  };

  // Create node
  EMSCRIPTEN_AUDIO_WORKLET_NODE_T wasmAudioWorklet = emscripten_create_wasm_audio_worklet_node(audioContext,
                                                            "noise-generator", &options, &GenerateNoise, 0);

  // Connect it to audio context destination
  emscripten_audio_node_connect(wasmAudioWorklet, audioContext, 0, 0);

  // Resume context on mouse click
  emscripten_set_click_callback("canvas", (void*)audioContext, 0, OnCanvasClick);
}
```

---

### Get Number of Connected Gamepads

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the number of gamepads connected to the browser tab after calling emscripten_sample_gamepad_data(). Returns EMSCRIPTEN_RESULT_NOT_SUPPORTED if the browser does not support gamepads. Note that a gamepad must have a button pressed to be detected.

```c
int emscripten_get_num_gamepads(void);
```

---

### Set Emscripten Trace Session Username

Source: https://emscripten.org/docs/api_reference/trace.h

Sets the username for the current tracing session. This is useful for identifying individual sessions when multiple users share a collector server. It can be set after tracing has started.

```c
void emscripten_trace_set_session_username(const char *username);
```

---

### Binding C++ Operators in IDL

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Demonstrates how to bind C++ operators to IDL using the `[Operator=]` attribute. The example shows binding the `+=` operator. Support is limited to specific binary operators and the array indexing operator.

```WebIDL
[Operator="+="] TYPE1 add(TYPE2 x);
```

---

### Get Current Visibility Status (C)

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the current page visibility state. This function populates a provided EmscriptenVisibilityChangeEvent structure with the latest visibility information and returns an Emscripten result code.

```c
EMSCRIPTEN_RESULT emscripten_get_visibility_status(EmscriptenVisibilityChangeEvent *visibilityStatus);
```

---

### Generate Source Map for Production Crash Logs with Emscripten

Source: https://emscripten.org/docs/porting/Debugging

This example demonstrates how to compile C code with Emscripten to generate a WebAssembly binary and an associated source map. The source map (-gsource-map) preserves source code location information, which is crucial for symbolizing stack traces and crash logs in production environments, even after post-link optimizations. The input object file must contain DWARF information for source map generation.

```bash
emcc source.c -c -o source.o -g
emcc source.o -o program.js -gsource-map
```

---

### Running an HTML file with a specific browser executable using emrun

Source: https://emscripten.org/docs/compiling/Running-html-files-with-emrun

This command allows you to specify the full path to a browser executable to run the HTML file. This is useful for browsers not detected by alias or installed in non-standard locations.

```shell
--browser /path/to/browser/executable page.html
```

---

### Get JavaScript Typeof Operator Result (C++)

Source: https://emscripten.org/docs/api_reference/val.h

Returns the result of a JavaScript `typeof` operator invoked on the current value. This is useful for runtime type checking of JavaScript values within C++.

```cpp
val typeof() const;
// Example:
// val jsStr = val("hello");
// val type = jsStr.typeof(); // type will be 'string'
```

---

### C/C++ Application Code with JavaScript Interop

Source: https://emscripten.org/docs/optimizing/Module-Splitting

This C code defines functions foo, bar, and unsupported. It uses EM_JS to call a JavaScript function `get_number` which prompts the user for input. The main function executes different C functions based on user input. This example is designed to be compiled with Emscripten's SPLIT_MODULE feature.

```c
#include <stdio.h>
#include <emscripten.h>

void foo() {
  printf("foo\n");
}

void bar() {
  printf("bar\n");
}

void unsupported(int i) {
  printf("%d is not supported!\n", i);
}

EM_JS(int, get_number, (), {
  if (typeof prompt === 'undefined') {
    prompt = require('prompt-sync')();
  }
  return parseInt(prompt('Give me 0 or 1: '));
});

int main() {
  int i = get_number();
  if (i == 0) {
    foo();
  } else if (i == 1) {
    bar();
  } else {
    unsupported(i);
  }
}

```

---

### Create and Run a Wasm Worker in C/C++

Source: https://emscripten.org/docs/api_reference/wasm_workers

This C/C++ example demonstrates how to create a new Wasm Worker, post a function to it for execution, and print a message from within the worker. It requires the Emscripten flag `-sWASM_WORKERS` during compilation and linking. The worker shares the same WebAssembly.Module and WebAssembly.Memory as the main thread.

```c
#include <emscripten/wasm_worker.h>
#include <stdio.h>

void run_in_worker()
{
  printf("Hello from Wasm Worker!\n");
}

int main()
{
  emscripten_wasm_worker_t worker = emscripten_malloc_wasm_worker(/*stackSize: */1024);
  emscripten_wasm_worker_post_function_v(worker, run_in_worker);
}

```

---

### Generate Bindings Glue Code with WebIDL Binder

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

This command demonstrates how to use the `webidl_binder.py` script to generate C++ and JavaScript glue code. It takes the WebIDL file as input and specifies the base name for the output glue files.

```bash
tools/webidl_binder my_classes.idl glue

```

---

### Implement Abstract C++ Interface in JavaScript

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

This example shows how to bind a C++ interface with a pure virtual function (`invoke`) and allow it to be implemented in JavaScript. It uses Embind's `class_`, `function`, `pure_virtual()`, and `allow_subclass<Wrapper>()` to create the binding. The `InterfaceWrapper` acts as glue code for calling JavaScript methods from C++.

```C++
struct Interface {
    virtual ~Interface() {}
    virtual void invoke(const std::string& str) = 0;
};

struct InterfaceWrapper : public wrapper<Interface> {
    EMSCRIPTEN_WRAPPER(InterfaceWrapper);
    void invoke(const std::string& str) {
        return call<void>("invoke", str);
    }
};

EMSCRIPTEN_BINDINGS(interface) {
    class_<Interface>("Interface")
        .function("invoke", &Interface::invoke, pure_virtual())
        .allow_subclass<InterfaceWrapper>("InterfaceWrapper")
        ;
}

```

---

### Pass Raw JavaScript Handles between C++ and JavaScript using emscripten::val

Source: https://emscripten.org/docs/api_reference/val.h

This example shows how to exchange raw JavaScript value handles between C++ and JavaScript. `as_handle()` converts a `val` to a raw handle for JavaScript, and `take_ownership()` converts a raw handle back to a `val` in C++.

```C++
EM_JS(void, log_value, (EM_VAL val_handle), {
  var value = Emval.toValue(val_handle);
  console.log(value); // 42
});

val foo(42);
log_value(foo.as_handle());

EM_ASYNC_JS(EM_VAL, fetch_json_from_url, (const char *url), {
  var url = UTF8ToString(url);
  var response = await fetch(url);
  var json = await response.json();
  return Emval.toHandle(json);
});

val obj = val::take_ownership(fetch_json_from_url("https://httpbin.org/json"));
std::string author = obj["slideshow"]["author"].as<std::string>();
```

---

### Modularized Emscripten Output Initialization (JavaScript)

Source: https://emscripten.org/docs/getting_started/FAQ

When using Emscripten's modularized output, this snippet shows how to initialize and interact with the module. It utilizes a factory function that returns a promise, allowing you to safely call module methods only after the promise resolves, indicating the runtime is ready.

```javascript
createMyModule(/* optional default settings */).then((myModule) => {
  // this is reached when everything is ready, and you can call methods on Module
});
```

---

### Get Absolute Path from Node (JS)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Retrieves the absolute path to a given node within the Emscripten file system, considering any mounted file systems. This function takes a node object as an argument and returns its absolute path as a string.

```javascript
var node = FS.lookupPath("/some/node").node;
var path = FS.getPath(node);
```

---

### Fetch API - Basic Usage

Source: https://emscripten.org/docs/api_reference/fetch

Demonstrates how to download a file from a web server asynchronously to memory using the Fetch API.

````APIDOC
## GET /emscripten/fetch

### Description
Downloads a file from a web server asynchronously to the application heap memory.

### Method
GET

### Endpoint
`/` (relative to current page URL) or an absolute URL.

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```c
#include <stdio.h>
#include <string.h>
#include <emscripten/fetch.h>

void downloadSucceeded(emscripten_fetch_t *fetch) {
  printf("Finished downloading %llu bytes from URL %s.\n", fetch->numBytes, fetch->url);
  // The data is now available at fetch->data[0] through fetch->data[fetch->numBytes-1];
  emscripten_fetch_close(fetch); // Free data associated with the fetch.
}

void downloadFailed(emscripten_fetch_t *fetch) {
  printf("Downloading %s failed, HTTP failure status code: %d.\n", fetch->url, fetch->status);
  emscripten_fetch_close(fetch); // Also free data on failure.
}

int main() {
  emscripten_fetch_attr_t attr;
  emscripten_fetch_attr_init(&attr);
  strcpy(attr.requestMethod, "GET");
  attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY;
  attr.onsuccess = downloadSucceeded;
  attr.onerror = downloadFailed;
  emscripten_fetch(&attr, "myfile.dat");
}
````

### Response

#### Success Response (200)

Data is loaded into memory and available via `fetch->data`.

#### Response Example

(Callback `downloadSucceeded` is invoked)

````

--------------------------------

### Emscripten Get Element CSS Size

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the current CSS dimensions (width and height) of an HTML element identified by a CSS selector. It returns the dimensions as they are applied by CSS, not necessarily the pixel dimensions.

```c
EMSCRIPTEN_RESULT emscripten_get_element_css_size(const char *target, double *width, double *height);
````

---

### Catching Null Dereference Without UBSan

Source: https://emscripten.org/docs/debugging/Sanitizers

Demonstrates the behavior of dereferencing a null pointer in Emscripten without UBSan enabled. This example shows that a runtime error might occur upon program exit, but it doesn't pinpoint the exact location of the error.

```c
int main(void) {
    int *a = 0;
    *a = 0;
}
```

```bash
emcc null-assign.c
node a.out.js
```

---

### File System Devices

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Explains how to create and register custom devices within the Emscripten file system.

````APIDOC
## File System Devices

### Description
Emscripten's file system API allows for the creation and registration of custom devices.

### Functions

- **`FS.makedev(major, minor)`**: Creates a device identifier from major and minor numbers.
  - **Parameters**:
    - `major` (number) - The major device number.
    - `minor` (number) - The minor device number.
  - **Returns**: A number representing the device identifier.

- **`FS.registerDevice(dev, ops)`**: Registers a custom device with the file system.
  - **Parameters**:
    - `dev` (number) - The device identifier created by `FS.makedev()`.
    - `ops` (object) - An object containing file operations for the device (e.g., `open`, `read`, `write`).
  - **Example `ops` object**:
    ```javascript
    {
      open: function(stream) { /* ... */ },
      close: function(stream) { /* ... */ },
      read: function(stream) { /* ... */ },
      write: function(stream) { /* ... */ }
    }
    ```

### Standard I/O Devices
Emscripten sets up standard I/O devices like `/dev/null`, `/dev/random`, `/dev/stdin`, and `/proc/self/fd` automatically. See `FS.staticInit()` for details.
````

---

### Get Current WebGL Context

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves a handle to the currently active WebGL rendering context. Returns 0 if no context is currently active. Calling WebGL functions without an active context is undefined behavior.

```c
EMSCRIPTEN_WEBGL_CONTEXT_HANDLE emscripten_webgl_get_current_context();
```

---

### Merge Multiple Profiles with wasm-split

Source: https://emscripten.org/docs/optimizing/Module-Splitting

This command merges multiple profile data files into a single profile file that can be used by wasm-split. This allows the splitting process to be guided by a comprehensive set of execution paths from various workloads. The output profile is saved to the specified output file.

```bash
$ wasm-split --merge-profiles profile1.data profile2.data -o profile.data
```

---

### Get Emscripten Compiler Setting Value

Source: https://emscripten.org/docs/api_reference/emscripten.h

Retrieves the value of a specified Emscripten compiler setting. It can return integer or string values. For string results, the 'long' return type must be cast to 'char\*'. This function requires the '-sRETAIN_COMPILER_SETTINGS' build flag.

```c
long compiler_setting_value = emscripten_get_compiler_setting("INITIAL_MEMORY");
// For string values:
// char* setting_str = (char*)emscripten_get_compiler_setting("EMSCRIPTEN_VERSION");
```

---

### Code Size Optimization with -O3 or -Os

Source: https://emscripten.org/docs/getting_started/FAQ

To minimize the size of your compiled code, use the -O3 or -Os flags. These options enable aggressive optimization and minification. Consider further size reduction techniques like closure compiler and gzip compression on your webserver.

```bash
emcc ... -O3 ...
```

```bash
emcc ... -Os ...
```

---

### Emscripten Get WebGL Drawing Buffer Size

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the drawing buffer dimensions (width and height) of a specified WebGL context. Requires a valid WebGL context handle and pointers to store the width and height.

```c
EMSCRIPTEN_RESULT emscripten_webgl_get_drawing_buffer_size(EMSCRIPTEN_WEBGL_CONTEXT_HANDLE context, int *width, int *height);
```

---

### Get Value from Emscripten Heap Memory

Source: https://emscripten.org/docs/api_reference/preamble.js

The `getValue` function retrieves a value from a specific memory address in the Emscripten heap at runtime. It requires a memory pointer and an LLVM IR type string. This function performs aligned reads and is a lower-level operation.

```javascript
getValue(_ptr_, _type_);
```

---

### Asyncify Imports for Dynamic Linking in C/C++

Source: https://emscripten.org/docs/porting/asyncify

Illustrates how to use `ASYNCIFY_IMPORTS` when dealing with dynamic libraries. Functions imported from other modules that might be on the stack during an asynchronous operation must be listed in `ASYNCIFY_IMPORTS` to ensure correct Asyncify instrumentation. This example shows a `sleep_for_seconds` function compiled as a side module.

```c++
// sleep.cpp
#include <emscripten.h>

extern "C" void sleep_for_seconds() {
  emscripten_sleep(100);
}

```

```c++
// main.cpp
#include <emscripten.h>

extern "C" void sleep_for_seconds();

int main() {
  sleep_for_seconds();
  return 0;
}

```

---

### Custom Module Loading Hook for Emscripten

Source: https://emscripten.org/docs/optimizing/Module-Splitting

Implement the `loadSplitModule` custom hook to override the default logic for lazily loading secondary Emscripten modules. This function is called from placeholder functions and should return the instance and module pair for the secondary module. It takes the deferred module path, import object, and placeholder property as arguments. The example demonstrates basic logging and uses `instantiateSync` for loading.

```javascript
Module["loadSplitModule"] = function (deferred, imports, prop) {
  console.log("Custom handler for loading split module.");
  console.log("Called with placeholder ", prop);

  return instantiateSync(deferred, imports);
};
```

---

### Configuring 64-bit Integer ABI for Emscripten C Functions

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Shows how to configure a C function in Emscripten to handle 64-bit integer arguments using the `__i53abi` decorator for 53-bit precision, or by relying on `-sWASM_BIGINT`.

```javascript
_set_file_size__i53abi: true,  // Handle 64-bit
_set_file_size__sig: 'iij',    // Function signature
_set_file_size: function(handle, size) { ... return error; }
```

---

### File Preloading API

Source: https://emscripten.org/docs/api_reference/emscripten.h

Asynchronously runs preload plugins on a given file. Callbacks are provided for successful processing or errors.

```APIDOC
## emscripten_run_preload_plugins

### Description
Runs preload plugins on a file asynchronously. This is useful for decoding assets like images or audio before they are used. Callbacks are triggered upon completion or error, receiving the filename as an argument.

### Method
(Implied asynchronous function call)

### Endpoint
(Not applicable, browser API interaction)

### Parameters
#### Path Parameters
(None)

#### Query Parameters
(None)

#### Request Body
- **file** (const char*) - Required - The name of the file to process.
- **onload** (em_str_callback_func) - Required - Callback function on successful processing. Receives the `file` name as a parameter.
- **onerror** (em_str_callback_func) - Required - Callback function on failure. Receives the `file` name as a parameter.

### Returns
- **int**: 0 if successful, -1 if the file does not exist.
```

---

### Configure Emscripten Module API Support

Source: https://emscripten.org/docs/api_reference/module

This example illustrates how to configure the `INCOMING_MODULE_JS_API` compiler setting in Emscripten. This setting controls which `Module` attributes are supported in the emitted JavaScript, allowing for code size optimization. By specifying an empty array `[]`, you disable all `Module` attributes. By listing specific attributes like `print` and `printErr`, you enable only those.

```c
#include <stdio.h>

int main() {
    printf("Hello, world!\n");
    return 0;
}

```

---

### Emscripten Class Binding Get Downcaster Prototype

Source: https://emscripten.org/docs/api_reference/bind.h

A static method within the `class_` template that retrieves the downcaster function for a given `ClassType`. This is used to safely cast base class pointers to derived class pointers.

```cpp
template<typename ClassType>
static Downcaster<ClassType> getDowncaster()
```

---

### Emscripten Class Binding Get Upcaster Prototype

Source: https://emscripten.org/docs/api_reference/bind.h

A static method within the `class_` template that retrieves the upcaster function for a given `ClassType`. This is used to safely cast derived class pointers to base class pointers.

```cpp
template<typename ClassType>
static Upcaster<ClassType> getUpcaster()
```

---

### Emitting DWARF Debug Information (Emcc)

Source: https://emscripten.org/docs/porting/Debugging

This example demonstrates how to generate DWARF debug information for object files and then link them to produce a final program with DWARF sections and a name section in the WASM binary. It highlights the use of the -g flag at both compile and link time. DWARF information can be large, and options like -gseparate-dwarf can be used to emit it in a separate file.

```c
emcc source.c -c -o source.o -g
emcc source.o -o program.js -g
```

---

### Enable Compile-Time Evaluation (EVAL_CTORS)

Source: https://emscripten.org/docs/optimizing/Optimizing-Code

The `-sEVAL_CTORS` flag evaluates as much code as possible at compile time, including global constructors and `main()`. This can reduce startup time by snapshotting the resulting state into the Wasm module. It may increase code size in some scenarios, so benchmarking is recommended. Calls to imports, `argc/argv`, and `getenv()` can hinder this optimization. Use `-sEVAL_CTORS=2` to ignore external input and potentially improve evaluation success.

```bash
emcc -sEVAL_CTORS=1 my_program.c -o my_program.html
emcc -sEVAL_CTORS=2 my_program.c -o my_program.html
```

---

### Using MODULARIZE with Promises

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Demonstrates how to use the factory function generated by MODULARIZE=1. The factory function, typically named by EXPORT_NAME, returns a promise that resolves to the module instance. This allows for asynchronous loading and initialization of the Emscripten module.

```javascript
const module = await EXPORT_NAME();

// or
let module;
EXPORT_NAME().then((instance) => {
  module = instance;
});
```

---

### Get Latest Device Orientation Status (C/C++)

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the most recent device orientation event state. This function requires that 'emscripten_set_deviceorientation_callback()' has been previously called to enable state capture. The orientation data is populated into the provided 'EmscriptenDeviceOrientationEvent' structure.

```c
EMSCRIPTEN_RESULT emscripten_get_deviceorientation_status(EmscriptenDeviceOrientationEvent *orientationState);
```

---

### Compile C to JavaScript and WebAssembly

Source: https://emscripten.org/docs/getting_started/Tutorial

This command compiles a C source file into JavaScript and WebAssembly. It uses the Emscripten Compiler Frontend (emcc) to perform the translation. The input is a C file (e.g., hello_world.c), and the output includes a JavaScript file (e.g., a.out.js) for runtime support and a WebAssembly file (e.g., a.out.wasm) containing the compiled code.

```shell
./emcc test/hello_world.c

```

---

### Generate C Struct Information

Source: https://emscripten.org/docs/contributing/developers_guide

These commands regenerate information used by JavaScript when C struct layouts or defines change. Running both commands is necessary for full compatibility, especially with WASM64. Failure to run these will cause the `test_gen_struct_info` test to fail.

```bash
./tools/gen_struct_info.py
```

```bash
./tools/gen_struct_info.py --wasm64
```

---

### Interact with Web Audio API from C++ using emscripten::val

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

This C++ code uses emscripten::val to interact with the JavaScript Web Audio API. It demonstrates getting global JavaScript objects, creating new instances, calling methods, and setting properties. Dependencies include Embind and standard C++ libraries.

```javascript
// Get web audio api context
var AudioContext = window.AudioContext || window.webkitAudioContext;

// Got an AudioContext: Create context and OscillatorNode
var context = new AudioContext();
var oscillator = context.createOscillator();

// Configuring oscillator: set OscillatorNode type and frequency
oscillator.type = "triangle";
oscillator.frequency.value = 261.63; // value in hertz - middle C

// Playing
oscillator.connect(context.destination);
oscillator.start();

// All done!
```

```cpp
#include <emscripten/val.h>
#include <stdio.h>
#include <math.h>

using namespace emscripten;

int main() {
  val AudioContext = val::global("AudioContext");
  if (!AudioContext.as<bool>()) {
    printf("No global AudioContext, trying webkitAudioContext\n");
    AudioContext = val::global("webkitAudioContext");
  }

  printf("Got an AudioContext\n");
  val context = AudioContext.new_();
  val oscillator = context.call<val>("createOscillator");

  printf("Configuring oscillator\n");
  oscillator.set("type", val("triangle"));
  oscillator["frequency"].set("value", val(261.63)); // Middle C

  printf("Playing\n");
  oscillator.call<void>("connect", context["destination"]);
  oscillator.call<void>("start", 0);

  printf("All done!\n");
}

```

---

### Access JavaScript Object Properties in C++ using emscripten::val

Source: https://emscripten.org/docs/api_reference/val.h

This example shows how to read properties of a JavaScript object from C++ using the emscripten::val class. It uses the `operator[]()` to access the 'readyState' property and `as<int>()` to coerce the JavaScript value to a C++ integer for comparison.

```C++
const char* state;
switch (xhr["readyState"].as<int>()) {
case 0:
  state = "UNSENT"; break;
case 1:
  state = "OPENED"; break;
default:
  state = "etc";
}
```

---

### Compile C to HTML with Exported Functions and Runtime Methods

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

This command compiles a C++ file into an HTML file, exporting the 'int_sqrt' function and enabling the 'ccall' and 'cwrap' runtime methods. EXPORTED_FUNCTIONS ensures 'int_sqrt' is not removed by dead code elimination, and EXPORTED_RUNTIME_METHODS includes necessary Emscripten runtime functions.

```bash
emcc test/hello_function.cpp -o function.html -sEXPORTED_FUNCTIONS=_int_sqrt -sEXPORTED_RUNTIME_METHODS=ccall,cwrap

```

---

### Pointerlockchange Callback API

Source: https://emscripten.org/docs/api_reference/html5.h

Register a callback function to receive pointerlockchange events. This event is triggered when the pointer lock state changes, for example, when the mouse cursor is hidden and the target element receives exclusive relative mouse movement events.

````APIDOC
## POST /emscripten_set_pointerlockchange_callback

### Description
Registers a callback function for receiving the pointerlockchange event. Pointer lock hides the mouse cursor and exclusively gives the target element relative mouse movement events via the mousemove event.

### Method
POST

### Endpoint
/emscripten_set_pointerlockchange_callback

### Parameters
#### Request Body
- **target** (string) - Required - Target HTML element id.
- **userData** (void*) - Optional - User-defined data to be passed to the callback.
- **useCapture** (boolean) - Optional - Set true to use capture.
- **callback** (function) - Required - A callback function to handle pointerlockchange events. It receives event type, event info, and userData. Should return true if the event is consumed.

### Request Example
```json
{
  "target": "#myCanvas",
  "userData": null,
  "useCapture": false,
  "callback": "function(eventType, event, userData) { console.log('Pointerlock change event:', event); return true; }"
}
````

### Response

#### Success Response (200)

- **result** (EMSCRIPTEN_RESULT) - Indicates success or failure of the operation. Expected to be EMSCRIPTEN_RESULT_SUCCESS on successful registration.

````

--------------------------------

### Emscripten Build Options (-sOPTION)

Source: https://emscripten.org/docs/tools_reference/emcc

The -sOPTION[=VALUE] flag allows setting Emscripten-specific build options. Options can be boolean (defaulting to 1 if no value), lists (comma-separated or quoted), or read from a file using '@'.

```bash
# Set a boolean option (e.g., enable exit runtime)
emcc source.c -sEXIT_RUNTIME=1 -o output.js

# Set an option with no space between -s and option name
emcc source.c -sFULL_ES3=1 -o output.js

# Set an option with a comma-separated list
emcc source.c -sEXPORTED_FUNCTIONS=foo,bar -o output.js

# Set an option with a quoted list
emcc source.c -sEXPORTED_FUNCTIONS="foo","bar" -o output.js

# Set an option with brackets and quotes
emcc source.c -sEXPORTED_FUNCTIONS="['liblib.so']" -o output.js

# Set an option with brackets and quotes, shell quoted
emcc -s"EXPORTED_FUNCTIONS=['liblib.so']" source.c -o output.js

# Set an option from a file (list of symbols, one per line)
emcc source.c -sEXPORTED_FUNCTIONS=@/path/to/file -o output.js

# Set an option from a JSON formatted file
emcc source.c -sEXPORTED_FUNCTIONS=@/path/to/json_file.json -o output.js
````

---

### Open File with FS.open

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Opens a file with specified flags for reading, writing, or appending. The 'flags' argument determines the mode of operation, and 'mode' can set permissions if the file is created.

```javascript
FS.open(_path_ , _flags_[, _mode_])
```

---

### Include C++ Glue Code Wrapper

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

This C++ code snippet shows how to create a wrapper file that includes the generated glue code (`glue.cpp`) and the necessary headers for the C++ classes being bound. This ensures that the C++ classes are available to the generated glue code.

```cpp
#include <...> // Where "..." represents the headers for the classes we are binding.
#include <glue.cpp>

```

---

### Get Current Emscripten Stack Pointer (C)

Source: https://emscripten.org/docs/api_reference/stack.h

Returns the current position of the stack pointer within the WebAssembly data stack. This value indicates how much of the stack is currently in use and is essential for manual stack management or debugging.

```c
uintptr_t emscripten_stack_get_current(void);
```

---

### FS.syncfs

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Synchronizes all mounted file systems asynchronously. Currently, only IDBFS implements the necessary interfaces for synchronization.

````APIDOC
## FS.syncfs

### Description
Responsible for iterating and synchronizing all mounted file systems in an asynchronous fashion. Currently, only the IDBFS file system implements the interfaces needed for synchronization. All other file systems are completely synchronous and don’t require synchronization.

### Method
FS.syncfs

### Parameters
#### Path Parameters
- **populate** (boolean) - Required - `true` to initialize Emscripten’s file system data with the data from the file system’s persistent source, and `false` to save Emscripten`s file system data to the file system’s persistent source.
- **callback** (function) - Required - A notification callback function that is invoked on completion of the synchronization. If an error occurred, it will be provided as a parameter to this function.

### Request Example
```javascript
// Example for populating the FS from persistent storage
FS.syncfs(true, function (err) {
  if (err) {
    console.error('Error populating FS:', err);
  } else {
    console.log('FS populated successfully.');
  }
});

// Example for saving FS data to persistent storage
FS.syncfs(false, function (err) {
  if (err) {
    console.error('Error saving FS:', err);
  } else {
    console.log('FS saved successfully.');
  }
});
````

### Response

The callback function receives an `err` parameter which will be null on success or an error object on failure.

````

--------------------------------

### C Function to Get Device Motion Status

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the most recent device motion event state. This function requires that a callback has already been registered using emscripten_set_devicemotion_callback. It populates a provided EmscriptenDeviceMotionEvent structure and returns an Emscripten result code.

```c
EMSCRIPTEN_RESULT emscripten_get_devicemotion_status(EmscriptenDeviceMotionEvent *motionState);
````

---

### Emscripten Get Canvas Element Pixel Size

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the current pixel dimensions (width and height) of a specified Canvas element in the DOM. Requires a CSS selector for the target canvas and non-null pointers to store the retrieved width and height.

```c
EMSCRIPTEN_RESULT emscripten_get_canvas_element_size(const char *target, int *width, int *height);
```

---

### Get Free Bytes on Emscripten Stack (C)

Source: https://emscripten.org/docs/api_reference/stack.h

Calculates and returns the number of free bytes remaining on the WebAssembly data stack. This function is optimized for speed and can be called frequently to monitor stack usage without significant performance impact.

```c
size_t emscripten_stack_get_free(void);
```

---

### Query Audio Context Sample Rate (C/Emscripten)

Source: https://emscripten.org/docs/porting/Audio

This C code snippet, designed for Emscripten environments, uses EM_ASM_INT to execute Javascript code directly. The Javascript retrieves the sample rate from a newly created AudioContext. It's crucial to avoid calling this function multiple times as caching the result is left to the user. The primary dependency is the Emscripten environment and browser's Web Audio API.

```c
#ifdef __EMSCRIPTEN__

#include <emscripten.h>

// Avoid calling this more than once! Caching the value is up to you.
unsigned query_sample_rate_of_audiocontexts() {
    return EM_ASM_INT({
        var AudioContext = window.AudioContext || window.webkitAudioContext;
        var ctx = new AudioContext();
        var sr = ctx.sampleRate;
        ctx.close();
        return sr;
    });
}
#endif

```

---

### Set Emscripten Environment Variables with preRun

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

This JavaScript snippet shows how to set environment variables for Emscripten compiled code using the `Module.preRun` callback. The `ENV` object is modified within `preRun` to ensure variables like `MY_FILE_ROOT` are available before the main execution loop starts. Setting a variable to `undefined` can prevent Emscripten from setting default values.

```javascript
Module.preRun = () => {
  ENV.MY_FILE_ROOT = "/usr/lib/test";
};

Module.preRun = () => {
  ENV.LANG = undefined;
};
```

---

### emscripten_async_wget

Source: https://emscripten.org/docs/api_reference/emscripten.h

Loads a file from a URL asynchronously. It fetches the URL, executes preload plugins, and calls callbacks upon successful load or error.

````APIDOC
## emscripten_async_wget

### Description
Loads a file from a URL asynchronously. In addition to fetching the URL from the network, preload plugins are executed so that the data is usable in `IMG_Load` and so forth. When the file is ready the `onload` callback will be called. If any error occurs `onerror` will be called. The callbacks are called with the file as their argument.

### Method
`void`

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
* **url** (const char*) - The URL to load.
* **file** (const char*) - The name of the file created and loaded from the URL. If the file already exists it will be overwritten. If the destination directory for the file does not exist on the filesystem, it will be created. A relative pathname may be passed, which will be interpreted relative to the current working directory at the time of the call to this function.
* **onload** (em_str_callback_func) - Callback on successful load of the file. The callback function parameter value is:
  * _(const char_)* : The name of the `file` that was loaded from the URL.
* **onerror** (em_str_callback_func) - Callback in the event of failure. The callback function parameter value is:
  * _(const char_)* : The name of the `file` that failed to load from the URL.

### Request Example
```c
emscripten_async_wget("http://example.com/data.txt", "local_data.txt", onload_callback, onerror_callback);
````

### Response

#### Success Response (void)

No direct response, relies on callbacks.

#### Response Example

```c
void onload_callback(const char* filename) {
  printf("File %s loaded successfully.\n", filename);
}

void onerror_callback(const char* filename) {
  printf("Error loading file %s.\n", filename);
}
```

````

--------------------------------

### Perform Synchronous Fetch Operation in C/C++

Source: https://emscripten.org/docs/api_reference/fetch

Demonstrates how to perform a synchronous HTTP GET request using Emscripten's Fetch API. This method blocks the calling thread until the fetch operation completes, simplifying code flow by avoiding callbacks. It's crucial to note the build mode restrictions for synchronous operations.

```c++
int main() {
  emscripten_fetch_attr_t attr;
  emscripten_fetch_attr_init(&attr);
  strcpy(attr.requestMethod, "GET");
  attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY | EMSCRIPTEN_FETCH_SYNCHRONOUS;
  emscripten_fetch_t *fetch = emscripten_fetch(&attr, "file.dat"); // Blocks here until the operation is complete.
  if (fetch->status == 200) {
    printf("Finished downloading %llu bytes from URL %s.\n", fetch->numBytes, fetch->url);
    // The data is now available at fetch->data[0] through fetch->data[fetch->numBytes-1];
  } else {
    printf("Downloading %s failed, HTTP failure status code: %d.\n", fetch->url, fetch->status);
  }
  emscripten_fetch_close(fetch);
}
````

---

### Sample Gamepad Data

Source: https://emscripten.org/docs/api_reference/html5.h

Samples the current state of connected gamepad data. This function must be called before retrieving gamepad information. It returns success if the Gamepad API is supported, or not supported otherwise.

```c
EMSCRIPTEN_RESULT emscripten_sample_gamepad_data(void);
```

---

### Build with Profiling and Optimization Flags in Emscripten

Source: https://emscripten.org/docs/optimizing/Optimizing-Code

This command compiles C++ source files to Emscripten bytecode with optimization level 2 and enables profiling information. Profiling data is crucial for identifying performance bottlenecks in JavaScript environments. Ensure you use this flag when building for performance analysis.

```bash
emcc -O2 --profiling file.cpp
```

---

### Get Emscripten Stack End Address (C)

Source: https://emscripten.org/docs/api_reference/stack.h

Retrieves the end address of the WebAssembly data stack. This address marks the limit of the stack's usable memory. Note that the stack grows downwards, so this address is smaller than the base address.

```c
uintptr_t emscripten_stack_get_end(void);
```

---

### Blocking Audio Capture in Emscripten

Source: https://emscripten.org/docs/porting/Audio

This code snippet demonstrates a common pitfall in Emscripten where blocking calls within a loop, such as `alcGetIntegerv` for capturing samples, will indefinitely block the main loop. This is because Emscripten applications do not typically use separate threads for audio processing like native applications do.

```c
while(nframes < THE_NUMBER_OF_FRAMES_WE_WANT)
    alcGetIntegerv(device, ALC_CAPTURE_SAMPLES, 1, &nframes);

```

---

### Filesystem Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Settings that control the behavior and inclusion of filesystem support within the compiled WebAssembly module.

```APIDOC
## CASE_INSENSITIVE_FS

If set to nonzero, the provided virtual filesystem if treated case-insensitive, like Windows and macOS do. If set to 0, the VFS is case-sensitive, like on Linux.
Default value: false

### FILESYSTEM

If set to 0, does not build in any filesystem support. Useful if you are just doing pure computation, but not reading files or using any streams (including fprintf, and other stdio.h things) or anything related. The one exception is there is partial support for printf, and puts, hackishly. The compiler will automatically set this if it detects that syscall usage (which is static) does not require a full filesystem. If you still want filesystem support, use FORCE_FILESYSTEM
Default value: true

### FORCE_FILESYSTEM

Makes full filesystem support be included, even if statically it looks like it is not used. For example, if your C code uses no files, but you include some JS that does, you might need this.
Default value: false
```

---

### SIMD Intrinsics Overview

Source: https://emscripten.org/docs/porting/simd

A comprehensive list of Emscripten's SIMD intrinsics and their corresponding Wasm SIMD support or emulation methods.

```APIDOC
## SIMD Intrinsics Status

This section details the status of various SIMD intrinsics in Emscripten, indicating their support level in WebAssembly (Wasm) SIMD.

### Intrinsics List

- **_mm_loadl_pd**
  - Status: ❌ No Wasm SIMD support.
  - Emulation: Emulated with scalar loads + shuffle.

- **_mm_loadr_pd**
  - Status: 💡 Virtual.
  - Emulation: Simd load + shuffle.

- **_mm_loadu_pd**
  - Status: 🟡 wasm_v128_load. VM must guess type.

- **_mm_loadu_si128**
  - Status: 🟡 wasm_v128_load. VM must guess type.

- **_mm_loadu_si64**
  - Status: ❌ Emulated with const+scalar load+replace lane.

- **_mm_loadu_si32**
  - Status: ❌ Emulated with const+scalar load+replace lane.

- **_mm_loadu_si16**
  - Status: ❌ Emulated with const+scalar load+replace lane.

- **_mm_madd_epi16**
  - Status: ✅ wasm_i32x4_dot_i16x8.

- **_mm_maskmoveu_si128**
  - Status: ❌ Scalarized.

- **_mm_max_epi16**
  - Status: ✅ wasm_i16x8_max.

- **_mm_max_epu8**
  - Status: ✅ wasm_u8x16_max.

- **_mm_max_pd**
  - Status: TODO: Migrate to wasm_f64x2_pmax.

- **_mm_max_sd**
  - Status: ⚠️ Emulated with a shuffle.

- **_mm_mfence**
  - Status: ⚠️ A full barrier in multithreaded builds.

- **_mm_min_epi16**
  - Status: ✅ wasm_i16x8_min.

- **_mm_min_epu8**
  - Status: ✅ wasm_u8x16_min.

- **_mm_min_pd**
  - Status: TODO: Migrate to wasm_f64x2_pmin.

- **_mm_min_sd**
  - Status: ⚠️ Emulated with a shuffle.

- **_mm_move_epi64**
  - Status: 💡 Emulated with a shuffle. VM must guess type.

- **_mm_move_sd**
  - Status: 💡 Emulated with a shuffle. VM must guess type.

- **_mm_movemask_epi8**
  - Status: ✅ wasm_i8x16_bitmask.

- **_mm_movemask_pd**
  - Status: ✅ wasm_i64x2_bitmask.

- **_mm_mul_epu32**
  - Status: ⚠️ Emulated with wasm_u64x2_extmul_low_u32x4 + 2 shuffles.

- **_mm_mul_pd**
  - Status: ✅ wasm_f64x2_mul.

- **_mm_mul_sd**
  - Status: ⚠️ Emulated with a shuffle.

- **_mm_mulhi_epi16**
  - Status: ⚠️ Emulated with a 2x SIMD extmul+generic shuffle.

- **_mm_mulhi_epu16**
  - Status: ⚠️ Emulated with a 2x SIMD extmul+generic shuffle.

- **_mm_mullo_epi16**
  - Status: ✅ wasm_i16x8_mul.

- **_mm_or_pd**
  - Status: 🟡 wasm_v128_or. VM must guess type.

- **_mm_or_si128**
  - Status: 🟡 wasm_v128_or. VM must guess type.

- **_mm_packs_epi16**
  - Status: ✅ wasm_i8x16_narrow_i16x8.

- **_mm_packs_epi32**
  - Status: ✅ wasm_i16x8_narrow_i32x4.

- **_mm_packus_epi16**
  - Status: ✅ wasm_u8x16_narrow_i16x8.

- **_mm_pause**
  - Status: 💭 No-op.

- **_mm_sad_epu8**
  - Status: ⚠️ Emulated with eleven SIMD instructions+const.

- **_mm_set_epi16**
  - Status: ✅ wasm_i16x8_make.

- **_mm_set_epi32**
  - Status: ✅ wasm_i32x4_make.

- **_mm_set_epi64 (_mm_set_epi64x)**
  - Status: ✅ wasm_i64x2_make.

- **_mm_set_epi8**
  - Status: ✅ wasm_i8x16_make.

- **_mm_set_pd**
  - Status: ✅ wasm_f64x2_make.

- **_mm_set_sd**
  - Status: 💡 Emulated with wasm_f64x2_make.

- **_mm_set1_epi16**
  - Status: ✅ wasm_i16x8_splat.

- **_mm_set1_epi32**
  - Status: ✅ wasm_i32x4_splat.

- **_mm_set1_epi64 (_mm_set1_epi64x)**
  - Status: ✅ wasm_i64x2_splat.

- **_mm_set1_epi8**
  - Status: ✅ wasm_i8x16_splat.

- **_mm_set1_pd (_mm_set_pd1)**
  - Status: ✅ wasm_f64x2_splat.

- **_mm_setr_epi16**
  - Status: ✅ wasm_i16x8_make.

- **_mm_setr_epi32**
  - Status: ✅ wasm_i32x4_make.

- **_mm_setr_epi64**
  - Status: ✅ wasm_i64x2_make.

- **_mm_setr_epi8**
  - Status: ✅ wasm_i8x16_make.

- **_mm_setr_pd**
  - Status: ✅ wasm_f64x2_make.

- **_mm_setzero_pd**
  - Status: 💡 Emulated with wasm_f64x2_const.

- **_mm_setzero_si128**
  - Status: 💡 Emulated with wasm_i64x2_const.

- **_mm_shuffle_epi32**
  - Status: 💡 Emulated with a general shuffle.

- **_mm_shuffle_pd**
  - Status: 💡 Emulated with a general shuffle.

- **_mm_shufflehi_epi16**
  - Status: 💡 Emulated with a general shuffle.

- **_mm_shufflelo_epi16**
  - Status: 💡 Emulated with a general shuffle.

- **_mm_sll_epi16**
  - Status: ❌ Scalarized.

- **_mm_sll_epi32**
  - Status: ❌ Scalarized.

- **_mm_sll_epi64**
  - Status: ❌ Scalarized.

- **_mm_slli_epi16**
  - Status: 💡 wasm_i16x8_shl. ✅ if shift count is immediate constant.

- **_mm_slli_epi32**
  - Status: 💡 wasm_i32x4_shl. ✅ if shift count is immediate constant.

- **_mm_slli_epi64**
  - Status: 💡 wasm_i64x2_shl. ✅ if shift count is immediate constant.

- **_mm_slli_si128 (_mm_bslli_si128)**
  - Status: 💡 Emulated with a general shuffle.

- **_mm_sqrt_pd**
  - Status: ✅ wasm_f64x2_sqrt.

- **_mm_sqrt_sd**
  - Status: ⚠️ Emulated with a shuffle.

- **_mm_sra_epi16**
  - Status: ❌ Scalarized.

- **_mm_sra_epi32**
  - Status: ❌ Scalarized.

- **_mm_srai_epi16**
  - Status: 💡 wasm_i16x8_shr. ✅ if shift count is immediate constant.

- **_mm_srai_epi32**
  - Status: 💡 wasm_i32x4_shr. ✅ if shift count is immediate constant.

- **_mm_srl_epi16**
  - Status: ❌ Scalarized.

- **_mm_srl_epi32**
  - Status: ❌ Scalarized.

- **_mm_srl_epi64**
  - Status: ❌ Scalarized.

- **_mm_srli_epi16**
  - Status: 💡 wasm_u16x8_shr. ✅ if shift count is immediate constant.

- **_mm_srli_epi32**
  - Status: 💡 wasm_u32x4_shr. ✅ if shift count is immediate constant.

- **_mm_srli_epi64**
  - Status: 💡 wasm_u64x2_shr. ✅ if shift count is immediate constant.

- **_mm_srli_si128 (_mm_bsrli_si128)**
  - Status: 💡 Emulated with a general shuffle.

- **_mm_store_pd**
  - Status: 🟡 wasm_v128_store. VM must guess type. Unaligned store on x86 CPUs.

- **_mm_store_sd**
  - Status: 💡 Emulated with scalar store.

- **_mm_store_si128**
  - Status: 🟡 wasm_v128_store. VM must guess type. Unaligned store on x86 CPUs.

- **_mm_store1_pd (_mm_store_pd1)**
  - Status: 🟡 Virtual. Emulated with shuffle. Unaligned store on x86 CPUs.

- **_mm_storeh_pd**
  - Status: ❌ Shuffle + scalar stores.

- **_mm_storel_epi64**
  - Status: ❌ Scalar store.

- **_mm_storel_pd**
  - Status: ❌ Scalar store.

- **_mm_storer_pd**
  - Status: ❌ Shuffle + scalar stores.

- **_mm_storeu_pd**
  - Status: 🟡 wasm_v128_store. VM must guess type.

- **_mm_storeu_si128**
  - Status: 🟡 wasm_v128_store. VM must guess type.

- **_mm_storeu_si64**
  - Status: 💡 Emulated with extract lane+scalar store.

- **_mm_storeu_si32**
  - Status: 💡 Emulated with extract lane+scalar store.

- **_mm_storeu_si16**
  - Status: 💡 Emulated with extract lane+scalar store.

- **_mm_stream_pd**
  - Status: 🟡 wasm_v128_store. VM must guess type. No cache control in Wasm SIMD.

- **_mm_stream_si128**
  - Status: 🟡 wasm_v128_store. VM must guess type. No cache control in Wasm SIMD.

- **_mm_stream_si32**
  - Status: 🟡 wasm_v128_store. VM must guess type. No cache control in Wasm SIMD.

```

---

### Set Minimum Firefox Version Target in Emscripten

Source: https://emscripten.org/docs/tools_reference/settings_reference

Specifies the oldest major Firefox version that the compiled application should support. Setting this option ensures compatibility with the targeted browser versions. For example, setting it to 79 indicates support for Firefox versions 79 and newer. The maximum value `0x7FFFFFFF` (or -1) indicates no specific target version.

```javascript
{
  "MIN_FIREFOX_VERSION": 79
}
```

---

### Consistent Optimization Flags in Emscripten Builds

Source: https://emscripten.org/docs/compiling/Building-Projects

Illustrates the correct and sub-optimal ways to apply optimization flags (`-O2`) during Emscripten builds. It emphasizes using the same optimization level for both compiling source files to object files (`-c`) and linking object files into the final JavaScript/WebAssembly output.

```bash
# Sub-optimal - JavaScript/WebAssembly optimizations are omitted
emcc -O2 a.cpp -c -o a.o
emcc -O2 b.cpp -c -o b.o
emcc a.o b.o -o project.js

# Sub-optimal - LLVM optimizations omitted
emcc a.cpp -c -o a.o
emcc b.cpp -c -o b.o
emcc -O2 a.o b.o -o project.js

# Usually the right thing: The same options are provided at compile and link.
emcc -O2 a.cpp -c -o a.o
emcc -O2 b.cpp -c -o b.o
emcc -O2 a.o b.o -o project.js
```

---

### Register Touch Event Callback in Emscripten

Source: https://emscripten.org/docs/api_reference/html5.h

Allows registration of callback functions for specific touch events like start, end, move, and cancel. The callback receives event details and user data. It's important to note the use of 'capture' and the return value indicating event consumption.

```c
EMSCRIPTEN_RESULT emscripten_set_touchstart_callback(const char *target, void *userData, bool useCapture, em_touch_callback_func callback);
EMSCRIPTEN_RESULT emscripten_set_touchend_callback(const char *target, void *userData, bool useCapture, em_touch_callback_func callback);
EMSCRIPTEN_RESULT emscripten_set_touchmove_callback(const char *target, void *userData, bool useCapture, em_touch_callback_func callback);
EMSCRIPTEN_RESULT emscripten_set_touchcancel_callback(const char *target, void *userData, bool useCapture, em_touch_callback_func callback);
```

---

### Emscripten FS: Stream Management Functions

Source: https://emscripten.org/docs/api_reference/advanced-apis

Functions for managing file streams within Emscripten. This includes getting the next available file descriptor, retrieving stream information by file descriptor or pointer, and closing streams. Essential for handling file I/O operations.

```javascript
FS.nextfd();
FS.getStream(_fd_);
FS.createStream(_stream_, _fd_);
FS.closeStream(_fd_);
FS.getStreamFromPtr(_ptr_);
FS.getPtrForStream(_stream_);
```

---

### Defining and Binding a C++ Class with Embind

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Demonstrates how to define a C++ class and then bind it to JavaScript using Embind. This involves registering the class, its constructor, member functions, static functions, and properties. It highlights the syntax for creating bindings similar to Boost.Python.

```cpp
class MyClass {
public:
  MyClass(int x, std::string y)
    : x(x)
    , y(y)
  {}

  void incrementX() {
    ++x;
  }

  int getX() const { return x; }
  void setX(int x_) { x = x_; }

  static std::string getStringFromInstance(const MyClass& instance) {
    return instance.y;
  }

private:
  int x;
  std::string y;
};

// Binding code
EMSCRIPTEN_BINDINGS(my_class_example) {
  class_<MyClass>("MyClass")
    .constructor<int, std::string>()
    .function("incrementX", &MyClass::incrementX)
    .property("x", &MyClass::getX, &MyClass::setX)
    .property("x_readonly", &MyClass::getX)
    .class_function("getStringFromInstance", &MyClass::getStringFromInstance)
    ;
}
```

---

### Emscripten: Yielding to Event Loop with Asyncify/JSPI

Source: https://emscripten.org/docs/porting/asyncify

This C++ example demonstrates how to yield to the JavaScript event loop using Emscripten's Asyncify or JSPI. It uses `EM_JS` to define JavaScript functions for setting and checking a timer, and `emscripten_sleep` to pause execution. The `main` function polls the timer, yielding control to the event loop during sleeps, allowing the timer to fire. This enables handling browser events or waiting for asynchronous operations within seemingly synchronous C++ code.

```c++
#include <emscripten.h>
#include <stdio.h>

// start_timer(): call JS to set an async timer for 500ms
EM_JS(void, start_timer, (), {
  Module.timer = false;
  setTimeout(function() {
    Module.timer = true;
  }, 500);
});

// check_timer(): check if that timer occurred
EM_JS(bool, check_timer, (), {
  return Module.timer;
});

int main() {
  start_timer();
  // Continuously loop while synchronously polling for the timer.
  while (1) {
    if (check_timer()) {
      printf("timer happened!\n");
      return 0;
    }
    printf("sleeping...\n");
    emscripten_sleep(100);
  }
}
```

---

### Load file from URL synchronously with emscripten_wget

Source: https://emscripten.org/docs/api_reference/emscripten.h

The emscripten_wget function synchronously loads a file from a given URL and saves it to a specified local file path. It also handles preloading plugins for immediate use with image and audio decoding. This function blocks until the operation is complete. Errors are indicated by the return value.

```c
int emscripten_wget(const char *url, const char *file);
```

---

### Create Directory Tree in Emscripten File System

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Creates a new directory node and all its parent directories if they do not exist. The `mode` argument specifies file permissions, defaulting to 0777. Permissions are owner-centric.

```javascript
FS.mkdirTree("/data/subdir1/subdir2");
```

---

### Run Preload Plugins for File Processing Asynchronously

Source: https://emscripten.org/docs/api_reference/emscripten.h

Runs preload plugins on a file asynchronously, performing operations like image decoding or audio decoding. The `onload` callback is invoked on success with the file name, and `onerror` is called on failure. Returns 0 on success, -1 if the file does not exist.

```c
int emscripten_run_preload_plugins(const char *file, em_str_callback_func onload, em_str_callback_func onerror);
```

---

### Configure SDL2_image Port with Specific Formats (Emcc)

Source: https://emscripten.org/docs/compiling/Building-Projects

This command shows how to use the SDL2_image port and specify the image formats to be supported. This ensures that functions like `IMG_Init` correctly report support for the desired formats (e.g., BMP, PNG, XPM, JPG).

```bash
emcc --use-port=sdl2_image:formats=bmp,png,xpm,jpg

```

---

### Embind C++ Enum to JavaScript Exposure (Default Object Type)

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Illustrates how to expose both C++98 enums and C++11 enum classes to JavaScript using Embind. By default, enums are exposed as JavaScript objects with a 'value' property. This example shows the default 'object' enum value type.

```c++
enum OldStyle {
    OLD_STYLE_ONE,
    OLD_STYLE_TWO
};

enum class NewStyle {
    ONE,
    TWO
};

EMSCRIPTEN_BINDINGS(my_enum_example) {
    enum_<OldStyle>("OldStyle")
        .value("ONE", OLD_STYLE_ONE)
        .value("TWO", OLD_STYLE_TWO)
        ;
    enum_<NewStyle>("NewStyle")
        .value("ONE", NewStyle::ONE)
        .value("TWO", NewStyle::TWO)
        ;
}
```

---

### Mount WORKERFS File System with Packages in Emscripten

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Mounts the WORKERFS file system using pre-packaged metadata and blob data. This method is suitable for loading larger sets of files efficiently. The `packages` option expects an array containing metadata and blob objects.

```javascript
// load metadata and blob using XMLHttpRequests, or IndexedDB, or from someplace else
FS.mkdir("/working");
FS.mount(
  WORKERFS,
  {
    packages: [{ metadata: meta, blob: blob }],
  },
  "/working",
);
```

---

### Emscripten Orientation Macros

Source: https://emscripten.org/genindex

This section lists C macros defining device orientation states for Emscripten.

````APIDOC
## Emscripten Orientation Macros

### Description
These macros represent different device orientation states.

### Parameters
*   **EMSCRIPTEN_ORIENTATION_LANDSCAPE_PRIMARY** (C macro) - Primary landscape orientation.
*   **EMSCRIPTEN_ORIENTATION_LANDSCAPE_SECONDARY** (C macro) - Secondary landscape orientation.
*   **EMSCRIPTEN_ORIENTATION_PORTRAIT_PRIMARY** (C macro) - Primary portrait orientation.
*   **EMSCRIPTEN_ORIENTATION_PORTRAIT_SECONDARY** (C macro) - Secondary portrait orientation.
*   **EMSCRIPTEN_ORIENTATION_UNKNOWN** (C macro) - Unknown orientation.

### Request Example
```c
// Example usage of orientation macros
EMSCRIPTEN_ORIENTATION_PORTRAIT_PRIMARY
````

### Response

No direct response, these are constants representing device orientation.

````

--------------------------------

### Specialized Smart Pointer Trait for std::shared_ptr in C++

Source: https://emscripten.org/docs/api_reference/bind.h

Provides a specialized trait for `std::shared_ptr` in Emscripten. This implementation allows for sharing and managing `std::shared_ptr` instances, including getting the underlying element type and constructing null pointers. It also defines how to share a `std::shared_ptr` with Emscripten values.

```cpp
// Prototype for the specialized smart pointer trait for std::shared_ptr
template<typename PointeeType>
struct smart_ptr_trait<std::shared_ptr<PointeeType>> : public default_smart_ptr_trait<std::shared_ptr<PointeeType>> {
    // Typedef for the element type
    typedef typename std::shared_ptr<PointeeType>::element_type element_type;

    // Get the raw pointer from a shared_ptr
    static element_type *get(const std::shared_ptr<PointeeType> &ptr);

    // Get the sharing policy
    static sharing_policy get_sharing_policy();

    // Share a std::shared_ptr with an EM_VAL
    static std::shared_ptr<PointeeType> *share(PointeeType *p, EM_VAL v);

    // Construct a null shared_ptr
    static std::shared_ptr<PointeeType> *construct_null();
};

````

---

### FS.mount

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Mounts a specified file system type to a given mount point with specific options.

````APIDOC
## FS.mount

### Description
Mounts the FS object specified by `type` to the directory specified by `mountpoint`. The `opts` object is specific to each file system type.

### Method
FS.mount

### Parameters
#### Path Parameters
- **type** (string) - Required - The file system type: `MEMFS`, `NODEFS`, `IDBFS` or `WORKERFS`.
- **opts** (object) - Required - A generic settings object used by the underlying file system. `NODEFS` uses the root parameter to map the Emscripten directory to the physical directory. `WORKERFS` accepts files and blobs parameters to map a provided flat list of files into the `mountpoint` directory. Can also take `packages` for pre-created file packages.
- **mountpoint** (string) - Required - A path to an existing local Emscripten directory where the file system is to be mounted.

### Request Example
```javascript
// Example for NODEFS
FS.mkdir('/working');
FS.mount(NODEFS, { root: '.' }, '/working');

// Example for WORKERFS with blobs
var blob = new Blob(['blob data']);
FS.mkdir('/working');
FS.mount(WORKERFS, {
  blobs: [{ name: 'blob.txt', data: blob }],
  files: files, // Array of File objects or FileList
}, '/working');

// Example for WORKERFS with packages
FS.mkdir('/working');
FS.mount(WORKERFS, {
  packages: [{ metadata: meta, blob: blob }]
}, '/working');
````

### Response

This function does not return a value.

````

--------------------------------

### Configure WebSocket Runtime Settings

Source: https://emscripten.org/docs/tools_reference/settings_reference

Shows how to configure WebSocket URL and subprotocol at runtime using the Module object in Emscripten. This allows dynamic adjustment of WebSocket settings, useful for applications connecting to different services.

```javascript
Module['websocket'] = {subprotocol: 'base64, binary, text'};
Module['websocket'] = {url: 'wss://', subprotocol: 'base64'};
````

---

### Get Current Mouse Event State in Emscripten

Source: https://emscripten.org/docs/api_reference/html5.h

Retrieves the most recently captured mouse event state. To successfully use this function, a mouse event callback must have been previously registered with a non-zero callback function pointer to enable state capture. The function populates an EmscriptenMouseEvent structure with the latest event details.

```c
EMSCRIPTEN_RESULT emscripten_get_mouse_status(EmscriptenMouseEvent *mouseState);
```

---

### Manual Data Package Preloading

Source: https://emscripten.org/docs/api_reference/module

Implement a callback to manually manage the download of .data file packages for custom caching, progress reporting, and error handling.

````APIDOC
## Module.getPreloadedPackage()

### Description
A callback function that allows manual management of .data file package downloads. It should return an ArrayBuffer containing the file data, enabling custom caching and progress reporting.

### Method
Configuration

### Endpoint
N/A (Module configuration property)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Arguments
- **remotePackageName** (string) - The name of the remote package.
- **remotePackageSize** (number) - The size of the remote package.

### Request Example
```javascript
Module.getPreloadedPackage = async function(remotePackageName, remotePackageSize) {
  // Fetch data manually
  const response = await fetch('path/to/your/data.data');
  return response.arrayBuffer();
};
````

### Response

- **ArrayBuffer** - An ArrayBuffer with the contents of the downloaded file data.

````

--------------------------------

### Emscripten Runtime Initialization Callback (JavaScript)

Source: https://emscripten.org/docs/getting_started/FAQ

This snippet shows how to define a JavaScript callback function (`onRuntimeInitialized`) that Emscripten will execute once its runtime is ready. This is the recommended way to ensure compiled functions are called only after all necessary resources, like preloaded files, are available.

```javascript
Module['onRuntimeInitialized'] = function() { ... };
````

---

### Get Current Time with Emscripten

Source: https://emscripten.org/docs/api_reference/html5.h

Emscripten functions to retrieve current time values by calling their JavaScript counterparts. `emscripten_date_now` returns milliseconds since the UNIX epoch by calling `Date.now()`. `emscripten_performance_now` returns high-precision wallclock time in milliseconds by calling `performance.now()`, with time offsets varying between main threads and Web Workers/pthreads.

```c
double emscripten_date_now(void);
double emscripten_performance_now(void);
```

---

### Runtime WebSocket Configuration via Module Object

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Shows how to configure WebSocket settings at runtime using the Emscripten `Module` object. This allows applications to dynamically set the WebSocket URL and subprotocol, which is useful for connecting to different services or environments without recompiling. The `Module` object can be updated before Emscripten initializes.

```javascript
Module["websocket"] = {
  url: "wss://example.com",
  subprotocol: "base64, binary, text",
};

// Or to unset subprotocol:
Module["websocket"] = {
  subprotocol: null,
};
```

---

### JavaScript Promise Integration (JSPI) Enable

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Enable the use of VM support for the JavaScript Promise Integration proposal. This allows asynchronous operations without modifying the WebAssembly module itself. This is an experimental feature.

```emcc
-JSPI=1
```

```emcc
-JSPI=0
```

---

### Build Emscripten Project with Make in GitLab CI/CD (Shell)

Source: https://emscripten.org/docs/compiling/GitLab

This snippet demonstrates how to execute the build process for an Emscripten project within a GitLab CI/CD pipeline using the 'make' command. It is typically placed in the 'script' stage of the .gitlab-ci.yml file. Alternatively, 'emcc' can be called directly.

```shell
pages:
  script:
  - make
  artifacts:
    paths:
    - public
  only:
    - main
```

---

### Prevent C/C++ Function Removal with Emscripten

Source: https://emscripten.org/docs/getting_started/FAQ

Emscripten performs dead code elimination, which can remove functions not explicitly called from the compiled code. To prevent functions from being removed or renamed when compiling to WebAssembly, you must add them to the EXPORTED_FUNCTIONS option in the emcc command line. For example, to keep '\_main' and '\_my_func' from being removed, use the flag -sEXPORTED_FUNCTIONS='\_main,\_my_func'. Functions not exported may be optimized away.

```bash
emcc -sEXPORTED_FUNCTIONS=_main,_my_func  ...
```

---

### Generate HTML with Emscripten

Source: https://emscripten.org/docs/getting_started/Tutorial

Compiles a C source file into an HTML file that can be opened in a web browser. This is useful for testing Emscripten-compiled code directly in a web environment.

```bash
./emcc test/hello_world.c -o hello.html

```

```bash
./emcc test/hello_world_sdl.c -o hello.html

```

---

### Verifying Emcc Usage in Build Output

Source: https://emscripten.org/docs/compiling/Building-Projects

This command helps to debug build system integration issues. Running 'make VERBOSE=1' with emmake will print out the detailed commands executed during the build process. This allows you to verify that Emscripten's compiler (emcc) is being invoked and not the native system compiler.

```bash
emmake make VERBOSE=1
```

---

### emscripten_async_wget2

Source: https://emscripten.org/docs/api_reference/emscripten.h

An experimental, more feature-complete version of emscripten_async_wget for loading files asynchronously with support for POST requests and progress callbacks.

````APIDOC
## emscripten_async_wget2

### Description
Loads a file from a URL asynchronously. This is an **experimental** “more feature-complete” version of `emscripten_async_wget()`. Preload plug-ins are at this time _not_ executed on the downloaded data. You may want to call `emscripten_run_preload_plugins()` in the `onload` callback if you want to be able to use the downloaded file with `IMG_Load` and such. When the file is ready the `onload` callback will be called with the object pointers given in `arg` and `file`. During the download the `onprogress` callback is called.

### Method
`int` (returns a request ID or 0 on error)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
* **url** (const char*) - The URL of the file to load.
* **file** (const char*) - The name of the file created and loaded from the URL. If the file already exists it will be overwritten. If the destination directory for the file does not exist on the filesystem, it will be created. A relative pathname may be passed, which will be interpreted relative to the current working directory at the time of the call to this function.
* **requesttype** (const char*) - ‘GET’ or ‘POST’.
* **param** (const char*) - Request parameters for POST requests (see `requesttype`). The parameters are specified in the same way as they would be in the URL for an equivalent GET request: e.g. `key=value&key2=value2`.
* **arg** (void*) - User-defined data that is passed to the callbacks, untouched by the API itself. This may be used by a callback to identify the associated call.
* **onload** (em_async_wget2_onload_func) - Callback on successful load of the file. The callback function parameter values are:
  * _(void_)* : Equal to `arg` (user defined data).
  * _(const char_)* : The `file` passed to the original call.
* **onerror** (em_async_wget2_onstatus_func) - Callback in the event of an error. The callback function parameter values are:
  * _(void_)* : Equal to `arg` (user defined data).
  * _(int)_ : The status code of the error.
* **onprogress** (em_async_wget2_onstatus_func) - Callback during the download progress. The callback function parameter values are:
  * _(void_)* : Equal to `arg` (user defined data).
  * _(int)_ : The number of bytes downloaded so far.

### Request Example
```c
// POST request example
emscripten_async_wget2("http://example.com/upload", "uploaded_file.dat", "POST", "data=some_value", NULL, onload_wget2, onerror_wget2, onprogress_wget2);

// GET request example
emscripten_async_wget2("http://example.com/download?id=123", "downloaded_file.dat", "GET", NULL, NULL, onload_wget2, onerror_wget2, onprogress_wget2);
````

### Response

#### Success Response (int)

Returns a request ID on success, or 0 on error.

#### Response Example

```c
void onload_wget2(void* arg, const char* filename) {
  printf("File %s loaded successfully via wget2.\n", filename);
}

void onerror_wget2(void* arg, int status) {
  printf("Error loading file via wget2. Status: %d\n", status);
}

void onprogress_wget2(void* arg, int bytesdown) {
  printf("Downloaded %d bytes via wget2.\n", bytesdown);
}
```

````

--------------------------------

### HTML page to spawn Emscripten Web Worker

Source: https://emscripten.org/docs/porting/files/Synchronous-Virtual-XHR-Backed-File-System-Usage

This HTML code snippet demonstrates how to create a simple web page that spawns an Emscripten Web Worker. It includes JavaScript to initialize the worker and set up an `onmessage` handler to receive data from the worker. This handler then uses `fetch` to send the received data to a server endpoint before closing the window.

```html
      <html>
      <body>
        Worker Test
        <script>
          var worker = new Worker('worker.js');
          worker.onmessage = async (event) => {
            await fetch('http://localhost:%s/report_result?' + event.data);
            window.close();
          };
        </script>
      </body>
      </html>

````

---

### FS.lchown

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Changes the ownership of a symbolic link itself.

````APIDOC
## FS.lchown

### Description
Identical to `FS.chown()`. However, if `path` is a symbolic link then the properties will be set on the link itself, not the file that it links to. Note: This call exists to provide a more “complete” API mapping for ported code. Values set are effectively ignored.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **path** (string) - Required - Path to the target file.
- **uid** (int) - Required - The id of the user to take ownership of the file.
- **gid** (int) - Required - The id of the group to take ownership of the file.

### Request Example
```javascript
// Assuming 'link' is a symbolic link
FS.lchown('link', 1000, 1000);
````

### Response

#### Success Response (N/A)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Enable runtime file read logging (JavaScript)

Source: https://emscripten.org/docs/porting/files/packaging_files

Enables logging of all files read by the application at runtime. This is useful for debugging and optimizing file usage by identifying which files are actually accessed.

```javascript
Module.logReadFiles = true;
````

---

### Calling Emscripten Compiled C API from NodeJS

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Demonstrates how to require a modularized Emscripten-compiled library in NodeJS and invoke its exported C functions. It shows direct calling (`_sayHi`) and using `ccall` for function invocation, as well as retrieving return values.

```javascript
var factory = require("./api_example.js");

factory().then((instance) => {
  instance._sayHi(); // direct calling works
  instance.ccall("sayHi"); // using ccall etc. also work
  console.log(instance._daysInWeek()); // values can be returned, etc.
});
```

---

### FS.symlink

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Creates a symbolic link (symlink) node in the file system.

````APIDOC
## FS.symlink

### Description
Creates a symlink node at `newpath` linking to `oldpath`.

### Method
FS.symlink

### Parameters
#### Path Parameters
- **oldpath** (string) - Required - The path name of the file to link to.
- **newpath** (string) - Required - The path name for the new symbolic link node.

### Request Example
```javascript
FS.writeFile('file', 'foobar');
FS.symlink('file', 'link');
````

### Response

This function does not return a value.

````

--------------------------------

### Instantiating a Module with Default Options

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Shows how to instantiate an Emscripten module when MODULARIZE is enabled by passing an object with default values to the factory function. This method is required as Emscripten no longer looks for a global 'Module' object for defaults in this mode.

```javascript
const module = await EXPORT_NAME({ option: value, ... });
````

---

### Emscripten Proxying API Overview

Source: https://emscripten.org/docs/api_reference/proxying.h

Overview of the Emscripten proxying.h API, its purpose, and usage patterns for thread-safe operations and asynchronous task management.

```APIDOC
## Emscripten Proxying API Overview

The Emscripten proxying.h API provides a mechanism for dispatching work to be executed by a target thread and optionally blocking until that work has been completed. This is particularly useful in a Web context where certain JS APIs can only be called on particular threads; any thread can access those APIs by proxying the API calls to the correct threads. Proxying is also useful for wrapping asynchronous JS tasks with a synchronous interface. The calling thread can proxy the asynchronous task to a dedicated worker thread and wait until the worker thread eventually marks the task as complete, possibly after returning multiple times to the JS event loop.

On the target thread, queued work can be executed in two ways. First, the user may explicitly call `emscripten_proxy_execute_queue` to execute any tasks that have been queued for the current thread. Alternatively, queued work will execute automatically if the target thread returns to the JS event loop, for example via `emscripten_exit_with_live_runtime`.

### Types

#### `em_proxying_queue`

An opaque handle to a set of thread-local work queues (one per thread) to which work can be asynchronously or synchronously proxied from other threads. Proxied work can only be completed on live thread runtimes, so users must ensure either that all proxied work is completed before a thread exits or that the thread exits with a live runtime, e.g. via `emscripten_exit_with_live_runtime` to avoid dropped work.

#### `em_proxying_ctx`

An opaque handle to a currently-executing proxied task, used to signal the end of the task.
```

---

### Decode Base64 Profile Data to File

Source: https://emscripten.org/docs/optimizing/Module-Splitting

These commands show how to take a base64 encoded profile string and decode it into a binary profile data file. This is typically used after extracting base64 encoded profile data from a browser or other environment. The first command pipes the base64 data directly to the decode command, while the second assumes the base64 data is in a file.

```bash
$ echo [pasted base64] | base64 --decode > profile.data
```

```bash
$ base64 --decode [base64 file] > profile.data
```

---

### preamble.js - allocate()

Source: https://emscripten.org/docs/api_reference/advanced-apis

The `allocate()` function in preamble.js is an internal, advanced API for memory allocation. While `_malloc()` is generally recommended, `allocate()` offers flexibility for specific use cases.

```APIDOC
## preamble.js - allocate()

### Description
An internal and advanced function for memory allocation. Generally, `_malloc()` should be used instead, but this function can be useful for advanced developers in specific scenarios.

### Method
allocate

### Parameters
#### Arguments
*   **slab** (Array or Number) - An array of data or the size in bytes of the block to allocate.
*   **allocator** (Number) - Specifies how to allocate memory (see ALLOC_* constants).
```

---

### Create Preloaded File with Emscripten FS

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Preloads a file asynchronously using preload plugins. This function should be called in `preRun`, as `run()` will be delayed until all preloaded files are ready. This is the mechanism used by the `--use-preload-plugins` option in emcc.

```javascript
FS.createPreloadedFile(_parent_ , _name_ , _url_ , _canRead_ , _canWrite_)

Arguments:

  * **parent** (`string/object()`) – The parent folder, either as a path (e.g. **‘/usr/lib’**) or an object previously returned from a FS.mkdir() or FS.createPath() call.
  * **name** (`string()`) – The name of the new file.
  * **url** (`string()`) – In the browser, this is the URL whose contents will be returned when the file is accessed. In a command line engine, this will be the local (real) file system path the contents will be loaded from. Note that writes to this file are virtual.
  * **canRead** (`bool()`) – Whether the file should have read permissions set from the program’s point of view.
  * **canWrite** (`bool()`) – Whether the file should have write permissions set from the program’s point of view.
```

---

### Emscripten Fullscreen and Scaling Macros

Source: https://emscripten.org/genindex

This section lists C macros related to Emscripten's fullscreen capabilities and canvas scaling behavior.

````APIDOC
## Emscripten Fullscreen and Scaling Macros

### Description
These macros control how the canvas is scaled and filtered when entering fullscreen mode.

### Parameters
*   **EMSCRIPTEN_FULLSCREEN_CANVAS_SCALE** (C macro) - Base macro for canvas scaling.
*   **EMSCRIPTEN_FULLSCREEN_CANVAS_SCALE_HIDEF** (C macro) - Hides the fake fullscreen element.
*   **EMSCRIPTEN_FULLSCREEN_CANVAS_SCALE_NONE** (C macro) - No scaling applied.
*   **EMSCRIPTEN_FULLSCREEN_CANVAS_SCALE_STDDEF** (C macro) - Default canvas scaling.
*   **EMSCRIPTEN_FULLSCREEN_FILTERING** (C macro) - Base macro for filtering.
*   **EMSCRIPTEN_FULLSCREEN_FILTERING_BILINEAR** (C macro) - Bilinear filtering.
*   **EMSCRIPTEN_FULLSCREEN_FILTERING_DEFAULT** (C macro) - Default filtering.
*   **EMSCRIPTEN_FULLSCREEN_FILTERING_NEAREST** (C macro) - Nearest neighbor filtering.
*   **EMSCRIPTEN_FULLSCREEN_SCALE** (C macro) - Base macro for scaling.
*   **EMSCRIPTEN_FULLSCREEN_SCALE_ASPECT** (C macro) - Scales with aspect ratio.
*   **EMSCRIPTEN_FULLSCREEN_SCALE_DEFAULT** (C macro) - Default scaling.
*   **EMSCRIPTEN_FULLSCREEN_SCALE_STRETCH** (C macro) - Stretches to fill.

### Request Example
```c
// Example usage of fullscreen scaling macros
EMSCRIPTEN_FULLSCREEN_SCALE_ASPECT
````

### Response

No direct response, these are constants used in Emscripten's fullscreen configuration.

````

--------------------------------

### FS.chown

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Changes the ownership of a file system node.

```APIDOC
## FS.chown

### Description
Change the ownership of the specified file to the given user or group id. Note: This call exists to provide a more “complete” API mapping for ported code. Values set are effectively ignored.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **path** (string) - Required - Path to the target file.
- **uid** (int) - Required - The id of the user to take ownership of the file.
- **gid** (int) - Required - The id of the group to take ownership of the file.

### Request Example
```javascript
FS.chown('file', 1000, 1000);
````

### Response

#### Success Response (N/A)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Calling JavaScript Function on Emscripten Runtime Initialization (C/C++)

Source: https://emscripten.org/docs/getting_started/FAQ

This snippet demonstrates how to call a JavaScript function (`allReady()`) from C/C++ code once the Emscripten runtime is fully initialized and safe to call compiled functions. It utilizes the `main()` function as a signal for completion.

```c
#include <emscripten.h>

int main() {
  EM_ASM( allReady() );
}
````

---

### Filesystem Support Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference

Control the filesystem support included in the build. Options allow for case-insensitive filesystem behavior, disabling filesystem support entirely for computational tasks, or forcing full filesystem support when needed due to external JS dependencies.

```ini
; CASE_INSENSITIVE_FS: Enable case-insensitive filesystem behavior.
; FILESYSTEM: Enable or disable filesystem support.
; FORCE_FILESYSTEM: Force inclusion of full filesystem support.

```

---

### File System Mounts

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Details the different types of file systems that can be mounted in Emscripten, including MEMFS, NODEFS, and IDBFS.

````APIDOC
## File System Types

### Description
Emscripten supports several types of file systems that can be mounted to manage data persistence and behavior.

### File Systems

- **MEMFS**: In-memory file system. Mounted at `/` by default.
- **NODEFS**: Node.js file system. Allows access to the host's file system when running in Node.js.
- **NODERAWFS**: Raw Node.js file system. Similar to NODEFS but with less abstraction.
- **IDBFS**: IndexedDB file system. Persists data in the browser's IndexedDB.
- **WORKERFS**: File system designed for use with Web Workers.
- **PROXYFS**: A file system that proxies operations to another file system, allowing for custom logic.

### Usage
File systems are mounted using `FS.mount(mountPoint, options, dev)`. For example:

```javascript
// Mount NODEFS to /host
FS.mount(NODEFS, { root: '.' }, '/host');

// Mount IDBFS to /persistent_data
FS.mount(IDBFS, {}, '/persistent_data');
````

### See Also

- `FS.mount()`
- `FS.unmount()`

````

--------------------------------

### Filesystem Support Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Enable or disable filesystem support in the build. If set to 0, no filesystem support is included, which is useful for pure computation. The compiler may automatically disable this if no syscalls require it. Use FORCE_FILESYSTEM to ensure filesystem support is included.

```emcc
-FILESYSTEM=1
````

```emcc
-FILESYSTEM=0
```

---

### Configure Binary Encoding for Single File Output (Emscripten)

Source: https://emscripten.org/docs/tools_reference/settings_reference

Determines whether binary Wasm content in a single-file build is encoded using a custom UTF-8 method or base64. UTF-8 encoding results in smaller files and better compression but requires the HTML/JS files to be served with UTF-8 encoding. If UTF-8 serving is not possible, set this to 0 to revert to base64 encoding.

```javascript
{
  "SINGLE_FILE_BINARY_ENCODE": true
}
```

---

### Force Filesystem Support

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Ensure full filesystem support is included in the build, even if static analysis suggests it is not strictly necessary. This is useful when JavaScript code that uses the filesystem is included, but the C code itself does not explicitly make syscalls.

```emcc
-FORCE_FILESYSTEM=true
```

```emcc
-FORCE_FILESYSTEM=false
```

---

### Configuring Emscripten -s Options in CMake

Source: https://emscripten.org/docs/getting_started/FAQ

Shows how to integrate Emscripten's `-s` compiler options into a CMake build system. Simple options can be added directly to `CMAKE_CXX_FLAGS`. For options requiring specific handling or avoiding CMake parsing issues, use the `-sX=Y` notation without spaces and consider `target_link_options`.

```cmake
# Direct flag addition
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -sUSE_SDL=2")

# Using -sX=Y notation for potentially problematic flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -sUSE_SDL=2")

# Example with target_link_options
target_link_options(example PRIVATE "-sEXPORTED_FUNCTIONS=_main")
```

---

### Run Emscripten Benchmarks

Source: https://emscripten.org/docs/getting_started/test-suite

Execute the entire Emscripten benchmark suite or specific benchmarks. Benchmarks measure code speed and size using various real-world codebases and standard benchmarks like CoreMark and LINPACK.

```shell
# Run all benchmarks
test/runner benchmark

```

```shell
# Run one specific benchmark
test/runner benchmark.test_skinning

```

```shell
# Run one specific benchmark and with clang and v8.
EMTEST_BENCHMARKERS=clang,v8 test/runner benchmark.test_skinning

```

---

### Using MODULARIZE with Instance ES Modules

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Illustrates the usage of Emscripten when compiled with -sMODULARIZE=instance. This mode produces an ES module that exports an async initialization function and named exports for Wasm and runtime functions. The init function must be called before using any exports.

```javascript
import init, { foo, bar } from “./my_module.mjs"
await init(optionalArguments);
foo();
bar();
```

---

### Set Main Loop with Arguments

Source: https://emscripten.org/docs/api_reference/emscripten.h

Configures a C function to serve as the main event loop, allowing user-defined data to be passed to it.

````APIDOC
## void emscripten_set_main_loop_arg(em_arg_callback_func func, void *arg, int fps, bool simulate_infinite_loop)

### Description
Sets a C function as the main event loop for the calling thread, passing user-defined data. The behavior regarding frame rate and infinite loop simulation is the same as `emscripten_set_main_loop()`.

### Method
void

### Endpoint
emscripten_set_main_loop_arg

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
- **func** (em_arg_callback_func) - Required - The C function to set as the main event loop. Must accept a `void*` parameter.
- **arg** (void*) - Required - User-defined data to be passed to the main loop function.
- **fps** (int) - Required - The number of frames per second for the JavaScript to call the function. Setting to 0 or a negative value uses `requestAnimationFrame`.
- **simulate_infinite_loop** (bool) - Required - If true, throws an exception to stop caller execution and enter the main loop.

### Request Example
```json
{
  "func": "my_main_loop_with_data",
  "arg": "0x12345678",
  "fps": 30,
  "simulate_infinite_loop": false
}
````

### Response

#### Success Response (void)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Touch Event Callbacks

Source: https://emscripten.org/docs/api_reference/html5.h

Register callback functions for various touch events: touchstart, touchend, touchmove, and touchcancel. These functions allow your application to respond to user interactions on touch-enabled devices.

```APIDOC
## Touch Event Registration API

### Description
Registers callback functions for receiving touch events (touchstart, touchend, touchmove, touchcancel).

### Functions

#### `emscripten_set_touchstart_callback`

*   **Method**: Not applicable (function signature provided)
*   **Description**: Registers a callback for the touch start event.
*   **Parameters**:
    *   `target` (const char*) - Target HTML element ID.
    *   `userData` (void*) - User-defined data passed to the callback.
    *   `useCapture` (bool) - Set to `true` to use capture.
    *   `callback` (em_touch_callback_func) - The callback function to execute.
*   **Return Value**: `EMSCRIPTEN_RESULT` indicating success or an error.

#### `emscripten_set_touchend_callback`

*   **Method**: Not applicable (function signature provided)
*   **Description**: Registers a callback for the touch end event.
*   **Parameters**:
    *   `target` (const char*) - Target HTML element ID.
    *   `userData` (void*) - User-defined data passed to the callback.
    *   `useCapture` (bool) - Set to `true` to use capture.
    *   `callback` (em_touch_callback_func) - The callback function to execute.
*   **Return Value**: `EMSCRIPTEN_RESULT` indicating success or an error.

#### `emscripten_set_touchmove_callback`

*   **Method**: Not applicable (function signature provided)
*   **Description**: Registers a callback for the touch move event.
*   **Parameters**:
    *   `target` (const char*) - Target HTML element ID.
    *   `userData` (void*) - User-defined data passed to the callback.
    *   `useCapture` (bool) - Set to `true` to use capture.
    *   `callback` (em_touch_callback_func) - The callback function to execute.
*   **Return Value**: `EMSCRIPTEN_RESULT` indicating success or an error.

#### `emscripten_set_touchcancel_callback`

*   **Method**: Not applicable (function signature provided)
*   **Description**: Registers a callback for the touch cancel event.
*   **Parameters**:
    *   `target` (const char*) - Target HTML element ID.
    *   `userData` (void*) - User-defined data passed to the callback.
    *   `useCapture` (bool) - Set to `true` to use capture.
    *   `callback` (em_touch_callback_func) - The callback function to execute.
*   **Return Value**: `EMSCRIPTEN_RESULT` indicating success or an error.

### Callback Function Signature (`em_touch_callback_func`)

*   **Signature**: `bool callback(int eventType, const EmscriptenTouchEvent *touchEvent, void *userData)`
*   **Parameters**:
    *   `eventType` (int) - The type of touch event.
    *   `touchEvent` (const EmscriptenTouchEvent*) - Information about the touch event.
    *   `userData` (void*) - User data passed during registration.
*   **Returns**: `true` if the event was consumed.
````

---

### JavaScript Promise Integration (JSPI) Options

Source: https://emscripten.org/docs/tools_reference/settings_reference

Configuration options for JavaScript Promise Integration (JSPI), enabling the use of VM support for asynchronous operations without modifying WebAssembly code.

```APIDOC
## JSPI

### Description
Enables VM support for the JavaScript Promise Integration proposal, allowing asynchronous operations without the overhead of modifying WebAssembly. This feature is experimental.

### Default Value
`0`

## JSPI_EXPORTS

### Description
A list of exported module functions that are asynchronous. Each function in this list will return a `Promise` resolved with its result. Exports that call asynchronous imports (listed in `JSPI_IMPORTS`) must be included here. By default, `main` is included.

### Default Value
`[]`

## JSPI_IMPORTS

### Description
A list of imported module functions that may perform asynchronous work. These functions should return a `Promise` when executing asynchronously. For JS library files, functions can be marked using `<function_name>_async:: true` within the library instead of using this setting.

### Default Value
`[]`

## ASYNCIFY_EXPORTS

### Description
Deprecated. Use `JSPI_EXPORTS` instead.

### Default Value
`[]`
```

---

### Create JavaScript Array and Object using emscripten::val

Source: https://emscripten.org/docs/api_reference/val.h

Shows how to create new JavaScript Array and Object instances from C++ using static methods of the `emscripten::val` class. `val::array()` creates an empty Array, and `val::object()` creates an empty Object.

```C++
val js_array = val::array();
val js_object = val::object();
```

---

### Look Up Path with Options (JS)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Resolves an incoming path in the Emscripten file system and returns an object containing the resolved path and node. It accepts the path string and an optional options object. Options include 'parent' to resolve the parent directory and 'follow' to resolve symlinks.

```javascript
var lookup = FS.lookupPath(path, { parent: true });
```

```javascript
var lookupWithOptions = FS.lookupPath("/some/path", {
  parent: false,
  follow: true,
});
```

---

### Create Lazy File with Emscripten FS

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Creates a file that is loaded lazily from a URL or local path upon first access. It returns a reference to the file. This method may not work in regular HTML pages due to limitations with synchronous binary XHRs, but functions in Web Workers.

```javascript
FS.createLazyFile(_parent_ , _name_ , _url_ , _canRead_ , _canWrite_)

Arguments:

  * **parent** (`string/object()`) – The parent folder, either as a path (e.g. ‘/usr/lib’) or an object previously returned from a FS.mkdir() or FS.createPath() call.
  * **name** (`string()`) – The name of the new file.
  * **url** (`string()`) – In the browser, this is the URL whose contents will be returned when this file is accessed. In a command line engine like _node.js_ , this will be the local (real) file system path from where the contents will be loaded. Note that writes to this file are virtual.
  * **canRead** (`bool()`) – Whether the file should have read permissions set from the program’s point of view.
  * **canWrite** (`bool()`) – Whether the file should have write permissions set from the program’s point of view.

Example:
```

FS.createLazyFile('/', 'foo', 'other/page.htm', true, false);
FS.createLazyFile('/', 'bar', '/get_file.php?name=baz', true, true);

```

```

---

### Emscripten Wget Functions

Source: https://emscripten.org/docs/api_reference/emscripten.h

Functions for synchronously loading files from a URL.

````APIDOC
## emscripten_wget

### Description
Synchronously loads a file from a given URL and saves it to a specified file name. This function handles decoding of image and audio data for use with functions like `IMG_Load`. It is a blocking operation.

### Method
`int` (returns 0 on success, 1 on error)

### Parameters
#### Path Parameters
- **url** (const char*) - The URL to load the file from.
- **file** (const char*) - The name of the file to be created or overwritten with the downloaded content. If the destination directory does not exist, it will be created. Relative pathnames are interpreted relative to the current working directory.

### Request Example
```c
int result = emscripten_wget("http://example.com/data.txt", "local_data.txt");
if (result == 0) {
    // File loaded successfully
} else {
    // Error loading file
}
````

### Response

#### Success Response (0)

Indicates the file was successfully downloaded and saved.

#### Error Response (1)

Indicates an error occurred during the download or file saving process.

## emscripten_wget_data

### Description

Synchronously fetches data from a URL and stores it into a memory buffer allocated by the function. The caller is responsible for freeing the allocated buffer to prevent memory leaks.

### Method

`void`

### Parameters

#### Path Parameters

- **url** (const char\*) - The URL to fetch data from.
- **pbuffer** (void\*\*) - An output parameter that will point to the allocated buffer containing the downloaded data. This buffer must be freed by the caller.
- **pnum** (int\*) - An output parameter that will be filled with the size of the downloaded data in bytes.
- **perror** (int\*) - An output parameter that will be set to a non-zero value if an error occurred during the download.

### Request Example

```c
void *buffer;
int size;
int error;
emscripten_wget_data("http://example.com/data.bin", &buffer, &size, &error);
if (error == 0 && buffer != NULL) {
    // Process the data in buffer of size 'size'
    // ...
    free(buffer); // Free the allocated buffer
} else {
    // Error occurred
}
```

### Response

#### Success Response

Data is populated into `pbuffer` and `pnum` if successful. `perror` will be 0.

#### Error Response

`perror` will be non-zero. `pbuffer` and `pnum` might be in an undefined state.

````

--------------------------------

### Change Data File Location with Module.locateFile

Source: https://emscripten.org/docs/porting/files/packaging_files

Demonstrates how to change the default location of the .data file using the Module.locateFile function. This is useful for hosting data files on a different server or CDN, separate from the main .js and .html files. The function should be defined before the script that loads the data file.

```html
<script>
  Module.locateFile = function(path, prefix) {
    // Custom logic to return the URL of the data file
    return 'https://cdn.example.com/my-data.data';
  };
</script>

````

---

### JavaScript Promise Integration (JSPI) Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference

Utilize VM support for JavaScript Promise Integration to handle asynchronous operations without modifying WebAssembly. This includes specifying exported and imported functions that involve asynchronous work, allowing them to return Promises.

```ini
; JSPI: Enable JavaScript Promise Integration.
; JSPI_EXPORTS: List of exported module functions that are asynchronous.
; JSPI_IMPORTS: List of imported module functions that may perform asynchronous work.

```

---

### Initialize Emscripten Fiber Context (C)

Source: https://emscripten.org/docs/api_reference/fiber.h

Initializes a fiber context, preparing it to be entered via emscripten_fiber_swap. Requires specifying entry function, C stack, and Asyncify stack details. Returning from the entry function terminates the program unless emscripten_fiber_swap is used.

```c
void emscripten_fiber_init(emscripten_fiber_t *fiber, em_arg_callback_func entry_func, void *entry_func_arg, void *c_stack, size_t c_stack_size, void *asyncify_stack, size_t asyncify_stack_size)
```

---

### Aggressive Runtime Optimization with -O2

Source: https://emscripten.org/docs/getting_started/FAQ

Ensure your code runs efficiently by compiling with the -O2 optimization flag. This flag enables a higher level of optimization, leading to faster runtime performance. More aggressive optimizations are available at the cost of significantly increased compilation time.

```bash
emcc ... -O2 ...
```

---

### JavaScript Implementation of C API Function (Simple)

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

This JavaScript code provides a direct implementation for the `my_js` C API function. It demonstrates how to define a JavaScript function that can be called from C/C++ using Emscripten, in this case, by showing an alert box.

```javascript
my_js: function() {
  alert('hi');
},

```

---

### Handling Infinite Loops in Emscripten Applications

Source: https://emscripten.org/docs/getting_started/FAQ

Explains how to refactor applications with infinite main loops, common in graphical C++ applications, to work with Emscripten's browser-based event model. Instead of an infinite loop, actions for a single iteration should be placed in a finite function that Emscripten can call repeatedly.

```c++
#include <emscripten.h>

void my_loop_function() {
  // Actions for a single iteration of the loop
  // This function will be called repeatedly by Emscripten
}

int main() {
  // Set my_loop_function as the main loop function
  emscripten_set_main_loop(my_loop_function, 0, 1);
  return 0;
}
```

---

### Synchronize Emscripten File System with IDBFS

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Synchronizes the Emscripten file system with the IDBFS persistent storage. The `populate` flag determines the direction of synchronization: `true` to load data from IDBFS, `false` to save data to IDBFS. This function is asynchronous and uses a callback to signal completion or errors. Only IDBFS supports synchronization.

```javascript
function myAppStartup(callback) {
  FS.mkdir("/data");
  FS.mount(IDBFS, {}, "/data");

  FS.syncfs(true, function (err) {
    // handle callback
  });
}

function myAppShutdown(callback) {
  FS.syncfs(function (err) {
    // handle callback
  });
}
```

---

### Track Download Progress with Emscripten Fetch API in C/C++

Source: https://emscripten.org/docs/api_reference/fetch

Illustrates how to track the progress of a file download using the Emscripten Fetch API. It shows the usage of the `onprogress` callback to report download status and percentage, and how to set timeouts and abort downloads.

```c++
void downloadProgress(emscripten_fetch_t *fetch) {
  if (fetch->totalBytes) {
    printf("Downloading %s.. %.2f%% complete.\n", fetch->url, fetch->dataOffset * 100.0 / fetch->totalBytes);
  } else {
    printf("Downloading %s.. %lld bytes complete.\n", fetch->url, fetch->dataOffset + fetch->numBytes);
  }
}

int main() {
  emscripten_fetch_attr_t attr;
  emscripten_fetch_attr_init(&attr);
  strcpy(attr.requestMethod, "GET");
  attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY;
  attr.onsuccess = downloadSucceeded;
  attr.onprogress = downloadProgress;
  attr.onerror = downloadFailed;
  emscripten_fetch(&attr, "myfile.dat");
}
```

---

### Enable Experimental WASMFS File System in Emscripten

Source: https://emscripten.org/docs/tools_reference/settings_reference

Activates the experimental WASMFS filesystem implementation, which is intended to replace the current JavaScript-based file system. This feature is under active development and should be used with caution. It offers a new approach to file system management within the Emscripten environment.

```javascript
{
  "WASMFS": 1
}
```

---

### Emscripten Linker Flags for Legacy OpenGL Emulation

Source: https://emscripten.org/docs/optimizing/Optimizing-WebGL

This snippet shows the use of Emscripten's `-sLEGACY_GL_EMULATION` linker flag to target older desktop OpenGL APIs. It also mentions the `-sGL_FFP_ONLY` flag which can be paired for fixed-function pipeline-only applications, though performance is generally not expected to be good. Porting to WebGL 1/OpenGL ES 2 is recommended.

```text
// Build with: emcc main.c -o main.js -sLEGACY_GL_EMULATION
// For FFP only: emcc main.c -o main.js -sLEGACY_GL_EMULATION -sGL_FFP_ONLY
```

---

### Create Device Node in Emscripten File System

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Creates a new device node in the Emscripten file system that references a registered device driver. The `dev` argument is the identifier for the registered device driver. The `mode` argument specifies file permissions, defaulting to 0777.

```javascript
var id = FS.makedev(64, 0);
FS.registerDevice(id, {});
FS.mkdev("/dummy", id);
```

---

### Compile Project with WebIDL Bindings

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

This `emcc` command compiles the C++ source files, including the wrapper for the glue code, and uses the `--post-js` option to include the generated JavaScript glue code. The output is a single JavaScript file ready for use in a web environment.

```bash
emcc my_classes.cpp my_glue_wrapper.cpp --post-js glue.js -o output.js

```

---

### Configure Emscripten SDK with Custom Fork (Shell)

Source: https://emscripten.org/docs/tools_reference/emsdk

This snippet demonstrates how to set up the Emscripten SDK to use a local fork of the Emscripten repository. It involves setting the EM_CONFIG environment variable to the SDK's configuration file and prepending the custom Emscripten checkout to the system's PATH. This ensures that the custom Emscripten compiler (emcc) utilizes the LLVM and Binaryen binaries provided by the active Emscripten SDK version.

```shell
cd my_emscripten/

# Tell emscripten to use the emsdk config file
export EM_CONFIG=/path/to/emsdk/.emscripten

# Now your version of emscripten will use LLVM and binaryen
# binaries from the currently active version of emsdk.
./emcc
```

---

### Preload Files using emcc

Source: https://emscripten.org/docs/porting/files/packaging_files

Packages files into a .data file for preloading, which is loaded by the generated .js file. This method separates data files from the compiled code, allowing for separate hosting. The .data file contains all files from the specified directory.

```bash
emcc file.cpp -o file.html --preload-file asset_dir

```

---

### emscripten_run_preload_plugins_data

Source: https://emscripten.org/docs/api_reference/emscripten.h

Runs preload plugins on a buffer of data asynchronously. This is a data-based version of emscripten_run_preload_plugins(), accepting raw data instead of a filename.

````APIDOC
## emscripten_run_preload_plugins_data

### Description
Runs preload plugins on a buffer of data asynchronously. This is a “data” version of `emscripten_run_preload_plugins()`, which receives raw data as input instead of a filename. See Preloading files for more information on preload plugins. When file is loaded then the `onload` callback will be called. If any error occurs `onerror` will be called.

### Method
`void`

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```c
void emscripten_run_preload_plugins_data(
    char *data,
    int size,
    const char *suffix,
    void *arg,
    em_run_preload_plugins_data_onload_func onload,
    em_arg_callback_func onerror
);
````

### Response

#### Success Response (200)

N/A (Callbacks handle success)

#### Response Example

N/A (Callbacks handle success)

### Parameters

- **data** (char\*) – The buffer of data to process.
- **size** (int) – The size of the data buffer.
- **suffix** (const char\*) – The file suffix, e.g. ‘png’ or ‘jpg’.
- **arg** (void\*) – User-defined data that is passed to the callbacks, untouched by the API itself.
- **onload** (em_run_preload_plugins_data_onload_func) – Callback function executed upon successful processing of the data.
- **onerror** (em_arg_callback_func) – Callback function executed in case of an error during processing.

````

--------------------------------

### Emscripten Synchronous Proxy Execution with Context

Source: https://emscripten.org/docs/api_reference/proxying.h

Similar to `emscripten_proxy_sync`, but waits for the proxied task to explicitly signal completion using `emscripten_proxy_finish`. The target function can store the context and call `emscripten_proxy_finish` later.

```c
int emscripten_proxy_sync_with_ctx(em_proxying_queue *q, pthread_t target_thread, void (*func)(em_proxying_ctx*, void*), void *arg);
````

---

### Create Directory in Emscripten File System

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Creates a new directory node within the Emscripten file system. The `mode` argument specifies file permissions, defaulting to 0777. Permissions are owner-centric.

```javascript
FS.mkdir("/data");
```

---

### Asyncify Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Settings related to the Asyncify feature, which allows C/C++ code to use JavaScript's asynchronous capabilities.

```APIDOC
## ASYNCIFY_ADD

Functions in the Asyncify add-list are added to the list of instrumented functions, that is, they will be instrumented even if otherwise asyncify thinks they don’t need to be. As by default everything will be instrumented in the safest way possible, this is only useful if you use IGNORE_INDIRECT and use this list to fix up some indirect calls that _do_ need to be instrumented.
See ASYNCIFY_REMOVE about the names, including wildcard matching and character substitutions.
Default value: []

### ASYNCIFY_PROPAGATE_ADD

If enabled, instrumentation status will be propagated from the add-list, ie. their callers, and their callers’ callers, and so on. If disabled then all callers must be manually added to the add-list (like the only-list).
Default value: true

### ASYNCIFY_ONLY

If the Asyncify only-list is provided, then _only_ the functions in the list will be instrumented. Like the remove-list, getting this wrong will break your application.
See ASYNCIFY_REMOVE about the names, including wildcard matching and character substitutions.
Default value: []

### ASYNCIFY_ADVISE

If enabled will output which functions have been instrumented and why.
Default value: false

### ASYNCIFY_DEBUG

Runtime debug logging from asyncify internals.
* 1: Minimal logging.
* 2: Verbose logging.

Default value: 0

### ASYNCIFY_EXPORTS

Deprecated, use JSPI_EXPORTS instead.
Note
This setting is deprecated
Default value: []
```

---

### FS.fchown

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Changes the ownership of a file using a file descriptor.

````APIDOC
## FS.fchown

### Description
Identical to `FS.chown()`. However, a raw file descriptor is supplied as `fd`. Note: This call exists to provide a more “complete” API mapping for ported code. Values set are effectively ignored.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **fd** (int) - Required - Descriptor of target file.
- **uid** (int) - Required - The id of the user to take ownership of the file.
- **gid** (int) - Required - The id of the group to take ownership of the file.

### Request Example
```javascript
// Assuming 'fd' is a valid file descriptor
FS.fchown(fd, 1000, 1000);
````

### Response

#### Success Response (N/A)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Asyncify Configuration Options

Source: https://emscripten.org/docs/tools_reference/settings_reference

Configuration options for the Asyncify feature, which allows JavaScript to interoperate with WebAssembly asynchronous functions.

```APIDOC
## ASYNCIFY_ADD

### Description
Functions listed in `ASYNCIFY_ADD` are instrumented by default, ensuring they are processed by Asyncify even if they wouldn't normally be considered asynchronous. This is particularly useful when `IGNORE_INDIRECT` is used, allowing specific indirect calls that need instrumentation to be included.

### Default Value
`[]`

## ASYNCIFY_PROPAGATE_ADD

### Description
When enabled, the instrumentation status from `ASYNCIFY_ADD` propagates to callers and their callers. If disabled, all callers must be explicitly added to `ASYNCIFY_ADD`.

### Default Value
`true`

## ASYNCIFY_ONLY

### Description
If a list is provided for `ASYNCIFY_ONLY`, only the functions within this list will be instrumented. Incorrect configuration can lead to application breakage.

### Default Value
`[]`

## ASYNCIFY_ADVISE

### Description
Enables the output of information detailing which functions have been instrumented and the reasons for their instrumentation.

### Default Value
`false`

## ASYNCIFY_DEBUG

### Description
Enables internal runtime debug logging for Asyncify. Level 1 provides minimal logging, while Level 2 offers verbose logging.

### Default Value
`0`
````

---

### wasm-split Command for Module Splitting

Source: https://emscripten.org/docs/optimizing/Module-Splitting

This command uses wasm-split to split the original Wasm module (`application.wasm.orig`) into two parts based on the generated profile data. `--enable-mutable-globals` is required for sharing mutable globals. `--export-prefix=%` sets a prefix for shared exports. `-o1` specifies the primary module, and `-o2` specifies the secondary (deferred) module. `--profile` points to the collected profile data.

```bash
wasm-split --enable-mutable-globals --export-prefix=% application.wasm.orig -o1 application.wasm -o2 application.deferred.wasm --profile=profile.data

```

---

### C++ Proxying API: Execute Queue

Source: https://emscripten.org/docs/api_reference/proxying.h

This C++ wrapper allows for the execution of a proxy queue. It is part of the Emscripten namespace and requires C++11 or later. It operates on a ProxyingQueue object.

```cpp
namespace emscripten {

type ProxyingQueue {
    // ...
    void execute();
    // ...
};
}

```

---

### Emscripten Code Optimization Level 1

Source: https://emscripten.org/docs/getting_started/Tutorial

This command compiles a C++ file ('test/hello_world.cpp') using Emscripten ('emcc') with the optimization level set to 1 (-O1). This applies minor optimizations and removes some runtime assertions, potentially leading to slightly smaller or faster code compared to unoptimized versions.

```bash
./emcc -O1 test/hello_world.cpp

```

---

### Emscripten Fullscreen Strategy

Source: https://emscripten.org/genindex

Structure defining strategies for handling fullscreen mode.

```APIDOC
## Emscripten Fullscreen Strategy

### Description
Defines configurations for managing fullscreen behavior and scaling.

### Type
- **EmscriptenFullscreenStrategy**:
  - **Members**:
    - `canvasResizedCallback` (function pointer) - Callback when canvas is resized.
    - `canvasResizedCallbackUserData` (void*) - User data for the callback.
    - `canvasResolutionScaleMode` (enum) - Scaling mode for canvas resolution.
    - `filteringMode` (enum) - Filtering mode for scaling.
    - `scaleMode` (enum) - Overall scaling mode for fullscreen.
```

---

### Catching Null Pointer Read With UBSan

Source: https://emscripten.org/docs/debugging/Sanitizers

Demonstrates how UBSan identifies and reports the exact location of a null pointer read operation, providing crucial debugging information.

```c
int main(void) {
    int *a = 0, b;
    b = *a;
}
```

```bash
emcc -fsanitize=undefined null-assign.c
node a.out.js
```

---

### Enable Dynamic Memory Growth

Source: https://emscripten.org/docs/optimizing/Optimizing-Code

The `-sALLOW_MEMORY_GROWTH` flag enables dynamic resizing of the Wasm module's memory. This is useful for applications where the required memory amount is not known at compile time, allowing the memory to adjust based on runtime demands.

```bash
emcc my_program.c -sALLOW_MEMORY_GROWTH=1 -o my_program.html
```

---

### Using Emscripten Bundled System Headers

Source: https://emscripten.org/docs/getting_started/FAQ

When compiling with Emscripten, ensure you are using the bundled system headers provided by Emscripten. Using local system headers with 'emcc' can lead to compilation errors.

```bash
emcc your_code.c -o output.js
```

---

### Emscripten Proxying Queue Management

Source: https://emscripten.org/docs/api_reference/proxying.h

Functions for creating and destroying proxying queues. `em_proxying_queue_create` allocates a new queue, and `em_proxying_queue_destroy` frees an existing queue. The queue must be empty before destruction.

```c
em_proxying_queue *em_proxying_queue_create();

void em_proxying_queue_destroy(em_proxying_queue *q);
```

---

### Mount NODEFS File System in Emscripten

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Mounts the NODEFS file system, mapping a local directory to an Emscripten directory. This allows Emscripten applications to access and manipulate files in the host's file system. Requires Node.js environment.

```javascript
FS.mkdir("/working");
FS.mount(NODEFS, { root: "." }, "/working");
```

---

### Emscripten Linker Flag for WebGL 2 Optimizations

Source: https://emscripten.org/docs/optimizing/Optimizing-WebGL

This snippet explains how to enable optimizations for WebGL 2 in Emscripten by using the `-sMAX_WEBGL_VERSION=2` linker flag. This aims to improve JavaScript-side performance by reducing garbage generation. It also requires creating a WebGL 2 context at GL startup.

```text
// Build with: emcc main.c -o main.js -sMAX_WEBGL_VERSION=2

// JavaScript to create WebGL 2 context:
const canvas = document.getElementById('myCanvas');
const gl = canvas.getContext('webgl2');
```

---

### Embind: Awaiting Asynchronous Methods with `val::await`

Source: https://emscripten.org/docs/porting/asyncify

Demonstrates how to use the `await()` method on an Embind `val` instance to asynchronously retrieve a Promise. This method handles `ASYNCIFY_IMPORTS` and `JSPI_IMPORTS` automatically.

```cpp
#include <emscripten/bind.h>
#include <emscripten.h>

static int delayAndReturn(bool sleep) {
  if (sleep) {
    emscripten_sleep(0);
  }
  return 42;
}

EMSCRIPTEN_BINDINGS(example) {
  // Asyncify
  emscripten::function("delayAndReturn", &delayAndReturn);
  // JSPI
  emscripten::function("delayAndReturn", &delayAndReturn, emscripten::async());
}
```

---

### Register a Custom Device Driver with Callbacks (JavaScript)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Registers a device driver with a unique ID and a set of associated stream callbacks. These callbacks handle I/O operations for the device, enabling seamless interaction with Emscripten's filesystem operations.

```javascript
FS.registerDevice(dev, ops);
```

---

### Emscripten File System API Functions

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Details the core file system operations available in Emscripten, including creating, deleting, reading, writing, and manipulating files and directories.

```APIDOC
## File System API Functions

### Description
This section lists the primary functions provided by the Emscripten `FS` object for interacting with the file system. These functions are largely inspired by POSIX system calls.

### Core Operations

- **Initialization**:
  - `FS.init(input, output, error)`: Sets up standard I/O streams.

- **Mounting/Unmounting**:
  - `FS.mount(mountPoint, options, dev)`: Mounts a file system.
  - `FS.unmount(mountPoint)`: Unmounts a file system.

- **Directory Operations**:
  - `FS.mkdir(path)`: Creates a directory.
  - `FS.mkdirTree(path)`: Creates a directory and any necessary parent directories.
  - `FS.rmdir(path)`: Removes an empty directory.
  - `FS.readdir(path)`: Reads the contents of a directory.

- **File Operations**:
  - `FS.open(path, flags, mode)`: Opens a file.
  - `FS.close(stream)`: Closes an open file stream.
  - `FS.read(stream, buffer, offset, length)`: Reads data from a file stream into a buffer.
  - `FS.write(stream, buffer, offset, length)`: Writes data from a buffer to a file stream.
  - `FS.readFile(path, options)`: Reads the entire content of a file.
  - `FS.writeFile(path, data, options)`: Writes data to a file, creating it if it doesn't exist.
  - `FS.truncate(path, newSize)`: Truncates a file to a specified size.
  - `FS.unlink(path)`: Deletes a file.

- **Metadata Operations**:
  - `FS.stat(path)`: Gets information about a file or directory.
  - `FS.lstat(path)`: Gets information about a file or directory, without following symbolic links.
  - `FS.chmod(path, mode)`: Changes the permissions of a file or directory.
  - `FS.chown(path, uid, gid)`: Changes the ownership of a file or directory.
  - `FS.lchmod(path, mode)`: Changes the permissions of a file or symbolic link.
  - `FS.fchmod(stream, mode)`: Changes the permissions of an open file.
  - `FS.lchown(path, uid, gid)`: Changes the ownership of a file or symbolic link.
  - `FS.fchown(stream, uid, gid)`: Changes the ownership of an open file.
  - `FS.ftruncate(stream, newSize)`: Truncates an open file to a specified size.
  - `FS.utime(path, atime, mtime)`: Changes the access and modification times of a file.
  - `FS.mkdev(path, mode, dev)`: Creates a device file.
  - `FS.symlink(oldPath, newPath)`: Creates a symbolic link.
  - `FS.rename(oldPath, newPath)`: Renames a file or directory.
  - `FS.readlink(path)`: Reads the target of a symbolic link.

- **Stream/Offset Operations**:
  - `FS.llseek(stream, offset, whence)`: Seeks within a file stream.

- **Preloading/Lazy Loading**:
  - `FS.createLazyFile(parent, name, url, size, stats)`: Creates a lazy-loaded file.
  - `FS.createPreloadedFile(parent, name, url, size, canRead, canWrite, onload, onerror)`: Creates a file by preloading data from a URL.

- **Tracking**:
  - `FS.trackingDelegate[callback name]`: Accessor for tracking callbacks.

### Error Handling
Most functions report errors by raising exceptions of type `FS.ErrnoError`.
```

---

### Emscripten Async Wget2 Data Onload Callback Type

Source: https://emscripten.org/docs/api_reference/emscripten.h

Defines the function pointer type for the `onload` callback of `emscripten_async_wget2_data()`. Specific parameter values are documented within the `emscripten_async_wget2_data()` method.

```c
typedef void (*em_async_wget2_data_onload_func)(unsigned, void*, void *, unsigned)
```

---

### C++ Embind: Allow Raw Pointers and Take Ownership

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Illustrates how to handle raw pointers in Embind using `allow_raw_pointers()` for function arguments and `return_value_policy::take_ownership()` for returned pointers. This ensures clear lifetime management when dealing with raw pointer interactions between C++ and JavaScript.

```cpp
class C {};
C* passThrough(C* ptr) { return ptr; }
C* createC() { return new C(); }
EMSCRIPTEN_BINDINGS(raw_pointers) {
    class_<C>("C");
    function("passThrough", &passThrough, allow_raw_pointers());
    function("createC", &createC, return_value_policy::take_ownership());
}
```

---

### Emscripten FS: Advanced Utilities and Initialization

Source: https://emscripten.org/docs/api_reference/advanced-apis

Contains miscellaneous advanced functions for memory mapping, I/O control, static initialization, and shutting down the file system. Also includes functions for IndexedDB interaction and retrieving internal database names. These are for specialized use cases.

```javascript
FS.mmap(_stream_, _buffer_, _offset_, _length_, _position_, _prot_, _flags_);
FS.ioctl(_stream_, _cmd_, _arg_);
FS.staticInit();
FS.quit();
FS.indexedDB();
FS.DB_NAME();
FS.getMode(_canRead_, _canWrite_);
FS.findObject(_path_, _dontResolveLastLink_);
FS.forceLoadFile(_obj_);
```

---

### File Preprocessing and Postprocessing

Source: https://emscripten.org/docs/tools_reference/emcc

Options to include JavaScript code before or after the main Emscripten output, with different optimization behaviors.

```APIDOC
## --pre-js <file>

### Description
Specifies a file whose contents are added before the emitted code and optimized together with it. Useful for defining `Module` properties before they are accessed by Emscripten's output.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **file** (string) - Required - Path to the JavaScript file.

### Request Example
```

emcc input.c -o output.js --pre-js pre.js

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --post-js <file>

### Description
Specifies a file whose contents are added after the emitted code.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **file** (string) - Required - Path to the JavaScript file.

### Request Example
```

emcc input.c -o output.js --post-js post.js

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --extern-pre-js <file>

### Description
Prepends a file's contents to the final JavaScript output after all other processing, including optimization and modularization.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **file** (string) - Required - Path to the JavaScript file.

### Request Example
```

emcc input.c -o output.js --extern-pre-js extern_pre.js

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --extern-post-js <file>

### Description
Appends a file's contents to the final JavaScript output after all other processing.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **file** (string) - Required - Path to the JavaScript file.

### Request Example
```

emcc input.c -o output.js --extern-post-js extern_post.js

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A
```

---

### Emscripten Class Factory Constructor Registration Prototype

Source: https://emscripten.org/docs/api_reference/bind.h

A flexible constructor registration method for the `class_` class that accepts a `Callable` (e.g., function pointer, `std::function`, or function object) to create objects using a factory function. It supports explicit signature deduction and various policies.

```cpp
template<typename Signature = internal::DeduceArgumentsTag, typename Callable, typename... Policies>
EMSCRIPTEN_ALWAYS_INLINE const class_& constructor(Callable callable, Policies...) const
```

---

### Create Symbolic Link in Emscripten File System

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Creates a symbolic link at `newpath` that points to `oldpath`. This allows creating aliases or shortcuts within the Emscripten file system. The target file or directory must exist.

```javascript
FS.writeFile("file", "foobar");
FS.symlink("file", "link");
```

---

### Browser Information Functions

Source: https://emscripten.org/docs/api_reference/emscripten.h

Functions to retrieve device pixel ratio, window title, and screen size.

````APIDOC
## `emscripten_get_device_pixel_ratio`

### Description
Returns the value of `window.devicePixelRatio`.

### Method
`double`

### Endpoint
N/A (C Function)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```c
double pixelRatio = emscripten_get_device_pixel_ratio();
````

### Response

#### Success Response (double)

- **Return value** (double) - The pixel ratio or 1.0 if not supported.

#### Response Example

```json
{
  "pixelRatio": 2.0
}
```

````

```APIDOC
## `emscripten_get_window_title`

### Description
Returns the window title. The returned string will be valid until the next call of the function.

### Method
`char *`

### Endpoint
N/A (C Function)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```c
char* title = emscripten_get_window_title();
printf("Window title: %s\n", title);
````

### Response

#### Success Response (char \*)

- **Return value** (char \*) - Pointer to the window title string.

#### Response Example

```json
{
  "title": "My Emscripten Game"
}
```

````

```APIDOC
## `emscripten_set_window_title`

### Description
Sets the window title.

### Method
`void`

### Endpoint
N/A (C Function)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```c
emscripten_set_window_title("New Game Title");
````

### Response

#### Success Response (void)

None

#### Response Example

N/A

### Parameters

- **title** (char \*) – The new window title string.

````

```APIDOC
## `emscripten_get_screen_size`

### Description
Returns the width and height of the screen.

### Method
`void`

### Endpoint
N/A (C Function)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```c
int width, height;
emscripten_get_screen_size(&width, &height);
printf("Screen size: %d x %d\n", width, height);
````

### Response

#### Success Response (void)

- **width** (int\*) - Pointer to store the screen width.
- **height** (int\*) - Pointer to store the screen height.

#### Response Example

N/A (function modifies provided pointers)

````

--------------------------------

### Using a Bound C++ Class in JavaScript

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Shows how to instantiate and interact with a C++ class that has been bound to JavaScript using Embind. It illustrates creating an instance, calling methods, accessing properties, and properly deleting the C++ object when it's no longer needed.

```javascript
var instance = new Module.MyClass(10, "hello");
instance.incrementX();
instance.x; // 11
instance.x = 20; // 20
Module.MyClass.getStringFromInstance(instance); // "hello"
instance.delete();
````

---

### Main Loop Timing Functions

Source: https://emscripten.org/docs/api_reference/emscripten.h

Functions for managing and retrieving the main loop's timing mode and configuration.

````APIDOC
## `emscripten_get_main_loop_timing`

### Description
Returns the current main loop timing mode that is in effect. The timing mode is controlled by calling `emscripten_set_main_loop_timing()` and `emscripten_set_main_loop()`.

### Method
`void`

### Endpoint
N/A (C Function)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```c
int mode;
int value;
emscripten_get_main_loop_timing(&mode, &value);
````

### Response

#### Success Response (void)

- **mode** (int\*) - If not null, the used timing mode is returned here.
- **value** (int\*) - If not null, the used timing value is returned here.

#### Response Example

N/A (function modifies provided pointers)

````

```APIDOC
## `emscripten_set_main_loop_expected_blockers`

### Description
Sets the number of blockers that are about to be pushed. The number is used for reporting the _relative progress_ through a set of blockers, after which the main loop will continue.

### Method
`void`

### Endpoint
N/A (C Function)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```c
emscripten_set_main_loop_expected_blockers(10);
````

### Response

#### Success Response (void)

None

#### Response Example

N/A

````

--------------------------------

### Build Side Module with Emscripten

Source: https://emscripten.org/docs/compiling/Dynamic-Linking

Builds other parts of your code as side modules, which do not include system libraries. The output suffix is recommended to be .wasm or .so.

```bash
emcc -sSIDE_MODULE other_code.c -o module.wasm
````

---

### Emscripten Async Wget2 Onload Callback Type

Source: https://emscripten.org/docs/api_reference/emscripten.h

Defines the function pointer type for the `onload` callback used by `emscripten_async_wget2()`. Detailed parameter information can be found in the `emscripten_async_wget2()` method documentation.

```c
typedef void (*em_async_wget2_onload_func)(void*, const char*)
```

---

### Emscripten Documentation Index

Source: https://emscripten.org/genindex

This section lists the documented items within the Emscripten project, organized alphabetically. It includes built-in functions, C++ types, C types, C macros, and other relevant project components.

```APIDOC
## Emscripten Documentation Index

### Description
This page provides an index of documentation related to the Emscripten project, covering various aspects like built-in functions, C++ types, C types, C macros, and configuration files.

### Method
N/A (Informational Index)

### Endpoint
N/A

### Parameters
N/A

### Request Example
N/A

### Response
#### Success Response (200)
N/A (Informational Content)

#### Response Example
N/A
```

---

### C++ Classes: value_array and value_object

Source: https://emscripten.org/genindex

Documentation for the value_array and value_object C++ classes used for handling arrays and objects.

```APIDOC
## C++ Classes: value_array and value_object

### Description
Details the `value_array` and `value_object` C++ classes, which are designed for representing and manipulating array-like and object-like data structures within Emscripten.

### Class: `value_array`
- **Description**: Represents an array of values.
- **Type**: `value_array::class_type`
- **Functions**: `value_array::element`, `value_array::value_array`, `value_array::~value_array`

### Class: `value_object`
- **Description**: Represents an object with key-value pairs.
- **Type**: `value_object::class_type`
- **Functions**: `value_object::field`, `value_object::value_object`, `value_object::~value_object`
```

---

### Gamepad Data Sampling and Retrieval

Source: https://emscripten.org/docs/api_reference/html5.h

Functions to sample gamepad data and retrieve the status of connected gamepads.

````APIDOC
## POST /emscripten_sample_gamepad_data

### Description
Samples the latest state of connected gamepad data. This must be called before querying gamepad information.

### Method
POST

### Endpoint
/emscripten_sample_gamepad_data

### Parameters
None

### Request Example
```json
{
  "message": "Sample gamepad data"
}
````

### Response

#### Success Response (200)

- **EMSCRIPTEN_RESULT** (EMSCRIPTEN_RESULT) - `EMSCRIPTEN_RESULT_SUCCESS` if the Gamepad API is supported, `EMSCRIPTEN_RESULT_NOT_SUPPORTED` otherwise.

#### Response Example

```json
{
  "status": "EMSCRIPTEN_RESULT_SUCCESS"
}
```

## GET /emscripten_get_num_gamepads

### Description

Retrieves the number of gamepads currently connected after calling `emscripten_sample_gamepad_data()`.

### Method

GET

### Endpoint

/emscripten_get_num_gamepads

### Parameters

None

### Request Example

```json
{
  "query": "Get number of gamepads"
}
```

### Response

#### Success Response (200)

- **count** (int) - The number of gamepads connected. Returns `EMSCRIPTEN_RESULT_NOT_SUPPORTED` if the browser does not support gamepads.

#### Response Example

```json
{
  "count": 2
}
```

## POST /emscripten_get_gamepad_status

### Description

Retrieves the current state of a specific gamepad after calling `emscripten_sample_gamepad_data()`.

### Method

POST

### Endpoint

/emscripten_get_gamepad_status

### Parameters

#### Path Parameters

None

#### Query Parameters

None

#### Request Body

- **index** (int) - Required - The index of the gamepad in the connected array.
- **gamepadState** (EmscriptenGamepadEvent\*) - Required - A pointer to store the gamepad state.

### Request Example

```json
{
  "index": 0,
  "gamepadState": {
    /* structure to hold gamepad state */
  }
}
```

### Response

#### Success Response (200)

- **EMSCRIPTEN_RESULT** (EMSCRIPTEN_RESULT) - `EMSCRIPTEN_RESULT_SUCCESS` or another result value.

#### Response Example

```json
{
  "status": "EMSCRIPTEN_RESULT_SUCCESS"
}
```

````

--------------------------------

### emscripten_idb_async_load

Source: https://emscripten.org/docs/api_reference/emscripten.h

Loads data from local IndexedDB storage asynchronously. The provided `onload` callback is invoked upon successful data retrieval, and `onerror` is called if any error occurs.

```APIDOC
## emscripten_idb_async_load

### Description
Loads data from local IndexedDB storage asynchronously. This allows use of persistent data, without the overhead of the filesystem layer. When the data is ready then the `onload` callback will be called. If any error occurred `onerror` will be called.

### Method
POST

### Endpoint
/websites/emscripten/idb

### Parameters
#### Path Parameters
- **db_name** (string) - Required - The IndexedDB database from which to load.
- **file_id** (string) - Required - The identifier of the data to load.

#### Query Parameters
- **arg** (void*) - Optional - User-defined data that is passed to the callbacks.
- **onload** (em_async_wget_onload_func) - Required - Callback on successful load. Receives (arg, buffer, size).
- **onerror** (em_arg_callback_func) - Required - Callback in the event of failure. Receives (arg).

### Request Example
```json
{
  "db_name": "myDatabase",
  "file_id": "myDataFile",
  "arg": null,
  "onload": "function(arg, buffer, size) { console.log('Data loaded'); }",
  "onerror": "function(arg) { console.error('Error loading data'); }"
}
````

### Response

#### Success Response (200)

This function does not return a value directly; results are delivered via the `onload` callback.

#### Response Example

(Callback invoked)

````

--------------------------------

### Write and Truncate File with Emscripten

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Demonstrates writing data to a file and then truncating it using Emscripten's JS API within C++ code. It utilizes MAIN_THREAD_EM_ASM for direct JavaScript execution.

```c
#include <emscripten.h>

int main() {
  MAIN_THREAD_EM_ASM(
  FS.writeFile('file', 'foobar');
  FS.truncate('file', 3);
  console.log(FS.readFile('file', { encoding: 'utf8' }));
  );
  return 0;
}
````

---

### Emscripten Code Optimization Level 2

Source: https://emscripten.org/docs/getting_started/Tutorial

This command compiles a C++ file ('test/hello_world.cpp') using Emscripten ('emcc') with the optimization level set to 2 (-O2). This level enables more aggressive optimizations, significantly altering the generated JavaScript code for potential performance gains.

```bash
./emcc -O2 test/hello_world.cpp

```

---

### Emscripten Proxy Execution with Context and Callback

Source: https://emscripten.org/docs/api_reference/proxying.h

Enqueues a function (`func`) that uses `emscripten_proxy_finish` for completion. Upon task completion, it proxies a `callback` back to the current thread. If the target thread dies, `cancel` is called. All functions receive `arg`. Returns 1 on successful enqueue.

```c
int emscripten_proxy_callback_with_ctx(em_proxying_queue *q, pthread_t target_thread, void (*func)(em_proxying_ctx*, void*), void (*callback)(void*), void (*cancel)(void*), void *arg);
```

---

### Asyncify Configuration for Instrumented Functions

Source: https://emscripten.org/docs/tools_reference/settings_reference

Configure which functions are instrumented by Asyncify, with options to add functions automatically, propagate instrumentation status, and specify functions to be exclusively instrumented. This is crucial for managing asynchronous behavior in WebAssembly modules.

```ini
; ASYNCIFY_ADD: List of functions to always instrument.
; ASYNCIFY_PROPAGATE_ADD: Propagate instrumentation status from callers.
; ASYNCIFY_ONLY: List of functions to instrument exclusively.
; ASYNCIFY_REMOVE: List of functions to exclude from instrumentation.
; ASYNCIFY_ADVISE: Enable output for instrumented functions.
; ASYNCIFY_DEBUG: Runtime debug logging level for Asyncify.

```

---

### Call JavaScript Constructor and Methods from C++ using emscripten::val

Source: https://emscripten.org/docs/api_reference/val.h

This snippet illustrates calling a JavaScript constructor using `new_()` and invoking methods on a JavaScript object using `call()` from C++. It also shows how to check for own properties using `hasOwnProperty()`.

```C++
val Math = val::global("Math");
val random_number = Math.call<double>("random");

val obj = val::object();
obj.set("name", val("Example"));

bool has_name = obj.hasOwnProperty("name"); // true
```

---

### Asyncify Only-List Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Specify a list of functions that are the _only_ ones to be instrumented by Asyncify. If this list is provided, no other functions will be instrumented. Incorrect configuration can break the application. Wildcard matching and character substitutions are supported.

```emcc
-ASYNCIFY_ONLY=[function1,function2,...]
```

---

### C++ Proxying API: Synchronous Proxy with Context

Source: https://emscripten.org/docs/api_reference/proxying.h

This C++ function executes a given function synchronously with context on a target thread. It returns true if the function was marked done via finish, and false otherwise. It relies on emscripten_proxy_sync_with_ctx and requires C++11 or later.

```cpp
#include <functional>
#include <pthread.h>

namespace emscripten {

// Assuming ProxyingCtx is defined elsewhere
struct ProxyingCtx;

bool proxySyncWithCtx(const pthread_t target, const std::function<void(ProxyingCtx)> &func);

}

```

---

### Run Compiled JavaScript with Node.js

Source: https://emscripten.org/docs/getting_started/Tutorial

This command executes the generated JavaScript file using Node.js. The JavaScript file contains the Emscripten runtime and the compiled WebAssembly module, allowing the C/C++ code to run in a Node.js environment. The input is the compiled JavaScript file (e.g., a.out.js), and the output is the result of the executed program.

```shell
node a.out.js

```

---

### Emscripten Async Wget Data Onload Callback Type

Source: https://emscripten.org/docs/api_reference/emscripten.h

Defines the function pointer type for the `onload` callback used by `emscripten_async_wget_data()`. The specific parameters are detailed within the `emscripten_async_wget_data()` method documentation.

```c
typedef void (*em_async_wget_onload_func)(void*, void*, int)
```

---

### emscripten_async_wget2_data

Source: https://emscripten.org/docs/api_reference/emscripten.h

Loads a buffer from a URL asynchronously, writing data directly to memory. This function is an experimental, more feature-complete version of emscripten_async_wget_data().

````APIDOC
## emscripten_async_wget2_data

### Description
Loads a buffer from a URL asynchronously. This is the “data” version of `emscripten_async_wget2()`. It is an **experimental** “more feature complete” version of `emscripten_async_wget_data()`. Instead of writing to a file, this function writes to a buffer directly in memory. This avoids the overhead of using the emulated file system.

### Method
`int`

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```c
int emscripten_async_wget2_data(
    const char *url,
    const char *requesttype,
    const char *param,
    void *arg,
    int free,
    em_async_wget2_data_onload_func onload,
    em_async_wget2_data_onerror_func onerror,
    em_async_wget2_data_onprogress_func onprogress
);
````

### Response

#### Success Response (200)

N/A (Callbacks handle success)

#### Response Example

N/A (Callbacks handle success)

### Callbacks

- **onload** (em_async_wget2_data_onload_func):
  - _(unsigned)_: Handle to the request
  - \_(void\*): Equal to `arg` (user defined data).
  - \_(void\*): A pointer to the buffer in memory.
  - _(unsigned)_: The size of the buffer (in bytes).

- **onerror** (em_async_wget2_data_onerror_func):
  - _(unsigned)_: Handle to the request
  - \_(void\*): Equal to `arg` (user defined data).
  - _(int)_: The HTTP error code.
  - \_(const char\*): A string with the status description.

- **onprogress** (em_async_wget2_data_onprogress_func):
  - _(unsigned)_: Handle to the request
  - \_(void\*): Equal to `arg` (user defined data).
  - _(int)_: The number of bytes loaded.
  - _(int)_: The total size of the data in bytes, or zero if the size is unavailable.

````

--------------------------------

### Emscripten Visibility and Orientation

Source: https://emscripten.org/genindex

Functions and macros related to controlling display orientation and visibility states.

```APIDOC
## Emscripten Visibility and Orientation API

### Description
Functions and macros for managing screen orientation and element visibility.

### Functions
- **emscripten_unlock_orientation**: Unlocks the screen orientation.

### Macros
- **EMSCRIPTEN_VISIBILITY_HIDDEN**: Macro representing hidden visibility state.
- **EMSCRIPTEN_VISIBILITY_PRERENDER**: Macro representing pre-render visibility state.
- **EMSCRIPTEN_VISIBILITY_UNLOADED**: Macro representing unloaded visibility state.
- **EMSCRIPTEN_VISIBILITY_VISIBLE**: Macro representing visible state.
````

---

### emscripten_idb_async_store

Source: https://emscripten.org/docs/api_reference/emscripten.h

Stores data to local IndexedDB storage asynchronously. The `onstore` callback is invoked upon successful data storage, and `onerror` is called if any error occurs.

````APIDOC
## emscripten_idb_async_store

### Description
Stores data to local IndexedDB storage asynchronously. This allows use of persistent data, without the overhead of the filesystem layer. When the data has been stored then the `onstore` callback will be called. If any error occurred `onerror` will be called.

### Method
POST

### Endpoint
/websites/emscripten/idb

### Parameters
#### Path Parameters
- **db_name** (string) - Required - The IndexedDB database from which to load.
- **file_id** (string) - Required - The identifier of the data to load.

#### Query Parameters
- **ptr** (void*) - Required - A pointer to the data to store.
- **num** (int) - Required - How many bytes to store.
- **arg** (void*) - Optional - User-defined data that is passed to the callbacks.
- **onstore** (em_arg_callback_func) - Required - Callback on successful store. Receives (arg).
- **onerror** (em_arg_callback_func) - Required - Callback in the event of failure. Receives (arg).

### Request Example
```json
{
  "db_name": "myDatabase",
  "file_id": "myDataFile",
  "ptr": "0x12345678",
  "num": 1024,
  "arg": null,
  "onstore": "function(arg) { console.log('Data stored'); }",
  "onerror": "function(arg) { console.error('Error storing data'); }"
}
````

### Response

#### Success Response (200)

This function does not return a value directly; results are delivered via the `onstore` callback.

#### Response Example

(Callback invoked)

````

--------------------------------

### Resume Audio Context on Canvas Click (C/C++)

Source: https://emscripten.org/docs/api_reference/wasm_audio_worklets

This event handler is triggered when the canvas element is clicked. It checks if the audio context is currently suspended and, if so, resumes it synchronously using `emscripten_resume_audio_context_sync`. This is necessary because audio playback on the web can only be initiated by user interaction.

```c++
bool OnCanvasClick(int eventType, const EmscriptenMouseEvent *mouseEvent, void *userData)
{
  EMSCRIPTEN_WEBAUDIO_T audioContext = (EMSCRIPTEN_WEBAUDIO_T)userData;
  if (emscripten_audio_context_state(audioContext) != AUDIO_CONTEXT_STATE_RUNNING) {
    emscripten_resume_audio_context_sync(audioContext);
  }
  return false;
}
````

---

### FS.lstat

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Retrieves statistics about a file system node, including symbolic links.

````APIDOC
## FS.lstat

### Description
Identical to `FS.stat()`, however, if `path` is a symbolic link then the returned stats will be for the link itself, not the file that it links to.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **path** (string) - Required - Path to the target file.

### Request Example
```javascript
// Assuming a symbolic link 'link' points to 'file'
FS.lstat('link');
````

### Response

#### Success Response (object)

- **dev** (number) - Device ID.
- **ino** (number) - Inode number.
- **mode** (number) - File mode (permissions).
- **nlink** (number) - Number of hard links.
- **uid** (number) - User ID.
- **gid** (number) - Group ID.
- **rdev** (number) - Device ID for special files.
- **size** (number) - Size of the file in bytes.
- **atime** (Date) - Last access time.
- **mtime** (Date) - Last modification time.
- **ctime** (Date) - Last status change time.
- **blksize** (number) - Block size.
- **blocks** (number) - Number of blocks.

#### Response Example

(Similar to FS.stat, but reflects the link itself if applicable)

````

--------------------------------

### FS.chdir(path) - Change Directory

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Sets the current working directory to the specified path.

```APIDOC
## FS.chdir(path)

### Description
Sets the current working directory.

### Method
POST

### Endpoint
/websites/emscripten/fs/chdir

### Parameters
#### Request Body
- **path** (string) - Required - The path to set as the current working directory.

### Request Example
```json
{
  "method": "POST",
  "endpoint": "/websites/emscripten/fs/chdir",
  "body": {
    "path": "/new/directory"
  }
}
````

### Response

#### Success Response (200)

- **string** - A confirmation message or the new current working directory.

#### Response Example

```json
{
  "message": "Current directory changed successfully",
  "cwd": "/new/directory"
}
```

````

--------------------------------

### Push Main Loop Blocker

Source: https://emscripten.org/docs/api_reference/emscripten.h

Adds a callback function that will be executed when the main loop is blocked.

```APIDOC
## void emscripten_push_main_loop_blocker(em_arg_callback_func func, void *arg)

### Description
Pushes a callback function onto a list of functions to be executed when the main loop is blocked. This is useful for handling asynchronous operations or long-running tasks without freezing the main thread.

### Method
void

### Endpoint
emscripten_push_main_loop_blocker

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
- **func** (em_arg_callback_func) - Required - The callback function to execute when the loop is blocked. Must accept a `void*` parameter.
- **arg** (void*) - Required - User-defined data to be passed to the callback function.

### Request Example
```json
{
  "func": "handle_blocking_task",
  "arg": "0xabcdef01"
}
````

### Response

#### Success Response (void)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Enter Soft Fullscreen - C/C++

Source: https://emscripten.org/docs/api_reference/html5.h

Enters a 'soft' fullscreen mode for a target element using a specified strategy. This mode might have different characteristics or browser support compared to standard fullscreen.

```c
EMSCRIPTEN_RESULT emscripten_enter_soft_fullscreen(const char *target, const EmscriptenFullscreenStrategy *fullscreenStrategy)
{
    // Implementation details for entering soft fullscreen
    return EMSCRIPTEN_RESULT_SUCCESS;
}
````

---

### Compile C API for NodeJS with Emscripten

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Compiles a C source file into a JavaScript module suitable for NodeJS. The `-sMODULARIZE` flag creates a factory function for easy importing, and `-sEXPORTED_RUNTIME_METHODS=ccall` ensures `ccall` is available for dynamic function calls.

```bash
emcc api_example.c -o api_example.js -sMODULARIZE -sEXPORTED_RUNTIME_METHODS=ccall
```

---

### C++ Proxying API: Callback Proxy with Context

Source: https://emscripten.org/docs/api_reference/proxying.h

This C++ function executes a primary function with context and schedules either a callback or cancel function. It returns true if the function was successfully enqueued, false otherwise. It utilizes emscripten_proxy_callback_with_ctx and requires C++11 or later.

```cpp
#include <functional>
#include <pthread.h>

namespace emscripten {

// Assuming ProxyingCtx is defined elsewhere
struct ProxyingCtx;

bool proxyCallbackWithCtx(pthread_t target, std::function<void(ProxyingCtx)> &&func, std::function<void()> &&callback, std::function<void()> &&cancel);

}

```

---

### WebGL Context Configuration

Source: https://emscripten.org/docs/api_reference/module

Configure the WebGL context for Emscripten applications. Allows pre-initializing a WebGL context for parallel loading and feature detection.

````APIDOC
## Module.preinitializedWebGLContext

### Description
Allows setting a precreated WebGL context instance when building with `-sGL_PREINITIALIZED_CONTEXT`. This context is used during WebGL initialization on the C/C++ side.

### Method
Configuration

### Endpoint
N/A (Module configuration property)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
Module.preinitializedWebGLContext = myPrecreatedContext;
````

### Response

N/A

````

--------------------------------

### Access read files object (JavaScript)

Source: https://emscripten.org/docs/porting/files/packaging_files

Provides direct access to an object containing all files that have been read by the application. This offers an alternative to runtime logging for analyzing file usage.

```javascript
const readFiles = FS.readFiles();
````

---

### Asynchronous Shared Library Loading with Emscripten dlopen

Source: https://emscripten.org/docs/api_reference/emscripten.h

Initiates an asynchronous operation to load a shared library. This function returns immediately, allowing the Emscripten event loop to continue. Success and error callbacks are provided to handle the outcome of the loading process. The `onerror` callback allows retrieval of error details using `dlerror`.

```c
void emscripten_dlopen(const char *filename, int flags, void *user_data, em_dlopen_callback onsuccess, em_arg_callback_func onerror);
```

---

### C++ Proxying API: Finish Context

Source: https://emscripten.org/docs/api_reference/proxying.h

This C++ wrapper provides a method to finish a proxying context. It is defined within the emscripten namespace and is intended for use with C++11 or later. It operates on a ProxyingCtx object.

```cpp
namespace emscripten {

type ProxyingCtx {
    // ...
    void finish();
    // ...
};
}

```

---

### Enable Gzip Compression for .wasm Files in Apache

Source: https://emscripten.org/docs/compiling/WebAssembly

This Apache configuration enables gzip compression for .wasm files, reducing transfer size. It ensures that the browser can decompress the content efficiently.

```apache
AddOutputFilterByType DEFLATE application/wasm

```

---

### Emscripten Class Zero-Argument Constructor Registration Prototype

Source: https://emscripten.org/docs/api_reference/bind.h

The zero-argument form of the `constructor` method for the `class_` class. It invokes the natural constructor and can accept policies, such as `allow_raw_pointers`, for managing object ownership.

```cpp
template<typename... ConstructorArgs, typename... Policies>
EMSCRIPTEN_ALWAYS_INLINE const class_& constructor(Policies... policies) const
```

---

### Emscripten Runtime Debugging Script

Source: https://emscripten.org/docs/tools_reference/settings_reference

Demonstrates how to toggle runtime debugging for libraries in Emscripten C++ code. This allows enabling or disabling logging dynamically during execution.

```javascript
emscripten_run_script("runtimeDebug = true;");
```

---

### C++ Embind: Define Class Constructors with Arguments

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Shows how to define constructors for C++ classes that take arguments, enabling their instantiation in JavaScript. This covers both the direct template argument form and the factory function form for more complex construction scenarios.

```cpp
class MyClass {
public:
  MyClass(int, float);
  void someFunction();
};

EMSCRIPTENEN_BINDINGS(external_constructors) {
  class_<MyClass>("MyClass")
    .constructor<int, float>()
    .function("someFunction", &MyClass::someFunction)
    ;
}
```

```cpp
class MyClass {
  virtual void someFunction() = 0;
};
MyClass* makeMyClass(int, float); //Factory function.

EMSCRIPTEN_BINDINGS(external_constructors) {
  class_<MyClass>("MyClass")
    .constructor(&makeMyClass, allow_raw_pointers())
    .function("someFunction", &MyClass::someFunction)
    ;
}
```

---

### Emscripten System Proxy Queue

Source: https://emscripten.org/docs/api_reference/proxying.h

Retrieves the system's proxy queue for low-level runtime work. This queue's tasks may execute at any time and must be non-blocking. User code should generally avoid using this.

```c
em_proxying_queue *emscripten_proxy_get_system_queue();
```

---

### C++ Class: wrapper

Source: https://emscripten.org/genindex

Information about the wrapper C++ class and its methods for function wrapping.

```APIDOC
## C++ Class: wrapper

### Description
Details the `wrapper` C++ class, which is used for wrapping functions, enabling them to be called from Emscripten-generated JavaScript code.

### Class
`wrapper`

### Members and Functions
- `call`: C++ function to invoke the wrapped function.
- `class_type`: C++ type representing the class type.
- `wrapper`: C++ constructor.
- `~wrapper`: C++ destructor.
```

---

### Catching Null Dereference With UBSan

Source: https://emscripten.org/docs/debugging/Sanitizers

Illustrates how UBSan detects and reports the exact line number of a null pointer dereference, making debugging significantly easier compared to builds without sanitizers.

```c
int main(void) {
    int *a = 0;
    *a = 0;
}
```

```bash
emcc -fsanitize=undefined null-assign.c
node a.out.js
```

---

### Generate Random Noise Audio Samples (C/C++)

Source: https://emscripten.org/docs/api_reference/wasm_audio_worklets

This is the core audio callback function that generates random noise for the audio output. It iterates through the output buffer and fills it with random floating-point values between -0.1 and 0.1. The `<emscripten/em_math.h>` header is needed for `emscripten_random`. The function returns true to indicate that the audio graph should continue processing.

```c++
#include <emscripten/em_math.h>

bool GenerateNoise(int numInputs, const AudioSampleFrame *inputs,
                      int numOutputs, AudioSampleFrame *outputs,
                      int numParams, const AudioParamFrame *params,
                      void *userData)
{
  for(int i = 0; i < numOutputs; ++i)
    for(int j = 0; j < outputs[i].samplesPerChannel*outputs[i].numberOfChannels; ++j)
      outputs[i].data[j] = emscripten_random() * 0.2 - 0.1; // Warning: scale down audio volume by factor of 0.2, raw noise can be really loud otherwise

  return true; // Keep the graph output going
}
```

---

### Emscripten Proxy Execution with Callback

Source: https://emscripten.org/docs/api_reference/proxying.h

Enqueues a function (`func`) on a target thread. Upon completion, it proxies a `callback` function back to the current thread. If the target thread dies, a `cancel` function is called instead. All functions receive the same `arg`. Returns 1 if enqueued successfully.

```c
int emscripten_proxy_callback(em_proxying_queue *q, pthread_t target_thread, void (*func)(void*), void (*callback)(void*), void (*cancel)(void*), void *arg);
```

---

### JavaScript Implementation of C API using addToLibrary

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

This JavaScript code uses the `addToLibrary` function to register the `my_js` implementation. `addToLibrary` adds properties to the global `LibraryManager.library` object, making the `my_js` function available to be called from C/C++.

```javascript
addToLibrary({
  my_js: function () {
    alert("hi");
  },
});
```

---

### String Conversion for Emscripten Function Calls (JS to C)

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Explains how to convert JavaScript strings to C-compatible `char *` pointers for passing to Emscripten-compiled functions. It highlights the use of `stringToNewUTF8` for allocation and the necessity of freeing the allocated memory using `_free` afterwards.

```javascript
// To convert a JavaScript string to a C char*
var ptr = stringToNewUTF8("your string");

// ... call your C function with ptr ...

// Remember to free the allocated memory
_free(ptr);
```

---

### EGL-related Bugs and Todos

Source: https://emscripten.org/docs/porting/multimedia_and_graphics/EGL-Support-in-Emscripten

Information on how to find and report EGL-related issues in Emscripten.

```APIDOC
## EGL API - Bugs and Todos

### Description
Guidance on finding and reporting EGL-related issues within the Emscripten project.

### Issue Tracking
EGL-related issues are tracked on the Emscripten issue tracker using the label `EGL`. Visit the tracker to report or find existing issues.
```

---

### Fetch API - Persisting Files

Source: https://emscripten.org/docs/api_reference/fetch

Enables explicit control for persisting downloaded files to browser's IndexedDB storage for subsequent visits.

````APIDOC
## POST /emscripten/fetch (with persistence)

### Description
Downloads a file and persists it to the browser's IndexedDB storage, making it available on subsequent page visits.

### Method
GET (or other HTTP methods like PUT, POST)

### Endpoint
`/` (relative to current page URL) or an absolute URL.

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```c
#include <emscripten/fetch.h>
#include <string.h>

int main() {
  emscripten_fetch_attr_t attr;
  emscripten_fetch_attr_init(&attr);
  strcpy(attr.requestMethod, "GET");
  // Load to memory AND persist the file to IndexedDB
  attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY | EMSCRIPTEN_FETCH_PERSIST_FILE;
  // ... set success/error callbacks if needed ...
  emscripten_fetch(&attr, "myfile.dat");
}
````

### Response

#### Success Response (200)

File is downloaded and stored in IndexedDB.

#### Response Example

(Success callback is invoked upon download completion)

````

--------------------------------

### Extract Profile Data to Base64 in JavaScript

Source: https://emscripten.org/docs/optimizing/Module-Splitting

This JavaScript code snippet demonstrates how to extract raw profile data from Emscripten's memory heap and encode it as a base64 string. This is useful for transmitting profile data from a browser environment to a developer machine for further processing. The data is expected to be located at a given pointer (ptr) with a specific length (len) in the HEAPU8 array.

```javascript
var profile_data = HEAPU8.subarray(ptr, ptr + len);
var binary = '';
for (var i = 0; i < profile_data.length; i++) {
    binary += String.fromCharCode(profile_data[i]);
}
console.log("===BEGIN===");
console.log(window.btoa(binary));
console.log("===END===");
````

---

### emscripten_async_wget_data

Source: https://emscripten.org/docs/api_reference/emscripten.h

Loads a buffer from a URL asynchronously. This version writes data directly into memory instead of a file, avoiding file system overhead.

````APIDOC
## emscripten_async_wget_data

### Description
Loads a buffer from a URL asynchronously. This is the “data” version of `emscripten_async_wget()`. Instead of writing to a file, this function writes to a buffer directly in memory. This avoids the overhead of using the emulated file system. When the file is ready then the `onload` callback will be called. If any error occurred `onerror` will be called.

### Method
`void`

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
* **url** (const char*) - The URL of the file to load.
* **arg** (void*) - User-defined data that is passed to the callbacks, untouched by the API itself. This may be used by a callback to identify the associated call.
* **onload** (em_async_wget_onload_func) - Callback on successful load of the URL into the buffer. The callback function parameter values are:
  * _(void_)* : Equal to `arg` (user defined data).
  * _(void_)* : A pointer to a buffer with the data. Note that, as with the worker API, the data buffer only lives during the callback; it must be used or copied during that time.
  * _(int)_ : The size of the buffer, in bytes.
* **onerror** (em_arg_callback_func) - Callback in the event of failure. The callback function parameter values are:
  * _(void_)* : Equal to `arg` (user defined data).

### Request Example
```c
void* my_data = malloc(1024);
emscripten_async_wget_data("http://example.com/data.bin", my_data, onload_data_callback, onerror_data_callback);
````

### Response

#### Success Response (void)

No direct response, relies on callbacks.

#### Response Example

```c
void onload_data_callback(void* arg, void* buffer, int size) {
  printf("Data loaded successfully. Size: %d bytes.\n", size);
  // Use the buffer here, e.g., copy it to persistent storage
  // free(buffer); // Do NOT free the buffer, it's managed by Emscripten during the callback
}

void onerror_data_callback(void* arg) {
  printf("Error loading data.\n");
}
```

````

--------------------------------

### Handling -s Options with Spaces and Lists in Emscripten

Source: https://emscripten.org/docs/getting_started/FAQ

Explains how to correctly pass complex `-s` options to Emscripten, especially those involving spaces, lists, or special characters. Using the `KEY=VALUE` format without spaces or brackets, or using response files (`@filename`), can help avoid shell quoting issues.

```shell
# Using simpler list form
emcc a.c -sEXPORTED_RUNTIME_METHODS=foo,bar

# Using a response file
emcc a.c -sEXPORTED_RUNTIME_METHODS=@extra.txt
````

---

### Mount WORKERFS File System with Blobs/Files in Emscripten

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Mounts the WORKERFS file system, loading files from a provided list of File objects or Blobs. This is useful for providing static assets or data to an Emscripten application running in a worker. It uses the `blobs` and `files` options for configuration.

```javascript
var blob = new Blob(["blob data"]);
FS.mkdir("/working");
FS.mount(
  WORKERFS,
  {
    blobs: [{ name: "blob.txt", data: blob }],
    files: files, // Array of File objects or FileList
  },
  "/working",
);
```

---

### Generate Emscripten Configuration File

Source: https://emscripten.org/docs/building_from_source/configuring_emscripten_settings

This command generates a default Emscripten settings file (.emscripten). It attempts to automatically detect tool paths based on your system's PATH environment variable. You will likely need to edit this file afterwards to provide correct paths to LLVM and Binaryen.

```bash
./emcc --generate-config

```

---

### JavaScript Promise Integration (JSPI)

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Settings for integrating JavaScript Promises with WebAssembly modules, enabling asynchronous operations without direct WASM modification.

```APIDOC
## JSPI

Use VM support for the JavaScript Promise Integration proposal. This allows async operations to happen without the overhead of modifying the wasm. This is experimental atm while spec discussion is ongoing, see https://github.com/WebAssembly/js-promise-integration/ TODO: document which of the following flags are still relevant in this mode (e.g. IGNORE_INDIRECT etc. are not needed)
Default value: 0

### JSPI_EXPORTS

A list of exported module functions that will be asynchronous. Each export will return a `Promise` that will be resolved with the result. Any exports that will call an asynchronous import (listed in `JSPI_IMPORTS`) must be included here.
By default this includes `main`.
Default value: []

### JSPI_IMPORTS

A list of imported module functions that will potentially do asynchronous work. The imported function should return a `Promise` when doing asynchronous work.
Note when using JS library files, the function can be marked with `<function_name>_async:: true` in the library instead of this setting.
Default value: []
```

---

### Show Available Emscripten Ports (Emcc)

Source: https://emscripten.org/docs/compiling/Building-Projects

This command lists all the available ports that can be easily integrated into an Emscripten project using the `--use-port` flag. This is useful for discovering libraries that have been ported and are supported by the Emscripten ecosystem.

```bash
emcc --show-ports

```

---

### stringToUTF32

Source: https://emscripten.org/docs/api_reference/preamble.js

Copies a JavaScript String to the Emscripten HEAP as a null-terminated UTF32LE-encoded string.

````APIDOC
## stringToUTF32

### Description
Copies a JavaScript String to the Emscripten HEAP as a null-terminated UTF32LE-encoded string.

### Method
N/A (JavaScript function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
const jsString = "Hello, Emscripten!";
const outPtr = ...; // A pointer in Emscripten HEAP
const maxBytesToWrite = 100; // Example limit
stringToUTF32(jsString, outPtr, maxBytesToWrite);
````

### Response

#### Success Response

N/A (This function modifies the HEAP directly)

#### Response Example

N/A

````

--------------------------------

### AVX Intrinsics

Source: https://emscripten.org/docs/porting/simd

This section details the support for AVX intrinsics in Emscripten, indicating their WebAssembly SIMD support status and any emulation strategies employed.

```APIDOC
## AVX Intrinsics Availability

This table highlights the availability and expected performance of different AVX intrinsics. Refer to Intel Intrinsics Guide on AVX.

x86 AVX intrinsics available via #include <immintrin.h> and -mavx

| Intrinsic name        | WebAssembly SIMD support |
|-----------------------|--------------------------|
| _mm_broadcast_ss      | ✅ wasm_v32x4_load_splat |
| _mm_cmp_pd            | ⚠️ emulated with 1-2 SIMD cmp+and/or |
| _mm_cmp_ps            | ⚠️ emulated with 1-2 SIMD cmp+and/or |
| _mm_cmp_sd            | ⚠️ emulated with 1-2 SIMD cmp+and/or+move |
| _mm_cmp_ss            | ⚠️ emulated with 1-2 SIMD cmp+and/or+move |
| _mm_maskload_pd       | ⚠️ emulated with SIMD load+shift+and |
| _mm_maskload_ps       | ⚠️ emulated with SIMD load+shift+and |
| _mm_maskstore_pd      | ❌ scalarized |
| _mm_maskstore_ps      | ❌ scalarized |
| _mm_permute_pd        | 💡 emulated with a general shuffle |
| _mm_permute_ps        | 💡 emulated with a general shuffle |
| _mm_permutevar_pd     | 💣 scalarized |
| _mm_permutevar_ps     | 💣 scalarized |
| _mm_testc_pd          | 💣 emulated with complex SIMD+scalar sequence |
| _mm_testc_ps          | 💣 emulated with complex SIMD+scalar sequence |
| _mm_testnzc_pd        | 💣 emulated with complex SIMD+scalar sequence |
| _mm_testnzc_ps        | 💣 emulated with complex SIMD+scalar sequence |
| _mm_testz_pd          | 💣 emulated with complex SIMD+scalar sequence |
| _mm_testz_ps          | 💣 emulated with complex SIMD+scalar sequence |

**Note**: Only the 128-bit wide instructions from AVX instruction set are listed. The 256-bit wide AVX instructions are emulated by two 128-bit wide instructions.
````

---

### Fetch data from URL into memory buffer synchronously with emscripten_wget_data

Source: https://emscripten.org/docs/api_reference/emscripten.h

emscripten_wget_data synchronously fetches data from a URL and stores it into a memory buffer allocated by the function. The caller is responsible for freeing the allocated buffer to prevent memory leaks. The function provides the data pointer, its size, and an error indicator.

```c
void emscripten_wget_data(const char *url, void **pbuffer, int *pnum, int *perror);
```

---

### Set Main Loop

Source: https://emscripten.org/docs/api_reference/emscripten.h

Configures a C function to serve as the main event loop for the current thread, with options for frame rate and infinite loop simulation.

````APIDOC
## void emscripten_set_main_loop(em_callback_func func, int fps, bool simulate_infinite_loop)

### Description
Sets a C function as the main event loop for the calling thread. The JavaScript environment will call this function at a specified frame rate.

### Method
void

### Endpoint
emscripten_set_main_loop

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
- **func** (em_callback_func) - Required - The C function to set as the main event loop.
- **fps** (int) - Required - The number of frames per second for the JavaScript to call the function. Setting to 0 or a negative value uses `requestAnimationFrame`.
- **simulate_infinite_loop** (bool) - Required - If true, throws an exception to stop caller execution and enter the main loop.

### Request Example
```json
{
  "func": "my_main_loop_function",
  "fps": 60,
  "simulate_infinite_loop": true
}
````

### Response

#### Success Response (void)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Store data to IndexedDB synchronously with emscripten_idb_store

Source: https://emscripten.org/docs/api_reference/emscripten.h

emscripten_idb_store synchronously writes data from a memory buffer to a specified file within an IndexedDB database. It takes the database name, file ID, buffer pointer, and the number of bytes to store. An error code is returned upon completion.

```c
void emscripten_idb_store(const char *db_name, const char *file_id, void *buffer, int num, int *perror);
````

---

### WebGL Context Activation

Source: https://emscripten.org/docs/api_reference/html5.h

Activates a specified WebGL context for rendering.

````APIDOC
## emscripten_webgl_make_context_current

### Description
Activates the given WebGL context, making it the current rendering context. After this call, all OpenGL functions will operate on this context.

### Method
N/A (C function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (EMSCRIPTEN_RESULT_SUCCESS)
Returns `EMSCRIPTEN_RESULT_SUCCESS` on successful activation.

#### Response Example
```json
{
  "status": "success"
}
````

### Parameters:

- **context** (EMSCRIPTEN_WEBGL_CONTEXT_HANDLE) – The WebGL context to activate.

### Returns:

`EMSCRIPTEN_RESULT_SUCCESS`, or one of the other result values.

### Return type:

`EMSCRIPTEN_RESULT`

````

--------------------------------

### Python Profiling Blocks with enter_block/exit_block

Source: https://emscripten.org/docs/optimizing/Profiling-Toolchain

This Python code illustrates an alternative method for creating custom profiling blocks using `ToolchainProfiler.enter_block` and `ToolchainProfiler.exit_block`. It is crucial to ensure that each `enter_block` call is matched with an `exit_block` call, often managed using a `try-finally` block to guarantee proper execution.

```python
from emscripten import ToolchainProfiler

ToolchainProfiler.enter_block('my_code_block')
try:
  do_some_tasks()
  call_another_function()
  more_code()
finally:
  ToolchainProfiler.exit_block('my_code_block')

````

---

### Emscripten Miscellaneous Functions

Source: https://emscripten.org/genindex

Utility functions for logging, mouse control, and memory management.

````APIDOC
## Emscripten Miscellaneous Functions

### Description
This section covers various utility functions for logging output, controlling the mouse cursor, checking WebGL context status, and managing memory growth.

### Functions
*   **emscripten_hide_mouse** (C function) - Hides the mouse cursor.
*   **emscripten_is_webgl_context_lost** (C function) - Checks if the WebGL context has been lost.
*   **emscripten_lock_orientation** (C function) - Locks the device orientation to a specific value.
*   **emscripten_log** (C function) - Logs messages to the browser's developer console.
*   **emscripten_notify_memory_growth** (C function) - Notifies Emscripten about memory growth.
*   **emscripten_out** (C function) - Outputs a string to the console.
*   **emscripten_pause_main_loop** (C function) - Pauses the Emscripten main loop.
*   **emscripten_performance_now** (C function) - Returns a high-resolution timestamp for performance measurement.
*   **emscripten_print_double** (C function) - Prints a double-precision floating-point number to the console.

### Request Example
```c
// Logging a message
emscripten_log(EM_LOG_INFO, "Application started.");
````

### Response

Functions return various types like `void`, `int`, `double`, or `EMSCRIPTEN_RESULT`.

````

--------------------------------

### Use SDL2 Port with Emscripten (Emcc)

Source: https://emscripten.org/docs/compiling/Building-Projects

This command demonstrates how to use the SDL2 library through Emscripten Ports. The `--use-port=sdl2` flag instructs emcc to fetch, build, and link the SDL2 library. `-sLEGACY_GL_EMULATION` is used for OpenGL ES 2.0 emulation. The output is an HTML file runnable in a browser.

```bash
emcc test/browser/test_sdl2_glshader.c --use-port=sdl2 -sLEGACY_GL_EMULATION -o sdl2.html

````

---

### Emscripten WebGL Functions

Source: https://emscripten.org/genindex

Functions for initializing, managing, and interacting with WebGL contexts.

```APIDOC
## Emscripten WebGL API

### Description
This section details the C functions for interacting with WebGL contexts in Emscripten.

### Functions
- **emscripten_webgl_commit_frame**: Commits the current WebGL frame for rendering.
- **emscripten_webgl_create_context**: Creates a new WebGL context.
- **emscripten_webgl_destroy_context**: Destroys a WebGL context.
- **emscripten_webgl_enable_extension**: Enables a specific WebGL extension.
- **emscripten_webgl_get_context_attributes**: Retrieves the attributes of a WebGL context.
- **emscripten_webgl_get_current_context**: Gets the currently active WebGL context.
- **emscripten_webgl_get_drawing_buffer_size**: Retrieves the size of the WebGL drawing buffer.
- **emscripten_webgl_init_context_attributes**: Initializes default WebGL context attributes.
- **emscripten_webgl_make_context_current**: Makes a WebGL context the current one.

### Types
- **EMSCRIPTEN_WEBGL_CONTEXT_HANDLE**: A handle to a WebGL context.
```

---

### File Embedding and Preloading

Source: https://emscripten.org/docs/tools_reference/emcc

Options for including external files within the compiled output or preloading them at runtime.

```APIDOC
## --embed-file <file>

### Description
Embeds a file or directory within the generated WebAssembly module. Embedded files are generally more efficient as they avoid runtime copying.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **file** (string) - Required - Path to the file or directory to embed.

### Request Example
```

emcc main.c -o game.html --embed-file assets/texture.png

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --preload-file <name>

### Description
Specifies a file or directory to be preloaded asynchronously before the compiled code runs. This is primarily used for HTML/JavaScript output and requires both the `.html` and `.data` files at runtime.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **name** (string) - Required - Path to the file or directory to preload.

### Request Example
```

emcc main.c -o game.html --preload-file data/level.json

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --exclude-file <name>

### Description
Specifies files or directories to be excluded from `--embed-file` and `--preload-file` operations. Supports wildcard characters.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **name** (string) - Required - File or directory pattern to exclude.

### Request Example
```

emcc main.c -o game.html --embed-file assets/_ --exclude-file assets/_.tmp

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A
```

---

### Stream file download progress with Emscripten Fetch API (C/C++)

Source: https://emscripten.org/docs/api_reference/fetch

Demonstrates how to stream file data as it's downloaded using the EMSCRIPTEN_FETCH_STREAM_DATA flag. The onprogress callback receives data chunks sequentially. This is suitable for applications that process data as it arrives without needing random seek access. Note: This feature currently has limited browser support, primarily working in Firefox.

```c
void downloadProgress(emscripten_fetch_t *fetch) {
  printf("Downloading %s.. %.2f%%s complete. HTTP readyState: %d. HTTP status: %d.\n"
    "HTTP statusText: %s. Received chunk [%llu, %llu[\n",
    fetch->url, fetch->totalBytes > 0 ? (fetch->dataOffset + fetch->numBytes) * 100.0 / fetch->totalBytes : (fetch->dataOffset + fetch->numBytes),
    fetch->totalBytes > 0 ? "%" : " bytes",
    fetch->readyState, fetch->status, fetch->statusText,
    fetch->dataOffset, fetch->dataOffset + fetch->numBytes);

  // Process the partial data stream fetch->data[0] thru fetch->data[fetch->numBytes-1]
  // This buffer represents the file at offset fetch->dataOffset.
  for(size_t i = 0; i < fetch->numBytes; ++i)
    ; // Process fetch->data[i];
}

int main() {
  emscripten_fetch_attr_t attr;
  emscripten_fetch_attr_init(&attr);
  strcpy(attr.requestMethod, "GET");
  attr.attributes = EMSCRIPTEN_FETCH_STREAM_DATA;
  attr.onsuccess = downloadSucceeded;
  attr.onprogress = downloadProgress;
  attr.onerror = downloadFailed;
  attr.timeoutMSecs = 2*60;
  emscripten_fetch(&attr, "myfile.dat");
}

```

---

### Runtime and Module Exports

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Configuration for exporting runtime elements and managing incoming JavaScript API values on the Module object.

```APIDOC
## EXPORTED_RUNTIME_METHODS

Runtime elements that are exported on Module by default. We used to export quite a lot here, but have removed them all. You should use EXPORTED_RUNTIME_METHODS for things you want to export from the runtime. Note that the name may be slightly misleading, as this is for any JS library element, and not just methods. For example, we can export the FS object by having “FS” in this list.
Default value: []

### INCOMING_MODULE_JS_API

A list of incoming values on the Module object in JS that we care about. If a value is not in this list, then we don’t emit code to check if you provide it on the Module object. For example, if you have this:
```

var Module = {
print: (x) => console.log('print: ' + x),
preRun: [() => console.log('pre run')]
};

```

Then MODULE_JS_API must contain ‘print’ and ‘preRun’; if it does not then we may not emit code to read and use that value. In other words, this option lets you set, statically at compile time, the list of which Module JS values you will be providing at runtime, so the compiler can better optimize.
Setting this list to [], or at least a short and concise set of names you actually use, can be very useful for reducing code size. By default, the list contains a set of commonly used symbols.
FIXME: should this just be 0 if we want everything?
Default value: (multi-line value, see settings.js)
```

---

### Using C++ Classes in JavaScript with Emscripten

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Demonstrates how to create and interact with C++ objects directly within JavaScript after WebIDL binding. C++ constructors are called automatically. Explicitly destroy C++ objects if they require cleanup using `Module.destroy(obj)`.

```javascript
var f = new Module.Foo();
f.setVal(200);
alert(f.getVal());

var b = new Module.Bar(123);
b.doSomething();

// If the C++ object requires clean up:
// Module.destroy(b);
```

---

### Map directory to virtual file system root (Emcc)

Source: https://emscripten.org/docs/porting/files/packaging_files

Maps a directory from the build environment to the root of the Emscripten virtual file system. This is useful for organizing assets within the application.

```bash
emcc file.cpp -o file.html --preload-file ../../asset_dir@/
```

---

### Implementing a General Error Handler (JavaScript)

Source: https://emscripten.org/docs/compiling/Deploying-Pages

This snippet shows how to implement a global error handler using `window.onerror`. This serves as a final catch-all for any unhandled exceptions that occur on the page, ensuring that errors are logged or reported even if not caught by specific try-catch blocks.

```javascript
// See window.onerror documentation on MDN.
```

---

### Instantiate Modularized Emscripten Module (JavaScript)

Source: https://emscripten.org/docs/compiling/Modularized-Output

Demonstrates how to instantiate a modularized Emscripten module with a custom exported name. The module is loaded asynchronously, and native methods can be called on the returned instance. This is useful when you need to load multiple Emscripten modules without global scope conflicts. Supports both `await` and `.then()` syntax.

```javascript
var myFoo = await Foo({
  /* optional params */
});
myFoo._nativeMethod();
```

```javascript
Foo({
  /* optional params */
}).then((myFoo) => {
  myFoo._nativeMethod();
});
```

---

### Emscripten Async Wget2 Data Progress Callback Type

Source: https://emscripten.org/docs/api_reference/emscripten.h

Defines the function pointer type for the `onprogress` callback of `emscripten_async_wget2_data()`. Specific parameter values are documented within the `emscripten_async_wget2_data()` method.

```c
typedef void (*em_async_wget2_data_onprogress_func)(unsigned, void*, int, int)
```

---

### Log Messages to Console with Emscripten

Source: https://emscripten.org/docs/api_reference/emscripten.h

Prints messages to the browser's console, with options to include callstack information. It uses a printf-style format string and variadic arguments.

```c
emscripten_log(EM_LOG_CONSOLE, "User logged in: %s", username);
emscripten_log(EM_LOG_WARN | EM_LOG_STACKTRACE, "Potential issue detected.");
```

---

### Emscripten GL Debugging Toggle

Source: https://emscripten.org/docs/tools_reference/settings_reference

Illustrates how to toggle verbose WebGL debugging at runtime using the GL.debug option, similar to the LIBRARY_DEBUG setting. This is useful for diagnosing WebGL-related issues.

```javascript
GL.debug = true;
```

---

### C/C++ Application with Profile Writing

Source: https://emscripten.org/docs/optimizing/Module-Splitting

This C code modifies the main function to include a call to `write_profile()` after the application logic. This ensures that the profiling data is collected and written to a file before the program exits. Note that functions called after `write_profile` will not be included in the profile.

```c
int main() {
  int i = get_number();
  if (i == 0) {
    foo();
  } else if (i == 1) {
    bar();
  } else {
    unsupported(i);
  }
  write_profile();
}

```

---

### Proxy Main Function to Pthread

Source: https://emscripten.org/docs/porting/pthreads

The `-sPROXY_TO_PTHREAD` linker flag modifies the application's entry point. It creates a new pthread and runs the original `main()` function on it, moving the main execution off the browser's main UI thread. This improves application responsiveness, although the main thread still handles events and certain operations.

```bash
emcc ... -sPROXY_TO_PTHREAD ... -o output.js
```

---

### Load data from IndexedDB synchronously with emscripten_idb_load

Source: https://emscripten.org/docs/api_reference/emscripten.h

The emscripten_idb_load function synchronously retrieves data from a specified IndexedDB database using a file identifier. The data is loaded into a memory buffer allocated by the function, which the caller must free. It returns the data pointer, its size, and an error status.

```c
void emscripten_idb_load(const char *db_name, const char *file_id, void **pbuffer, int *pnum, int *perror);
```

---

### Async Fetch with Promises and EM_JS in C

Source: https://emscripten.org/docs/porting/asyncify

Provides an alternative to EM_ASYNC_JS for older JavaScript engines lacking async/await support. This method uses `Asyncify.handleAsync` with Promises to manage the asynchronous fetch operation. It requires compilation with `ASYNCIFY` and explicitly listing the async function in `ASYNCIFY_IMPORTS`.

```c
EM_JS(int, do_fetch, (), {
  return Asyncify.handleAsync(function () {
    out("waiting for a fetch");
    return fetch("a.html").then(function (response) {
      out("got the fetch response");
      // (normally you would do something with the fetch here)
      return 42;
    });
  });
});
```

---

### Listing available browsers with emrun

Source: https://emscripten.org/docs/compiling/Running-html-files-with-emrun

This command lists all browsers that emrun has automatically detected on your system. It helps you identify the correct alias or path to use with the `--browser` option.

```shell
> emrun --list_browsers
```

---

### Embind Library

Source: https://emscripten.org/docs/tools_reference/emcc

Options related to linking and emitting types for the embind library.

```APIDOC
## --bind

### Description
Links against the embind library. This option is deprecated and `-lembind` should be used instead.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
N/A

### Request Example
```

emcc main.cpp -o output.js --bind

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --embind-emit-tsd <path>

### Description
Emits TypeScript definition files for embind generated code to the specified path.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **path** (string) - Required - The directory path to emit the TSD files.

### Request Example
```

emcc main.cpp -o output.js --embind-emit-tsd ./types/

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A
```

---

### Emscripten WebSocket Listen Callback Registration

Source: https://emscripten.org/docs/api_reference/emscripten.h

Register a callback function that is triggered when the 'listen' function is called, acting as a synthetic event for server-side operations. The callback receives user data and the relevant file descriptor.

```c
void emscripten_set_socket_listen_callback(void *userData, em_socket_callback callback)
{
    // Implementation details for registering the listen callback
}
```

---

### Orientation Event Defines

Source: https://emscripten.org/docs/api_reference/html5.h

Defines constants related to orientation change events.

```APIDOC
## Orientation Event Defines

### Description
Constants related to Emscripten orientation change events.

### Defines
- **EMSCRIPTEN_EVENT_ORIENTATIONCHANGE**: Represents an orientation change event.
- **EMSCRIPTEN_ORIENTATION_UNKNOWN**: Indicates that the orientation is unknown or the API is not supported.
- **EMSCRIPTEN_ORIENTATION_PORTRAIT_PRIMARY**: Represents the primary portrait orientation.
- **EMSCRIPTEN_ORIENTATION_PORTRAIT_SECONDARY**: Represents the secondary portrait orientation.
- **EMSCRIPTEN_ORIENTATION_LANDSCAPE_PRIMARY**: Represents the primary landscape orientation.
- **EMSCRIPTEN_ORIENTATION_LANDSCAPE_SECONDARY**: Represents the secondary landscape orientation.
```

---

### String Conversion for Emscripten Function Calls (C to JS)

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Demonstrates how to convert C `char *` pointers received from Emscripten-compiled functions into JavaScript strings. `UTF8ToString()` is used for this conversion, assuming the C string is UTF-8 encoded.

```javascript
// Assuming 'c_string_ptr' is a pointer received from C/C++
var jsString = UTF8ToString(c_string_ptr);
```

---

### Bind C++ Base and Derived Classes

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

This code illustrates how to bind C++ base and derived classes using Embind. It shows the syntax for defining a base class binding (`class_<BaseClass>`) and then binding a derived class, specifying its base class using `base<BaseClass>`. This allows derived class instances to be used where base class instances are expected and inherit base class members.

```C++
EMSCRIPTEN_BINDINGS(base_example) {
    class_<BaseClass>("BaseClass");
    class_<DerivedClass, base<BaseClass>>("DerivedClass");
}

```

---

### FS.rmdir

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Removes an empty directory from the file system.

````APIDOC
## FS.rmdir

### Description
Removes an empty directory located at `path`.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **path** (string) - Required - Path of the directory to be removed.

### Request Example
```javascript
FS.mkdir('data');
FS.rmdir('data');
````

### Response

#### Success Response (N/A)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Gamepad API

Source: https://emscripten.org/docs/api_reference/html5.h

Handles gamepad input by defining event types, data structures for gamepad state, and callback functions for detecting gamepad connections and disconnections.

```APIDOC
## Gamepad API

### Description
Provides definitions for gamepad events, structures to represent gamepad state, and callback function types for handling gamepad connections and disconnections.

### Event Types

*   `EMSCRIPTEN_EVENT_GAMEPADCONNECTED`: Represents a gamepad connection event.
*   `EMSCRIPTEN_EVENT_GAMEPADDISCONNECTED`: Represents a gamepad disconnection event.

### Data Structure: `EmscriptenGamepadEvent`

Represents the current snapshot state of a gamepad.

*   **`timestamp`** (double) - Absolute wallclock time when the data was recorded (milliseconds).
*   **`numAxes`** (int) - The number of valid axis entries in the `axis` array.
*   **`numButtons`** (int) - The number of valid button entries in the `analogButton` and `digitalButton` arrays.
*   **`axis[64]`** (double[64]) - The analog state of the gamepad axes, in the range [-1, 1].
*   **`analogButton[64]`** (double[64]) - The analog state of the gamepad buttons, in the range [0, 1].
*   **`digitalButton[64]`** (bool[64]) - The digital state of the gamepad buttons, either 0 or 1.
*   **`connected`** (bool) - Specifies whether this gamepad is connected.
*   **`index`** (int) - An ordinal associated with this gamepad, zero-based.
*   **`id`** (EM_UTF8) - An ID for the brand or style of the connected gamepad device (max 64 chars).
*   **`mapping`** (EM_UTF8) - A string that identifies the layout or control mapping of this device (max 64 chars).

### Callback Function Type: `em_gamepad_callback_func`

Function pointer for gamepad event callback functions.

*   **Signature**: `bool callback(int eventType, const EmscriptenGamepadEvent *gamepadEvent, void *userData)`
*   **Parameters**:
    *   `eventType` (int) - The type of gamepad event (`EMSCRIPTEN_EVENT_GAMEPADCONNECTED` or `EMSCRIPTEN_EVENT_GAMEPADDISCONNECTED`).
    *   `gamepadEvent` (const EmscriptenGamepadEvent*) - Information about the gamepad event.
    *   `userData` (void*) - The `userData` originally passed to the registration function.
*   **Returns**: `true` (non-zero) to indicate that the event was consumed by the callback handler.
````

---

### Handling C++ Pointers, References, and Value Types in WebIDL

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Explains how Emscripten's WebIDL binder translates C++ pointers, references, and value types into JavaScript. Undecorated custom types are treated as pointers. `[Ref]` is used for references, and `[Value]` is used for return types that should be allocated on the stack.

```javascript
// C++ (Pointer)
// MyClass* process(MyClass* input);

// WebIDL (Pointer)
// MyClass process(MyClass input);

// C++ (Reference)
// MyClass& process(MyClass& input);

// WebIDL (Reference)
// [Ref] MyClass process([Ref] MyClass input);

// C++ (Value Return)
// MyClass process(MyClass& input);

// WebIDL (Value Return)
// [Value] MyClass process([Ref] MyClass input);
```

---

### Emscripten FS: Device and Mount Point Functions

Source: https://emscripten.org/docs/api_reference/advanced-apis

Utilities for interacting with file system devices and mount points. These functions allow retrieval of device information, major/minor device numbers, and listing mount points. Useful for low-level file system control.

```javascript
FS.major(_dev_);
FS.minor(_dev_);
FS.getDevice(_dev_);
FS.getMounts(_mount_);
```

---

### Async Fetch with Callbacks and Asyncify.handleSleep in C

Source: https://emscripten.org/docs/porting/asyncify

This approach uses `Asyncify.handleSleep` for environments that do not support Promises or async/await. It passes a `wakeUp` callback to the JavaScript function, which is invoked upon completion of the asynchronous operation. The result is propagated via the `wakeUp` callback. This method requires `ASYNCIFY` compilation and `ASYNCIFY_IMPORTS`.

```c
EM_JS(int, do_fetch, (), {
  return Asyncify.handleSleep((wakeUp) => {
    out("waiting for a fetch");
    fetch("a.html").then(function (response) {
      out("got the fetch response");
      // (normally you would do something with the fetch here)
      wakeUp(42);
    });
  });
});
```

---

### FS.stat

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Retrieves statistics about a file system node.

````APIDOC
## FS.stat

### Description
Gets a JavaScript object containing statistics about the node at `path`.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **path** (string) - Required - Path to the target file.

### Request Example
```javascript
// Assuming FS.writeFile('file', 'foobar') has been called
FS.stat('file');
````

### Response

#### Success Response (object)

- **dev** (number) - Device ID.
- **ino** (number) - Inode number.
- **mode** (number) - File mode (permissions).
- **nlink** (number) - Number of hard links.
- **uid** (number) - User ID.
- **gid** (number) - Group ID.
- **rdev** (number) - Device ID for special files.
- **size** (number) - Size of the file in bytes.
- **atime** (Date) - Last access time.
- **mtime** (Date) - Last modification time.
- **ctime** (Date) - Last status change time.
- **blksize** (number) - Block size.
- **blocks** (number) - Number of blocks.

#### Response Example

```json
{
  "dev": 1,
  "ino": 13,
  "mode": 33206,
  "nlink": 1,
  "uid": 0,
  "gid": 0,
  "rdev": 0,
  "size": 6,
  "atime": "Mon Nov 25 2013 00:37:27 GMT-0800 (PST)",
  "mtime": "Mon Nov 25 2013 00:37:27 GMT-0800 (PST)",
  "ctime": "Mon Nov 25 2013 00:37:27 GMT-0800 (PST)",
  "blksize": 4096,
  "blocks": 1
}
```

````

--------------------------------

### Asyncify Advice Output

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Enable or disable advice output from Asyncify, which details which functions have been instrumented and the reasons for their instrumentation. This is useful for debugging and understanding Asyncify's behavior.

```emcc
-ASYNCIFY_ADVISE=true
````

```emcc
-ASYNCIFY_ADVISE=false
```

---

### Exit Fullscreen - C/C++

Source: https://emscripten.org/docs/api_reference/html5.h

Exits the current fullscreen mode and returns the page to windowed browsing. This function should only be used for proper fullscreen modes, not soft fullscreen modes.

```c
EMSCRIPTEN_RESULT emscripten_exit_fullscreen(void)
{
    // Implementation details for exiting fullscreen
    return EMSCRIPTEN_RESULT_SUCCESS;
}
```

---

### Python Profiling Blocks with 'with' Statement

Source: https://emscripten.org/docs/optimizing/Profiling-Toolchain

This Python code demonstrates how to use the `ToolchainProfiler.profile_block` context manager to hierarchically annotate specific sections of Python code. This allows for detailed breakdown of execution time for custom tasks within the profiling output.

```python
from emscripten import ToolchainProfiler

with ToolchainProfiler.profile_block('my_custom_task'):
  do_some_tasks()
  call_another_function()
  more_code()

this_is_outside_the_block()

```

---

### Download File Directly to IndexedDB with Emscripten Fetch API in C/C++

Source: https://emscripten.org/docs/api_reference/fetch

Explains how to download large files directly to IndexedDB using the Emscripten Fetch API without loading them into memory. This is achieved by using the `EMSCRIPTEN_FETCH_PERSIST_FILE` flag, which is memory-efficient for large assets.

```c++
// Example demonstrating the concept, actual IndexedDB interaction would be more involved.
// The key is to use EMSCRIPTEN_FETCH_PERSIST_FILE instead of EMSCRIPTEN_FETCH_LOAD_TO_MEMORY.

// int main() {
//   emscripten_fetch_attr_t attr;
//   emscripten_fetch_attr_init(&attr);
//   strcpy(attr.requestMethod, "GET");
//   // Use EMSCRIPTEN_FETCH_PERSIST_FILE to save directly to IndexedDB
//   attr.attributes = EMSCRIPTEN_FETCH_PERSIST_FILE;
//   // ... set other attributes like onerror, onsuccess etc. ...
//   emscripten_fetch(&attr, "largefile.zip");
// }

// Note: The actual data is not directly accessible in the onsuccess callback when using EMSCRIPTEN_FETCH_PERSIST_FILE.
// The onsuccess handler will report the total downloaded file size.

```

---

### Emscripten Linker Flags for OpenGL ES 3 Targeting

Source: https://emscripten.org/docs/optimizing/Optimizing-WebGL

This snippet illustrates how to target OpenGL ES 3 (WebGL 2) with Emscripten. The `-sFULL_ES3` flag enables emulation for features like client-side memory rendering and `glMapBuffer*()`, which are not core WebGL 2 features and may impact performance. Using VBOs is advised for better performance.

```text
// Build with: emcc main.c -o main.js -sFULL_ES3
```

---

### Emscripten Run Preload Plugins Data Onload Callback Type

Source: https://emscripten.org/docs/api_reference/emscripten.h

Defines the function pointer type for the `onload` callback of `emscripten_run_preload_plugins_data()`. Specific parameter values are documented in the `emscripten_run_preload_plugins_data()` method.

```c
typedef void (*em_run_preload_plugins_data_onload_func)(void*, const char*)
```

---

### Enable Automatic JavaScript Library Loading in Emscripten

Source: https://emscripten.org/docs/tools_reference/settings_reference

Controls whether JavaScript libraries are automatically linked at build time. When enabled (1), libraries are readily available. In STRICT or MINIMAL_RUNTIME modes (where it's set to 0), you must explicitly link libraries using `-lfoo.js` to access their functions.

```javascript
{
  "AUTO_JS_LIBRARIES": 1
}
```

---

### Build Main Module with Dead Code Elimination (Emscripten)

Source: https://emscripten.org/docs/compiling/Dynamic-Linking

Builds the main module with normal dead code elimination enabled. This requires manually ensuring that code needed by side modules is kept alive using EXPORTED_FUNCTIONS or EMSCRIPTEN_KEEPALIVE.

```bash
emcc -sMAIN_MODULE=2 main.c -o main_module.js
```

---

### Emscripten Compilation Command for SPLIT_MODULE

Source: https://emscripten.org/docs/optimizing/Module-Splitting

This command compiles the C application using Emscripten, enabling the SPLIT_MODULE option. This generates the standard output files (application.js, application.wasm) and an additional application.wasm.orig file, which is the original, unmodified Wasm module before profiling instrumentation.

```bash
emcc application.c -o application.js -sSPLIT_MODULE

```

---

### Async Fetch with EM_ASYNC_JS in C

Source: https://emscripten.org/docs/porting/asyncify

Demonstrates how to perform an asynchronous fetch operation from C code using the EM_ASYNC_JS macro. This allows the C code to appear synchronous to the caller, while the underlying JavaScript handles the asynchronous nature of the fetch. It requires compilation with ASYNCIFY or JSPI enabled.

```c
#include <emscripten.h>
#include <stdio.h>

EM_ASYNC_JS(int, do_fetch, (), {
  out("waiting for a fetch");
  const response = await fetch("a.html");
  out("got the fetch response");
  // (normally you would do something with the fetch here)
  return 42;
});

int main() {
  puts("before");
  do_fetch();
  puts("after");
}
```

---

### Request Fullscreen - C/C++

Source: https://emscripten.org/docs/api_reference/html5.h

Requests that a specified target HTML element enter fullscreen mode. The `deferUntilInEventHandler` parameter controls whether the request is deferred if not called within a user event handler. Note that for security reasons, requests outside event handlers may be deferred or fail.

```c
EMSCRIPTEN_RESULT emscripten_request_fullscreen(const char *target, bool deferUntilInEventHandler)
{
    // Implementation details for requesting fullscreen
    return EMSCRIPTEN_RESULT_SUCCESS;
}
```

---

### C/C++ Emscripten Asynchronous Main Loop Implementation

Source: https://emscripten.org/docs/porting/emscripten-runtime-environment

Implements an asynchronous main loop for Emscripten by using emscripten_request_animation_frame_loop for browser environments and a traditional while loop with delays for native builds. The one_iter function represents a single frame's work. It requires the emscripten and emscripten/html5 headers. Returns true to continue the loop.

```c
#include <emscripten.h>
#include <emscripten/html5.h>
#include <stdio.h>

// Our "main loop" function. This callback receives the current time as
// reported by the browser, and the user data we provide in the call to
// emscripten_request_animation_frame_loop().
bool one_iter(double time, void* userData) {
  // Can render to the screen here, etc.
  puts("one iteration");
  // Return true to keep the loop running.
  return true;
}

int main() {
#ifdef __EMSCRIPTEN__
  // Receives a function to call and some user data to provide it.
  emscripten_request_animation_frame_loop(one_iter, 0);
#else
  while (1) {
    one_iter();
    // Delay to keep frame rate constant (using SDL).
    SDL_Delay(time_to_next_frame());
  }
#endif
}
```

---

### Emscripten void\* and any Type Mapping

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Details the mapping of the C++ `void*` type in Emscripten bindings. `VoidPtr` is used for pointer-like behavior with wrapper objects, while `any` treats the pointer as a 32-bit integer.

```webidl
typedef any VoidPtr; // Represents a void pointer as a wrapper object
typedef any any; // Represents a void pointer as a 32-bit integer
```

---

### Specifying C++ Namespace/Class Scope in IDL with Prefix

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Illustrates the use of the `[Prefix]` keyword in IDL to define the scope of C++ classes declared within namespaces or other classes. This ensures correct referencing in C++ glue code.

```WebIDL
[Prefix="MyNameSpace::"]
interface Inner {
..
};
```

---

### Write File with Emscripten FS

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Writes provided data to a file at the specified path. The data can be a string (decoded as UTF-8) or an ArrayBufferView. Options allow specifying write flags.

```javascript
FS.writeFile(_path_ , _data_ , _opts_)

Arguments:

  * **path** (`string()`) – The file to which to write `data`.
  * **data** (`string|ArrayBufferView()`) – The data to write. A string will always be decoded as UTF-8.
  * **opts** (`object()`) –
    * **flags** (_string_) Write flags, as defined in `FS.open()`. The default is ‘w’.

Example:
```

FS.writeFile('file', 'foobar');
var contents = FS.readFile('file', { encoding: 'utf8' });

```

```

---

### Enable Emscripten Fetch API

Source: https://emscripten.org/docs/tools_reference/settings_reference

Activates the emscripten_fetch API, allowing Emscripten applications to perform network requests. When enabled, this provides a unified interface for fetching resources from the network, abstracting underlying browser APIs like XMLHttpRequest or the Fetch API.

```javascript
{
  "FETCH": 1
}
```

---

### Define Class Constructor with Smart Pointers

Source: https://emscripten.org/docs/api_reference/bind.h

Binds a class constructor that creates a smart pointer. It accepts a name for the smart pointer, a factory function to create it, and optional policies. This function returns a const reference to the class\_ object for chaining.

```cpp
template<typename SmartPtr, typename... Args, typename... Policies>
EMSCRIPTEN_ALWAYS_INLINE const class_& smart_ptr_constructor(const char* smartPtrName, SmartPtr (*factory)(Args...), Policies...) const
```

---

### Manual Makefile Modification for Emscripten

Source: https://emscripten.org/docs/compiling/Building-Projects

For build systems that do not use configure or CMake, you can often omit the emconfigure step and directly run 'make'. However, you might need to manually edit the Makefile to ensure Emscripten's compiler (emcc) is used instead of the native system compiler.

```bash
# If no configure or cmake is used, you can directly run make.
# Ensure Makefile is edited to use emcc.
make

# Compile the linked code generated by make to JavaScript + WebAssembly.
emcc [-Ox] project.o -o project.js
```

---

### WebGL Context Creation

Source: https://emscripten.org/docs/api_reference/html5.h

Creates and returns a new WebGL context for a specified HTML canvas element.

````APIDOC
## emscripten_webgl_create_context

### Description
Creates and returns a new WebGL context for the specified DOM canvas element. Note that the created context is not immediately active; `emscripten_webgl_make_context_current()` must be called to activate it for rendering. The `majorVersion` attribute's behavior is influenced by linker flags like `-sMIN_WEBGL_VERSION` and `-sMAX_WEBGL_VERSION`.

### Method
N/A (C function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (EMSCRIPTEN_WEBGL_CONTEXT_HANDLE)
On success, returns a non-zero value representing a handle to the created context.

#### Response Example
```json
{
  "contextHandle": 123
}
````

### Parameters:

- **target** (const char\*) – The DOM canvas element in which to initialize the WebGL context.
- **attributes** (const EmscriptenWebGLContextAttributes\*) – The attributes of the requested context version.

### Returns:

On success, a non-zero value that represents a handle to the created context. On failure, 0.

### Return type:

`EMSCRIPTEN_WEBGL_CONTEXT_HANDLE`

````

--------------------------------

### Emscripten FS: Path and File Creation Functions

Source: https://emscripten.org/docs/api_reference/advanced-apis

Functions for creating paths and different types of files within the Emscripten file system. This includes creating nodes, directories, regular files, data files, and special devices. Supports various creation modes and properties.

```javascript
FS.lookup(_parent_, _name_)
FS.mknod(_path_, _mode_, _dev_)
FS.create(_path_, _mode_)
FS.createPath(_parent_, _path_, _canRead_, _canWrite_)
FS.createFile(_parent_, _name_, _properties_, _canRead_, _canWrite_)
FS.createDataFile(_parent_, _name_, _data_, _canRead_, _canWrite_, _canOwn_)
FS.createDevice(_parent_, _name_, _input_, _output_)
````

---

### Configure Fetch API Debugging in Emscripten

Source: https://emscripten.org/docs/tools_reference/settings_reference

Enables detailed debugging output for the emscripten_fetch API, which is used for network requests. Setting this option to a non-zero value will print verbose information to the console during fetch operations, aiding in troubleshooting.

```javascript
{
  "FETCH_DEBUG": 1
}
```

---

### Enable Debugging Output with EMCC_DEBUG

Source: https://emscripten.org/docs/getting_started/FAQ

To diagnose slow compilation times, set the EMCC_DEBUG environment variable to 1. This will log intermediate compilation steps to a temporary directory, allowing you to identify bottlenecks. Note that this increases compilation time.

```bash
export EMCC_DEBUG=1
```

---

### Emscripten Event Macros

Source: https://emscripten.org/genindex

This section lists the C macros used to define various Emscripten events.

````APIDOC
## Emscripten Event Macros

### Description
These macros define event types that can be used with Emscripten's event handling system.

### Parameters
*   **EMSCRIPTEN_EVENT_DEVICEORIENTATION** (C macro) - Represents device orientation events.
*   **EMSCRIPTEN_EVENT_FOCUS** (C macro) - Represents focus gain events.
*   **EMSCRIPTEN_EVENT_FOCUSIN** (C macro) - Represents focus in events.
*   **EMSCRIPTEN_EVENT_FOCUSOUT** (C macro) - Represents focus out events.
*   **EMSCRIPTEN_EVENT_FULLSCREENCHANGE** (C macro) - Represents fullscreen mode change events.
*   **EMSCRIPTEN_EVENT_GAMEPADCONNECTED** (C macro) - Represents gamepad connection events.
*   **EMSCRIPTEN_EVENT_GAMEPADDISCONNECTED** (C macro) - Represents gamepad disconnection events.
*   **EMSCRIPTEN_EVENT_KEYDOWN** (C macro) - Represents key press down events.
*   **EMSCRIPTEN_EVENT_KEYPRESS** (C macro) - Represents key press events.
*   **EMSCRIPTEN_EVENT_KEYUP** (C macro) - Represents key release events.
*   **EMSCRIPTEN_EVENT_MOUSEDOWN** (C macro) - Represents mouse button down events.
*   **EMSCRIPTEN_EVENT_MOUSEENTER** (C macro) - Represents mouse entering an element.
*   **EMSCRIPTEN_EVENT_MOUSELEAVE** (C macro) - Represents mouse leaving an element.
*   **EMSCRIPTEN_EVENT_MOUSEMOVE** (C macro) - Represents mouse movement.
*   **EMSCRIPTEN_EVENT_MOUSEUP** (C macro) - Represents mouse button up events.
*   **EMSCRIPTEN_EVENT_ORIENTATIONCHANGE** (C macro) - Represents device orientation change events.
*   **EMSCRIPTEN_EVENT_POINTERLOCKCHANGE** (C macro) - Represents pointer lock mode change events.
*   **EMSCRIPTEN_EVENT_POINTERLOCKERROR** (C macro) - Represents pointer lock error events.
*   **EMSCRIPTEN_EVENT_RESIZE** (C macro) - Represents window resize events.
*   **EMSCRIPTEN_EVENT_SCROLL** (C macro) - Represents scroll events.
*   **EMSCRIPTEN_EVENT_TOUCHCANCEL** (C macro) - Represents touch cancel events.
*   **EMSCRIPTEN_EVENT_TOUCHEND** (C macro) - Represents touch end events.
*   **EMSCRIPTEN_EVENT_TOUCHMOVE** (C macro) - Represents touch move events.
*   **EMSCRIPTEN_EVENT_TOUCHSTART** (C macro) - Represents touch start events.
*   **EMSCRIPTEN_EVENT_VISIBILITYCHANGE** (C macro) - Represents visibility change events.
*   **EMSCRIPTEN_EVENT_WEBGLCONTEXTLOST** (C macro) - Represents WebGL context lost events.
*   **EMSCRIPTEN_EVENT_WEBGLCONTEXTRESTORED** (C macro) - Represents WebGL context restored events.
*   **EMSCRIPTEN_EVENT_WHEEL** (C macro) - Represents mouse wheel events.

### Request Example
```c
// Example usage of an event macro
EMSCRIPTEN_EVENT_KEYDOWN
````

### Response

No direct response, these are constants used in Emscripten's event registration.

````

--------------------------------

### FS.rename

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Renames a file system node from an old path to a new path.

```APIDOC
## FS.rename

### Description
Renames the node at `oldpath` to `newpath`.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **oldpath** (string) - Required - The old path name.
- **newpath** (string) - Required - The path to the new symlink node, that points to `oldpath`.

### Request Example
```javascript
FS.writeFile('file', 'foobar');
FS.rename('file', 'newfile');
````

### Response

#### Success Response (N/A)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### stringToUTF8

Source: https://emscripten.org/docs/api_reference/preamble.js

Copies a JavaScript String to the Emscripten HEAP as a null-terminated UTF8-encoded string.

```APIDOC
## stringToUTF8

### Description
Copies a JavaScript String to the Emscripten HEAP as a null-terminated UTF8-encoded string.

### Method
N/A (JavaScript function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
const jsString = "Hello, Emscripten!";
const outPtr = ...; // A pointer in Emscripten HEAP
const maxBytesToWrite = 100; // Example limit
stringToUTF8(jsString, outPtr, maxBytesToWrite);
````

### Response

#### Success Response

N/A (This function modifies the HEAP directly)

#### Response Example

N/A

````

--------------------------------

### Emscripten FS Tracking Delegate Functions

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Defines callback functions for various file system events in Emscripten, such as deleting, opening, reading, writing, seeking, closing files, and creating directories or symlinks. These functions are triggered by specific FS operations and log messages to the console.

```javascript
FS.trackingDelegate['onDeletePath'] = function(path) {
    out('Deleted "' + path + '"');
  };
  FS.trackingDelegate['onOpenFile'] = function(path, flags) {
    out('Opened "' + path + '" with flags ' + flags);
  };
  FS.trackingDelegate['onReadFile'] = function(path, bytesRead) {
    out('Read ' + bytesRead + ' bytes from "' + path + '"');
  };
  FS.trackingDelegate['onWriteToFile'] = function(path, bytesWritten) {
    out('Wrote to file "' + path + '" with ' + bytesWritten + ' bytes written');
  };
  FS.trackingDelegate['onSeekFile'] = function(path, position, whence) {
    out('Seek on "' + path + '" with position ' + position + ' and whence ' + whence);
  };
  FS.trackingDelegate['onCloseFile'] = function(path) {
    out('Closed ' + path);
  };
  FS.trackingDelegate['onMakeDirectory'] = function(path, mode) {
    out('Created directory ' + path + ' with mode ' + mode);
  };
  FS.trackingDelegate['onMakeSymlink'] = function(oldpath, newpath) {
    out('Created symlink from ' + oldpath + ' to ' + newpath);
  };
````

---

### Touch Event API

Source: https://emscripten.org/docs/api_reference/html5.h

Defines structures and callback types for handling touch events.

```APIDOC
## Touch Event Structures and Callbacks

### Description
Defines the data structures for touch points and touch events, along with the callback function signature for handling these events.

### Data Structures
#### `EmscriptenTouchPoint`
Specifies the status of a single touch point on the page.

- **identifier** (int) - An identification number for each touch point.
- **screenX** (int) - Screen X coordinate.
- **screenY** (int) - Screen Y coordinate.
- **clientX** (int) - Viewport X coordinate.
- **clientY** (int) - Viewport Y coordinate.
- **pageX** (int) - Page X coordinate (including scroll offset).
- **pageY** (int) - Page Y coordinate (including scroll offset).
- **isChanged** (bool) - Specifies whether the touch point changed during this event.
- **onTarget** (bool) - Specifies whether this touch point is still above the original target.
- **targetX** (int) - Touch coordinates relative to the target DOM element.
- **targetY** (int) - Touch coordinates relative to the target DOM element.
- **canvasX** (int) - Touch coordinates mapped to the Emscripten canvas client area.
- **canvasY** (int) - Touch coordinates mapped to the Emscripten canvas client area.

#### `EmscriptenTouchEvent`
Specifies the data of a single touch event.

- **timestamp** (double) - Absolute wallclock time when the data was recorded (milliseconds).
- **numTouches** (int) - The number of valid elements in the `touches` array.
- **ctrlKey** (bool) - Specifies if the Ctrl key was active.
- **shiftKey** (bool) - Specifies if the Shift key was active.
- **altKey** (bool) - Specifies if the Alt key was active.
- **metaKey** (bool) - Specifies if the Meta key was active.
- **touches** (EmscriptenTouchPoint[32]) - An array of currently active touches.

### Callback Function
#### `em_touch_callback_func`
Function pointer for touch event callback functions.

- **eventType** (int) - The type of touch event (e.g., `EMSCRIPTEN_EVENT_TOUCHSTART`).
- **touchEvent** (const EmscriptenTouchEvent*) - Information about the touch event.
- **userData** (void*) - User-defined data passed to the registration function.
- **Returns** (bool) - `true` to indicate that the event was consumed.
```

---

### JSPI Exports Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Define a list of exported module functions that will be asynchronous. Each of these exports will return a Promise that resolves with the result. Exports that call asynchronous imports must be included here. 'main' is included by default.

```emcc
-JSPI_EXPORTS=[export1,export2,...]
```

---

### C++ Function Overloads for WebIDL Binding

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Demonstrates how C++ function overloads can be bound to WebIDL. Overloads differing only in the number of arguments are handled by default. For differing argument types, the [BindTo] attribute is used to specify the binding name.

```cpp
class OverloadTest {
public:
  void test(int arg1, int arg2) { ... }
  void test(int arg) { ... }
};

class BindToTest {
public:
  void test(const char* arg) { ... }
  void test(int arg) { ... }
};
```

---

### Case-Insensitive Filesystem Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Control whether the virtual filesystem is treated as case-insensitive. When set to a non-zero value, the VFS behaves like Windows and macOS. When set to 0, it is case-sensitive, similar to Linux.

```emcc
-CASE_INSENSITIVE_FS=1
```

```emcc
-CASE_INSENSITIVE_FS=0
```

---

### Embind Exposing C++ Constants to JavaScript

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Shows the simple syntax for exposing C++ constants to JavaScript using Embind's `constant()` function. The constant can be of any type known to Embind.

```c++
EMSCRIPTEN_BINDINGS(my_constant_example) {
    constant("SOME_CONSTANT", SOME_CONSTANT);
}
```

---

### Runtime Debugging Control with emscripten_run_script

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Demonstrates how to dynamically control runtime debugging flags in Emscripten-compiled C++ code. This is useful for enabling or disabling logging during execution without recompilation. It utilizes the `emscripten_run_script` function to execute JavaScript commands.

```c++
emscripten_run_script("runtimeDebug = true;"); // Enable debugging
emscripten_run_script("runtimeDebug = false;"); // Disable debugging
```

---

### Emscripten WebSocket Connection Callback Registration

Source: https://emscripten.org/docs/api_reference/emscripten.h

Register a callback function to be invoked when a WebSocket connection is established. This callback receives user data and the file descriptor associated with the new connection.

```c
void emscripten_set_socket_connection_callback(void *userData, em_socket_callback callback)
{
    // Implementation details for registering the connection callback
}
```

---

### JavaScript Implementation of C++ Base Classes in IDL

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Explains how to use `[JSImplementation]` in IDL to allow JavaScript to act as an implementation of a C++ base class. This enables C++ code to call JavaScript methods.

```WebIDL
[JSImplementation="Base"]
interface ImplJS {
  void ImplJS();
  void virtualFunc();
  void virtualFunc2();
};
```

```JavaScript
var c = new ImplJS();
c.virtualFunc = function() { .. };
```

---

### Constant Registration

Source: https://emscripten.org/docs/api_reference/bind.h

Registers a constant to export to JavaScript.

````APIDOC
## Constant Registration

### Description
Registers a constant to export to JavaScript. This is called from within an `EMSCRIPTEN_BINDINGS()` block.

### Method
`constant`

### Endpoint
N/A (C++ function)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```cpp
// prototype
template<typename ConstantType>
void constant(const char* name, const ConstantType& v)
````

#### Parameters:

- **const char\* name**: The name of the constant.
- **const ConstantType & v**: The constant type. This can be any type known to _embind_.

### Example Usage:

```cpp
EMSCRIPTEN_BINDINGS(my_constant_example) {
  constant("SOME_CONSTANT", SOME_CONSTANT);
}
```

### Response

#### Success Response (200)

None (void function)

#### Response Example

N/A

````

--------------------------------

### Create Lazy File in Emscripten Virtual File System

Source: https://emscripten.org/docs/porting/files/Synchronous-Virtual-XHR-Backed-File-System-Usage

This JavaScript code snippet demonstrates how to create a lazy file in Emscripten's virtual file system using `FS.createLazyFile`. This function allows for lazy loading of file content from a specified URL, improving startup performance by only fetching data when accessed. It's typically called during Emscripten's `preInit` phase.

```javascript
Module.arguments = ["/bigfile"];
Module.preInit = () => {
  FS.createLazyFile('/', "bigfile", "http://localhost:11111/bogus_file_path", true, false);
};

````

---

### Package Files with Specific Path using emcc

Source: https://emscripten.org/docs/porting/files/packaging_files

Packages files using emcc while specifying a relative path for the asset directory. The virtual file system at runtime will mirror this relative path. This allows for precise control over where packaged files appear in the runtime file system.

```bash
emcc file.cpp -o file.html --preload-file dir3/asset_dir

```

---

### Visibility Change API

Source: https://emscripten.org/docs/api_reference/html5.h

Register callbacks for visibility change events and retrieve the current visibility status.

````APIDOC
## emscripten_set_visibilitychange_callback

### Description
Registers a callback function for receiving the visibilitychange event.

### Method
`emscripten_set_visibilitychange_callback`

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```json
{
  "userData": "someData",
  "useCapture": true,
  "callback": "myVisibilityCallback"
}
````

### Response

#### Success Response (EMSCRIPTEN_RESULT_SUCCESS)

Indicates the callback was successfully registered.

#### Response Example

```json
{
  "result": "EMSCRIPTEN_RESULT_SUCCESS"
}
```

## emscripten_get_visibility_status

### Description

Returns the current page visibility state.

### Method

`emscripten_get_visibility_status`

### Parameters

#### Path Parameters

None

#### Query Parameters

None

#### Request Body

None

### Request Example

```json
{
  "visibilityStatus": "{...}"
}
```

### Response

#### Success Response (EMSCRIPTEN_RESULT_SUCCESS)

Returns the current visibility status.

#### Response Example

```json
{
  "result": "EMSCRIPTEN_RESULT_SUCCESS",
  "visibilityStatus": {
    "eventType": "EMSCRIPTEN_VISIBILITY_HIDDEN",
    "visibilityChangeEvent": {
      "hidden": true
    }
  }
}
```

````

--------------------------------

### Asyncify Add-List Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Configure functions to be instrumented by Asyncify, even if they are not initially detected as asynchronous. This is useful for fixing indirect calls that require instrumentation. Wildcard matching and character substitutions are supported.

```emcc
-ASYNCIFY_ADD=[function1,function2,...]
````

---

### Emscripten WebSocket Open Callback Registration

Source: https://emscripten.org/docs/api_reference/emscripten.h

Register a callback function to be executed when a WebSocket connection is successfully opened. The callback is provided with user data and the file descriptor of the connection. This is a core part of Emscripten's socket event handling.

```c
void emscripten_set_socket_open_callback(void *userData, em_socket_callback callback)
{
    // Implementation details for registering the open callback
}
```

---

### Emscripten Asynchronous Proxy Execution

Source: https://emscripten.org/docs/api_reference/proxying.h

Enqueues a function to be called on a target thread via a proxy queue. The call returns immediately without waiting for the function to execute. Returns 1 on success, 0 otherwise.

```c
int emscripten_proxy_async(em_proxying_queue *q, pthread_t target_thread, void (*func)(void*), void *arg);
```

---

### Configure Tracing API

Source: https://emscripten.org/docs/api_reference/trace.h

Configures the Emscripten tracing API to send trace data to a specified collection server and application name. This is the primary initialization step for custom tracing servers.

```c
emscripten_trace_configure("http://127.0.0.1:5000/", "MyApplication");

```

---

### Customizing File Loading with locateFile in Emscripten

Source: https://emscripten.org/docs/api_reference/module

The `Module.locateFile` attribute allows for custom logic when the Emscripten runtime needs to load files like `.wasm`, `.mem`, or packaged files. This function receives the file path and a prefix, returning the correct URL, which is useful for hosting assets on CDNs or other locations. It replaces several deprecated `Module.*PrefixURL` options.

```javascript
Module["locateFile"] = function (path, prefix) {
  // if it's a mem init file, use a custom dir
  if (path.endsWith(".mem")) return "https://mycdn.com/memory-init-dir/" + path;
  // otherwise, use the default, the prefix (JS file's dir) + the path
  return prefix + path;
};
```

---

### Request Fullscreen with Strategy - C/C++

Source: https://emscripten.org/docs/api_reference/html5.h

Requests fullscreen mode for a target element with a custom presentation strategy for consistent cross-browser behavior. This function is similar to `emscripten_request_fullscreen` but allows for fine-grained control over aspect ratio and resizing.

```c
EMSCRIPTEN_RESULT emscripten_request_fullscreen_strategy(const char *target, bool deferUntilInEventHandler, const EmscriptenFullscreenStrategy *fullscreenStrategy)
{
    // Implementation details for requesting fullscreen with strategy
    return EMSCRIPTEN_RESULT_SUCCESS;
}
```

---

### C++ Program Demonstrating Exceptions

Source: https://emscripten.org/docs/porting/exceptions

A basic C++ program that uses a try-catch block to handle an exception. This code is used to illustrate the behavior of exception handling before and after enabling Emscripten's exception support.

```cpp
#include <stdio.h>

int main() {
  try {
    puts("throw...");
    throw 1;
    puts("(never reached)");
  } catch(...) {
    puts("catch!");
  }
  return 0;
}

```

---

### String Conversion Utilities

Source: https://emscripten.org/docs/api_reference/preamble.js

Functions for converting between JavaScript strings and C-style arrays/memory representations, including UTF-8 and UTF-32 encoding.

```APIDOC
## String Conversion Utilities

This section details functions for converting JavaScript strings to and from various C-compatible formats used within Emscripten.

### UTF8/UTF32 String Conversion

This function converts a JavaScript String to a C-style string in memory, encoded in UTF-32 Little Endian format and null-terminated. It includes options for specifying maximum bytes to write.

#### `stringToUTF32(str, outPtr, maxBytesToWrite)`

*   **str** (`String()`): A JavaScript `String` object.
*   **outPtr**: Pointer to data copied from `str`, encoded in UTF32LE format and null-terminated.
*   **maxBytesToWrite**: A limit on the number of bytes that this function can at most write out. If the string is longer than this, the output is truncated. The outputted string will always be null terminated, even if truncation occurred, as long as `maxBytesToWrite >= 4` so that there is space for the null terminator.

#### `lengthBytesUTF32(str)`

Computes the exact amount of bytes (excluding the null terminator) needed to encode the string in UTF-32.

### ASCII/Latin-1 String Conversion

#### `AsciiToString(_ptr_)`

Converts an ASCII or Latin-1 encoded string from a given pointer to a JavaScript String object.

*   **ptr**: The pointer to the C-style string to be converted.
*   **Returns**: A JavaScript `String` containing the data from `ptr`.

### JavaScript String to C-Array Conversion

#### `intArrayFromString(_stringy_, _dontAddNull_[, _length_])`

Converts a JavaScript string into a C-style array of numbers, optionally zero-terminated.

*   **stringy** (`String()`): The string to be converted.
*   **dontAddNull** (`bool()`): If `true`, the new array is not zero-terminated.
*   **length**: The length of the array (optional).
*   **Returns**: The array created from `stringy`.

### C-Array to JavaScript String Conversion

#### `intArrayToString(_array_)`

Creates a JavaScript string from a zero-terminated C-style array of numbers.

*   **array**: The array to convert.
*   **Returns**: A `String`, containing the content of `array`.
```

---

### Allocate, Set, Call, and Free Memory in Emscripten

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

This JavaScript code demonstrates allocating memory, copying data into it, calling a C function with the allocated memory, and then freeing the memory. It's useful for importing large amounts of data from JavaScript to compiled code. Ensure the C function signature matches the call.

```javascript
var buf = Module._malloc(myTypedArray.length * myTypedArray.BYTES_PER_ELEMENT);
Module.HEAPU8.set(myTypedArray, buf);
Module.ccall("my_function", "number", ["number"], [buf]);
Module._free(buf);
```

---

### Compile with Minimal Undefined Behavior Sanitizer (UBSan) Runtime

Source: https://emscripten.org/docs/debugging/Sanitizers

Utilize the minimal runtime for UBSan in production builds by adding the '-fsanitize-minimal-runtime' flag alongside the '-fsanitize' flag. This reduces the runtime overhead and attack surface.

```bash
emcc -fsanitize=null -fsanitize-minimal-runtime null-read.c
emcc -fsanitize=null -fsanitize-minimal-runtime null-assign.c
```

---

### Emscripten Class Smart Pointer Registration Prototype

Source: https://emscripten.org/docs/api_reference/bind.h

A const method of the `class_` class that allows registering smart pointer types for the class. It takes a name and returns a const reference to the current `class_` object, enabling method chaining.

```cpp
template<typename PointerType>
EMSCRIPTEN_ALWAYS_INLINE const class_& smart_ptr(const char* name) const
```

---

### Allow Subclassing with Constructor

Source: https://emscripten.org/docs/api_reference/bind.h

Enables subclassing for a C++ class within Emscripten. This overload takes a wrapper class name and a constructor, returning a const reference to the class\_ object for chaining.

```cpp
template<typename WrapperType, typename... ConstructorArgs>
EMSCRIPTEN_ALWAYS_INLINE const class_& allow_subclass(
  const char* wrapperClassName,
  ::emscripten::constructor<ConstructorArgs...> constructor = ::emscripten::constructor<>()
) const
```

---

### Accessing Runtime Functions in Emscripten JavaScript

Source: https://emscripten.org/docs/getting_started/FAQ

Demonstrates how to correctly call runtime functions in Emscripten. Previously, `Runtime.*` APIs were used, but these have been refactored to be top-level functions. If accessed from outside compiled code, these functions must be exported using `EXPORTED_RUNTIME_METHODS` and accessed via the `Module` object.

```javascript
// Old way (will cause error)
x = Runtime.stackAlloc(10);

// New way for code compiled with Emscripten
x = stackAlloc(10);

// New way for code outside compiled Emscripten module (requires export)
x = Module.stackAlloc(10);
```

---

### Allocating Memory with allocate() - Emscripten

Source: https://emscripten.org/docs/api_reference/advanced-apis

The `allocate()` function in preamble.js is an advanced Emscripten API for memory allocation. It's considered internal and difficult to use, typically reserved for developers working on Emscripten's core. For general memory allocation, `_malloc()` and `setValue()` are recommended. This function takes a data slab or size and an allocator type.

```javascript
allocate(_slab_, _allocator_);
```

---

### FS.chmod

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Changes the mode flags (permissions) for a file system node.

````APIDOC
## FS.chmod

### Description
Change the mode flags for `path` to `mode`. Note: The underlying implementation does not support user or group permissions. The caller is always treated as the owner of the folder, and only permissions relevant to the owner apply.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **path** (string) - Required - Path to the target file.
- **mode** (int) - Required - The new file permissions for `path`, in octal numeric notation.

### Request Example
```javascript
FS.writeFile('forbidden', 'can\'t touch this');
FS.chmod('forbidden', 0o0000);
````

### Response

#### Success Response (N/A)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### C++ to WebIDL Type Mapping

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Illustrates the common type mappings between C++ and WebIDL used in Emscripten bindings. This table helps in correctly defining interfaces for interoperability.

```text
C++ | IDL
---
`bool` | `boolean`
`float` | `float`
`double` | `double`
`char` | `byte`
`char*` | `DOMString`
`unsigned char` | `octet`
`int` | `long`
`long` | `long`
`unsigned short` | `unsigned short`
`unsigned long` | `unsigned long`
`long long` | `long long`
`void` | `void`
`void*` | `any` or `VoidPtr`
````

---

### Compile C++ with Embind and Emscripten

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

This command compiles a C++ file using Emcc, enabling Embind functionality and linking the Embind library. It optimizes the code with -O2 and enables warnings with -Wall. The output is an HTML file that can be run in a browser.

```bash
emcc -O2 -Wall -Werror -lembind -o oscillator.html oscillator.cpp

```

---

### Create a reusable JavaScript wrapper for C function 'c_add' using cwrap

Source: https://emscripten.org/docs/api_reference/preamble.js

Demonstrates the use of the `cwrap` function to create a reusable JavaScript function wrapper for a compiled C function named 'c_add'. It specifies the return type as 'number' and the argument types as two 'number's. The returned JavaScript function (`c_javascript_add`) can then be invoked multiple times with different arguments.

```javascript
var c_javascript_add = Module.cwrap(
  "c_add", // name of C function
  "number", // return type
  ["number", "number"],
); // argument types

// Call c_javascript_add normally
console.log(c_javascript_add(10, 20)); // 30
console.log(c_javascript_add(20, 30)); // 50
```

---

### Built-in Functions: Memory Operations

Source: https://emscripten.org/genindex

Documentation for built-in functions related to memory operations like writing arrays.

```APIDOC
## Built-in Functions: Memory Operations

### Description
Details built-in functions for interacting with memory, specifically for writing array data to memory locations.

### Functions
- `writeArrayToMemory()`: Writes an array to a specified memory location.
```

---

### Convert C++ Primitive Types to emscripten::val

Source: https://emscripten.org/docs/api_reference/val.h

Demonstrates the construction of `emscripten::val` objects from various C++ primitive types. This allows seamless conversion of C++ values like booleans, integers, and strings into their JavaScript equivalents.

```C++
val boolean_val = val(true);
val int_val = val(42);
val string_val = val(std::string("hello"));
```

---

### FS.lookupPath(path, opts) - Lookup Path

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Looks up a given path and returns an object containing the resolved path and node. Supports options to control the lookup behavior, such as returning the parent path or following symlinks.

````APIDOC
## FS.lookupPath(path, opts)

### Description
Looks up the incoming path and returns an object containing both the resolved path and node. The options (`opts`) allow you to specify whether the object, its parent component, a symlink, or the item the symlink points to are returned.

### Method
GET

### Endpoint
/websites/emscripten/fs/lookupPath

### Parameters
#### Query Parameters
- **path** (string) - Required - The incoming path.
- **opts** (object) - Optional - Options for the path lookup.
  - **parent** (boolean) - Optional - If true, stop resolving the path once the penultimate component is reached. Defaults to `false`.
  - **follow** (boolean) - Optional - If true, follow the last component if it is a symlink. Defaults to `false`.

### Request Example
```json
{
  "method": "GET",
  "endpoint": "/websites/emscripten/fs/lookupPath?path=/some/path&opts.parent=true&opts.follow=false"
}
````

### Response

#### Success Response (200)

- **object** - An object with the format:
  - **path** (string) - The resolved path.
  - **node** (object) - The resolved file system node.

#### Response Example

```json
{
  "lookupResult": {
    "path": "/resolved/path",
    "node": {
      "type": "directory"
    }
  }
}
```

````

--------------------------------

### Emscripten Synchronous Proxy Execution

Source: https://emscripten.org/docs/api_reference/proxying.h

Enqueues a function to be called on a target thread via a proxy queue and waits for its synchronous completion before returning. Returns 1 on success, 0 if the target thread is canceled or exits prematurely.

```c
int emscripten_proxy_sync(em_proxying_queue *q, pthread_t target_thread, void (*func)(void*), void *arg);
````

---

### Wasm Fetch Settings

Source: https://emscripten.org/docs/api_reference/module

Override the default settings object used when fetching the Wasm module from the network.

````APIDOC
## Module.fetchSettings

### Description
Allows overriding the default settings object used when fetching the Wasm module over the network. The default value is `{ credentials: 'same-origin' }`.

### Method
Configuration

### Endpoint
N/A (Module configuration property)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
Module.fetchSettings = {
  credentials: 'include',
  headers: {
    'X-Custom-Header': 'value'
  }
};
````

### Response

N/A

````

--------------------------------

### Emscripten Class Constructor with Name Prototype

Source: https://emscripten.org/docs/api_reference/bind.h

The constructor for the `class_` class that takes a C-style string `name`. This is used to provide a JavaScript-accessible name for the registered C++ class.

```cpp
EMSCRIPTEN_ALWAYS_INLINE explicit class_(const char* name)
````

---

### stringToUTF16

Source: https://emscripten.org/docs/api_reference/preamble.js

Copies a JavaScript String to the Emscripten HEAP as a null-terminated UTF16LE-encoded string.

````APIDOC
## stringToUTF16

### Description
Copies a JavaScript String to the Emscripten HEAP as a null-terminated UTF16LE-encoded string.

### Method
N/A (JavaScript function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
const jsString = "Hello, Emscripten!";
const outPtr = ...; // A pointer in Emscripten HEAP
const maxBytesToWrite = 100; // Example limit
stringToUTF16(jsString, outPtr, maxBytesToWrite);
````

### Response

#### Success Response

N/A (This function modifies the HEAP directly)

#### Response Example

N/A

````

--------------------------------

### Stack Trace API

Source: https://emscripten.org/docs/api_reference/preamble.js

Provides functionality to retrieve the current stack trace.

```APIDOC
## Stack Trace API

### `stackTrace()`

Returns the current stack trace.

> Note
> The stack trace is not available at least on IE10 and Safari 6.

*   **Returns**: The current stack trace, if available.
````

---

### WebGL Context Attributes Initialization

Source: https://emscripten.org/docs/api_reference/html5.h

Initializes EmscriptenWebGLContextAttributes structure with default values for WebGL 1.0.

```APIDOC
## emscripten_webgl_init_context_attributes

### Description
Populates all fields of the given `EmscriptenWebGLContextAttributes` structure to their default values for use with WebGL 1.0. This function ensures forward compatibility with future structure additions.

### Method
N/A (C function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response
N/A

#### Response Example
N/A

### Parameters:
- **attributes** (EmscriptenWebGLContextAttributes*) – The structure to be populated.
```

---

### Activate Emscripten SDK Version and Set Environment

Source: https://emscripten.org/docs/tools_reference/emsdk

This command switches the active SDK version and configures your environment. On Linux/macOS, you need to source `emsdk_env.sh` to update your current terminal's environment variables. On Windows, activation handles this automatically.

```bash
# Activate the specified tool or SDK version.
./emsdk activate <tool/sdk name>

# On Linux and macOS, set environment variables for the current terminal.
source ./emsdk_env.sh
```

---

### Initialize Emscripten Fiber from Current Context (C)

Source: https://emscripten.org/docs/api_reference/fiber.h

Partially initializes a fiber using the current execution context. This is essential for switching back from a fiber to the original thread context. It sets up stack boundaries and Asyncify stack information, making the fiber suitable for use with emscripten_fiber_swap to complete the continuation.

```c
void emscripten_fiber_init_from_current_context(emscripten_fiber_t *fiber, void *asyncify_stack, size_t asyncify_stack_size)
```

---

### Persist Downloaded File to IndexedDB using Fetch API (C)

Source: https://emscripten.org/docs/api_reference/fetch

This code snippet illustrates how to enable persistent storage of downloaded files in the browser's IndexedDB using the Emscripten Fetch API. By combining EMSCRIPTEN_FETCH_LOAD_TO_MEMORY with EMSCRIPTEN_FETCH_PERSIST_FILE in the fetch attributes, downloaded files can be made available on subsequent page visits. This is useful for larger files or when reliable local storage is required.

```c
int main() {
  emscripten_fetch_attr_t attr;
  emscripten_fetch_attr_init(&attr);
  // ... other attributes setup ...
  attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY | EMSCRIPTEN_FETCH_PERSIST_FILE;
  // ... rest of the fetch call ...
  emscripten_fetch(&attr, "myfile.dat");
}
```

---

### Built-in Functions: String Conversion

Source: https://emscripten.org/genindex

Documentation for built-in functions used for converting strings between different UTF encodings.

```APIDOC
## Built-in Functions: String Conversion

### Description
Provides details on built-in functions available in Emscripten for converting strings between UTF-8, UTF-16, and UTF-32 encodings, as well as for converting C++ `std::string` representations.

### Functions
- `stringToUTF16()`: Converts a string to UTF-16.
- `stringToUTF32()`: Converts a string to UTF-32.
- `stringToUTF8()`: Converts a string to UTF-8.
- `UTF16ToString()`: Converts a UTF-16 string to a standard string.
- `UTF32ToString()`: Converts a UTF-32 string to a standard string.
- `UTF8ToString()`: Converts a UTF-8 string to a standard string.
```

---

### Emscripten FS Event Tracking Callbacks

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Allows users to specify callback functions to receive notifications for various file system events, such as path movements, deletions, file openings, writes, reads, seeks, and closes. This feature requires the `-sFS_DEBUG` compilation flag.

```javascript
FS.trackingDelegate[callback name]

Users can specify callbacks to receive different filesystem events. This is useful for tracking changes in the filesystem. This requires -sFS_DEBUG.
  * `willMovePath` — Indicates path is about to be moved.
  * `onMovePath` — Indicates path is moved.
  * `willDeletePath` — Indicates path is about to be deleted.
  * `onDeletePath` — Indicates path deleted.
  * `onOpenFile` — Indicates file is opened.
  * `onWriteToFile` — Indicates file is being written to and number of bytes written.
  * `onReadFile` — Indicates file is being read and number of bytes read.
  * `onSeekFile` — Indicates seeking within a file, position, and whence.
  * `onCloseFile` — Indicates a file being closed.

Callback name:

The name of the callback that indicates the filesystem event
Example Code
```

EM_ASM(
FS.trackingDelegate['willMovePath'] = function(oldpath, newpath) {
out('About to move "' + oldpath + '" to "' + newpath + '"');
};
FS.trackingDelegate['onMovePath'] = function(oldpath, newpath) {
out('Moved "' + oldpath + '" to "' + newpath + '"');
};
FS.trackingDelegate['willDeletePath'] = function(path) {
out('About to delete "' + path + '"');
};
);

```

```

---

### Build Side Module with Dead Code Elimination (Emscripten)

Source: https://emscripten.org/docs/compiling/Dynamic-Linking

Builds a side module with normal dead code elimination enabled. This means only explicitly exported or kept-alive code will be included.

```bash
emcc -sSIDE_MODULE=2 side_module.c -o side_module.wasm
```

---

### Define Value Object Fields using C++

Source: https://emscripten.org/docs/api_reference/bind.h

Demonstrates how to define fields for a C++ `value_object`. This involves specifying field names and their corresponding types, either directly as member pointers or through getter/setter functions. These methods are essential for serializing and managing object data in Emscripten.

```cpp
class value_object : public internal::noncopyable {
public:
    // Constructor
    value_object(const char *name);
    ~value_object();

    // Add field by member pointer
    value_object &field(const char *fieldName, FieldType InstanceType::* field);

    // Add field by getter and setter functions
    value_object &field(const char *fieldName, Getter getter, Setter setter);

    // Add field by index
    value_object &field(const char *fieldName, index<Index>);
};

```

---

### Socket Event Registration Functions

Source: https://emscripten.org/docs/api_reference/emscripten.h

Register callback functions for various WebSocket events.

````APIDOC
## emscripten_set_socket_error_callback

### Description
Registers a callback function to be triggered by a WebSocket error.

### Method
`void`

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
*   **userData** (void*) - Arbitrary user data to be passed to the callback.
*   **callback** (em_socket_error_callback) - Pointer to a callback function. The callback receives a file descriptor, error code, message, and userData.

### Request Example
```c
void my_error_callback(int fd, int error, const char* msg, void* userData) {
    // Handle socket error
}

emscripten_set_socket_error_callback(NULL, my_error_callback);
````

### Response

#### Success Response (void)

N/A

#### Response Example

N/A

````

```APIDOC
## emscripten_set_socket_open_callback

### Description
Registers a callback function to be triggered when the WebSocket has opened.

### Method
`void`

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
*   **userData** (void*) - Arbitrary user data to be passed to the callback.
*   **callback** (em_socket_callback) - Pointer to a callback function. The callback receives a file descriptor and userData.

### Request Example
```c
void my_open_callback(int fd, void* userData) {
    // Handle socket open
}

emscripten_set_socket_open_callback(NULL, my_open_callback);
````

### Response

#### Success Response (void)

N/A

#### Response Example

N/A

````

```APIDOC
## emscripten_set_socket_listen_callback

### Description
Registers a callback function to be triggered when `listen` has been called (synthetic event).

### Method
`void`

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
*   **userData** (void*) - Arbitrary user data to be passed to the callback.
*   **callback** (em_socket_callback) - Pointer to a callback function. The callback receives a file descriptor and userData.

### Request Example
```c
void my_listen_callback(int fd, void* userData) {
    // Handle listen event
}

emscripten_set_socket_listen_callback(NULL, my_listen_callback);
````

### Response

#### Success Response (void)

N/A

#### Response Example

N/A

````

```APIDOC
## emscripten_set_socket_connection_callback

### Description
Registers a callback function to be triggered when a connection has been established.

### Method
`void`

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
*   **userData** (void*) - Arbitrary user data to be passed to the callback.
*   **callback** (em_socket_callback) - Pointer to a callback function. The callback receives a file descriptor and userData.

### Request Example
```c
void my_connection_callback(int fd, void* userData) {
    // Handle connection established
}

emscripten_set_socket_connection_callback(NULL, my_connection_callback);
````

### Response

#### Success Response (void)

N/A

#### Response Example

N/A

````

```APIDOC
## emscripten_set_socket_message_callback

### Description
Registers a callback function to be triggered when data is available to be read from the socket.

### Method
`void`

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
*   **userData** (void*) - Arbitrary user data to be passed to the callback.
*   **callback** (em_socket_callback) - Pointer to a callback function. The callback receives a file descriptor and userData.

### Request Example
```c
void my_message_callback(int fd, void* userData) {
    // Handle incoming message
}

emscripten_set_socket_message_callback(NULL, my_message_callback);
````

### Response

#### Success Response (void)

N/A

#### Response Example

N/A

````

```APIDOC
## emscripten_set_socket_close_callback

### Description
Registers a callback function to be triggered when the WebSocket has closed.

### Method
`void`

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
*   **userData** (void*) - Arbitrary user data to be passed to the callback.
*   **callback** (em_socket_callback) - Pointer to a callback function. The callback receives a file descriptor and userData.

### Request Example
```c
void my_close_callback(int fd, void* userData) {
    // Handle socket close
}

emscripten_set_socket_close_callback(NULL, my_close_callback);
````

### Response

#### Success Response (void)

N/A

#### Response Example

N/A

````

--------------------------------

### WebGL Context Threading Models

Source: https://emscripten.org/docs/api_reference/html5.h

Configures the threading model for WebGL contexts created in pthreads. This determines how the WebGLRenderingContext is handled, impacting performance and shareability across threads.

```APIDOC
## WebGL Context Threading Models

This section describes the different threading models that can be used when creating a WebGL context within a pthread using Emscripten.

### Threading Model Options:

- **`EMSCRIPTEN_WEBGL_CONTEXT_PROXY_DISALLOW`**:
  - The WebGLRenderingContext is created directly within the calling pthread as an OffscreenCanvas-based context.
  - **Requirements**: Browser support for OffscreenCanvas, `-sOFFSCREENCANVAS_SUPPORT` linker flag, Canvas transferred via `emscripten_pthread_attr_settransferredcanvases()`, and no existing OffscreenCanvas context.
  - **Limitation**: Only the creating pthread can access the context via `emscripten_webgl_make_context_current()`.

- **`EMSCRIPTEN_WEBGL_CONTEXT_PROXY_ALWAYS`**:
  - Creates a "proxied context" where the WebGLRenderingContext is on the main thread and WebGL calls are proxied asynchronously.
  - **Requirements**: `-sOFFSCREEN_FRAMEBUFFER` linker flag. No special browser support needed.
  - **Benefit**: Can be shared across multiple pthreads; any pthread can activate access via `emscripten_webgl_make_context_current()`.
  - **Impact**: Performance and latency impact compared to OffscreenCanvas contexts.

- **`EMSCRIPTEN_WEBGL_CONTEXT_PROXY_FALLBACK`**:
  - Prefers OffscreenCanvas if supported, otherwise falls back to a proxied context.
  - **Requirements**: `-sOFFSCREEN_FRAMEBUFFER` and `-sOFFSCREENCANVAS_SUPPORT` linker flags.

### Default Behavior:

- `proxyContextToMainThread` defaults to `EMSCRIPTEN_WEBGL_CONTEXT_PROXY_DISALLOW` for contexts created on the main thread, meaning they are not shared by default.
- To create a shared context, set `proxyContextToMainThread` to `EMSCRIPTEN_WEBGL_CONTEXT_PROXY_ALWAYS`.

````

---

### emscripten_async_wget2_abort

Source: https://emscripten.org/docs/api_reference/emscripten.h

Aborts an asynchronous request that was initiated using emscripten_async_wget2() or emscripten_async_wget2_data().

````APIDOC
## emscripten_async_wget2_abort

### Description
Abort an asynchronous request raised using `emscripten_async_wget2()` or `emscripten_async_wget2_data()`.

### Method
`void`

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```c
void emscripten_async_wget2_abort(int handle);
````

### Response

#### Success Response (200)

N/A

#### Response Example

N/A

### Parameters

- **handle** (int) - A handle to the request to be aborted.

````

--------------------------------

### Compile with Address Sanitizer (ASan)

Source: https://emscripten.org/docs/debugging/Sanitizers

Enable Clang's Address Sanitizer by passing the '-fsanitize=address' flag during compilation and linking. ASan helps detect memory errors like buffer overflows and use-after-free bugs.

```bash
emcc -fsanitize=address your_code.c
````

---

### FS.analyzePath(path, dontResolveLastLink) - Analyze Path

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Analyzes a given path, providing detailed information about its existence, type, and parent. Built upon `FS.lookupPath`.

````APIDOC
## FS.analyzePath(path, dontResolveLastLink)

### Description
Looks up the incoming path and returns an object containing information about file stats and nodes. Built on top of `FS.lookupPath` and provides more information about the given path and its parent. If any error occurs, it won’t throw but returns an `error` property.

### Method
GET

### Endpoint
/websites/emscripten/fs/analyzePath

### Parameters
#### Query Parameters
- **path** (string) - Required - The incoming path.
- **dontResolveLastLink** (boolean) - Optional - If true, don't follow the last component if it is a symlink.

### Request Example
```json
{
  "method": "GET",
  "endpoint": "/websites/emscripten/fs/analyzePath?path=/another/path&dontResolveLastLink=true"
}
````

### Response

#### Success Response (200)

- **object** - An object with the format:
  - **isRoot** (boolean) - True if the path is the root directory.
  - **exists** (boolean) - True if the path exists.
  - **error** (Error) - An error object if an error occurred.
  - **name** (string) - The name of the last component of the path.
  - **path** (string) - The resolved path.
  - **object** (object) - The file system node corresponding to the resolved path.
  - **parentExists** (boolean) - True if the parent directory exists.
  - **parentPath** (string) - The resolved path of the parent directory.
  - **parentObject** (object) - The file system node corresponding to the parent directory.

#### Response Example

```json
{
  "analysis": {
    "isRoot": false,
    "exists": true,
    "error": null,
    "name": "file.txt",
    "path": "/data/file.txt",
    "object": { "type": "file" },
    "parentExists": true,
    "parentPath": "/data",
    "parentObject": { "type": "directory" }
  }
}
```

````

--------------------------------

### Enabling WebAssembly Exception Handling

Source: https://emscripten.org/docs/porting/exceptions

This snippet demonstrates the compilation command to enable C++ exception handling using the native WebAssembly exception handling proposal. The -fwasm-exceptions flag is used during compilation and linking.

```bash
emcc your_code.cpp -o your_app.js -fwasm-exceptions
````

---

### Define Noise Generator AudioWorkletProcessor (C/C++)

Source: https://emscripten.org/docs/api_reference/wasm_audio_worklets

This function is a callback executed when the Wasm Audio Worklet thread is initialized. It creates a new `AudioWorkletProcessor` named 'noise-generator' asynchronously, using `emscripten_create_wasm_audio_worklet_processor_async`. It requires the `success` status to be true before proceeding.

```c++
void AudioThreadInitialized(EMSCRIPTEN_WEBAUDIO_T audioContext, bool success, void *userData)
{
  if (!success) return; // Check browser console in a debug build for detailed errors
  WebAudioWorkletProcessorCreateOptions opts = {
    .name = "noise-generator",
  };
  emscripten_create_wasm_audio_worklet_processor_async(audioContext, &opts, &AudioWorkletProcessorCreated, 0);
}
```

---

### UTF32ToString

Source: https://emscripten.org/docs/api_reference/preamble.js

Converts a null-terminated UTF32LE-encoded string from the Emscripten HEAP to a JavaScript String.

````APIDOC
## UTF32ToString

### Description
Converts a null-terminated UTF32LE-encoded string from the Emscripten HEAP to a JavaScript String.

### Method
N/A (JavaScript function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
// Assuming 'ptr' is a valid pointer to a UTF32LE string in Emscripten HEAP
const jsString = UTF32ToString(ptr);
````

### Response

#### Success Response

- **string** (String) - A JavaScript String object representing the decoded UTF32LE string.

#### Response Example

```javascript
"Hello, Emscripten!";
```

````

--------------------------------

### Advanced Emscripten Toolchain Profiling Commands

Source: https://emscripten.org/docs/optimizing/Profiling-Toolchain

This snippet shows advanced usage of the `emprofile.py` script, including clearing previous profiling data, profiling specific compilation steps with environment variables set per-command, and specifying an output file name for the results.

```bash
emprofile --clear
EMPROFILE=1 emcc -c foo.c a.o
EMPROFILE=1 emcc a.o -O3 -o a.html
emprofile --outfile=myresults.html

````

---

### Modular JavaScript Output with Emscripten

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Wraps JavaScript output in a function, returning a Promise that resolves to the initialized Emscripten Module instance. This is useful for creating libraries and avoids polluting the global scope. The promise resolves when compiled code is ready to run.

```javascript
var instance;
Module().then((module) => {
  instance = module;
});
```

---

### Call C function 'c_add' from JavaScript using ccall

Source: https://emscripten.org/docs/api_reference/preamble.js

Demonstrates how to use the `ccall` function to execute a compiled C function named 'c_add' from JavaScript. It specifies the return type as 'number' and the argument types as two 'number's, passing the values 10 and 20. The result of the C function call is stored in the `result` variable.

```javascript
var result = Module.ccall(
  "c_add", // name of C function
  "number", // return type
  ["number", "number"], // argument types
  [10, 20],
); // arguments

// result is 30
```

---

### Code Transformation and Utilities

Source: https://emscripten.org/docs/tools_reference/emcc

Options for transforming generated JavaScript code and specifying utility files.

```APIDOC
## --use-preload-plugins

### Description
Enables preload plugins to process files during loading, performing tasks like image and audio decoding using browser codecs.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
N/A

### Request Example
```

emcc main.c -o game.html --preload-file assets/audio.mp3 --use-preload-plugins

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --shell-file <path>

### Description
Specifies a skeleton HTML file to use as a template for HTML output. The shell file must contain the `{{{ SCRIPT }}}` token.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **path** (string) - Required - Path to the HTML shell file.

### Request Example
```

emcc main.c -o game.html --shell-file my_shell.html

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --source-map-base <base-url>

### Description
Sets the base URL for WebAssembly source map locations when using the `-gsource-map` option.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **base-url** (string) - Required - The base URL for source maps.

### Request Example
```

emcc main.c -o game.js -gsource-map --source-map-base https://example.com/maps/

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --minify 0

### Description
Disables minification. Equivalent to `-g1` when passed at compile time.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
N/A

### Request Example
```

emcc main.c -o game.js --minify 0

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## --js-transform <cmd>

### Description
Specifies a command to be executed on the generated JavaScript code before optimization, allowing for custom code modifications.

### Method
Compiler Flag

### Endpoint
N/A

### Parameters
#### Path Parameters
- **cmd** (string) - Required - The command to execute, space-separated.

### Request Example
```

emcc main.c -o game.js --js-transform "python ./transform.py"

```

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A
```

---

### FS.readlink

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Retrieves the target path of a symbolic link.

````APIDOC
## FS.readlink

### Description
Gets the string value stored in the symbolic link at `path`.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **path** (string) - Required - Path to the target file.

### Request Example
```javascript
// Assuming FS.symlink('file', 'link') has been called
FS.readlink('link');
````

### Response

#### Success Response (string)

- **Returns** (string) - The string value stored in the symbolic link at `path`.

#### Response Example

```
file
```

````

--------------------------------

### Emscripten Soft Fullscreen API (C/C++)

Source: https://emscripten.org/docs/api_reference/html5.h

Provides functions to enter and exit a 'soft' fullscreen mode. This mode displays a target element in the entire client area without requesting actual browser fullscreen. It's useful for packaged applications where fullscreen is not desired. Exiting requires a manual call to emscripten_exit_soft_fullscreen().

```c
EMSCRIPTEN_RESULT emscripten_enter_soft_fullscreen(嫨_dom_element target, EMSCRIPTEN_RESULT (*callback)(EMSCRIPTEN_RESULT result, void *userData));
EMSCRIPTEN_RESULT emscripten_exit_soft_fullscreen();
````

---

### C++ Embind: Explicitly Take Ownership of Returned Objects

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Demonstrates how to use `return_value_policy::take_ownership()` to transfer object ownership from C++ to JavaScript. This policy is crucial when a C++ function creates and returns an object that JavaScript should manage and eventually delete.

```cpp
EMSCRIPTEN_BINDINGS(module) {
  function("createData", &createData, return_value_policy::take_ownership());
}
```

---

### Emscripten Async Wget2 Status Callback Type

Source: https://emscripten.org/docs/api_reference/emscripten.h

Defines the function pointer type for the `onerror` and `onprogress` callbacks associated with `emscripten_async_wget2()`. Specific parameter details are available in the `emscripten_async_wget2()` method documentation.

```c
typedef void (*em_async_wget2_onstatus_func)(void*, int)
```

---

### WebGL Context Event Callbacks

Source: https://emscripten.org/docs/api_reference/html5.h

Functions to register callbacks for WebGL context lost and restored events.

```APIDOC
## emscripten_set_webglcontextlost_callback

### Description
Registers a callback function for the `webglcontextlost` event.

### Method
N/A (C function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (EMSCRIPTEN_RESULT_SUCCESS)
N/A

#### Response Example
N/A

---

## emscripten_set_webglcontextrestored_callback

### Description
Registers a callback function for the `webglcontextrestored` event.

### Method
N/A (C function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (EMSCRIPTEN_RESULT_SUCCESS)
N/A

#### Response Example
N/A

---

### Parameters for both callbacks:
- **target** (const char*) – Target HTML element id.
- **userData** (void*) – User-defined data to be passed to the callback.
- **useCapture** (bool) – Set `true` to use capture.
- **callback** (em_webgl_context_callback) – A callback function. Should return `true` if the event is consumed.

### Returns for both callbacks:
`EMSCRIPTEN_RESULT_SUCCESS`, or one of the other result values.

### Return type for both callbacks:
`EMSCRIPTEN_RESULT`
```

---

### C++ Functions and Types: R

Source: https://emscripten.org/genindex

Documentation for C++ functions like register_map and register_vector, and types such as ret_val.

```APIDOC
## C++ Functions and Types: R

### Description
Details C++ functions for registering maps and vectors, along with the `ret_val` type used for return values.

### Functions
- `register_map`: C++ function.
- `register_vector`: C++ function.

### Types
- `ret_val`: C++ type.
  - `ret_val::index`: C++ member of `ret_val`.

### Concepts
- **Relooping**
- **reStructured text**
```

---

### Map file to new path and filename (Emcc)

Source: https://emscripten.org/docs/porting/files/packaging_files

Embeds a file from the build environment and makes it available at a new, specified path and filename within the virtual file system. This allows for renaming or relocating files at build time.

```bash
emcc file.cpp -o file.html --embed-file ../res/gen123.png@main.png
```

---

### FS.lchmod

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Changes the mode flags for a symbolic link itself.

````APIDOC
## FS.lchmod

### Description
Identical to `FS.chmod()`. However, if `path` is a symbolic link then the mode will be set on the link itself, not the file that it links to.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **path** (string) - Required - Path to the target file.
- **mode** (int) - Required - The new file permissions for `path`, in octal numeric notation.

### Request Example
```javascript
// Assuming 'link' is a symbolic link
FS.lchmod('link', 0o0000);
````

### Response

#### Success Response (N/A)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Download specific byte ranges of a file with Emscripten Fetch API (C/C++)

Source: https://emscripten.org/docs/api_reference/fetch

Illustrates how to download only a specific portion of a file using the 'Range' HTTP header. This is useful for large files containing multiple smaller assets or when only a subset of data is needed. The emscripten_fetch_attr_t allows setting custom request headers for this purpose. The data is loaded into memory upon completion.

```c
#include <stdio.h>
#include <string.h>
#include <emscripten/fetch.h>

void downloadSucceeded(emscripten_fetch_t *fetch) {
  printf("Finished downloading %llu bytes from URL %s.\n", fetch->numBytes, fetch->url);
  // The data is now available at fetch->data[0] through fetch->data[fetch->numBytes-1];
  emscripten_fetch_close(fetch); // Free data associated with the fetch.
}

void downloadFailed(emscripten_fetch_t *fetch) {
  printf("Downloading %s failed, HTTP failure status code: %d.\n", fetch->url, fetch->status);
  emscripten_fetch_close(fetch); // Also free data on failure.
}

int main() {
  emscripten_fetch_attr_t attr;
  emscripten_fetch_attr_init(&attr);
  strcpy(attr.requestMethod, "GET");
  attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY;
  // Make a Range request to only fetch bytes 10 to 20
  const char* headers[] = {"Range", "bytes=10-20", NULL};
  attr.requestHeaders = headers;
  attr.onsuccess = downloadSucceeded;
  attr.onerror = downloadFailed;
  emscripten_fetch(&attr, "myfile.dat");
}


````

---

### Standard Output and Error Handling

Source: https://emscripten.org/docs/api_reference/module

Callbacks for handling standard output (stdout) and standard error (stderr) streams from the Emscripten application.

````APIDOC
## Module.print

### Description
A callback function that is invoked whenever the Emscripten application prints to standard output (stdout).

### Method
Configuration

### Endpoint
N/A (Module configuration property)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
Module.print = (text) => {
  console.log('stdout:', text);
};
````

### Response

N/A

## Module.printErr

### Description

A callback function that is invoked whenever the Emscripten application prints to standard error (stderr).

### Method

Configuration

### Endpoint

N/A (Module configuration property)

### Parameters

#### Path Parameters

N/A

#### Query Parameters

N/A

#### Request Body

N/A

### Request Example

```javascript
Module.printErr = (text) => {
  console.error("stderr:", text);
};
```

### Response

N/A

````

--------------------------------

### Incoming Module JS API Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Specify a list of incoming JavaScript values on the Module object that the compiler should be aware of. If a value is not in this list, code to check for its provision at runtime may not be emitted, allowing for compiler optimizations. A short and concise list can reduce code size.

```javascript
var Module = {
  print: (x) => console.log('print: ' + x),
  preRun: [() => console.log('pre run')]
};

````

```emcc
-INCOMING_MODULE_JS_API=['print','preRun']
```

---

### Instantiate Emscripten Module with MODULARIZE=instance (JavaScript)

Source: https://emscripten.org/docs/compiling/Modularized-Output

Demonstrates the experimental `MODULARIZE=instance` setting which exports a single instance of the program rather than a factory function. This mode implicitly enables EXPORT_ES6 and exports other module elements directly. It allows passing input parameters to the instance upon initialization.

```javascript
// Import the default init function and a named native method
import init, { _nativeMethod } from "./emcc-output.js";
await init({ print: myPrint });
_nativeMethod();
```

---

### Exported Runtime Methods Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Define a list of runtime elements that should be exported on the Module object. This list is used for any JavaScript library element you wish to expose, not just methods. For instance, exporting the 'FS' object requires 'FS' to be in this list.

```emcc
-EXPORTED_RUNTIME_METHODS=[method1,method2,...]
```

---

### Enable Stack Use-After-Return Check with ASan in C

Source: https://emscripten.org/docs/debugging/Sanitizers

This C code snippet demonstrates how to enable the 'detect_stack_use_after_return' option for Emscripten's AddressSanitizer (ASan). By defining the `__asan_default_options` function, you can pass ASan configuration flags directly within your C source code. This is useful for catching bugs where a function returns a pointer to a local variable that is then accessed after the function has returned.

```c
#include <stdio.h>

const char *__asan_default_options() {
  return "detect_stack_use_after_return=1";
}

int *f() {
  int buf[10];
  return buf;
}

int main() {
  *f() = 1;
}
```

---

### Emscripten String Conversion and Memory Management

Source: https://emscripten.org/docs/api_reference/emscripten.h

Demonstrates converting JavaScript strings to UTF-8 for Emscripten and managing memory using \_malloc and free. Emphasizes the difference between JS string length (UTF-16) and C string length (UTF-8).

```javascript
var jsString = 'Hello with some exotic Unicode characters: Tässä on yksi lumiukko: ☃, ole hyvä.';
var lengthBytes = lengthBytesUTF8(jsString)+1;
// 'jsString.length' would return the length of the string as UTF-16
// units, but Emscripten C strings operate as UTF-8.
return stringToNewUTF8(jsString);
});
printf("UTF8 string says: %s\n", str);
free(str); // Each call to _malloc() must be paired with free(), or heap memory will leak!

```

---

### Embed Resources in Single File Output (Emscripten)

Source: https://emscripten.org/docs/tools_reference/settings_reference

Configures Emscripten to embed all subresources, such as WASM, ASM.js, and static memory, as base64 encoded strings within the single output file. This simplifies deployment by creating a self-contained file but may require adjustments to Content Security Policy (CSP) settings, particularly for `script-src` and `child-src` directives.

```javascript
{
  "SINGLE_FILE": 1
}
```

---

### Emscripten Linker Flags for OpenGL ES 2 Targeting

Source: https://emscripten.org/docs/optimizing/Optimizing-WebGL

This snippet demonstrates how to use Emscripten linker flags to target OpenGL ES 2 (WebGL 1). The `-sFULL_ES2` flag is used for client-side memory rendering emulation, which is not natively supported by WebGL but eases porting. For optimal performance, VBOs should be used and this flag omitted.

```text
#include <GLES2/gl2.h>
#include <GLES2/gl2ext.h>

// Build with: emcc main.c -o main.js -sFULL_ES2
```

---

### C++ Embind: Register Smart Pointer Constructor with std::make_shared

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Demonstrates how to register a smart pointer type, specifically `std::shared_ptr`, using `smart_ptr_constructor()`. This allows Embind to correctly manage the lifetime of objects created via `std::make_shared` when instantiated from JavaScript.

```cpp
EMSCRIPTEN_BINDINGS(better_smart_pointers) {
    class_<C>("C")
        .smart_ptr_constructor("C", &std::make_shared<C>)
        ;
}
```

---

### C++ Proxying API: Callback Proxy

Source: https://emscripten.org/docs/api_reference/proxying.h

This C++ function executes a primary function and schedules either a callback or cancel function. It returns true if the function was successfully enqueued, false otherwise. It uses emscripten_proxy_callback and requires C++11 or later.

```cpp
#include <functional>
#include <pthread.h>

namespace emscripten {

bool proxyCallback(pthread_t target, std::function<void()> &&func, std::function<void()> &&callback, std::function<void()> &&cancel);

}

```

---

### Runtime and Module JS API Export Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference

Manage which runtime elements are exported on the Module object and which incoming JavaScript values on the Module object the compiler should be aware of for optimization. This helps reduce code size by only including necessary exports and imports.

```ini
; EXPORTED_RUNTIME_METHODS: List of runtime elements to export on Module.
; INCOMING_MODULE_JS_API: List of incoming JS values on Module that the compiler should track.

```

---

### Configure Apache for .wasm MIME Type

Source: https://emscripten.org/docs/compiling/WebAssembly

This Apache configuration directive sets the correct MIME type for .wasm files, enabling streaming compilation in the browser. Ensure this is added to your Apache server configuration.

```apache
AddType application/wasm .wasm

```

---

### Asynchronous File System API - Typedefs

Source: https://emscripten.org/docs/api_reference/emscripten.h

Defines function pointer types used for callbacks within Emscripten's Asynchronous File System API.

```APIDOC
## Asynchronous File System API Typedefs

### Description
This section details the various function pointer types used for callbacks in Emscripten's asynchronous file system operations, such as `emscripten_async_wget_data`, `emscripten_async_wget2`, and `emscripten_run_preload_plugins_data`.

### Typedefs

#### `em_async_wget_onload_func`

- **Description**: Function pointer type for the `onload` callback of `emscripten_async_wget_data()`.
- **Defined as**: `typedef void (*em_async_wget_onload_func)(void*, void*, int)`

#### `em_async_wget2_onload_func`

- **Description**: Function pointer type for the `onload` callback of `emscripten_async_wget2()`.
- **Defined as**: `typedef void (*em_async_wget2_onload_func)(void*, const char*)`

#### `em_async_wget2_onstatus_func`

- **Description**: Function pointer type for the `onerror` and `onprogress` callbacks of `emscripten_async_wget2()`.
- **Defined as**: `typedef void (*em_async_wget2_onstatus_func)(void*, int)`

#### `em_async_wget2_data_onload_func`

- **Description**: Function pointer type for the `onload` callback of `emscripten_async_wget2_data()`.
- **Defined as**: `typedef void (*em_async_wget2_data_onload_func)(unsigned, void*, void *, unsigned)`

#### `em_async_wget2_data_onerror_func`

- **Description**: Function pointer type for the `onerror` callback of `emscripten_async_wget2_data()`.
- **Defined as**: `typedef void (*em_async_wget2_data_onerror_func)(unsigned, void*, int, const char*)`

#### `em_async_wget2_data_onprogress_func`

- **Description**: Function pointer type for the `onprogress` callback of `emscripten_async_wget2_data()`.
- **Defined as**: `typedef void (*em_async_wget2_data_onprogress_func)(unsigned, void*, int, int)`

#### `em_run_preload_plugins_data_onload_func`

- **Description**: Function pointer type for the `onload` callback of `emscripten_run_preload_plugins_data()`.
- **Defined as**: `typedef void (*em_run_preload_plugins_data_onload_func)(void*, const char*)`

### Method
N/A (Typedef definitions)

### Endpoint
N/A

### Parameters
N/A

### Request Example
N/A

### Response
N/A
```

---

### Read File with Emscripten FS

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Reads the entire content of a file specified by its path. It can return the content as a UTF-8 encoded string or a Uint8Array buffer. Options allow specifying encoding and read flags.

```javascript
FS.readFile(_path_ , _opts_)

Arguments:

  * **path** (`string()`) – The file to read.
  * **opts** (`object()`) –
    * **encoding** (_string_) Defines the encoding used to return the file contents: `binary` | `utf8` . The default is `binary`
    * **flags** (_string_) Read flags, as defined in `FS.open()`. The default is ‘r’.
```

---

### Return Integer/Pointer Values with EM_ASM_INT/EM_ASM_PTR

Source: https://emscripten.org/docs/api_reference/emscripten.h

EM_ASM_INT and EM_ASM_PTR extend EM_ASM by allowing JavaScript code blocks to return values back to C. EM_ASM_INT returns integer types, while EM_ASM_PTR returns pointer-sized values (configurable for i64). Proper memory management is required when returning strings.

```c
int x = EM_ASM_INT({
  return $0 + 42;
}, 100);

int y = EM_ASM_INT(return HEAP8.length);
```

```c
char *str = (char*)EM_ASM_PTR({

```

---

### Truncate File (C/C++ with Emscripten)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Truncates a file to a specified length. This function allows you to resize a file to a desired size, potentially shortening or padding it.

```c
#include <stdio.h>
// FS.truncate is typically used within EM_ASM blocks or called from C/C++ code
// Example usage would depend on the context, but conceptually it resizes a file.
// FS.truncate('my_file.txt', 1024);
```

---

### Event Registration Functions

Source: https://emscripten.org/docs/api_reference/html5.h

Details on how to register callbacks for various HTML5 events using functions like emscripten_set_some_callback.

````APIDOC
## Event Registration Functions

Most of the APIs in `html5.h` utilize an event-based architecture, where functionality is accessed by registering a callback function that will be invoked when a specific event occurs. The Gamepad API is an exception, offering only a polling API.

### Function Signature (Typical)

The general format for registration functions is as follows, though some methods might omit certain parameters:

```c
EMSCRIPTEN_RESULT emscripten_set_some_callback(
  const char *target,       // ID of the target HTML element.
  void *userData,           // User-defined data to be passed to the callback.
  bool useCapture,          // Whether or not to use capture.
  em_someevent_callback_func callback // Callback function.
);
````

### Parameters

- **`target`** (const char \*)
  - The ID of the target HTML element to which the callback registration is applied. Special values include:
    - `EMSCRIPTEN_EVENT_TARGET_WINDOW`: Applies to the JavaScript `window` object.
    - `EMSCRIPTEN_EVENT_TARGET_DOCUMENT`: Applies to the JavaScript `document` object.
    - `EMSCRIPTEN_EVENT_TARGET_SCREEN`: Applies to the JavaScript `window.screen` object.
    - `0` or `NULL`: In default builds (`-sDISABLE_DEPRECATED_FIND_EVENT_TARGET_BEHAVIOR`), denotes an invalid element. With the legacy option (`-sDISABLE_DEPRECATED_FIND_EVENT_TARGET_BEHAVIOR=0`), a default element is auto-selected.
    - `#canvas`: With the legacy option, applies to the Emscripten default WebGL canvas. With the default option, it's a CSS query selector for the first element with ID 'canvas'.
    - Any other string: Treated as a CSS selector to find the first matching DOM element.
  - Custom mappings can be defined in JavaScript using `specialHTMLTargets` (e.g., `specialHTMLTargets["!canvas"] = Module.canvas;`).

- **`userData`** (void \*)
  - A user-defined value passed unchanged to the registered event callback. Useful for passing pointers to C++ objects or structuring the API.

- **`useCapture`** (bool)
  - Corresponds to `useCapture` in `EventTarget.addEventListener`. If `true`, the callback is invoked during the DOM capture and target phases. If `false`, it's triggered during the target and bubbling phases.

- **`callback`** (em_someevent_callback_func)
  - The function to be called when the event occurs.

### Return Value

- **`EMSCRIPTEN_RESULT`**
  - Zero or positive values indicate success.
  - Negative values indicate failure.
  - `EMSCRIPTEN_RESULT_NOT_SUPPORTED` is returned if the browser does not support the feature when the callback is registered.
  - These functions do not throw JavaScript or C++ exceptions.

````

--------------------------------

### Advanced File System API

Source: https://emscripten.org/docs/api_reference/advanced-apis

Provides a comprehensive set of functions for interacting with the Emscripten virtual file system, including node creation, management, and lookup operations.

```APIDOC
## Advanced File System API

### Description
A collection of advanced functions for managing the Emscripten virtual file system.

### Functions
*   **`FS.hashName(parentdev, node, name)`**: Hashes a file name.
*   **`FS.hashAddNode(mode, dev, uid, gid, size, atime, mtime, ctime, name)`**: Adds a node to the hash table.
*   **`FS.hashRemoveNode(name)`**: Removes a node from the hash table.
*   **`FS.lookupNode(parent, name)`**: Looks up a node within a parent directory.
*   **`FS.createNode(parent, name, mode, dev)`**: Creates a new file system node.
*   **`FS.destroyNode(node)`**: Destroys a file system node.
*   **`FS.isRoot(node)`**: Checks if a node is the root directory.
*   **`FS.isMountpoint(node)`**: Checks if a node is a mount point.
*   **`FS.isFIFO(mode)`**: Checks if a file mode represents a FIFO.
*   **`FS.nextfd(fd)`**: Gets the next available file descriptor.
*   **`FS.getStream(fd)`**: Retrieves the stream associated with a file descriptor.
*   **`FS.createStream(node, mode, fd_offset)`**: Creates a new stream for a node.
*   **`FS.closeStream(stream)`**: Closes a stream.
*   **`FS.getStreamFromPtr(ptr)`**: Gets a stream from its pointer representation.
*   **`FS.getPtrForStream(stream)`**: Gets the pointer representation for a stream.
*   **`FS.major(dev)`**: Extracts the major number from a device identifier.
*   **`FS.minor(dev)`**: Extracts the minor number from a device identifier.
*   **`FS.getDevice(major, minor)`**: Constructs a device identifier from major and minor numbers.
*   **`FS.getMounts()`**: Returns a list of mounted file systems.
*   **`FS.lookup(path)`**: Looks up a node by its path.
*   **`FS.mknod(path, mode, dev)`**: Creates a node at the specified path.
*   **`FS.create(path, mode)`**: Creates a new node at the specified path.
*   **`FS.mmap(path, length, prot, flags, fd, offset)`**: Memory maps a file.
*   **`FS.ioctl(fd, cmd, arg)`**: Performs I/O control operations.
*   **`FS.staticInit()`**: Initializes the static file system.
*   **`FS.quit()`**: Cleans up the file system.
*   **`FS.indexedDB(canRead, canWrite)`**: Interacts with IndexedDB.
*   **`FS.DB_NAME(name)`**: Returns the IndexedDB database name.
*   **`FS.getMode(path)`**: Gets the mode of a file system node.
*   **`FS.findObject(path, dontResolveSymlinks)`**: Finds a file system object.
*   **`FS.createPath(parent, path, mode, dev)`**: Creates a directory path.
*   **`FS.createFile(parent, name, mode, dev)`**: Creates a file node.
*   **`FS.createDataFile(parent, name, data, mode, dev)`**: Creates a file node with initial data.
*   **`FS.createDevice(parent, name, mode, dev)`**: Creates a device node.
*   **`FS.forceLoadFile(file)`**: Forces loading of a file.
````

---

### Await JavaScript Promise (C++)

Source: https://emscripten.org/docs/api_reference/val.h

Pauses C++ execution to `await` a JavaScript `Promise` or thenable. This method requires ASYNCIFY to be enabled and returns the fulfilled value of the promise.

```cpp
val await() const;
// Example:
// val promise = someAsyncOperation();
// val result = promise.await();
```

---

### FS.readdir(path) - Read Directory Contents

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Reads the contents of a specified directory path and returns an array of file and directory names.

````APIDOC
## FS.readdir(path)

### Description
Reads the contents of the `path`.

### Method
GET

### Endpoint
/websites/emscripten/fs/readdir

### Parameters
#### Query Parameters
- **path** (string) - Required - The incoming path to read.

### Request Example
```json
{
  "method": "GET",
  "endpoint": "/websites/emscripten/fs/readdir?path=/some/directory"
}
````

### Response

#### Success Response (200)

- **array** - An array of strings, where each string is the name of a file or directory within the specified path, including '.' and '..'.

#### Response Example

```json
{
  "contents": [".", "..", "file1.txt", "subdir"]
}
```

````

--------------------------------

### Registering STL Wrappers with Embind

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

This snippet demonstrates how to use Embind's factory functions to register C++ STL container types for use with JavaScript. It shows the registration of a vector of integers, a map from integers to integers, and an optional string.

```cpp
EMSCRIPTEN_BINDINGS(stl_wrappers) {
    register_vector<int>("VectorInt");
    register_map<int,int>("MapIntInt");
    register_optional<std::string>();
}
````

---

### Asyncify Debug Logging

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Configure the level of runtime debug logging for Asyncify internals. A value of 1 provides minimal logging, while a value of 2 provides verbose logging.

```emcc
-ASYNCIFY_DEBUG=1
```

```emcc
-ASYNCIFY_DEBUG=2
```

---

### Emscripten Workaround: Adapter Function for Function Pointers

Source: https://emscripten.org/docs/porting/guidelines/function_pointer_issues

Presents a preferred solution using an adapter function to resolve Emscripten function pointer casting problems. The adapter function is defined with the expected signature, allowing it to be correctly placed in the function pointer table and call the original function.

```c
void voidReturnNoParamAdapter(const char *message) {
  voidReturnNoParam();
}

int main() {
  voidReturnType functionList[3];

  functionList[0] = voidReturn;
  functionList[1] = (voidReturnType)intReturn; // Fixed in callFunctions
  functionList[2] = voidReturnNoParamAdapter; // Fixed by Adapter

  callFunctions(functionList, 3);
}
```

---

### Control Parallel Optimizations with EMCC_CORES

Source: https://emscripten.org/docs/getting_started/FAQ

Emscripten can parallelize certain optimizations (Binaryen for Wasm, JavaScript optimizations). You can control the number of cores used with the EMCC_CORES environment variable. Increasing cores generally leads to near-linear speed improvements, but consider memory constraints.

```bash
export EMCC_CORES=N
```

---

### Direct JavaScript Call to Emscripten Function

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Shows how to directly call a C function compiled with Emscripten from JavaScript. The function name needs to be prefixed with an underscore (`_`). This method is generally faster than `ccall` or `cwrap` but requires manual type management.

```javascript
// Assuming 'instance' is the Emscripten module
instance._yourCFunctionName(arg1, arg2);
```

---

### Register Orientation Change Callback (C)

Source: https://emscripten.org/docs/api_reference/html5.h

Registers a callback function to receive orientation change events. User data can be passed to the callback. The `useCapture` parameter controls event capturing behavior. The callback function should return true if it consumes the event.

```c
EMSCRIPTEN_RESULT emscripten_set_orientationchange_callback(void *userData, bool useCapture, em_orientationchange_callback_func callback);
```

---

### C++ Proxying API: Synchronous Proxy

Source: https://emscripten.org/docs/api_reference/proxying.h

This C++ function executes a given function synchronously on a target thread. It returns true if the function completed successfully, and false otherwise. It uses emscripten_proxy_sync and requires C++11 or later.

```cpp
#include <functional>
#include <pthread.h>

namespace emscripten {

bool proxySync(const pthread_t target, const std::function<void()> &func);

}

```

---

### Stack and Register Scanning

Source: https://emscripten.org/docs/api_reference/emscripten.h

Functions to scan the C userspace stack and Wasm registers.

```APIDOC
## void emscripten_scan_stack(em_scan_func func)

### Description
Scans the C userspace stack, which is the stack managed by the compiled code. This function provides a way to access data already in linear memory.

### Method
N/A (Function Signature)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A

## void emscripten_scan_registers(em_scan_func func)

### Description
Scans Wasm locals, which represent data not stored in memory. This function relies on Asyncify and may incur overhead. To ensure all necessary data is scanned, consider also using `emscripten_scan_stack`.

### Method
N/A (Function Signature)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
N/A

### Response
#### Success Response (N/A)
N/A

#### Response Example
N/A
```

---

### Emscripten: Running with Node.js (Asyncify/JSPI)

Source: https://emscripten.org/docs/porting/asyncify

Instructions for running a compiled Emscripten application that utilizes Asyncify or JSPI features using Node.js. For JSPI, specific Node.js flags like `--experimental-wasm-stack-switching` might be required due to its experimental nature. This demonstrates how to execute the compiled JavaScript output from a C++ source that interacts with asynchronous operations.

```bash
nodejs a.out.js
nodejs --experimental-wasm-stack-switching a.out.js
```

---

### JSPI Imports Configuration

Source: https://emscripten.org/docs/tools_reference/settings_reference_highlight=environment

Specify a list of imported module functions that may perform asynchronous work. These imported functions should return a Promise when performing asynchronous operations. Alternatively, functions can be marked with `<function_name>_async:: true` in JS library files.

```emcc
-JSPI_IMPORTS=[import1,import2,...]
```

---

### Emscripten Soft Fullscreen API

Source: https://emscripten.org/docs/api_reference/html5.h

APIs for entering and exiting a "soft" fullscreen mode, where an element is displayed in the client area without requesting actual browser fullscreen.

````APIDOC
## emscripten_enter_soft_fullscreen

### Description
Enters a "soft" fullscreen mode, displaying the target element in the whole client area and hiding other elements. This does not request actual browser fullscreen.

### Method
(Implicitly called by Emscripten runtime)

### Endpoint
N/A

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```javascript
// Example usage within Emscripten C/C++ code
// emscripten_enter_soft_fullscreen(targetElement);
````

### Response

#### Success Response (EMSCRIPTEN_RESULT)

- **Success**: Returns EMSCRIPTEN_RESULT_SUCCESS on success.
- **Failure**: Returns an appropriate EMSCRIPTEN_RESULT code on failure.

#### Response Example

```json
{
  "result": "EMSCRIPTEN_RESULT_SUCCESS"
}
```

## emscripten_exit_soft_fullscreen

### Description

Returns back to windowed browsing mode from a soft fullscreen mode. This function should not be used to exit actual browser fullscreen mode.

### Method

(Implicitly called by Emscripten runtime)

### Endpoint

N/A

### Parameters

#### Path Parameters

None

#### Query Parameters

None

#### Request Body

None

### Request Example

```javascript
// Example usage within Emscripten C/C++ code
// emscripten_exit_soft_fullscreen();
```

### Response

#### Success Response (EMSCRIPTEN_RESULT)

- **Success**: Returns EMSCRIPTEN_RESULT_SUCCESS on success.
- **Failure**: Returns an appropriate EMSCRIPTEN_RESULT code on failure.

#### Response Example

```json
{
  "result": "EMSCRIPTEN_RESULT_SUCCESS"
}
```

````

--------------------------------

### Embind Handling Overloaded C++ Functions

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Shows how to expose C++ functions or constructors that are overloaded on the number of arguments using the `select_overload` helper. Embind does not support overloading based on argument types directly. Each overload is exposed with a distinct name in JavaScript.

```c++
struct HasOverloadedMethods {
    void foo();
    void foo(int i);
    void foo(float f) const;
};

EMSCRIPTEN_BINDING(overloads) {
    class_<HasOverloadedMethods>("HasOverloadedMethods")
        .function("foo", select_overload<void()>(&HasOverloadedMethods::foo))
        .function("foo_int", select_overload<void(int)>(&HasOverloadedMethods::foo))
        .function("foo_float", select_overload<void(float)const>(&HasOverloadedMethods::foo))
        ;
````

---

### Enable Automatic Native Library Loading in Emscripten

Source: https://emscripten.org/docs/tools_reference/settings_reference

Similar to `AUTO_JS_LIBRARIES`, this option governs the automatic linking of native libraries like libgl, libal, and libhtml5. If disabled (0), these libraries must be explicitly linked (e.g., `-lhtml5`) and pre-built using `embuilder`.

```javascript
{
  "AUTO_NATIVE_LIBRARIES": 1
}
```

---

### Write Data to File Stream using FS.write

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Writes data from a buffer to a file stream. The write operation can be directed to a specific offset within the stream.

```javascript
FS.write(_stream_ , _buffer_ , _offset_ , _length_[, _position_])
```

```javascript
var data = new Uint8Array(32);
var stream = FS.open("dummy", "w+");
FS.write(stream, data, 0, data.length, 0);
FS.close(stream);
```

---

### Scan Wasm Registers (Locals) with Emscripten

Source: https://emscripten.org/docs/api_reference/emscripten.h

The `emscripten_scan_registers` function scans data stored in Wasm locals, including those in higher stack frames that have been spilled. This function relies on Asyncify to ensure local state is observable and may incur overhead. It's recommended to also use `emscripten_scan_stack` to ensure all necessary data is scanned, as LLVM optimizations might store locals on the stack at lower optimization levels.

```c
void emscripten_scan_registers(em_scan_func func)
```

---

### Utility Functions

Source: https://emscripten.org/docs/api_reference/emscripten.h

Provides Emscripten's high-precision time retrieval and random number generation functions.

````APIDOC
## emscripten_get_now

### Description
Returns the highest-precision representation of the current time that the browser provides, using either `Date.now` or `performance.now`. The result is not an absolute time and is only meaningful in comparison to other calls to this function.

### Method
`double`

### Endpoint
N/A (Function call)

### Parameters
None

### Request Example
```c
double currentTime = emscripten_get_now();
````

### Response

#### Success Response

- **return value** (double) - The current time, in milliseconds (ms).

#### Response Example

```
1678886400000.123
```

## emscripten_random

### Description

Generates a random number in the range 0-1. This maps to `Math.random()`.

### Method

`float`

### Endpoint

N/A (Function call)

### Parameters

None

### Request Example

```c
float randomValue = emscripten_random();
```

### Response

#### Success Response

- **return value** (float) - A random number between 0.0 and 1.0.

#### Response Example

```
0.456789
```

````

--------------------------------

### Execute JavaScript from C/C++ using emscripten_run_script()

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

The emscripten_run_script() function allows direct execution of JavaScript code from C/C++. It uses eval() internally, making it simple but potentially slower. This method is suitable for calling browser-specific functions like alert().

```c
#include <emscripten.h>

int main() {
  emscripten_run_script("alert('hi')");
  return 0;
}
````

---

### Running an HTML file with a specific browser using emrun

Source: https://emscripten.org/docs/compiling/Running-html-files-with-emrun

This command launches an HTML file using a specified browser alias. If the alias is not provided, emrun uses the system's default browser.

```shell
emrun --browser firefox_nightly page.html
```

---

### Enter and Exit Tracing Context

Source: https://emscripten.org/docs/api_reference/trace.h

Records the entry and exit of application contexts for more granular analysis. Contexts help categorize sections of code, aiding in profiling and memory usage tracking.

```c
emscripten_trace_enter_context("Physics Update");
...
emscripten_trace_exit_context();

```

---

### Analyze Path Information (JS)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Analyzes an incoming path in the Emscripten file system, providing detailed information about the path, its node, and its parent. It takes the path string and an optional boolean 'dontResolveLastLink' argument. The function returns an object containing properties like 'exists', 'error', 'path', 'node', etc.

```javascript
var analysis = FS.analyzePath("/a/file.txt");
```

```javascript
var analysisNoFollow = FS.analyzePath("/a/symlink", true);
```

---

### Emscripten Fiber Management Functions

Source: https://emscripten.org/genindex

Functions for initializing, creating, and managing Emscripten fibers.

````APIDOC
## Emscripten Fiber Management Functions

### Description
Functions for creating and managing fibers, which are lightweight execution contexts.

### Functions
*   **emscripten_fiber_init** (C function) - Initializes a fiber with a specific function and stack.
*   **emscripten_fiber_init_from_current_context** (C function) - Initializes a fiber from the current execution context.
*   **emscripten_fiber_swap** (C function) - Swaps execution between two fibers.

### Request Example
```c
// Initializing a fiber
void my_fiber_entry(EMSCRIPTEN_WEBIDL_USER_DATA_T user_data) { /* ... */ }
emscripten_fiber_t *my_fiber = malloc(sizeof(emscripten_fiber_t));
emscripten_fiber_init(my_fiber, my_fiber_entry, NULL, STACK_SIZE);
````

### Response

These functions typically return a pointer to the created fiber or an integer status code.

````

--------------------------------

### Compilation Settings for Module API

Source: https://emscripten.org/docs/api_reference/module

The `INCOMING_MODULE_JS_API` compiler setting allows you to specify which `Module` attributes are supported in the emitted JavaScript, helping to reduce code size.

```APIDOC
## Compilation Settings for Module API

### Description
The `-sINCOMING_MODULE_JS_API` compiler setting controls which `Module` attributes are included in the generated JavaScript. By default, a common set of attributes is supported. Specifying only the attributes your application actually uses can significantly reduce the size of the emitted JavaScript code.

### Usage

- **To include all default attributes:** (This is the default behavior if the setting is not used)
  ```bash
  emcc ...
````

- **To specify an empty API (no supported attributes):**

  ```bash
  emcc -sINCOMING_MODULE_JS_API=[] ...
  ```

- **To specify a custom list of supported attributes:**
  ```bash
  emcc -sINCOMING_MODULE_JS_API=print,printErr ...
  ```

### Example

If your application only uses `Module.print` and `Module.printErr`, you can compile it with:

```bash
emcc your_code.c -o your_app.js -sINCOMING_MODULE_JS_API=print,printErr
```

````

--------------------------------

### Advanced File System API

Source: https://emscripten.org/docs/api_reference/advanced-apis

This section covers advanced File System API functions in Emscripten, useful for specific scenarios such as creating custom file systems or ensuring compatibility with older versions.

```APIDOC
## File System API Functions

### Description
Provides advanced functions for file system manipulation in Emscripten, intended for specialized use cases.

### Method
(Various - These are JavaScript API calls within the Emscripten environment, not traditional HTTP methods)

### Endpoints
(N/A - These are JavaScript functions)

### Functions

- **FS.hashName** (_parentid_, _name_)
  - Description: Hashes a file name.
- **FS.hashAddNode** (_node_)
  - Description: Adds a node to the hash table.
- **FS.hashRemoveNode** (_node_)
  - Description: Removes a node from the hash table.
- **FS.lookupNode** (_parent_, _name_)
  - Description: Looks up a node by parent and name.
- **FS.createNode** (_parent_, _name_, _mode_, _rdev_)
  - Description: Creates a new file system node.
- **FS.destroyNode** (_node_)
  - Description: Destroys a file system node.
- **FS.isRoot** (_node_)
  - Description: Checks if a node is the root.
- **FS.isMountpoint** (_node_)
  - Description: Checks if a node is a mount point.
- **FS.isFIFO** (_node_)
  - Description: Checks if a node is a FIFO.
- **FS.nextfd** ()
  - Description: Gets the next available file descriptor.
- **FS.getStream** (_fd_)
  - Description: Retrieves a stream associated with a file descriptor.
- **FS.createStream** (_stream_, _fd_)
  - Description: Creates a stream for a file descriptor.
- **FS.closeStream** (_fd_)
  - Description: Closes the stream associated with a file descriptor.
- **FS.getStreamFromPtr** (_ptr_)
  - Description: Gets a stream from its pointer representation.
- **FS.getPtrForStream** (_stream_)
  - Description: Gets the pointer representation for a stream.
- **FS.major** (_dev_)
  - Description: Extracts the major device number.
- **FS.minor** (_dev_)
  - Description: Extracts the minor device number.
- **FS.getDevice** (_dev_)
  - Description: Gets the device associated with a device number.
- **FS.getMounts** (_mount_)
  - Description: Retrieves mount information.
- **FS.lookup** (_parent_, _name_)
  - Description: Looks up a path in the file system.
- **FS.mknod** (_path_, _mode_, _dev_)
  - Description: Creates a node by path, mode, and device.
- **FS.create** (_path_, _mode_)
  - Description: Creates a file at a given path with a mode.
- **FS.mmap** (_stream_, _buffer_, _offset_, _length_, _position_, _prot_, _flags_)
  - Description: Memory maps a stream.
- **FS.ioctl** (_stream_, _cmd_, _arg_)
  - Description: Performs an IOCTL operation on a stream.
- **FS.staticInit** ()
  - Description: Initializes the static file system.
- **FS.quit** ()
  - Description: Shuts down the file system.
- **FS.indexedDB** ()
  - Description: Initializes IndexedDB support.
- **FS.DB_NAME** ()
  - Description: Gets the default IndexedDB database name.
- **FS.getMode** (_canRead_, _canWrite_)
  - Description: Determines the file mode based on read/write permissions.
- **FS.findObject** (_path_, _dontResolveLastLink_)
  - Description: Finds an object in the file system by path.
- **FS.createPath** (_parent_, _path_, _canRead_, _canWrite_)
  - Description: Creates a directory path.
- **FS.createFile** (_parent_, _name_, _properties_, _canRead_, _canWrite_)
  - Description: Creates a file with specified properties.
- **FS.createDataFile** (_parent_, _name_, _data_, _canRead_, _canWrite_, _canOwn_)
  - Description: Creates a file with initial data.
- **FS.createDevice** (_parent_, _name_, _input_, _output_)
  - Description: Creates a device node.
- **FS.forceLoadFile** (_obj_)
  - Description: Forces loading of a file object.

### Legacy v1 compatibility flags:

- `rs`
- `xw`
- `xw+`
- `xa`
- `xa+`
````

---

### SSE4.2 Intrinsics

Source: https://emscripten.org/docs/porting/simd

This section details the support for SSE4.2 intrinsics in Emscripten, indicating whether they are directly supported by WebAssembly SIMD, emulated, or not supported.

```APIDOC
## SSE4.2 Intrinsics Availability

This table highlights the availability and expected performance of different SSE4.2 intrinsics. Refer to Intel Intrinsics Guide on SSE4.2.

x86 SSE4.2 intrinsics available via #include <nmmintrin.h> and -msse4.2

| Intrinsic name        | WebAssembly SIMD support |
|-----------------------|--------------------------|
| _mm_blendv_ps         | ⚠️ emulated with a SIMD shr+and+andnot+or |
| _mm_ceil_pd           | ✅ wasm_f64x2_ceil |
| _mm_ceil_ps           | ✅ wasm_f32x4_ceil |
| _mm_ceil_sd           | ⚠️ emulated with a shuffle |
| _mm_ceil_ss           | ⚠️ emulated with a shuffle |
| _mm_cmpeq_epi64       | ⚠️ emulated with a SIMD cmp+and+shuffle |
| _mm_cvtepi16_epi32    | ✅ wasm_i32x4_widen_low_i16x8 |
| _mm_cvtepi16_epi64    | ⚠️ emulated with a SIMD widen+const+cmp+shuffle |
| _mm_cvtepi32_epi64    | ⚠️ emulated with SIMD const+cmp+shuffle |
| _mm_cvtepi8_epi16     | ✅ wasm_i16x8_widen_low_i8x16 |
| _mm_cvtepi8_epi32     | ⚠️ emulated with two SIMD widens |
| _mm_cvtepi8_epi64     | ⚠️ emulated with two SIMD widens+const+cmp+shuffle |
| _mm_cvtepu16_epi32    | ✅ wasm_u32x4_extend_low_u16x8 |
| _mm_cvtepu16_epi64    | ⚠️ emulated with SIMD const+two shuffles |
| _mm_cvtepu32_epi64    | ⚠️ emulated with SIMD const+shuffle |
| _mm_cvtepu8_epi16     | ✅ wasm_u16x8_extend_low_u8x16 |
| _mm_cvtepu8_epi32     | ⚠️ emulated with two SIMD widens |
| _mm_cvtepu8_epi64     | ⚠️ emulated with SIMD const+three shuffles |
| _mm_dp_pd             | ⚠️ emulated with SIMD mul+add+setzero+2xblend |
| _mm_dp_ps             | ⚠️ emulated with SIMD mul+add+setzero+2xblend |
| _mm_extract_epi32     | ✅ wasm_i32x4_extract_lane |
| _mm_extract_epi64     | ✅ wasm_i64x2_extract_lane |
| _mm_extract_epi8      | ✅ wasm_u8x16_extract_lane |
| _mm_extract_ps        | ✅ wasm_i32x4_extract_lane |
| _mm_floor_pd          | ✅ wasm_f64x2_floor |
| _mm_floor_ps          | ✅ wasm_f32x4_floor |
| _mm_floor_sd          | ⚠️ emulated with a shuffle |
| _mm_floor_ss          | ⚠️ emulated with a shuffle |
| _mm_insert_epi32      | ✅ wasm_i32x4_replace_lane |
| _mm_insert_epi64      | ✅ wasm_i64x2_replace_lane |
| _mm_insert_epi8       | ✅ wasm_i8x16_replace_lane |
| _mm_insert_ps         | ⚠️ emulated with generic non-SIMD-mapping shuffles |
| _mm_max_epi32         | ✅ wasm_i32x4_max |
| _mm_max_epi8          | ✅ wasm_i8x16_max |
| _mm_max_epu16         | ✅ wasm_u16x8_max |
| _mm_max_epu32         | ✅ wasm_u32x4_max |
| _mm_min_epi32         | ✅ wasm_i32x4_min |
| _mm_min_epi8          | ✅ wasm_i8x16_min |
| _mm_min_epu16         | ✅ wasm_u16x8_min |
| _mm_min_epu32         | ✅ wasm_u32x4_min |
| _mm_minpos_epu16      | 💣 scalarized |
| _mm_mpsadbw_epu8      | 💣 scalarized |
| _mm_mul_epi32         | ⚠️ emulated with wasm_i64x2_extmul_low_i32x4 + 2 shuffles |
| _mm_mullo_epi32       | ✅ wasm_i32x4_mul |
| _mm_packus_epi32      | ✅ wasm_u16x8_narrow_i32x4 |
| _mm_round_pd          | ✅ wasm_f64x2_ceil, wasm_f64x2_floor, wasm_f64x2_nearest, wasm_f64x2_trunc |
| _mm_round_ps          | ✅ wasm_f32x4_ceil, wasm_f32x4_floor, wasm_f32x4_nearest, wasm_f32x4_trunc |
| _mm_round_sd          | ⚠️ emulated with a shuffle |
| _mm_round_ss          | ⚠️ emulated with a shuffle |
| _mm_stream_load_si128 | 🟡 wasm_v128_load. VM must guess type. Unaligned load on x86 CPUs. |
| _mm_test_all_ones     | ❌ scalarized |
| _mm_test_all_zeros    | ❌ scalarized |
| _mm_test_mix_ones_zeros| ❌ scalarized |
| _mm_testc_si128       | ❌ scalarized |
| _mm_testnzc_si128     | ❌ scalarized |
| _mm_testz_si128       | ❌ scalarized |
| _mm_cmpgt_epi64       | ✅ wasm_i64x2_gt |

**Unsupported SSE4.2 Intrinsics**: The SSE4.2 functions that deal with string comparisons and CRC calculations are not available:

* _mm_cmpestra, _mm_cmpestrc, _mm_cmpestri, _mm_cmpestrm, _mm_cmpestro, _mm_cmpestrs, _mm_cmpestrz, _mm_cmpistra, _mm_cmpistrc, _mm_cmpistri, _mm_cmpistrm, _mm_cmpistro, _mm_cmpistrs, _mm_cmpistrz, _mm_crc32_u16, _mm_crc32_u32, _mm_crc32_u64, _mm_crc32_u8

Any code referencing these intrinsics will not compile.
```

---

### Emscripten IndexedDB Functions

Source: https://emscripten.org/genindex

Functions for interacting with the browser's IndexedDB for asynchronous and synchronous data storage.

````APIDOC
## Emscripten IndexedDB Functions

### Description
Provides functions to interact with the IndexedDB API for client-side data storage, with both asynchronous and synchronous interfaces.

### Functions (Asynchronous)
*   **emscripten_idb_async_clear** (C function) - Asynchronously clears all records from an object store.
*   **emscripten_idb_async_delete** (C function) - Asynchronously deletes a record from an object store.
*   **emscripten_idb_async_exists** (C function) - Asynchronously checks if a record exists in an object store.
*   **emscripten_idb_async_load** (C function) - Asynchronously loads a record from an object store.
*   **emscripten_idb_async_store** (C function) - Asynchronously stores a record in an object store.

### Functions (Synchronous)
*   **emscripten_idb_clear** (C function) - Synchronously clears all records from an object store.
*   **emscripten_idb_delete** (C function) - Synchronously deletes a record from an object store.
*   **emscripten_idb_exists** (C function) - Synchronously checks if a record exists in an object store.
*   **emscripten_idb_load** (C function) - Synchronously loads a record from an object store.
*   **emscripten_idb_store** (C function) - Synchronously stores a record in an object store.

### Request Example
```c
// Asynchronously storing data
EMSCRIPTEN_RESULT result = emscripten_idb_async_store("my_db", "my_store", "my_key", "my_value", strlen("my_value"));
````

### Response

These functions return an `EMSCRIPTEN_RESULT` value indicating success or failure.

````

--------------------------------

### Generating TypeScript Definitions with Embind

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

This command demonstrates how to use emcc with the --emit-tsd option to generate TypeScript definition files (.d.ts) from Embind's EMSCRIPTEN_BINDINGS blocks. This helps in integrating C++ code with TypeScript projects.

```bash
emcc -lembind quick_example.cpp --emit-tsd interface.d.ts
````

---

### Emscripten Trace Enter Context

Source: https://emscripten.org/docs/api_reference/trace.h

Enters a new tracing context, marked by a name. The current timestamp is associated with this event.

````APIDOC
## emscripten_trace_enter_context

### Description
The current timestamp is associated with this data.

### Method
void

### Endpoint
N/A (Function Call)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```c
emscripten_trace_enter_context("MyNewContext");
````

### Response

#### Success Response (200)

N/A (void return type)

#### Response Example

N/A

````

--------------------------------

### UI Event Callbacks (Resize and Scroll)

Source: https://emscripten.org/docs/api_reference/html5.h

Registers callback functions for receiving DOM element resize and scroll events.

```APIDOC
## POST /emscripten/set_ui_callback

### Description
Registers a callback function for receiving DOM element resize and scroll events. For resize events, target `EMSCRIPTEN_EVENT_TARGET_WINDOW` can be used to listen to Window object resize events.

### Method
POST

### Endpoint
/emscripten/set_ui_callback

### Parameters
#### Request Body
- **target** (string) - Required - Target HTML element id or `EMSCRIPTEN_EVENT_TARGET_WINDOW` for window resize.
- **userData** (object) - Optional - User-defined data to be passed to the callback.
- **useCapture** (boolean) - Optional - Set to true to use capture.
- **callback** (function) - Required - A callback function to handle UI events. It receives event type, UI event details, and userData, and should return true if the event is consumed.

### Request Example
```json
{
  "target": "EMSCRIPTEN_EVENT_TARGET_WINDOW",
  "userData": { "appState": "ready" },
  "useCapture": false,
  "callback": "function(eventType, uiEvent, userData) { console.log('UI Event:', eventType, uiEvent, userData); return false; }"
}
````

### Response

#### Success Response (200)

- **result** (string) - Indicates success or failure, e.g., "EMSCRIPTEN_RESULT_SUCCESS".

#### Response Example

```json
{
  "result": "EMSCRIPTEN_RESULT_SUCCESS"
}
```

### UI Event Types

- **EMSCRIPTEN_EVENT_RESIZE**: For resize events.
- **EMSCRIPTEN_EVENT_SCROLL**: For scroll events.

### EmscriptenUiEvent Structure

- **detail** (integer) - Always zero for resize and scroll events.
- **documentBodyClientWidth** (integer) - The clientWidth of the `document.body` element.
- **documentBodyClientHeight** (integer) - The clientHeight of the `document.body` element.
- **windowInnerWidth** (integer) - The innerWidth of the browser window.
- **windowInnerHeight** (integer) - The innerHeight of the browser window.
- **windowOuterWidth** (integer) - The outerWidth of the browser window.
- **windowOuterHeight** (integer) - The outerHeight of the browser window.
- **scrollTop** (integer) - The page scroll position (rounded down).
- **scrollLeft** (integer) - The page scroll position (rounded down).

````

--------------------------------

### Configure Pthread Pool Size

Source: https://emscripten.org/docs/porting/pthreads

Optionally, use the linker flag `-sPTHREAD_POOL_SIZE=<expression>` to pre-allocate a pool of web workers. The `<expression>` can be a fixed number or dynamic, such as `navigator.hardwareConcurrency` to match the number of CPU cores. This helps ensure workers are available before application `main()` is called.

```bash
emcc ... -sPTHREAD_POOL_SIZE=8 ... -o output.js
emcc ... -sPTHREAD_POOL_SIZE=navigator.hardwareConcurrency ... -o output.js
````

---

### Emscripten IndexedDB API

Source: https://emscripten.org/docs/api_reference/emscripten.h

Functions for synchronously interacting with IndexedDB for data storage and retrieval.

````APIDOC
## emscripten_idb_load

### Description
Synchronously loads data from IndexedDB into a memory buffer allocated by the function. The caller must free the buffer to prevent memory leaks.

### Method
`void`

### Parameters
#### Path Parameters
- **db_name** (const char*) - The name of the IndexedDB database.
- **file_id** (const char*) - The identifier for the data to load within the database.
- **pbuffer** (void**) - An output parameter that will point to the allocated buffer containing the downloaded data. This buffer must be freed by the caller.
- **pnum** (int*) - An output parameter that will be filled with the size of the downloaded data in bytes.
- **perror** (int*) - An output parameter that will be set to a non-zero value if an error occurred.

### Request Example
```c
void *data_buffer;
int data_size;
int error_code;
emscripten_idb_load("myDatabase", "dataFile", &data_buffer, &data_size, &error_code);
if (error_code == 0 && data_buffer != NULL) {
    // Use the loaded data from data_buffer
    // ...
    free(data_buffer); // Free the allocated buffer
} else {
    // Handle error
}
````

### Response

#### Success Response

Data is populated into `pbuffer` and `pnum` if successful. `perror` will be 0.

#### Error Response

`perror` will be non-zero. `pbuffer` and `pnum` might be in an undefined state.

## emscripten_idb_store

### Description

Synchronously stores data from a memory buffer into IndexedDB.

### Method

`void`

### Parameters

#### Path Parameters

- **db_name** (const char\*) - The name of the IndexedDB database to store to.
- **file_id** (const char\*) - The identifier for the data to store within the database.
- **buffer** (void\*) - A pointer to the data buffer to store.
- **num** (int) - The number of bytes to store from the buffer.
- **perror** (int\*) - An output parameter that will be set to a non-zero value if an error occurred.

### Request Example

```c
char my_data[] = "Hello IndexedDB!";
int error_code;
emscripten_idb_store("myDatabase", "greeting", my_data, sizeof(my_data), &error_code);
if (error_code != 0) {
    // Handle error
}
```

### Response

#### Success Response

Data is successfully stored. `perror` will be 0.

#### Error Response

`perror` will be non-zero.

## emscripten_idb_delete

### Description

Synchronously deletes data from IndexedDB.

### Method

`void`

### Parameters

#### Path Parameters

- **db_name** (const char\*) - The name of the IndexedDB database to delete from.
- **file_id** (const char\*) - The identifier for the data to delete within the database.
- **perror** (int\*) - An output parameter that will be set to a non-zero value if an error occurred.

### Request Example

```c
int error_code;
emscripten_idb_delete("myDatabase", "oldData", &error_code);
if (error_code != 0) {
    // Handle error
}
```

### Response

#### Success Response

Data is successfully deleted. `perror` will be 0.

#### Error Response

`perror` will be non-zero.

## emscripten_idb_exists

### Description

Synchronously checks if a specific data entry exists in IndexedDB.

### Method

`void`

### Parameters

#### Path Parameters

- **db_name** (const char\*) - The name of the IndexedDB database to check in.
- **file_id** (const char\*) - The identifier for the data to check for.
- **pexists** (int\*) - An output parameter that will be set to a non-zero value if the data exists, or 0 if it does not.
- **perror** (int\*) - An output parameter that will be set to a non-zero value if an error occurred.

### Request Example

```c
int exists_flag;
int error_code;
emscripten_idb_exists("myDatabase", "someKey", &exists_flag, &error_code);
if (error_code == 0) {
    if (exists_flag != 0) {
        // Data exists
    } else {
        // Data does not exist
    }
} else {
    // Handle error
}
```

### Response

#### Success Response

`pexists` is populated with 1 if the item exists, 0 otherwise. `perror` will be 0.

#### Error Response

`perror` will be non-zero. `pexists` might be in an undefined state.

## emscripten_idb_clear

### Description

Synchronously clears all data from a specified IndexedDB database.

### Method

`void`

### Parameters

#### Path Parameters

- **db_name** (const char\*) - The name of the IndexedDB database to clear.
- **perror** (int\*) - An output parameter that will be set to a non-zero value if an error occurred.

### Request Example

```c
int error_code;
emscripten_idb_clear("myDatabase", &error_code);
if (error_code != 0) {
    // Handle error
}
```

### Response

#### Success Response

All data in the specified database is cleared. `perror` will be 0.

#### Error Response

`perror` will be non-zero.

````

--------------------------------

### Visibility Change Event Constants

Source: https://emscripten.org/docs/api_reference/html5.h

Defines constants related to the visibility change event and different visibility states.

```APIDOC
## Defines

### EMSCRIPTEN_EVENT_VISIBILITYCHANGE
Constant representing the visibilitychange event.

### EMSCRIPTEN_VISIBILITY_HIDDEN
Constant indicating the document is hidden (not visible).

### EMSCRIPTEN_VISIBILITY_VISIBLE
Constant indicating the document is at least partially visible.

### EMSCRIPTEN_VISIBILITY_PRERENDER
Constant indicating the document is loaded off screen and not visible (prerender).

### EMSCRIPTEN_VISIBILITY_UNLOADED
Constant indicating the document is to be unloaded.
````

---

### Expose Raw Memory Buffers as Typed Arrays (Emscripten)

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Shows how to expose raw binary data from the Emscripten heap to JavaScript as a typed array using `typed_memory_view`. This avoids data copying and is useful for large data transfers like WebGL textures. It requires `emscripten/bind.h` and `emscripten/val.h`. Note that memory lifetime is not managed.

```c++
#include <emscripten/bind.h>
#include <emscripten/val.h>

using namespace emscripten;

unsigned char *byteBuffer = /* ... */;
size_t bufferLength = /* ... */;

val getBytes() {
    return val(typed_memory_view(bufferLength, byteBuffer));
}

EMSCRIPTEN_BINDINGS(memory_view_example) {
    function("getBytes", &getBytes);
}
```

---

### FS.unmount

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Unmounts the file system from the specified mount point.

```APIDOC
## FS.unmount

### Description
Unmounts the specified `mountpoint`.

### Method
FS.unmount

### Parameters
#### Path Parameters
- **mountpoint** (string) - Required - The directory to unmount.

### Response
This function does not return a value.
```

---

### C++ Embind: Register Smart Pointer Type with .smart_ptr()

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Shows an alternative method to register smart pointer types using the `.smart_ptr<T>()` method. This approach facilitates functions returning or accepting smart pointers, though direct instantiation in JavaScript might still yield raw pointers depending on the constructor used.

```cpp
EMSCRIPTEN_BINDINGS(smart_pointers) {
    class_<C>("C")
        .constructor<>()
        .smart_ptr<std::shared_ptr<C>>("C")
        ;
}
```

---

### Memory and Array Operations

Source: https://emscripten.org/docs/api_reference/preamble.js

Functions for writing arrays to memory and managing runtime dependencies.

```APIDOC
## Memory and Array Operations

This section covers functions related to writing data to Emscripten's memory heap and managing runtime dependencies.

### `writeArrayToMemory(_array_, _buffer_)`

Writes an array to a specified address in the heap. Note that memory should be allocated for the array before it is written.

*   **array**: The array to write to memory.
*   **buffer** (`Number()`): The address (number) where `array` is to be written.

### Run Dependencies

Note that generally run dependencies are managed by the file packager and other parts of the system. It is rare for developers to use this API directly.

#### `addRunDependency(_id_)`

Adds an `id` to the list of run dependencies. This adds a run dependency and increments the run dependency counter.

*   **id** (`String()`): An arbitrary id representing the operation.

#### `removeRunDependency(_id_)`

Removes a specified `id` from the list of run dependencies.

*   **id** (`String()`): The identifier for the specific dependency to be removed (added with `addRunDependency()`)
```

---

### UTF8ToString

Source: https://emscripten.org/docs/api_reference/preamble.js

Converts a null-terminated UTF8-encoded string from the Emscripten HEAP to a JavaScript String.

````APIDOC
## UTF8ToString

### Description
Converts a null-terminated UTF8-encoded string from the Emscripten HEAP to a JavaScript String.

### Method
N/A (JavaScript function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
// Assuming 'ptr' is a valid pointer to a UTF8 string in Emscripten HEAP
const jsString = UTF8ToString(ptr);
````

### Response

#### Success Response

- **string** (String) - A JavaScript String object representing the decoded UTF8 string.

#### Response Example

```javascript
"Hello, Emscripten!";
```

````

--------------------------------

### Mouse Wheel Event Callback

Source: https://emscripten.org/docs/api_reference/html5.h

Registers a callback function to receive browser-generated mousewheel events.

```APIDOC
## POST /emscripten/set_wheel_callback

### Description
Registers a callback function for receiving browser-generated mousewheel events.

### Method
POST

### Endpoint
/emscripten/set_wheel_callback

### Parameters
#### Request Body
- **target** (string) - Required - Target HTML element id.
- **userData** (object) - Optional - User-defined data to be passed to the callback.
- **useCapture** (boolean) - Optional - Set to true to use capture.
- **callback** (function) - Required - A callback function to handle mousewheel events. It receives event type, event information, and userData, and should return true if the event is consumed.

### Request Example
```json
{
  "target": "#myCanvas",
  "userData": { "custom": "data" },
  "useCapture": false,
  "callback": "function(eventType, eventInfo, userData) { console.log(eventType, eventInfo, userData); return true; }"
}
````

### Response

#### Success Response (200)

- **result** (string) - Indicates success or failure, e.g., "EMSCRIPTEN_RESULT_SUCCESS".

#### Response Example

```json
{
  "result": "EMSCRIPTEN_RESULT_SUCCESS"
}
```

````

--------------------------------

### Registering HTML5 Event Callbacks in C++ (Emscripten)

Source: https://emscripten.org/docs/api_reference/html5.h

This C++ code snippet demonstrates the typical format for registering event listeners with HTML5 events using Emscripten. It shows how to specify the target element, pass user data, control capture phase, and provide a callback function. The function returns an `EMSCRIPTEN_RESULT` to indicate success or failure.

```cpp
EMSCRIPTEN_RESULT emscripten_set_some_callback(
  const char *target,   // ID of the target HTML element.
  void *userData,   // User-defined data to be passed to the callback.
  bool useCapture,   // Whether or not to use capture.
  em_someevent_callback_func callback   // Callback function.
);

````

---

### Emscripten Vibration Functions

Source: https://emscripten.org/genindex

Functions for triggering device vibration.

```APIDOC
## Emscripten Vibration API

### Description
Functions to control device vibration feedback.

### Functions
- **emscripten_vibrate**: Triggers vibration for a specified duration.
- **emscripten_vibrate_pattern**: Triggers vibration using a pattern of durations.
```

---

### Read Directory Contents (JS)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Reads the contents of a specified directory in the Emscripten file system. It takes a string argument for the directory path and returns an array of strings, including '.' and '..', representing the files and subdirectories within the given path.

```javascript
FS.readdir("/path/to/directory");
```

---

### Select Overload for C++ Functions - Embind

Source: https://emscripten.org/docs/api_reference/bind.h

Utilities for selecting specific overloads of C++ functions or methods, particularly useful when dealing with overloaded functions or member functions. `select_overload` helps in disambiguating function calls, while `select_const` targets constant member functions.

```cpp
// Prototype for select_overload
template<typename Signature>
type
```

```cpp
// Prototype for select_const
template<typename ClassType, typename ReturnType, typename... Args>
auto select_const(ReturnType (ClassType::*method)(Args...) const)
```

---

### Increasing Node.js Stack Size for Emscripten Optimization

Source: https://emscripten.org/docs/getting_started/FAQ

Provides instructions for increasing the Node.js stack size to prevent 'Maximum call stack size exceeded' errors during Emscripten optimization. This can be configured in the Emscripten Compiler Configuration File (.emscripten) for Linux/macOS, and may require additional steps on Windows.

```ini
# .emscripten configuration file
NODE_JS = ['/path/to/node', '--stack_size=8192']
```

---

### Fetch API - Persisting Data Bytes from Memory to IndexedDB

Source: https://emscripten.org/docs/api_reference/fetch

Allows persisting a range of bytes from application memory directly to IndexedDB without performing XHR requests.

````APIDOC
## POST EM_IDB_STORE /emscripten/fetch

### Description
Stores a block of data from application memory into the browser's IndexedDB under a specified filename. This bypasses network requests.

### Method
POST (using the special verb "EM_IDB_STORE")

### Endpoint
`/` (target filename in IndexedDB)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
- **requestData** (uint8_t*) - Pointer to the data buffer to store.
- **requestDataSize** (size_t) - The size of the data buffer in bytes.

### Request Example
```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <emscripten/fetch.h>
#include <string.h>

void success(emscripten_fetch_t *fetch) {
  printf("IDB store succeeded.\n");
  emscripten_fetch_close(fetch);
}

void failure(emscripten_fetch_t *fetch) {
  printf("IDB store failed.\n");
  emscripten_fetch_close(fetch);
}

void persistFileToIndexedDB(const char *outputFilename, uint8_t *data, size_t numBytes) {
  emscripten_fetch_attr_t attr;
  emscripten_fetch_attr_init(&attr);
  strcpy(attr.requestMethod, "EM_IDB_STORE");
  attr.attributes = EMSCRIPTEN_FETCH_REPLACE | EMSCRIPTEN_FETCH_PERSIST_FILE;
  attr.requestData = (char *)data;
  attr.requestDataSize = numBytes;
  attr.onsuccess = success;
  attr.onerror = failure;
  emscripten_fetch(&attr, outputFilename);
}

int main() {
  // Create data
  uint8_t *data = (uint8_t*)malloc(10240);
  srand(time(NULL));
  for(int i = 0; i < 10240; ++i) data[i] = (uint8_t)rand();

  persistFileToIndexedDB("outputfile.dat", data, 10240);

  free(data);
  return 0;
}
````

### Response

#### Success Response (200)

Data successfully stored in IndexedDB.

#### Response Example

(Callback `success` is invoked)

````

--------------------------------

### Emscripten Information Retrieval Functions

Source: https://emscripten.org/genindex

Functions to retrieve various status and configuration information from the Emscripten environment.

```APIDOC
## Emscripten Information Retrieval Functions

### Description
These functions provide access to system status, device information, and Emscripten configuration settings.

### Functions
*   **emscripten_get_battery_status** (C function) - Retrieves battery status information.
*   **emscripten_get_callstack** (C function) - Gets the current call stack information.
*   **emscripten_get_canvas_element_size** (C function) - Retrieves the dimensions of the canvas element.
*   **emscripten_get_compiler_setting** (C function) - Retrieves a specific Emscripten compiler setting.
*   **emscripten_get_device_pixel_ratio** (C function) - Gets the device's pixel ratio.
*   **emscripten_get_devicemotion_status** (C function) - Retrieves device motion sensor data.
*   **emscripten_get_deviceorientation_status** (C function) - Retrieves device orientation sensor data.
*   **emscripten_get_element_css_size** (C function) - Gets the CSS size of an HTML element.
*   **emscripten_get_fullscreen_status** (C function) - Retrieves the current fullscreen status.
*   **emscripten_get_gamepad_status** (C function) - Retrieves the status of connected gamepads.
*   **emscripten_get_main_loop_timing** (C function) - Gets the timing information for the main Emscripten loop.
*   **emscripten_get_mouse_status** (C function) - Retrieves the current mouse cursor position and state.
*   **emscripten_get_now** (C function) - Returns the current high-resolution time in milliseconds.
*   **emscripten_get_num_gamepads** (C function) - Gets the number of connected gamepads.
*   **emscripten_get_orientation_status** (C function) - Retrieves the current device orientation status.
*   **emscripten_get_pointerlock_status** (C function) - Retrieves the current pointer lock status.
*   **emscripten_get_preloaded_image_data** (C function) - Retrieves data for a preloaded image.
*   **emscripten_get_preloaded_image_data_from_FILE** (C function) - Retrieves image data from a file.
*   **emscripten_get_screen_size** (C function) - Gets the dimensions of the browser screen.
*   **emscripten_get_visibility_status** (C function) - Retrieves the visibility state of the page.
*   **emscripten_get_window_title** (C function) - Gets the current title of the browser window.
*   **emscripten_get_worker_queue_size** (C function) - Gets the size of the worker queue.

### Request Example
```c
// Getting the current time
double now = emscripten_get_now();
````

### Response

These functions return various data types such as integers, doubles, structs, or booleans, depending on the information retrieved.

````

--------------------------------

### Report Memory Layout and Off-Heap Data

Source: https://emscripten.org/docs/api_reference/trace.h

Reports the overall heap layout and any off-heap data to the tracing API. These calls provide a snapshot of memory usage at specific points in time.

```c
emscripten_trace_report_memory_layout();
emscripten_trace_report_off_heap_data();

````

---

### Scan C Userspace Stack with Emscripten

Source: https://emscripten.org/docs/api_reference/emscripten.h

The `emscripten_scan_stack` function allows scanning the C userspace stack, which is managed by the compiled code. It provides a way to locate data within the linear memory of the stack. This function takes a callback function (`em_scan_func`) as an argument to process the scanned stack data.

```c
void emscripten_scan_stack(em_scan_func func)
```

---

### Emscripten Wrapper Constructor Prototype

Source: https://emscripten.org/docs/api_reference/bind.h

The constructor for the `wrapper` class. It takes a rvalue reference to the wrapped value and forward-references any additional arguments to the base class `T`. The `wrapped` member is initialized with the provided value.

```cpp
template<typename... Args>
explicit wrapper(val&& wrapped, Args&&... args)
  : T(std::forward<Args>(args)...)
  , wrapped(std::forward<val>(wrapped))
```

---

### JavaScript: Using `ccall` with Asyncify

Source: https://emscripten.org/docs/porting/asyncify

Demonstrates how to use `Module.ccall` with the `async: true` option to call an Asyncify-enabled Wasm export. This ensures that `ccall` returns a Promise that resolves with the function's result.

```javascript
Module.ccall("func", "number", [], [], { async: true }).then((result) => {
  console.log("js_func: " + result);
});
```

---

### Print Double to String Precisely

Source: https://emscripten.org/docs/api_reference/emscripten.h

Converts a double-precision floating-point number into a string representation that preserves all its information for reversible parsing. It writes to a provided buffer and includes a null terminator. If the buffer is NULL, it can be used to determine the required size.

```c
double value = 3.141592653589793;
char buffer[64];
int written = emscripten_print_double(value, buffer, sizeof(buffer));
if (written > 0) {
    printf("Double as string: %s\n", buffer);
}
```

---

### Emscripten File Type Checks

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Provides functions to check the type of a file system entry in Emscripten.

````APIDOC
## File Type Checks

### Description
Emscripten's `FS` object provides several utility functions to determine the type of a given file system entry.

### Functions

- **`FS.isFile(mode)`**: Checks if the given mode represents a regular file.
- **`FS.isDir(mode)`**: Checks if the given mode represents a directory.
- **`FS.isLink(mode)`**: Checks if the given mode represents a symbolic link.
- **`FS.isChrdev(mode)`**: Checks if the given mode represents a character device.
- **`FS.isBlkdev(mode)`**: Checks if the given mode represents a block device.
- **`FS.isSocket(mode)`**: Checks if the given mode represents a socket.

### Usage
These functions typically take the `mode` field from the result of `FS.stat()` or `FS.lstat()`.

```javascript
const stats = FS.stat('/path/to/file');
if (FS.isFile(stats.mode)) {
  console.log('/path/to/file is a file.');
}
````

````

--------------------------------

### UTF16ToString

Source: https://emscripten.org/docs/api_reference/preamble.js

Converts a null-terminated UTF16LE-encoded string from the Emscripten HEAP to a JavaScript String.

```APIDOC
## UTF16ToString

### Description
Converts a null-terminated UTF16LE-encoded string from the Emscripten HEAP to a JavaScript String.

### Method
N/A (JavaScript function)

### Endpoint
N/A

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A

### Request Example
```javascript
// Assuming 'ptr' is a valid pointer to a UTF16LE string in Emscripten HEAP
const jsString = UTF16ToString(ptr);
````

### Response

#### Success Response

- **string** (String) - A JavaScript String object representing the decoded UTF16LE string.

#### Response Example

```javascript
"Hello, Emscripten!";
```

````

--------------------------------

### Reference Counting for Shared C++ Objects

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Illustrates how to manage shared C++ objects between multiple JavaScript contexts using Embind's reference counting mechanism. The `clone()` method creates a new handle, increasing the reference count, and `delete()` decrements it. The object is destroyed only when all handles are deleted.

```javascript
async function myLongRunningProcess(x, milliseconds) {
    // sleep for the specified number of milliseconds
    await new Promise(resolve => setTimeout(resolve, milliseconds));
    x.method();
    x.delete();
}

const y = new Module.MyClass;          // refCount = 1
myLongRunningProcess(y.clone(), 5000); // refCount = 2
myLongRunningProcess(y.clone(), 3000); // refCount = 3
y.delete();                            // refCount = 2

// (after 3000ms) refCount = 1
// (after 5000ms) refCount = 0 -> object is deleted

````

---

### Log to console.warn() with emscripten_console_warn

Source: https://emscripten.org/docs/api_reference/console.h

Prints a UTF-8 encoded string to the JavaScript console using `console.warn()`. This is suitable for non-critical issues that should be noted.

```c
void emscripten_console_warn(const char *utf8String);
```

---

### Creating the Module Object

Source: https://emscripten.org/docs/api_reference/module

You can define or extend the `Module` object using Emscripten's pre-JS option. The method for defining `Module` differs slightly depending on whether you are generating only JavaScript or HTML.

````APIDOC
## Creating the Module Object

### Description
The `Module` object can be defined or extended using Emscripten's `--pre-js` option. The approach differs based on whether you are generating plain JavaScript or an HTML file.

### Defining Module for JavaScript-only Output
When generating only JavaScript, no `Module` object is created by default. You must explicitly define it in your pre-JS file.

### Request Example (JavaScript-only)
```javascript
var Module = {
  'print': function(text) { alert('stdout: ' + text) },
  'printErr': function(text) { alert('stderr: ' + text) }
};
````

### Extending Module for HTML Output

When Emscripten generates an HTML file, it includes a default `Module` object. In this case, you add properties to the existing `Module` object using `--pre-js`.

### Request Example (HTML Output)

```javascript
Module["print"] = function (text) {
  alert("stdout: " + text);
};
```

### Important Note

- `Module` properties are read during the main JavaScript file's execution. Modifying them afterward might not be effective.

````

--------------------------------

### Emscripten: Compiling with Asyncify or JSPI

Source: https://emscripten.org/docs/porting/asyncify

Compilation commands for an Emscripten C++ project using either the Asyncify or JSPI feature. It's recommended to use optimization flags like -O3, especially with Asyncify, to reduce the size of the generated WebAssembly output. The choice between ASYNCIFY and JSPI depends on specific project needs and compatibility with the target JavaScript environment.

```bash
emcc -O3 example.cpp -sASYNCIFY
emcc -O3 example.cpp -sJSPI
````

---

### Emscripten: Emitting \_\_postset Code Directly

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

Illustrates the direct emission of JavaScript code defined within \_\_postset properties by the Emscripten compiler. This generated code typically involves function definitions and immediate calls to initialize them.

```javascript
function _good_02() {
  _good_o2 = document.querySelector.bind(document);
}

function _good_03() {
  var callCount = 0;
  _good_03 = function () {
    console.log("times called: ", ++callCount);
  };
}

function _good_05() {
  _good_05 = curry(scrollTo, 0);
}

// Call each function once so it will replace itself
_good_02();
_good_03();
_good_05();
```

---

### emscripten_resume_main_loop

Source: https://emscripten.org/docs/api_reference/emscripten.h

Resumes the main event loop for the calling thread after it has been paused.

````APIDOC
## emscripten_resume_main_loop

### Description
Resumes the main event loop for the calling thread after it has been paused using `emscripten_pause_main_loop()`.

### Method
`void`

### Endpoint
N/A

### Parameters
None

### Request Example
```c
emscripten_resume_main_loop();
````

### Response

#### Success Response (void)

This function does not return a value.

#### Response Example

N/A

````

--------------------------------

### Make WebGL Context Current

Source: https://emscripten.org/docs/api_reference/html5.h

Activates the specified WebGL context, making it the current rendering context. After this call, standard OpenGL functions will operate on this context. Returns EMSCRIPTEN_RESULT_SUCCESS on success.

```c
EMSCRIPTEN_RESULT emscripten_webgl_make_context_current(EMSCRIPTEN_WEBGL_CONTEXT_HANDLE context);
````

---

### Embed Files using emcc

Source: https://emscripten.org/docs/porting/files/packaging_files

Embeds specified files directly into the generated .js file. This is more efficient than preloading as it avoids a separate file download and copy. The contents of the directory are directly incorporated into the JavaScript bundle.

```bash
emcc file.cpp -o file.html --embed-file asset_dir

```

---

### Emscripten Runtime Functions

Source: https://emscripten.org/genindex

Functions for managing the Emscripten runtime and application exit.

````APIDOC
## Emscripten Runtime Functions

### Description
These functions control the Emscripten runtime, including exiting the application and managing fullscreen/pointer lock.

### Functions
*   **emscripten_exit_fullscreen** (C function) - Exits fullscreen mode.
*   **emscripten_exit_pointerlock** (C function) - Exits pointer lock mode.
*   **emscripten_exit_soft_fullscreen** (C function) - Exits soft fullscreen mode.
*   **emscripten_exit_with_live_runtime** (C function) - Exits the runtime, keeping it live.
*   **emscripten_force_exit** (C function) - Forces an exit from the Emscripten runtime.

### Request Example
```c
// Exiting fullscreen
emscripten_exit_fullscreen();
````

### Response

These functions typically return void or an integer status code.

````

--------------------------------

### FS.fchmod

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Changes the mode flags for a file using a file descriptor.

```APIDOC
## FS.fchmod

### Description
Identical to `FS.chmod()`. However, a raw file descriptor is supplied as `fd`.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **fd** (int) - Required - Descriptor of target file.
- **mode** (int) - Required - The new file permissions for `path`, in octal numeric notation.

### Request Example
```javascript
// Assuming 'fd' is a valid file descriptor
FS.fchmod(fd, 0o0000);
````

### Response

#### Success Response (N/A)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Wrap and Call C function 'int_sqrt' from JavaScript using cwrap

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

This JavaScript code uses cwrap to create a callable JavaScript function from the compiled C function 'int_sqrt'. It specifies the function name, its return type ('number'), and its argument types (an array containing 'number'). Subsequent calls demonstrate its usage.

```javascript
int_sqrt = Module.cwrap('int_sqrt', 'number', ['number'])
int_sqrt(12)
int_sqrt(28)

````

---

### WebGL Context Event Callback

Source: https://emscripten.org/docs/api_reference/html5.h

Defines the function pointer type for callbacks that handle WebGL context events.

````APIDOC
## Callback function: `em_webgl_context_callback`

This is a function pointer type for `WebGL Context event callback functions`.

### Signature:
```c
typedef bool (*em_webgl_context_callback)(int eventType, const void *reserved, void *userData);
````

### Parameters:

- **`eventType`** (int) - The type of the WebGL context event.
- **`reserved`** (const void\*) - Reserved for future use; should be passed as 0.
- **`userData`** (void\*) - The `userData` originally passed to the registration function.

### Return Value:

- **`bool`** - Returns `true` (non-zero) to indicate that the event was consumed by the callback handler. Otherwise, returns `false` (zero).

````

--------------------------------

### Register DOM Focus/Blur Event Callbacks (C/C++)

Source: https://emscripten.org/docs/api_reference/html5.h

Allows registration of callback functions for DOM focus, blur, focusin, and focusout events. The callback receives event type, event details, and user data, returning true if the event is consumed. Requires a target element ID, user data, capture mode flag, and the callback function pointer.

```c
EMSCRIPTEN_RESULT emscripten_set_blur_callback(const char *target, void *userData, bool useCapture, em_focus_callback_func callback);
EMSCRIPTEN_RESULT emscripten_set_focus_callback(const char *target, void *userData, bool useCapture, em_focus_callback_func callback);
EMSCRIPTEN_RESULT emscripten_set_focusin_callback(const char *target, void *userData, bool useCapture, em_focus_callback_func callback);
EMSCRIPTEN_RESULT emscripten_set_focusout_callback(const char *target, void *userData, bool useCapture, em_focus_callback_func callback);
````

---

### Initialize WebGL Context Attributes

Source: https://emscripten.org/docs/api_reference/html5.h

Populates an EmscriptenWebGLContextAttributes structure with default values suitable for WebGL 1.0. This ensures forward compatibility with future additions to the structure by initializing new fields to their defaults.

```c
void emscripten_webgl_init_context_attributes(EmscriptenWebGLContextAttributes *attributes);
```

---

### Change File Ownership (JavaScript)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Changes the ownership of a file to a specified user ID (UID) and group ID (GID). Note that the values set are effectively ignored in the current implementation.

```javascript
FS.chown("my_file.txt", 1000, 1000);
```

---

### emscripten_idb_async_delete

Source: https://emscripten.org/docs/api_reference/emscripten.h

Deletes data from local IndexedDB storage asynchronously. The `ondelete` callback is invoked upon successful deletion, and `onerror` is called if any error occurs.

````APIDOC
## emscripten_idb_async_delete

### Description
Deletes data from local IndexedDB storage asynchronously. When the data has been deleted then the `ondelete` callback will be called. If any error occurred `onerror` will be called.

### Method
DELETE

### Endpoint
/websites/emscripten/idb

### Parameters
#### Path Parameters
- **db_name** (string) - Required - The IndexedDB database.
- **file_id** (string) - Required - The identifier of the data.

#### Query Parameters
- **arg** (void*) - Optional - User-defined data that is passed to the callbacks.
- **ondelete** (em_arg_callback_func) - Required - Callback on successful delete. Receives (arg).
- **onerror** (em_arg_callback_func) - Required - Callback in the event of failure. Receives (arg).

### Request Example
```json
{
  "db_name": "myDatabase",
  "file_id": "myDataFile",
  "arg": null,
  "ondelete": "function(arg) { console.log('Data deleted'); }",
  "onerror": "function(arg) { console.error('Error deleting data'); }"
}
````

### Response

#### Success Response (200)

This function does not return a value directly; results are delivered via the `ondelete` callback.

#### Response Example

(Callback invoked)

````

--------------------------------

### Create XMLHttpRequest in C++ using emscripten::val

Source: https://emscripten.org/docs/api_reference/val.h

This snippet demonstrates how to create a new XMLHttpRequest object in JavaScript from C++ using the emscripten::val class. It utilizes `val::global()` to access the JavaScript 'XMLHttpRequest' constructor and `new_()` to instantiate it.

```C++
val xhr = val::global("XMLHttpRequest").new_();
xhr.call<void>("open", std::string("GET"), std::string("http://url"));
````

---

### Emscripten NULL Pointer Handling

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Explains how Emscripten represents NULL pointers in bindings. Instead of JavaScript's `null` or `0`, Emscripten uses a global singleton `NULL` object which is a wrapped pointer with a value of 0.

```javascript
// Emscripten's representation of NULL
const nullPointer = NULL;
```

---

### Access Global JavaScript Symbols in C++ using emscripten::val

Source: https://emscripten.org/docs/api_reference/val.h

Demonstrates how to retrieve global JavaScript values by name from C++ using the `emscripten::val` class. `val::global(name)` looks up a global symbol, and `val::module_property(name)` accesses properties of the Emscripten Module object.

```C++
val console = val::global("console");
val window = val::global("window");

// Accessing a property on the Emscripten Module object
// Example: if your module has a property named 'myCustomData'
// val myData = val::module_property("myCustomData");
```

---

### Partially Implemented EGL Functions

Source: https://emscripten.org/docs/porting/multimedia_and_graphics/EGL-Support-in-Emscripten

These EGL functions have partial implementations with specific limitations or behaviors in Emscripten.

```APIDOC
## EGL API - Partially Implemented

### Description
These EGL functions have partial implementations with specific limitations or behaviors in Emscripten.

### Endpoints
- `eglChooseConfig`
- `eglGetConfigAttrib`
- `eglCreateWindowSurface`
- `eglCreateContext`
- `eglBindAPI`
- `eglQueryAPI`
- `eglWaitClient`
- `eglWaitNative`
- `eglSwapInterval`
- `eglMakeCurrent`
- `eglTerminate`
- `eglGetProcAddress`

### Notes on Specific Functions

#### `eglChooseConfig`
Implemented as a stub. Does not perform searching/filtering and is identical to `eglGetConfigs` (issue #643).

#### `eglGetConfigAttrib`
Implemented. Querying for `EGL_BUFFER_SIZE`, `EGL_ALPHA_SIZE`, `EGL_BLUE_SIZE`, `EGL_GREEN_SIZE`, `EGL_RED_SIZE`, `EGL_DEPTH_SIZE`, and `EGL_STENCIL_SIZE` returns hardcoded defaults (issue #644). `EGL_MIN_SWAP_INTERVAL` and `EGL_MAX_SWAP_INTERVAL` have no function; use `emscripten_set_main_loop()` for update rate.

#### `eglCreateWindowSurface`
Implemented, but cannot be called multiple times to create multiple render windows.

#### `eglCreateContext`
Implemented as a stub. Cannot be called multiple times to create multiple contexts.

#### `eglBindAPI`, `eglQueryAPI`
Implemented, but have little utility as only GLES2 is supported.

#### `eglWaitClient`, `eglWaitNative`
Implemented as no-op functions; have no meaning on Emscripten.

#### `eglSwapInterval`
Implemented as a no-op stub. Cannot set or enable/disable vsync interval.

#### `eglMakeCurrent`
Implemented as a no-op stub.

#### `eglTerminate`
Implemented as a no-op function stub. Browser handles teardown automatically.

#### `eglGetProcAddress`
Implemented, experimental.
```

---

### Truncate File using FS.ftruncate

Source: https://emscripten.org/docs/api_reference/Filesystem-API

The FS.ftruncate function allows truncating a file to a specified length. It requires a file descriptor and the desired length in bytes.

```javascript
FS.ftruncate(_fd_, _len_);
```

---

### Emscripten Async Wget2 Data Error Callback Type

Source: https://emscripten.org/docs/api_reference/emscripten.h

Defines the function pointer type for the `onerror` callback of `emscripten_async_wget2_data()`. The specific values of the parameters are documented in the `emscripten_async_wget2_data()` method.

```c
typedef void (*em_async_wget2_data_onerror_func)(unsigned, void*, int, const char*)
```

---

### Define WebIDL Interface for C++ Binding

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

This WebIDL file defines the interface for the C++ classes `Foo` and `Bar`. It specifies the methods and constructors available to JavaScript, including a constructor for object creation and type mappings.

```idl
interface Foo {
  void Foo();
  long getVal();
  void setVal(long v);
};

interface Bar {
  void Bar(long val);
  void doSomething();
};

```

---

### Emscripten Workaround: Manual Function Pointer Re-casting

Source: https://emscripten.org/docs/porting/guidelines/function_pointer_issues

Illustrates a workaround for Emscripten function pointer issues by re-casting the function pointer to its original signature just before calling it. This requires specific knowledge of the function types within the calling context, as shown in the special handling for index 1.

```c
void callFunctions(const voidReturnType * funcs, size_t size) {
  size_t current = 0;
  while (current < size) {
    if ( current == 1 ) {
      ((intReturnType)funcs[current])("hello world"); // Special-case cast
    } else {
      funcs[current]("hello world");
    }
    current++;
  }
}
```

---

### Compiling with emrun support

Source: https://emscripten.org/docs/compiling/Running-html-files-with-emrun

This linker flag enables Emscripten to inject code into the generated Module object, allowing emrun to capture stdout, stderr, and exit() calls from the application.

```shell
emcc ... --emrun ...
```

---

### Change Current Working Directory (JS)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Sets the current working directory in the Emscripten file system. It accepts a single string argument representing the new path to be set as the current directory.

```javascript
FS.chdir("/path/to/new/directory");
```

---

### Call C function 'int_sqrt' from JavaScript using ccall

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code

This JavaScript code demonstrates calling the compiled C function 'int_sqrt' directly using ccall. It specifies the C function name, its return type, its argument types, and the actual arguments to pass. The result of the C function call is stored in the 'result' variable.

```javascript
// Call C from JavaScript
var result = Module.ccall(
  "int_sqrt", // name of C function
  "number", // return type
  ["number"], // argument types
  [28],
); // arguments

// result is 5
```

---

### Define C++ Class Properties for JavaScript (Emscripten)

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Demonstrates defining C++ class properties that can be accessed from JavaScript using Emscripten's binding system. It highlights different binding strategies like direct member access, getters/setters, and the importance of `return_value_policy` to manage memory and prevent leaks. Requires `emscripten.h`.

```c++
struct Point {
    float x;
    float y;
};

struct Person {
    Point location;
    Point getLocation() const { // Note: const is required on getters
        return location;
    }
    void setLocation(Point p) {
        location = p;
    }
};

EMSCRIPTEN_BINDINGS(xxx) {
    class_<Person>("Person")
        .constructor<>()
        // Bind directly to a class member with automatically generated getters/setters using a
        // reference return policy so the object does not need to be deleted from JS.
        .property("location", &Person::location, return_value_policy::reference())
        // Same as above, but this will return a copy and the object must be deleted or it will
        // leak!
        .property("locationCopy", &Person::location)
        // Bind using a only getter method for read only access.
        .property("readOnlyLocation", &Person::getLocation, return_value_policy::reference())
        // Bind using a getter and setter method.
        .property("getterAndSetterLocation", &Person::getLocation, &Person::setLocation,
                  return_value_policy::reference());
    class_<Point>("Point")
        .property("x", &Point::x)
        .property("y", &Point::y);
}

int main() {
    EM_ASM(
        let person = new Module.Person();
        person.location.x = 42;
        console.log(person.location.x); // 42
        let locationCopy = person.locationCopy;
        // This is a copy so the original person's location will not be updated.
        locationCopy.x = 99;
        console.log(locationCopy.x); // 99
        // Important: delete any copies!
        locationCopy.delete();
        console.log(person.readOnlyLocation.x); // 42
        console.log(person.getterAndSetterLocation.x); // 42
        person.delete();
    );
}
```

---

### EM_JS(return_type, function_name, arguments, code)

Source: https://emscripten.org/docs/api_reference/emscripten.h

Defines a JavaScript function within C/C++ code that can be called like a regular C function. It supports passing arguments (int32_t, double, strings, pointers) and returning values to C.

````APIDOC
## EM_JS

### Description
Provides a convenient syntax for declaring JavaScript library functions within C/C++ code. These functions can be called directly from C/C++ as if they were native functions.

### Method
Macro

### Endpoint
N/A (Inline C/C++ Macro)

### Parameters
#### Arguments to EM_JS Macro
- **return_type** (C/C++ type) - The return type of the JavaScript function when called from C/C++.
- **function_name** (string) - The name of the JavaScript function to be declared.
- **arguments** (C/C++ parameter list) - The parameters of the JavaScript function, which map to C/C++ arguments. Supported types include `int32_t`, `double`, `const char*`, and pointers.
- **code** (JavaScript code block) - The JavaScript code that defines the function's behavior. It can access arguments passed from C/C++ and use Emscripten-provided global variables like `HEAP32`, `stringToNewUTF8`, etc.

#### Arguments Passed from C/C++ to JavaScript
Arguments declared in the `arguments` section of `EM_JS` are available within the JavaScript `code` block by their declared names. Special handling is required for C strings and pointers.

### Request Example
```c
// Example 1: Simple function with no arguments
EM_JS(void, two_alerts, (), {
  alert('hai');
  alert('bai');
});

// Example 2: Function with arguments
EM_JS(void, take_args, (int x, float y), {
  console.log('I received: ' + [x, y]);
});

// Example 3: Function accepting a C string
EM_JS(void, say_hello, (const char* str), {
  console.log('hello ' + UTF8ToString(str));
});

// Example 4: Function accepting a pointer
EM_JS(void, read_data, (int* data), {
  console.log('Data: ' + HEAP32[data>>2] + ', ' + HEAP32[(data+4)>>2]);
});

// Example 5: Function returning an integer
EM_JS(int, add_forty_two, (int n), {
  return n + 42;
});

// Example 6: Function returning a pointer (string)
EM_JS(char*, get_unicode_str, (), {
  var jsString = 'Hello with some exotic Unicode characters: Tässä on yksi lumiukko: ☃, ole hyvä.';
  return stringToNewUTF8(jsString);
});
````

### Response

#### Success Response (return value)

- The return value depends on the `return_type` specified in the `EM_JS` macro. If `void`, there is no return value. Otherwise, it's the value returned from the JavaScript code block (e.g., `int`, `char*`).

#### Response Example

```c
int main() {
  two_alerts(); // Calls the JavaScript function
  take_args(100, 35.5); // Passes arguments to JavaScript
  char* message = "Emscripten";
  say_hello(message); // Passes a C string to JavaScript
  int arr[2] = { 30, 45 };
  read_data(arr); // Passes a pointer to JavaScript
  int x = add_forty_two(100); // Receives an integer return value
  printf("Result: %d\n", x); // Output: Result: 142
  char* str = get_unicode_str(); // Receives a C string pointer
  printf("UTF8 string says: %s\n", str);
  free(str); // Free memory allocated by stringToNewUTF8
  return 0;
}
```

````

--------------------------------

### emscripten_idb_async_exists

Source: https://emscripten.org/docs/api_reference/emscripten.h

Checks if data with a certain ID exists in the local IndexedDB storage asynchronously. The `oncheck` callback is invoked with the existence status, and `onerror` is called if any error occurs.

```APIDOC
## emscripten_idb_async_exists

### Description
Checks if data with a certain ID exists in the local IndexedDB storage asynchronously. When the data has been checked then the `oncheck` callback will be called. If any error occurred `onerror` will be called.

### Method
GET

### Endpoint
/websites/emscripten/idb

### Parameters
#### Path Parameters
- **db_name** (string) - Required - The IndexedDB database.
- **file_id** (string) - Required - The identifier of the data.

#### Query Parameters
- **arg** (void*) - Optional - User-defined data that is passed to the callbacks.
- **oncheck** (em_idb_exists_func) - Required - Callback on successful check. Receives (arg, exists).
- **onerror** (em_arg_callback_func) - Required - Callback in the event of failure. Receives (arg).

### Request Example
```json
{
  "db_name": "myDatabase",
  "file_id": "myDataFile",
  "arg": null,
  "oncheck": "function(arg, exists) { console.log('File exists:', exists); }",
  "onerror": "function(arg) { console.error('Error checking existence'); }"
}
````

### Response

#### Success Response (200)

This function does not return a value directly; results are delivered via the `oncheck` callback.

#### Response Example

(Callback invoked)

````

--------------------------------

### FS.truncate

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Truncates a file to a specified length.

```APIDOC
## FS.truncate

### Description
Truncates a file to the specified length.

### Method
Not applicable (JavaScript API)

### Endpoint
Not applicable (JavaScript API)

### Parameters
#### Path Parameters
- **path** (string) - Required - Path to the target file.
- **len** (int) - Required - The new length of the file.

### Request Example
```javascript
// Example usage with FS.writeFile (implementation details may vary)
FS.writeFile('myFile.txt', 'some content');
FS.truncate('myFile.txt', 5); // Truncates file to 5 bytes
````

### Response

#### Success Response (N/A)

This function does not return a value upon success.

#### Response Example

N/A

````

--------------------------------

### Visibility Change Event Structure

Source: https://emscripten.org/docs/api_reference/html5.h

Defines the structure for the visibility change event, providing information about the document's visibility state.

```APIDOC
## Struct

### type EmscriptenVisibilityChangeEvent

The event structure passed in the visibilitychange event.

#### Fields
- **hidden** (boolean) - If true, the current browser page is now hidden.
- **visibilityState** (integer) - Specifies a more fine-grained state of the current page visibility status. One of the `EMSCRIPTEN_VISIBILITY_` values (e.g., `EMSCRIPTEN_VISIBILITY_VISIBLE`, `EMSCRIPTEN_VISIBILITY_HIDDEN`).
````

---

### Swap Emscripten Fiber Contexts (C)

Source: https://emscripten.org/docs/api_reference/fiber.h

Performs a context switch between two Emscripten fibers. The 'old_fiber' parameter captures the current state, allowing a return to it later. The 'new_fiber' parameter initiates execution in the target context, either by calling its entry point or rewinding the call stack using Asyncify data.

```c
void emscripten_fiber_swap(emscripten_fiber_t *old_fiber, emscripten_fiber_t *new_fiber)
```

---

### Register Device Orientation Event Callback (C/C++)

Source: https://emscripten.org/docs/api_reference/html5.h

Registers a callback function to receive device orientation events. The callback is invoked with event details and user data. Requires user data, capture mode flag, and the callback function pointer.

```c
EMSCRIPTEN_RESULT emscripten_set_deviceorientation_callback(void *userData, bool useCapture, em_deviceorientation_callback_func callback);
```

---

### Enable Runtime Assertions with Emscripten

Source: https://emscripten.org/docs/porting/Debugging

This command enables runtime checks for common errors using Emscripten's assertion settings. It can be used with varying levels of verbosity to catch more issues during development. `ASSERTIONS=1` is the default at `-O0` and can be overridden.

```shell
emcc -O1 -s ASSERTIONS=1 test/hello_world.c
```

---

### JavaScript: Invoking Embind Functions with Asyncify

Source: https://emscripten.org/docs/porting/asyncify

Shows how to call Embind exported functions from JavaScript, illustrating synchronous and asynchronous return values based on whether the function calls suspending operations like `emscripten_sleep()`.

```javascript
let syncResult = Module.delayAndReturn(false);
console.log(syncResult); // 42
console.log(await syncResult); // also 42 because `await` is no-op

let asyncResult = Module.delayAndReturn(true);
console.log(asyncResult); // Promise { <pending> }
console.log(await asyncResult); // 42
```

---

### Change File Permissions (JavaScript)

Source: https://emscripten.org/docs/api_reference/Filesystem-API

Changes the mode flags (permissions) for a given file path to a specified octal mode. Note that user/group permissions are not fully supported, and only owner permissions apply.

```javascript
FS.writeFile("forbidden", "can't touch this");
FS.chmod("forbidden", 0000);
```

---

### Orientationchange Callback Registration

Source: https://emscripten.org/docs/api_reference/html5.h

Registers a callback function to handle orientationchange events. The callback receives event details and user data, and should return true if the event is consumed.

````APIDOC
## POST /emscripten/orientationchange/callback

### Description
Registers a callback function for receiving the orientationchange event. The callback is invoked with event type, event details, and user data. It should return `true` if the event is consumed.

### Method
POST

### Endpoint
/emscripten/orientationchange/callback

### Parameters
#### Request Body
- **userData** (void*) - Required - User-defined data to be passed to the callback.
- **useCapture** (bool) - Required - Set `true` to use capture.
- **callback** (em_orientationchange_callback_func) - Required - The callback function to register.

### Request Example
```json
{
  "userData": "0x12345678",
  "useCapture": true,
  "callback": "myOrientationChangeCallback"
}
````

### Response

#### Success Response (200)

- **result** (EMSCRIPTEN_RESULT) - Indicates success (`EMSCRIPTEN_RESULT_SUCCESS`) or an error.

#### Response Example

```json
{
  "result": "EMSCRIPTEN_RESULT_SUCCESS"
}
```

````

--------------------------------

### Emscripten Synchronous Pointer Return (MAIN_THREAD_EM_ASM_PTR)

Source: https://emscripten.org/docs/api_reference/emscripten.h

A variant of MAIN_THREAD_EM_ASM that returns a pointer value. It executes JavaScript code synchronously on the main thread and returns the pointer.

```javascript
MAIN_THREAD_EM_ASM_PTR(code, ...)


    Similar to `MAIN_THREAD_EM_ASM` but returns a pointer value.
````

---

### Emscripten Network and Worker Functions

Source: https://emscripten.org/genindex

Functions for making network requests and interacting with Web Workers.

```APIDOC
## Emscripten Network and Worker API

### Description
This section covers functions for asynchronous network requests and communication with Web Workers.

### Functions
- **emscripten_wget**: Initiates an HTTP GET request.
- **emscripten_wget_data**: Initiates an HTTP GET request and retrieves data.
- **emscripten_worker_respond**: Sends a response from a worker.
- **emscripten_worker_respond_provisionally**: Sends a provisional response from a worker.

### Macros
- **EMSCRIPTEN_WRAPPER**: (C++) Macro for creating function wrappers.
```

---

### EmscriptenWebGLContextAttributes

Source: https://emscripten.org/docs/api_reference/html5.h

Defines the attributes for creating a WebGL context with Emscripten.

````APIDOC
## Struct EmscriptenWebGLContextAttributes

### Description
Specifies WebGL context creation parameters.

### Attributes

#### alpha (bool)
- **Description**: If `true`, request an alpha channel for the context. Allows blending canvas rendering with underlying web page content. Default: `true`.
- **Required**: Optional

#### depth (bool)
- **Description**: If `true`, request a depth buffer of at least 16 bits. If `false`, no depth buffer will be initialized. Default: `true`.
- **Required**: Optional

#### stencil (bool)
- **Description**: If `true`, request a stencil buffer of at least 8 bits. If `false`, no stencil buffer will be initialized. Default: `false`.
- **Required**: Optional

#### antialias (bool)
- **Description**: If `true`, antialiasing will be initialized with a browser-specified algorithm and quality level. If `false`, antialiasing is disabled. Default: `true`.
- **Required**: Optional

#### premultipliedAlpha (bool)
- **Description**: If `true`, the alpha channel of the rendering context will be treated as representing premultiplied alpha values. If `false`, it represents non-premultiplied alpha. Default: `true`.
- **Required**: Optional

#### preserveDrawingBuffer (bool)
- **Description**: If `true`, the contents of the drawing buffer are preserved between consecutive `requestAnimationFrame()` calls. If `false`, color, depth, and stencil are cleared at the beginning of each `requestAnimationFrame()`. Setting to `false` generally improves performance. Default: `false`.
- **Required**: Optional

#### powerPreference (EM_WEBGL_POWER_PREFERENCE)
- **Description**: Specifies a hint to the WebGL canvas implementation on how to choose the use of available GPU resources. Possible values: `EM_WEBGL_POWER_PREFERENCE_DEFAULT`, `EM_WEBGL_POWER_PREFERENCE_LOW_POWER`, `EM_WEBGL_POWER_PREFERENCE_HIGH_PERFORMANCE`.
- **Required**: Optional

#### failIfMajorPerformanceCaveat (bool)
- **Description**: If `true`, requests context creation to abort if the browser can only create a context that does not provide good hardware-accelerated performance. Default: `false`.
- **Required**: Optional

#### majorVersion (int)
- **Description**: Emscripten-specific extension to specify the WebGL context major version. For example, `1` for WebGL 1.0 or `2` for WebGL 2.0. Default: `1`.
- **Required**: Optional

#### minorVersion (int)
- **Description**: Emscripten-specific extension to specify the WebGL context minor version. For example, `0` for WebGL 1.0 or `2.0`. Default: `0`.
- **Required**: Optional

#### enableExtensionsByDefault (bool)
- **Description**: If `true`, all GLES2-compatible non-performance-impacting WebGL extensions will automatically be enabled after context creation. If `false`, no extensions are enabled by default, requiring manual enabling via `emscripten_webgl_enable_extension()`. Default: `true`.
- **Required**: Optional

#### explicitSwapControl (bool)
- **Description**: If `true`, rendered WebGL content is not implicitly presented on the canvas when the event handler returns. Instead, the user manages swapping via `emscripten_webgl_commit_frame()`. Requires `-sOFFSCREEN_FRAMEBUFFER` and `renderViaOffscreenBackBuffer=1`, or `-sOFFSCREENCANVAS_SUPPORT`.
- **Required**: Optional

#### renderViaOffscreenBackBuffer (bool)
- **Description**: If `true`, an intermediate offscreen backbuffer is allocated, and rendering occurs there instead of directly onto the WebGL default backbuffer. Required if `explicitSwapControl=true` and OffscreenCanvas is not supported, or when rendering WebGL from a worker thread without OffscreenCanvas support, or when accessing WebGL context from multiple threads simultaneously. Requires `-sOFFSCREEN_FRAMEBUFFER`. Can act as a polyfill for OffscreenCanvas when both flags are enabled.
- **Required**: Optional

#### proxyContextToMainThread (bool)
- **Description**: Proxies the WebGL context to the main thread. This is a boolean flag indicating whether to proxy the context to the main thread.
- **Required**: Optional

### Request Example
```json
{
  "alpha": true,
  "depth": true,
  "stencil": false,
  "antialias": true,
  "premultipliedAlpha": true,
  "preserveDrawingBuffer": false,
  "powerPreference": "EM_WEBGL_POWER_PREFERENCE_HIGH_PERFORMANCE",
  "failIfMajorPerformanceCaveat": false,
  "majorVersion": 2,
  "minorVersion": 0,
  "enableExtensionsByDefault": true,
  "explicitSwapControl": false,
  "renderViaOffscreenBackBuffer": false,
  "proxyContextToMainThread": false
}
````

### Response

This struct is used for configuring context creation and does not have a direct response. The success or failure of context creation would be indicated by the return value of the relevant Emscripten API function.

````

--------------------------------

### Emscripten Optimization Levels

Source: https://emscripten.org/docs/tools_reference/emcc

Emscripten supports various optimization levels from -O0 (no optimizations, default, good for debugging) to -Oz (maximum size reduction). These flags affect both WebAssembly and JavaScript code generation and optimization during compilation and linking.

```bash
# No optimizations (default), assertions enabled for debugging
emcc -O0 source.c -o output.js

# Simple optimizations
emcc -O1 source.c -o output.js

# More optimizations, enables JavaScript optimizations
emcc -O2 source.c -o output.js

# Additional optimizations, may increase code size, good for release builds
emcc -O3 source.c -o output.js

# Optimizations for better debugging experience
emcc -Og source.c -o output.js

# Focus on code size reduction, may trade speed for size
emcc -Os source.c -o output.js

# Further code size reduction, may take longer
emcc -Oz source.c -o output.js
````

---

### C++ Const Pointer Binding in WebIDL

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/WebIDL-Binder

Demonstrates how to specify C++ const pointers in IDL using the `[Const]` attribute. This applies to function return types that are constant pointers.

```C++
const myObject* getAsConst();
```

```WebIDL
[Const] myObject getAsConst();
```

---

### Automatic C++ Object Deletion with 'using' Keyword

Source: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind

Demonstrates automatic memory management for C++ objects in JavaScript using the 'using' keyword, which leverages the Explicit Resource Management proposal. This ensures C++ objects are deleted at the end of their scope, similar to RAII in C++.

```javascript
using x = new Module.MyClass();
x.method();
```

---

### Register Device Motion Callback

Source: https://emscripten.org/docs/api_reference/html5.h

Registers a callback function to receive device motion events.

```APIDOC
## EMSCRIPTEN_RESULT emscripten_set_devicemotion_callback

### Description
Registers a callback function for receiving the devicemotion event.

### Method
`emscripten_set_devicemotion_callback`

### Parameters
- **userData** (void*) - User-defined data to be passed to the callback (opaque to the API).
- **useCapture** (bool) - Set `true` to use capture phase for the event.
- **callback** (em_devicemotion_callback_func) - A callback function that will be invoked when a devicemotion event occurs.

### Returns
- `EMSCRIPTEN_RESULT_SUCCESS` on success.
- Other `EMSCRIPTEN_RESULT` values on failure.
```

---

### Emscripten Proxy Functions

Source: https://emscripten.org/genindex

Functions for managing callbacks and executing code across different JavaScript contexts.

````APIDOC
## Emscripten Proxy Functions

### Description
These functions facilitate asynchronous operations and callback management, especially useful when interacting with JavaScript from Emscripten or vice-versa.

### Functions
*   **emscripten_proxy_async** (C function) - Proxies an asynchronous operation.
*   **emscripten_proxy_callback** (C function) - Proxies a callback function.
*   **emscripten_proxy_callback_with_ctx** (C function) - Proxies a callback function with context.
*   **emscripten_proxy_execute_queue** (C function) - Executes the proxy queue.
*   **emscripten_proxy_finish** (C function) - Finishes proxy operations.
*   **emscripten_proxy_get_system_queue** (C function) - Gets the system proxy queue.

### Request Example
```c
// Example of proxying a callback
void my_callback(int arg) { /* ... */ }
emscripten_proxy_callback(my_callback, 123);
````

### Response

These functions typically return `EMSCRIPTEN_RESULT` to indicate success or failure.

````

--------------------------------

### Use ES Module Exports with Emscripten

Source: https://emscripten.org/docs/tools_reference/settings_reference

Enabling EXPORT_ES6 allows Emscripten to export using an ES6 Module export instead of a UMD export. MODULARIZE must be enabled for this feature and is implicitly enabled if not already set. This option is also implicitly enabled if the output file suffix is set to '.mjs'.

```javascript
import init, { foo, bar } from "./my_module.mjs"
await init(optionalArguments);
foo();
bar();
````

---

### Fully Implemented EGL Functions

Source: https://emscripten.org/docs/porting/multimedia_and_graphics/EGL-Support-in-Emscripten

These EGL functions are fully implemented and expected to work according to the EGL v1.4 specification.

```APIDOC
## EGL API - Fully Implemented

### Description
These EGL functions are fully implemented and expected to work according to the EGL v1.4 specification.

### Endpoints
- `eglInitialize`
- `eglGetConfigs`
- `eglQueryContext`
- `eglQueryString`
- `eglQuerySurface`
- `eglGetCurrentContext`
- `glGetCurrentSurface`
- `eglGetCurrentDisplay`
- `eglReleaseThread`
- `eglDestroySurface`
- `eglDestroyContext`
- `eglSwapBuffers`
- `eglGetDisplay`
- `eglGetError`

### Notes on Specific Functions

#### `eglSwapBuffers`
Implemented, but cannot control swap behavior under WebGL. Calling this function is optional. Presentation to the screen happens when execution returns to the browser. Can be used to detect GL context loss.

#### `eglGetDisplay`
Implemented according to the specification. Pass `EGL_DEFAULT_DISPLAY`. Emscripten currently ignores the value passed, but this may change.

#### `eglGetError`
Implemented. Reports the single most recent error. Do not call in a loop like `glGetError`.
```

---

### Vibrate with Pattern

Source: https://emscripten.org/docs/api_reference/html5.h

Creates a complex vibration pattern by specifying an array of on and off durations in milliseconds. The function allows for custom haptic feedback sequences.

```c
EMSCRIPTEN_RESULT emscripten_vibrate_pattern(int *msecsArray, int numEntries);
```

---

### Emscripten Compilation with Exported Functions

Source: https://emscripten.org/docs/optimizing/Module-Splitting

This Emscripten compilation command enables SPLIT_MODULE and explicitly exports `_malloc`, `_free`, and `_main`. Exporting `_malloc` and `_free` is necessary for the JavaScript `write_profile` function to interact with the Wasm module's memory. Exporting `_main` ensures the entry point is available.

```bash
emcc application.c -o application.js -sSPLIT_MODULE -sEXPORTED_FUNCTIONS=_malloc,_free,_main

```
