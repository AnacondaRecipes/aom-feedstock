@echo on

mkdir ..\build-stage
cd ..\build-stage

cmake -G "NMake Makefiles" ^
      -DCMAKE_BUILD_TYPE="Release"                 ^
      -DCMAKE_INSTALL_PREFIX=${PREFIX}             ^
      -DCMAKE_INSTALL_LIBDIR:PATH=${PREFIX}/lib    ^
      -DBUILD_SHARED_LIBS=ON                       ^
      -DENABLE_DOCS=OFF                            ^
      -DENABLE_EXAMPLES=ON                         ^
      -DENABLE_TESTS=OFF                           ^
      ..

if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
