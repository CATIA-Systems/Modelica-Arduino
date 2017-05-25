rem Remember the current folder
set START_DIR=%cd%

rem Change into the script's folder
cd %~dp0

set RESULT=0

echo Run the tests
python test.py
if %ERRORLEVEL% neq 0 set RESULT=1

rem Change back to the original folder
cd %START_DIR%

exit /B %RESULT%
