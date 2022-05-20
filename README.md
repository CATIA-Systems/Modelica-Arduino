# Simulate Arduino Sketches in Modelica

With the Arduino Modelica library you can simulate your circuits and [sketches](https://www.arduino.cc/en/Tutorial/Sketch) on a virtual [Arduino Uno](https://www.arduino.cc/en/Main/ArduinoBoardUno) and connect your [Modelica](https://www.modelica.org/) models to real-world circuits using the [Firmata protocol](http://www.firmata.org/).

## Prerequisites

- [Dymola](https://www.3ds.com/products-services/catia/products/dymola)
- [Visual Studio](https://visualstudio.microsoft.com/downloads/) 2015 or later
- [CMake](https://cmake.org/download/)

## Getting Started

- download the [latest release](https://github.com/CATIA-Systems/Modelica-Arduino/releases/latest) and extract the archive
- in Dymola select `File > Load...` and open `Arduino/package.mo` from the extracted files
- open `Arduino.Components.ArduinoUno` and set the default values for parameters `cmake` and `generator` to match your installation, e.g.

```Modelica
model ArduinoUno "Virtual Arduino Uno"

  // ...
  parameter String cmake = "C:\\Program Files\\CMake\\bin\\cmake.exe";
  parameter String generator = "Visual Studio 17 2022";
  // ...
```

- select `File > Save` to save your changes
- open `Arduino.Examples.Blink`
- select the `Simulation` ribbon and click `Simulate` to run the simulation
- after the simulation has finished click the `Play` button in the `Animation Control` section and watch the LED `L` blink

![Arduino.Examples.Blink](Arduino/Resources/Images/blink_example.png)

- try the other examples in `Arduino.Examples`

## Simulate your own Sketch

To simulate your sketch `MySketch` you have to perform the following steps.

- save your sketch as `Arduino/Resources/Sketches/MySketch.ino`
- add the block `Arduino.Components.ArduinoUno` to your model
- double-click the block and set the parameter `sketch` to `"MySketch.ino"`
- click `Translate` to re-translate the model when the sketch has changed

## Limitations

- currently you can use only one instance of ArduinoUno in your Modelica model

- the whole [Arduino API](https://www.arduino.cc/en/Reference/HomePage) is supported except for the following functions

	- [analogReadResolution()](https://www.arduino.cc/en/Reference/AnalogReadResolution)
	- [analogWriteResolution()](https://www.arduino.cc/en/Reference/AnalogWriteResolution)
	- [shiftOut()](https://www.arduino.cc/en/Reference/ShiftOut)
	- [shiftIn()](https://www.arduino.cc/en/Reference/ShiftIn)
	- [isWhitespace()](https://www.arduino.cc/en/Reference/IsWhitespace)
	- [Serial](https://www.arduino.cc/en/Reference/Serial) (`print()`, `println()` and `write()` are supported)
	- [Stream](https://www.arduino.cc/en/Reference/Stream)
	- [Keyboard](https://www.arduino.cc/en/Reference/MouseKeyboard)
	- [Mouse](https://www.arduino.cc/en/Reference/MouseKeyboard)

## Arduino Libraries

The following libraries are included and can be used directly.

| Name                            | Description |
|---------------------------------|-------------|
|[Servo.h](Libraries/Servo.h)     | [Servo library](https://www.arduino.cc/en/Reference/Servo) to control RC (hobby) servo motors |
|[PID_v1.h](Libraries/PID_v1.h)   | PID controller library for Arduino |

To use an external library in your sketch copy its header files (`*.h`) and source files (`*.cpp`) to the `Libraries` folder. If the library contains `.cpp` files you have to add them to the `Arduino` project by dragging them from the `Libraries` folder in the file browser onto the `Source Files` folder in the solution explorer.

## How it works

The `ArduinoUno` model is driven by an [`ExternalObject`](Arduino/Internal/ExternalArduino.mo) that contains the compiled sketch and an implementation of the [Arduino API](https://www.arduino.cc/reference/en/). The external object is synchronized at every sample step with the Modelica model.

When a model that contains the `ArduinoUno` block is translated the external object is automatically re-built through the `preInstantiate=Arduino.Internal.buildSketch()` directive in its annotation.

This function writes a new `Sketch.cpp` to `Arduino/Resources/Source/Arduino` that includes the sketch currently selected in the `ArduinoUno` component, calls CMake to generate the Visual Studio Solution, and builds the shared library `Arduino/Resources/Library/{win32|win64}/ModelicaArduino.dll` that contains the implementation of the external object.

## Debugging a Sketch

- translate and simulate the model you want to debug
- open `Arduino/Resources/Source/Arduino/Win32/Arduino.sln` (or `Arduino/Resources/Source/Arduino/x64/Arduino.sln` if `Advanced.CompileWith64 = 2`)
- select `Debug` as configuration
- open the settings of the `ModelicaArduino` project and under `Debug` set `Command` to `dymosim.exe` and `Working Directory` to your current Dymola working directory
- open the sketch in Visual Studio and set a breakpoint
- start debugging

## Copyright and License

Copyright &copy; 2022 [Dassault Systèmes](https://www.3ds.com/). The code is licensed [GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html), the documentation [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
