
call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"

cl -c ModelicaArduino.cpp

lib ModelicaArduino.obj -OUT:ModelicaArduino.lib

copy /Y ModelicaArduino.lib ..\Library\win32

pause
