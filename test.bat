set SEVENZIP="C:\Program Files\7-Zip\7z.exe"

rem Remember the current folder
set START_DIR=%cd%

rem Change into the script's folder
cd %~dp0

rem Clean up
rmdir /s /q Temp

set RESULT=0

echo Extract the ZIP archive
%SEVENZIP% x Modelica-Arduino.zip -oTemp

echo Copy the test script to the Temp folder
copy test.py Temp\

echo Run the tests
python Temp\test.py
if %ERRORLEVEL% neq 0 set RESULT=1

rem Change back to the original folder
cd %START_DIR%

exit /B %RESULT%
