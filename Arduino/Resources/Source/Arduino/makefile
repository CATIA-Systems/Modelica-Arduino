INCLUDE_DIRS = \
	/I"." \
	/I"..\..\Include" \
	/I"..\..\Sketches"

SRC_FILES = \
	Braccio.cpp \
	PID_v1.cpp \
	Servo.cpp \
	ModelicaArduino.cpp \
	Print.cpp \
	Sketch.cpp \
	SoftArduino.cpp \
	WMath.cpp

OBJ_FILES = $(SRC_FILES:.cpp=.obj)

TARGET = "..\..\Library\win32\ModelicaArduino.lib"

clean:
	del *.obj
	del $(TARGET)

build:
	cl /c /D "WIN32" /D "ARDUINO=100" /D "NDEBUG" /D "_LIB" $(INCLUDE_DIRS) $(SRC_FILES)
	lib /out:$(TARGET) *.obj
