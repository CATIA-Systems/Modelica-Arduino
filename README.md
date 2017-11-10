# Simulate Arduino Sketches in Modelica

With the Arduino Modelica library you can simulate your circuits and sketches on a virtual [Arduino Uno](https://www.arduino.cc/en/Main/ArduinoBoardUno) and connect your [Modelica](https://www.modelica.org/) models to real-world circuits using the [Firmata protocol](http://www.firmata.org/).


## Prerequisites

- [Dymola](https://www.3ds.com/products-services/catia/products/dymola) 2017 FD01 or later
- Visual Studio 2015


## Getting Started

- download the [latest release](releases/latest) and extract the archive
- in Dymola select `File > Open...` and open `Arduino/package.mo` from the extracted files
- in the package browser double-click `Arduino.Examples.Blink`
- right-click on the toolbar and check `Simulation` and `Animation` to view the simulation and animation toolbars
- open the `Simulation Setup` ![Setup Button](Arduino/Resources/Images/setup_button.png) and on the `Compiler` tab select `Visual Studio 2015/Visual Studio C++ Express Edition (14.0)` 
- click ![Simulate Button](Arduino/Resources/Images/simulate_button.png) to run the Simulation
- after the simulation has finished click ![Run Button](Arduino/Resources/Images/run_button.png) in the animation toolbar and watch the LED `L` blink

![Arduino.Examples.Blink](Arduino/Resources/Images/blink_example.png)

- try the other examples in `Arduino.Examples`


## Simulate your Sketch

To simulate your sketch `MySketch` you have to perform the following steps.

- save your sketch as `Arduino/Resources/Sketches/MySketch.ino`
- add the block `Arduino.Components.ArduinoUno` to your model
- double-click the block and set the parameter `sketch` to `"MySketch.ino"`


## Limitations

- currently you can use only one instance of ArduinoUno in your Modelica model

- the whole [Arduino API](https://www.arduino.cc/en/Reference/HomePage) is supported except for the following functions

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


## Arduino Libraries

The following libraries are included and can be used directly.

| Name                            | Description |
|---------------------------------|-------------|
|[Servo.h](Libraries/Servo.h)     | [Servo library](https://www.arduino.cc/en/Reference/Servo) to control RC (hobby) servo motors |
|[Braccio.h](Libraries/Braccio.h) | control the [Braccio](http://www.arduino.org/products/tinkerkit/arduino-tinkerkit-braccio) robot arm |
|[PID_v1.h](Libraries/PID_v1.h)   | PID controller library for Arduino |

To use an external library in your sketch copy its header files (`*.h`) and source files (`*.cpp`) to the `Libraries` folder. If the library contains `.cpp` files you have to add them to the `Arduino` project by dragging them from the `Libraries` folder in the file browser onto the `Source Files` folder in the solution explorer.


## License

The code is licensed [GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html), the documentation [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

----------------------------

Developed by Torsten Sommer at [Dassault Systèmes](https://www.3ds.com/). Copyright &copy; 2017 Dassault Systèmes.
