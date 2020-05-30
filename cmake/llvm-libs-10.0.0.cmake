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
set(CLANG_LIBS "clangBasic;clangLex;clangParse;clangAST;clangDynamicASTMatchers;clangASTMatchers;clangCrossTU;clangSema;clangCodeGen;clangAnalysis;clangEdit;clangRewrite;clangARCMigrate;clangDriver;clangSerialization;clangRewriteFrontend;clangFrontend;clangFrontendTool;clangToolingCore;clangToolingInclusions;clangToolingRefactoring;clangToolingASTDiff;clangToolingSyntax;clangDependencyScanning;clangTransformer;clangTooling;clangDirectoryWatcher;clangIndex;clangStaticAnalyzerCore;clangStaticAnalyzerCheckers;clangStaticAnalyzerFrontend;clangFormat")
set(LLVM_LIBS  "LLVMDemangle;LLVMSupport;LLVMTableGen;LLVMCore;LLVMFuzzMutate;LLVMIRReader;LLVMCodeGen;LLVMSelectionDAG;LLVMAsmPrinter;LLVMMIRParser;LLVMGlobalISel;LLVMBinaryFormat;LLVMBitReader;LLVMBitWriter;LLVMBitstreamReader;LLVMDWARFLinker;LLVMFrontendOpenMP;LLVMTransformUtils;LLVMInstrumentation;LLVMAggressiveInstCombine;LLVMInstCombine;LLVMScalarOpts;LLVMipo;LLVMVectorize;LLVMObjCARCOpts;LLVMCoroutines;LLVMCFGuard;LLVMLinker;LLVMAnalysis;LLVMLTO;LLVMMC;LLVMMCParser;LLVMMCDisassembler;LLVMMCA;LLVMObject;LLVMObjectYAML;LLVMOption;LLVMRemarks;LLVMDebugInfoDWARF;LLVMDebugInfoGSYM;LLVMDebugInfoMSF;LLVMDebugInfoCodeView;LLVMDebugInfoPDB;LLVMSymbolize;LLVMExecutionEngine;LLVMInterpreter;LLVMJITLink;LLVMMCJIT;LLVMOrcError;LLVMOrcJIT;LLVMRuntimeDyld;LLVMTarget;LLVMAArch64CodeGen;LLVMAArch64AsmParser;LLVMAArch64Disassembler;LLVMAArch64Desc;LLVMAArch64Info;LLVMAArch64Utils;LLVMAMDGPUCodeGen;LLVMAMDGPUAsmParser;LLVMAMDGPUDisassembler;LLVMAMDGPUDesc;LLVMAMDGPUInfo;LLVMAMDGPUUtils;LLVMARMCodeGen;LLVMARMAsmParser;LLVMARMDisassembler;LLVMARMDesc;LLVMARMInfo;LLVMARMUtils;LLVMBPFCodeGen;LLVMBPFAsmParser;LLVMBPFDisassembler;LLVMBPFDesc;LLVMBPFInfo;LLVMHexagonCodeGen;LLVMHexagonAsmParser;LLVMHexagonDisassembler;LLVMHexagonDesc;LLVMHexagonInfo;LLVMLanaiCodeGen;LLVMLanaiAsmParser;LLVMLanaiDisassembler;LLVMLanaiDesc;LLVMLanaiInfo;LLVMMipsCodeGen;LLVMMipsAsmParser;LLVMMipsDisassembler;LLVMMipsDesc;LLVMMipsInfo;LLVMMSP430CodeGen;LLVMMSP430Desc;LLVMMSP430Info;LLVMMSP430AsmParser;LLVMMSP430Disassembler;LLVMNVPTXCodeGen;LLVMNVPTXDesc;LLVMNVPTXInfo;LLVMPowerPCCodeGen;LLVMPowerPCAsmParser;LLVMPowerPCDisassembler;LLVMPowerPCDesc;LLVMPowerPCInfo;LLVMRISCVCodeGen;LLVMRISCVAsmParser;LLVMRISCVDisassembler;LLVMRISCVDesc;LLVMRISCVInfo;LLVMRISCVUtils;LLVMSparcCodeGen;LLVMSparcAsmParser;LLVMSparcDisassembler;LLVMSparcDesc;LLVMSparcInfo;LLVMSystemZCodeGen;LLVMSystemZAsmParser;LLVMSystemZDisassembler;LLVMSystemZDesc;LLVMSystemZInfo;LLVMWebAssemblyCodeGen;LLVMWebAssemblyAsmParser;LLVMWebAssemblyDisassembler;LLVMWebAssemblyDesc;LLVMWebAssemblyInfo;LLVMX86CodeGen;LLVMX86AsmParser;LLVMX86Disassembler;LLVMX86Desc;LLVMX86Info;LLVMX86Utils;LLVMXCoreCodeGen;LLVMXCoreDisassembler;LLVMXCoreDesc;LLVMXCoreInfo;LLVMAsmParser;LLVMLineEditor;LLVMProfileData;LLVMCoverage;LLVMPasses;LLVMTextAPI;LLVMDlltoolDriver;LLVMLibDriver;LLVMXRay;LLVMWindowsManifest;LTO")