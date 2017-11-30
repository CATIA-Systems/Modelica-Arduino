INCLUDE_DIRS = \
	/I"." \
	/I"..\..\Include" \
	/I"..\..\Sketches"

SRC_FILES = \
	Braccio.cpp \
	ModelicaArduino.cpp \
	ModelicaUtilities.cpp \
	PID_v1.cpp \
	Print.cpp \
	Servo.cpp \
	Sketch.cpp \
	SoftArduino.cpp \
	WMath.cpp

# default target
TARGET = "..\..\Library\win32\ModelicaArduino.dll"

clean:
	del *.obj
	del $(TARGET)

build:
	cl /D "WIN32" /D "ARDUINO=100" /D "NDEBUG" $(INCLUDE_DIRS) $(SRC_FILES) /link /DLL /out:$(TARGET)
