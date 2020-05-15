# example-llvm-clangtool
This is an example helping you build your cross-platform clangtool utility with CMake quickly on Windows/Linux/macOS(x).

——————————————————————————————————————————————————

## Start

Please build `llvm-project` from source code at first, then set the following vairables depending on where is your location of llvm-project.
1. `$LLVMDirPathWin` and/or
2. `$LLVMDirPathLinux` 


- If you have no idea about how to build LLVM-Project, have a read the document([how-to-build-llvm.md](https://github.com/dougpuob/cpp-namelint/blob/master/doc/how-to-build-llvm.md)).


- The following script is an PowerShell script, you can do the following command on your console directly too. [How to install powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7)


```powershell
clear

# Create build folder
if (Test-Path('build')) {
    Remove-Item build -Force
}
New-Item -Type Directory build

# You have to change the variable if your LLVM-Project was located at different place.
$LLVMDirPathWin   ='C:\my-work\opensrc\llvm\llvm-project\llvm-project.git--10.0.0\build'
$LLVMDirPathLinux ='/home/gliadmin/llvm-project--8.0.0.git/build/release'

# create configuration then build it by CMake.
Push-Location build
if ($IsWindows) {
    $env:LLVM_DIR=$LLVMDirPathWin
    echo $env:LLVM_DIR

    cmake .. -G "Visual Studio 16 2019"
    cmake --build . --config Debug      # Debug | Release
}
elseif ($IsLinux) {
    $env:LLVM_DIR=$LLVMDirPathLinux
    echo $env:LLVM_DIR

    cmake .. -G "Unix Makefiles"
    cmake --build . --config Release    # Debug | Release
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