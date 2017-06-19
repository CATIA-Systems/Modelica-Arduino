echo Remember the current folder
set START_DIR=%cd%

echo Change into the script's folder
cd %~dp0

echo Set the environment variables
call "%VS140COMNTOOLS%vsvars32.bat"

rem Build the binaries
msbuild VisualStudio\Firmata\Firmata.vcxproj /t:Clean,Build /p:Configuration=Release /p:Platform=win32
msbuild VisualStudio\Firmata\Firmata.vcxproj /t:Clean,Build /p:Configuration=Release /p:Platform=x64

echo Create the distribution files
python dist.py

echo Change back to the original folder
cd %START_DIR%
