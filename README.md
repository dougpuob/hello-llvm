# example-hello-clangtool
This is an example helping you build your cross-platform clangtool utility with CMake quickly on Windows/Linux.
(If you just wanna a quick start with LLVM, it may help you focus on your idea ASAP)

——————————————————————————————————————————————————

## ● Build LLVM

``` bash
mkdir llvm-project.git-8.0.0
cd llvm-project.git-8.0.0
git clone https://github.com/llvm/llvm-project.git .
git checkout llvmorg-8.0.0
mkdir -p build/debug
cd build/debug

#####################################################################################
# Config
#####################################################################################
export BUILD_TYPE=Debug
export TARGET_CPUS="X86"
export ENABLE_PROJECTS="clang;clang-tools-extra;llvm"
export INSTALL_DIR=~/petzone/llvm/llvm-prebuilt-install/llvmorg-8.0.0-gcc-debug
export 
time cmake -G "Ninja"                             \
      -DLLVM_ENABLE_ABI_BREAKING_CHECKS=0         \
      -DLLVM_USE_LINKER=lld                       \
      -DLLVM_TARGETS_TO_BUILD=$TARGET_CPUS        \
      -DLLVM_ENABLE_PROJECTS=$ENABLE_PROJECTS     \
      -DCMAKE_BUILD_TYPE=$BUILD_TYPE              \
      -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR         \
      ../../llvm

#####################################################################################
# Make
#####################################################################################
time cmake --build .

#####################################################################################
# Install
#####################################################################################
time cmake -P cmake_install.cmake
```

## ● Build this project

``` bash
mkdir hello-clangtool.git
cd hello-clangtools.git
git clone https://github.com./dougpuob/hello-clangtool.git  .
mkdir build
cd build
cmake .. -DLLVM_INSTALL_DIR=~/petzone/llvm/llvm-prebuilt-install/llvmorg-8.0.0-gcc-debug/
cmake --build .
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
