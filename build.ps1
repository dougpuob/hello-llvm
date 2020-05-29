clear


# Create build folder
if (Test-Path('build')) {
    Remove-Item build -Force
}
New-Item -Type Directory build


# You have to change the variable if your LLVM-Project was located at different place.
$env:LLVM_BUILD_TYPE  = 'Release'
$env:LLVM_ROOT_DIR    = 'C:\petzone\llvm\llvm-project.git--10.0.0--release'


#$env:Clang_DIR      = 'C:\petzone\llvm\llvm-project.git--10.0.0\build'
#$env:Clang_DIR       = 'C:\petzone\llvm\llvm-project.git--10.0.0-release\build'
#$LLVM8DirPathLinux  = '/home/dougpuob/petzone/llvm-project--8.0.0.git--release-shrinked/build/release'
#$LLVM10DirPathLinux = '/home/dougpuob/petzone/llvm-project--10.0.0.git--release-shrinked/build/release'


# create configuration then build it by CMake.
Push-Location build
if ($IsWindows) {
    cmake .. -G "Visual Studio 16 2019"
    cmake --build . --config $env:LLVM_BUILD_TYPE
}
elseif ($IsLinux) {
    cmake .. -G "Unix Makefiles"
    cmake --build . --config $env:LLVM_BUILD_TYPE
}
elseif ($IsMacOS) {
}

Pop-Location
