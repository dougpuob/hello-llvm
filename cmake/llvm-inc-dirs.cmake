set(LLVM_INC_DIRS
    $ENV{LLVM_ROOT_DIR}/llvm/include
    $ENV{LLVM_ROOT_DIR}/clang/include
    $ENV{LLVM_ROOT_DIR}/build/include
    $ENV{LLVM_ROOT_DIR}/build/tools/clang/include
    $ENV{LLVM_ROOT_DIR}/build/${LLVM_BUILD_TYPE}/include
    $ENV{LLVM_ROOT_DIR}/build/${LLVM_BUILD_TYPE}/tools/clang/include
    $ENV{LLVM_ROOT_DIR}/build/${LLVM_BUILD_TYPE}/tools/llvm/include
)

#file(TO_NATIVE_PATH ${LLVM_INC_DIRS} LLVM_INC_DIRS)