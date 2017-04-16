echo Remember the current folder
set START_DIR=%cd%

echo Change into the script's folder
cd %~dp0

echo Set the environment variables
call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"

echo Build the sketch
msbuild VisualStudio\Arduino\Arduino.vcxproj /t:Clean,Build /p:Configuration=Release /p:Platform=win32

echo Change back to the original folder
cd %START_DIR%
