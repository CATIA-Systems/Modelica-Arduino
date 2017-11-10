gcc -c -std=c++11 -I. -I"..\..\Include" -I"..\..\Sketches" -D"ARDUINO=100" PID_v1.cpp ModelicaArduino.cpp Print.cpp Sketch.cpp SoftArduino.cpp WMath.cpp
ar rcs ..\..\Library\win64\ModelicaArduino.lib *.o
