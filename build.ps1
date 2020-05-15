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