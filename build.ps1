clear

# ==---------------------------------------------------------------------------
# Create build folder
# ==---------------------------------------------------------------------------
if (Test-Path('build')) {
    Remove-Item build -Force
}
New-Item -Type Directory build


# ==---------------------------------------------------------------------------
# Enter to build folder then build this project.
#
# $env:LLVM_VERSION     = LLVM version
# $env:LLVM_BUILD_TYPE  = LLVM build folder in root folder
# $env:LLVM_ROOT_DIR    = LLVM source code root folder
# ==---------------------------------------------------------------------------
Push-Location build

$env:LLVM_VERSION    = '10.0.0'
$env:LLVM_BUILD_TYPE = 'Release'
if ($IsWindows) {
    $env:LLVM_ROOT_DIR = 'C:\petzone\llvm\llvm-project.git--10.0.0-release-shrinked'
    cmake .. -G "Visual Studio 16 2019"
    cmake --build . --config $env:LLVM_BUILD_TYPE
}
elseif ($IsLinux) {
    $env:LLVM_ROOT_DIR = '/home/dougpuob/petzone/llvm-project--10.0.0.git--release-shrinked'
    cmake .. -G "Unix Makefiles"
    cmake --build . --config $env:LLVM_BUILD_TYPE
}
elseif ($IsMacOS) {
}

Pop-Location
