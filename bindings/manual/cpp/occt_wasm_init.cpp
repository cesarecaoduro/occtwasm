#include <emscripten/bind.h>

#include <string>

using namespace emscripten;

namespace {

constexpr const char* OCCTWASM_VERSION = "0.1.0";

} // namespace

EMSCRIPTEN_BINDINGS(occt_wasm_init) {

  function("getOCCTWasmVersion", +[]() -> std::string {
    return OCCTWASM_VERSION;
  });

}
