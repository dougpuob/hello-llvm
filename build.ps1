#===----------------------------------------------------------------------===#
#
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
#===----------------------------------------------------------------------===#clear
clear

#-----------------------------------------------------------------------------
# Create build folder
#-----------------------------------------------------------------------------
if (Test-Path('build')) {
    Remove-Item build -Force
}
New-Item -Type Directory build


#-----------------------------------------------------------------------------
# Enter to build folder then build this project.
#
# $env:LLVM_VERSION     = LLVM version
# $env:LLVM_BUILD_TYPE  = LLVM build folder in root folder
# $env:LLVM_ROOT_DIR    = LLVM source code root folder
#---------------------------------------------------------------------------
Push-Location build

$env:LLVM_VERSION    = '10.0.0'
if ($IsWindows) {
    $env:LLVM_BUILD_TYPE = 'Release'
    $env:LLVM_ROOT_DIR   = 'C:\petzone\llvm\llvm-project-llvmorg-10.0.0-release'
    
    cmake .. -G "Visual Studio 16 2019"
    cmake --build . --config $env:LLVM_BUILD_TYPE
}
elseif ($IsLinux) {
    $env:LLVM_BUILD_TYPE = 'release'
    $env:LLVM_ROOT_DIR   = '/mnt/c/petzone/llvm/llvm-project-10.0.0-ubuntu18.04-release-shrinking'
    
    cmake .. -G "Unix Makefiles"
    cmake --build . --config $env:LLVM_BUILD_TYPE
}
elseif ($IsMacOS) {
}

Pop-Location
