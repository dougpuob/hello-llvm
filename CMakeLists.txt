cmake_minimum_required(VERSION 3.10)
project(MyClangTool)

set(LLVM_PACKAGE_VERSION $ENV{LLVM_VERSION})
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/llvm-inc-dirs.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/llvm-lib-dirs.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/llvm-libs-${LLVM_PACKAGE_VERSION}.cmake)
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
    set(SYSTEM_LIBS
        Version.lib)

elseif(UNIX AND NOT APPLE)
    set(SYSTEM_LIBS)

elseif(APPLE)
    # LLVM_INCLUDE_DIR  =
    # LLVM_LIBRARY_DIR  =
    # LLVM_CMAKE_DIR    =
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
