cmake_minimum_required(VERSION 3.10)
project(MyClangTool)


include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/llvm-libs-8.0.0.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/llvm-libs-10.0.0.cmake)


set(LLVM_LINK_COMPONENTS support)
find_package(LLVM REQUIRED CONFIG)


if(WIN32)
    set(SELECTED_INCLUDER_DIRS      
      ${LLVM_INCLUDE_DIR}/../../clang/include)
    set(SELECTED_LIBRARY_DIRS
      ${LLVM_LIBRARY_DIR}/..
      ${LLVM_LIBRARY_DIR}/../../lib/debug)
    set(SELECTED_SYSTEM_LIBS
        Version.lib)

elseif(UNIX AND NOT APPLE)
    set(SELECTED_INCLUDER_DIRS
        ${LLVM_INCLUDE_DIR}/../../../clang/include)
    set(SELECTED_LIBRARY_DIRS
        ${LLVM_LIBRARY_DIR}/../release/lib)
    set(SELECTED_SYSTEM_LIBS)

elseif(APPLE)
    # LLVM_INCLUDE_DIR  =
    # LLVM_LIBRARY_DIR  =
    # LLVM_CMAKE_DIR    =
endif()


include_directories(${LLVM_INCLUDE_DIRS}
                    ${LLVM_INCLUDE_DIR}/../tools/clang/include
                    ${LLVM_INCLUDE_DIR}/../../llvm/include
                    ${SELECTED_INCLUDER_DIRS})
                    
link_directories(${LLVM_LIBRARY_DIR};${SELECTED_LIBRARY_DIRS})


message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message("LLVM_DIR             = ${LLVM_DIR}")
message("LLVM_CMAKE_DIR       = ${LLVM_CMAKE_DIR}")
message("LLVM_INCLUDE_DIR     = ${LLVM_INCLUDE_DIR}")
message("LLVM_LIBRARY_DIR     = ${LLVM_LIBRARY_DIR}")
message("LLVM_CMAKE_DIR       = ${LLVM_CMAKE_DIR}")
message("LLVM_INCLUDE_DIRS    = ${LLVM_INCLUDE_DIRS}")
message("LLVM_DEFINITIONS     = ${LLVM_DEFINITIONS}")
message("SELECTED_SYSTEM_LIBS = ${SELECTED_SYSTEM_LIBS}")


add_executable(MyClangTool
  main.cpp
  )


if     ("${LLVM_PACKAGE_VERSION}" EQUAL "10.0.0")
  set(SELECTED_LLVM_LIBS ${LLVM_LIBS_10_0_0})
elseif ("${LLVM_PACKAGE_VERSION}" EQUAL "9.0.0")
  set(SELECTED_LLVM_LIBS ${LLVM_LIBS_9_0_0})
elseif ("${LLVM_PACKAGE_VERSION}" EQUAL "8.0.0")
  set(SELECTED_LLVM_LIBS ${LLVM_LIBS_8_0_0})
endif()


target_link_libraries(MyClangTool
  PRIVATE
  clangTooling
  clangAnalysis
  ${SELECTED_LLVM_LIBS}
  ${SELECTED_SYSTEM_LIBS}
  )
