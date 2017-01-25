# Simulate Arduino Sketches in Modelica

Simulate your circuits and sketches on a virtual [Arduino Uno](https://www.arduino.cc/en/Main/ArduinoBoardUno)

![Circuit w/ Arduino](Arduino/Resources/Images/led_circuit.png)


## Prerequistites

- Dymola 2017 FD01 (Windows)
- Visual Studio 2012

## Getting Started

To simulate a sketch named `Blink` you have to perform the following steps.

- Save your sketch as `Sketches/Blink.ino`

- Open `VisualStudio/Arduino.sln` in Visual Studio

- In the top toolbar set the solution configuration to `Release` and the platform to `Win32`

![Visual Studio Solution Configuration](Arduino/Resources/Images/solution_config.png)

- Open `Arduino > Source Files > Sketch.cpp` and change the #include statement
to include your sketch

```C
// include your sketch here
#include "Blink.ino"
```

- Right-click on the solution in the Solution Explorer and select `Build Solution` to build the Arduino library. `NOTE: `You have to repeat this step every time you make changes to your sketch.

![Solution Context Menu](Arduino/Resources/Images/build_solution.png)

- Load the Modelica library `Arduino/package.mo` in Dymola

- Add an instance of `Arduino/Components/ArduinoUno` to your model

- Simulate your model

## Limitations

- Currently you can use only one instance of ArduinoUno in your Modelica model

- The whole [Arduino API](https://www.arduino.cc/en/Reference/HomePage) is supported except for the following functions

	- [analogReadResolution()](https://www.arduino.cc/en/Reference/AnalogReadResolution)
	- [analogWriteResolution()](https://www.arduino.cc/en/Reference/AnalogWriteResolution)
	- [tone()](https://www.arduino.cc/en/Reference/Tone)
	- [noTone()](https://www.arduino.cc/en/Reference/NoTone)
	- [shiftOut()](https://www.arduino.cc/en/Reference/ShiftOut)
	- [shiftIn()](https://www.arduino.cc/en/Reference/ShiftIn)
	- [isWhitespace()](https://www.arduino.cc/en/Reference/IsWhitespace)
	- [Serial](https://www.arduino.cc/en/Reference/Serial) `print(), println() and write() are supported`
	- [Stream](https://www.arduino.cc/en/Reference/Stream)
	- [Keyboard](https://www.arduino.cc/en/Reference/MouseKeyboard)
	- [Mouse](https://www.arduino.cc/en/Reference/MouseKeyboard)

## Using Libraries

To use a library in your sketch copy its header files (`*.h`) and source files (`*.cpp`) to the `Libraries` folder. If the library contains `.cpp` files you have to add them to the `Arduino` project by dragging them from the `Libraries` folder in the file browser onto the `Source Files` folder in the solution explorer.

## License

The code is licensed [GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html), the documentation [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

----------------------------

Developed by Torsten Sommer at [Dassault Systèmes](https://www.3ds.com/). Copyright 2017 Dassault Systèmes.
