#===----------------------------------------------------------------------===#
#                           The MIT License (MIT)
#             Copyright (c) 2020 Douglas Chen <dougpuob@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
#===----------------------------------------------------------------------===#

cmake_minimum_required(VERSION 3.10)
project(MyClangTool)

if(CMAKE_HOST_WIN32)
    set(SYSTEM_LIBS Version.lib)
elseif(CMAKE_HOST_UNIX)
    set(CMAKE_CXX_FLAGS "-fno-rtti")
elseif(CMAKE_HOST_APPLE)
    #set(SYSTEM_LIBS)
endif()

###############################################################################
# LLVM
###############################################################################
find_package(LLVM REQUIRED CONFIG PATHS ${LLVM_INSTALL_DIR} NO_DEFAULT_PATH)
message(STATUS "Found LLVM  : ${LLVM_INCLUDE_DIRS} ${LLVM_PACKAGE_VERSION}")

find_package(Clang REQUIRED CONFIG PATHS ${LLVM_INSTALL_DIR} NO_DEFAULT_PATH)

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
llvm_map_components_to_libnames(LLVM_LIBS core clang native)

message(STATUS "LLVM_INSTALL_DIR   = ${LLVM_INSTALL_DIR}")
message(STATUS "LLVM_INCLUDE_DIRS  = ${LLVM_INCLUDE_DIRS}")
message(STATUS "LLVM_DEFINITIONS   = ${LLVM_DEFINITIONS}")
message(STATUS "LLVM_LIBRARY_DIRS  = ${LLVM_LIBRARY_DIRS}")
message(STATUS "CLANG_INCLUDE_DIRS = ${CLANG_INCLUDE_DIRS}")

set (SELECTED_CLANG_LIBS
    clangTooling
    )

###############################################################################
add_executable(MyClangTool
    source/main.cpp
    )

target_link_libraries(MyClangTool  
    ${LLVM_AVAILABLE_LIBS}
    ${SELECTED_CLANG_LIBS}
    ${SYSTEM_LIBS}
    )
