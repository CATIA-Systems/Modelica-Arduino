echo Remember the current folder
set START_DIR=%cd%

echo Change into the script's folder
cd %~dp0

echo Create the distribution files
python dist.py

echo Change back to the original folder
cd %START_DIR%
