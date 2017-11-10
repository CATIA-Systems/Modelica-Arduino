echo Remember the current folder
set START_DIR=%cd%

echo Change into the script's folder
cd /d %~dp0

echo Build the 32-bit library
call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" x86
nmake clean build TARGET=..\..\Library\win32\ModelicaArduino.lib

echo Build the 64-bit library
call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" x86_amd64
nmake clean build TARGET=..\..\Library\win64\ModelicaArduino.lib

echo Change back to the original folder
cd %START_DIR%
