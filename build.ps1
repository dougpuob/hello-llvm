clear

# Create build folder
if (Test-Path('build')) {
    Remove-Item build -Force
}
New-Item -Type Directory build

# You have to change the variable if your LLVM-Project was located at different place.
$BuildType          = 'Release'
$LLVM8DirPathWin    = 'D:\petzone\llvm\llvm-project.git--8.0.0-release-shrinked\build'
$LLVM10DirPathWin   = 'D:\petzone\llvm\llvm-project.git--10.0.0-release-shrinked\build'
$LLVM8DirPathLinux  = '/home/dougpuob/petzone/llvm-project--8.0.0.git--release-shrinked/build/release'
$LLVM10DirPathLinux = '/home/dougpuob/petzone/llvm-project--10.0.0.git--release-shrinked/build/release'


# create configuration then build it by CMake.
Push-Location build
if ($IsWindows) {
    $SelectedLLVMDir=$LLVM10DirPathWin
    $env:LLVM_DIR=$SelectedLLVMDir
    echo $env:LLVM_DIR

    cmake .. -G "Visual Studio 16 2019"
    cmake --build . --config $BuildType
}
elseif ($IsLinux) {
    $SelectedLLVMDir=$LLVM10DirPathLinux
    $env:LLVM_DIR=$SelectedLLVMDir
    echo $env:LLVM_DIR

    cmake .. -G "Unix Makefiles"
    cmake --build . --config $BuildType
}
elseif ($IsMacOS) {
}

Pop-Location