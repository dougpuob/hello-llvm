# example-llvm-clangtool
This is an example helping you build your cross-platform clangtool utility with CMake quickly on Windows/Linux/macOS(x).

![Diagram](https://i.ibb.co/QCd5CWX/2020-06-06-002649-1.png)

——————————————————————————————————————————————————

## Start

Please build `llvm-project` from source code at first, then set the following vairables depending on where is your location of llvm-project.
1. `$LLVMDirPathWin` and/or
2. `$LLVMDirPathLinux`


- If you have no idea about how to build LLVM-Project, have a read the document([how-to-build-llvm.md](https://github.com/dougpuob/cpp-namelint/blob/master/doc/how-to-build-llvm.md)).

- Or you can download prebuilt packages here ([GoogleDrive](https://reurl.cc/arXKaQ))

- The following script is an PowerShell script, you can do the following command on your console directly too. [How to install powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7)


``` powershell
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
```

——————————————————————————————————————————————————

## Author
Douglas Chen <dougpuob@gmail.com>


——————————————————————————————————————————————————

## License
MIT