# example-hello-clangtool
This is an example helping you build your cross-platform clangtool utility with CMake quickly on Windows/Linux.
(If you just wanna a quick start with LLVM, it may help you focus on your idea ASAP)

——————————————————————————————————————————————————

## ● Prepare vcpkg

- https://docs.microsoft.com/en-us/cpp/build/install-vcpkg?view=msvc-160&tabs=linux
- https://docs.microsoft.com/en-us/cpp/build/install-vcpkg?view=msvc-160&tabs=macos
- https://docs.microsoft.com/en-us/cpp/build/install-vcpkg?view=msvc-160&tabs=windows

Take Windows for example
``` powershell
mkdir vcpkg
cd vcpkg
git clone https://github.com/microsoft/vcpkg .
bootstrap-vcpkg.bat
```

## ● Prepare LLVM (Install & Build)
This step takes time. Depends on your performance of CPU.

``` powershell
vcpkg.exe install llvm:x64-windows
```

## ● Build HelloClangTool
``` powershell
mkdir hello-clangtool.git
cd hello-clangtools.git
git clone https://github.com./dougpuob/hello-clangtool.git  .
mkdir build
cd build 

# Debug build on Windows
cmake ..                                                                `
    -DCMAKE_TOOLCHAIN_FILE="C:\vcpkg\scripts\buildsystems\vcpkg.cmake"  `
    -DLLVM_CONFIGURATION_TYPES=Debug                                    `
    -DLLVM_BUILD_TYPE=Debug
    
cmake --build . --config Debug

# Release build on Windows
cmake ..                                                                `
    -DCMAKE_TOOLCHAIN_FILE="C:\vcpkg\scripts\buildsystems\vcpkg.cmake"  `
    -DLLVM_CONFIGURATION_TYPES=Release                                  `
    -DLLVM_BUILD_TYPE=Release
    
cmake --build . --config Release
```

**main.cpp**
``` c++
#include "clang/Frontend/FrontendActions.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Tooling.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using namespace clang::tooling;

static llvm::cl::OptionCategory MyToolCategory("my-tool options");
static cl::extrahelp CommonHelp(CommonOptionsParser::HelpMessage);
static cl::extrahelp MoreHelp("\nMore help content ...\n");

int main(int argc, const char **argv) {
  CommonOptionsParser OptionsParser(argc, argv, MyToolCategory);
  ClangTool Tool(OptionsParser.getCompilations(),
                 OptionsParser.getSourcePathList());
  return Tool.run(newFrontendActionFactory<clang::SyntaxOnlyAction>().get());
}
```

——————————————————————————————————————————————————

## ● License
MIT

——————————————————————————————————————————————————

## ● Author
Douglas Chen(陳鍵源) <<dougpuob@gmail.com>>
