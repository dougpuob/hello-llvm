$env:LLVM_DIR='D:\working-folder\opensrc\llvm\llvm-project\llvm-project.git--llvmorg-9.0.0-dev\build\debug'
echo $env:LLVM_DIR

Push-Location build
cmake .. -G "Visual Studio 16"
cmake --build . --config Debug
Pop-Location