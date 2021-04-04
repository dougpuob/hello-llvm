# example-hello-clangtool
This is an example helping you build your cross-platform clangtool utility with CMake quickly on Windows/Linux.
(If you just wanna a quick start with LLVM, it may help you focus on your idea ASAP)

——————————————————————————————————————————————————

## ● Build LLVM

``` script
mkdir llvm-project.git-11.1.0
cd llvm-project.git-11.1.0
git clone https://github.com/llvm/llvm-project.git .
git checkout llvmorg-11.1.0
mkdir build
cd build
```

### Config & Build & Install
- Windows
``` powershell
# Config
cmake -G "Visual Studio 16 2019" -A X64           `
      -DLLVM_ENABLE_ABI_BREAKING_CHECKS=0         `
      -DLLVM_USE_LINKER=lld                       `
      -DLLVM_TARGETS_TO_BUILD="X86"               `
      -DLLVM_ENABLE_PROJECTS="clang;llvm"         `
      -DCMAKE_BUILD_TYPE=Release                  `
      -DCMAKE_INSTALL_PREFIX="C:\petzone\llvm\llvm-prebuilt\llvmorg-11.1.0-msbuild-vs2019-x64-rel" `
      ../llvm | tee logfile-config.log

# Build
cmake --build . --config Release | tee logfile-build.log

# Install
cmake -P cmake_install.cmake
```

- Linux/macOS
``` bash
# Config
cmake -G "Ninja"                                \
      -DLLVM_ENABLE_ABI_BREAKING_CHECKS=OFF     \
      -DLLVM_TARGETS_TO_BUILD="X86"             \
      -DLLVM_ENABLE_PROJECTS="clang;llvm"       \
      -DCMAKE_BUILD_TYPE=Release                \
      -DCMAKE_INSTALL_PREFIX="~/petzone/llvm/llvm-prebuilt/llvmorg-11.1.0-ninja-gcc-x64-rel"  \
      ../llvm | tee logfile-config.log

# Build
cmake --build . --config Release | tee logfile-build.log

# Install
cmake -P cmake_install.cmake
````


## ● Build this project

``` script
mkdir hello-clangtool.git
cd hello-clangtools.git
git clone https://github.com./dougpuob/hello-clangtool.git  .
cd build-with-prebuilt
mkdir build
cd build

# Windows
cmake .. -DLLVM_INSTALL_DIR="C:\petzone\llvm\llvm-prebuilt\llvmorg-11.1.0-msbuild-vs2019-x64-rel"
cmake --build . --config Release

# Linux, macOS
cmake .. -DLLVM_INSTALL_DIR="~/petzone/llvm/llvm-prebuilt/llvmorg-11.1.0-ninja-gcc-x64-rel"
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
