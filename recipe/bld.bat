@echo on

mkdir ..\build-stage
cd ..\build-stage

cmake -G "NMake Makefiles"                           ^
      -DCMAKE_BUILD_TYPE="Release"                   ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_LIBDIR="lib"                   ^
      -DBUILD_SHARED_LIBS=ON                         ^
      -DENABLE_DOCS=OFF                              ^
      -DENABLE_EXAMPLES=ON                           ^
      -DENABLE_TESTS=OFF                             ^
      %SRC_DIR%

if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

rem Shared-only package: drop static import (matches Unix rm *.a in build.sh)
if exist "%LIBRARY_LIB%\aom_static.lib" del /f "%LIBRARY_LIB%\aom_static.lib"
if errorlevel 1 exit 1
