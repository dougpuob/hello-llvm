cmake_minimum_required(VERSION 3.15)
project(LoopConvert)


#set(LLVM_LINK_COMPONENTS support)
find_package(LLVM REQUIRED CONFIG)
find_package(LLVM REQUIRED CONFIG)

include_directories(${LLVM_INCLUDE_DIRS};${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})


message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message("LLVM_INCLUDE_DIR=${LLVM_INCLUDE_DIR}")
message("LLVM_MAIN_INCLUDE_DIR=${LLVM_MAIN_INCLUDE_DIR}")
message("LLVM_LIBRARY_DIR=${LLVM_LIBRARY_DIR}")
message("LLVM_CMAKE_DIR=${LLVM_CMAKE_DIR}")
message("LLVM_INCLUDE_DIRS=${LLVM_INCLUDE_DIRS}")
message("LLVM_DEFINITIONS=${LLVM_DEFINITIONS}")



add_executable(loop-convert
  LoopConvert.cpp
  )
  
target_link_libraries(loop-convert
  PRIVATE
  clangTooling
  clangBasic
  clangASTMatchers
  )