rem Clean up
del Arduino\Resources\Library\win32\*.lib
del /s /q Arduino\*.bak-mo
del /s /q VisualStudio\Arduino.sdf
rmdir /s /q VisualStudio\Release
rmdir /s /q VisualStudio\Arduino\Release
rmdir /s /q dist

rem Create the distribution directories
mkdir dist
mkdir dist\Arduino
mkdir dist\Libraries
mkdir dist\Sketches
mkdir dist\VisualStudio

rem Create the distribution directories
copy CHANGELOG.md dist\CHANGELOG.md
copy LICENSE dist\LICENSE
copy README.md dist\README.md
xcopy Arduino dist\Arduino /s /e
xcopy VisualStudio dist\VisualStudio /s /e
xcopy Sketches dist\Sketches /s /e

rem Create the ZIP archive
rem git rev-parse --abbrev-ref HEAD
"C:\Program Files\7-Zip\7z.exe" a ModelicaArduino-snapshot+%date:~6,4%%date:~3,2%%date:~0,2%.zip .\dist\*

pause
