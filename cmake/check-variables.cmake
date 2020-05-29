if(NOT DEFINED ENV{LLVM_BUILD_TYPE})
  message(FATAL_ERROR "missing variable: ${LLVM_BUILD_TYPE}")
endif()

if(NOT DEFINED ENV{LLVM_ROOT_DIR})
  message(FATAL_ERROR "missing variable: ${LLVM_ROOT_DIR}")
endif()



