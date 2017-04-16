rem Disable delayed expansion to allow "!" in 7-Zip command
setlocal DISABLEDELAYEDEXPANSION

set SEVENZIP="C:\Program Files\7-Zip\7z.exe"

echo Remember the current folder
set START_DIR=%cd%

echo Change into the script's folder
cd %~dp0

echo Create the distribution files
python dist.py

echo Copy the build script
copy build_sketch.bat dist\

echo Create the ZIP archive
%SEVENZIP% a -r -x!.* Arduino-Modelica.zip .\dist\*

echo Change back to the original folder
cd %START_DIR%
