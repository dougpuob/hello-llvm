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

set(CMAKE_VERBOSE_MAKEFILE on )
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/llvm-inc-dirs.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/llvm-lib-dirs.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/llvm-libs-$ENV{LLVM_VERSION}.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/check-variables.cmake)

message(STATUS "=============================================================")
message(STATUS "LLVM_BUILD_TYPE = $ENV{LLVM_BUILD_TYPE}")
message(STATUS "LLVM_ROOT_DIR   = $ENV{LLVM_ROOT_DIR}")
message(STATUS "-------------------------------------------------------------")
message(STATUS "LLVM_INC_DIRS   = ${LLVM_INC_DIRS}")
message(STATUS "-------------------------------------------------------------")
message(STATUS "LLVM_LIB_DIRS   = ${LLVM_LIB_DIRS}")
message(STATUS "-------------------------------------------------------------")
message(STATUS "LLVM_LIBS       = ${LLVM_LIBS}")
message(STATUS "=============================================================")
message("")

    
if(WIN32)
    set(SYSTEM_LIBS Version.lib)
elseif(UNIX AND NOT APPLE)
    set(SYSTEM_LIBS z tinfo pthread)
    set(CMAKE_CXX_FLAGS "-frtti")
elseif(APPLE)
    set(SYSTEM_LIBS)
endif()


include_directories(${LLVM_INC_DIRS})
link_directories(${LLVM_LIB_DIRS})

add_executable(MyClangTool
  main.cpp
  )

target_link_libraries(MyClangTool
  clangTooling
  clangAnalysis
  ${LLVM_LIBS}
  ${SYSTEM_LIBS}
  )
