# Simulate Arduino Sketches in Modelica

Simulate your circuits and sketches on a virtual [Arduino Uno](https://www.arduino.cc/en/Main/ArduinoBoardUno)

![alt text](Arduino/Button_Model3.png)


## Prerequistites

- Dymola 2017 FD01 (Windows)
- Visual Studio 2012

## Getting Started

To simulate a sketch named `Blink` you have to perform following steps.

1. Save your sketch as `VisualStudio/Arduino/Blink.ino`

2. Open the Solution `VisualStudio/Arduino.sln` in Visual Studio

3. Open `Arduino > Source Files > Sketch.cpp` and change the #include statement
to include your sketch

```C
...
// include your sketch here
#include "Blink.ino"
...```

4. Press `F7` to build the Arduino code

5. Load the Modelica library `Arduino/package.mo` in Dymola

6. Add an instance of `Arduino/Components/ArduinoUno` to your model

7. Simulate your model

> If you change your sketch you have to re-build the Arduino code and model
> for the change to take effect

## Limitations

Currently you can use only one instance of ArduinoUno in your Modelica model.

## Arduino API

Functions that cannot be used in sketches are ~~striked through~~

#### Digital I/O

- [pinMode()](https://www.arduino.cc/en/Reference/PinMode)
- [digitalWrite()](https://www.arduino.cc/en/Reference/DigitalWrite)
- [digitalRead()](https://www.arduino.cc/en/Reference/DigitalRead)

#### Analog I/O

- ~~analogReference()~~
- [analogRead()](https://www.arduino.cc/en/Reference/AnalogRead)
- ~~analogWrite() - PWM~~

#### Due & Zero only

- ~~analogReadResolution()~~
- ~~analogWriteResolution()~~

#### Advanced I/O

- ~~tone()~~
- ~~noTone()~~
- ~~shiftOut()~~
- ~~shiftIn()~~
- ~~pulseIn()~~

#### Time

- [millis()](https://www.arduino.cc/en/Reference/Millis)
- ~~micros()~~
- [delay()](https://www.arduino.cc/en/Reference/Delay)
- ~~delayMicroseconds()~~

#### Math

- [min()](https://www.arduino.cc/en/Reference/Min)
- [max()](https://www.arduino.cc/en/Reference/Max)
- [abs()](https://www.arduino.cc/en/Reference/Abs)
- [constrain()](https://www.arduino.cc/en/Reference/Constrain)
- [map()](https://www.arduino.cc/en/Reference/Map)
- [pow()](https://www.arduino.cc/en/Reference/Pow)
- [sqrt()](https://www.arduino.cc/en/Reference/Sqrt)

#### Trigonometry

- [sin()](https://www.arduino.cc/en/Reference/Sin)
- [cos()](https://www.arduino.cc/en/Reference/Cos)
- [tan()](https://www.arduino.cc/en/Reference/Tan)

#### Characters

- [isAlphaNumeric()](https://www.arduino.cc/en/Reference/IsAlphaNumeric)
- [isAlpha()](https://www.arduino.cc/en/Reference/IsAlpha)
- [isAscii()](https://www.arduino.cc/en/Reference/IsAscii)
- ~~[isWhitespace()](https://www.arduino.cc/en/Reference/IsWhitespace)~~
- [isControl()](https://www.arduino.cc/en/Reference/IsControl)
- [isDigit()](https://www.arduino.cc/en/Reference/IsDigit)
- [isGraph()](https://www.arduino.cc/en/Reference/IsGraph)
- [isLowerCase()](https://www.arduino.cc/en/Reference/IsLowerCase)
- [isPrintable()](https://www.arduino.cc/en/Reference/IsPrintable)
- [isPunct()](https://www.arduino.cc/en/Reference/IsPunct)
- [isSpace()](https://www.arduino.cc/en/Reference/IsSpace)
- [isUpperCase()](https://www.arduino.cc/en/Reference/IsUpperCase)
- [isHexadecimalDigit()](https://www.arduino.cc/en/Reference/IsHexadecimalDigit)

#### Random Numbers

- [randomSeed()](https://www.arduino.cc/en/Reference/RandomSeed)
- [random()](https://www.arduino.cc/en/Reference/Random)

#### Bits and Bytes

- [lowByte()](https://www.arduino.cc/en/Reference/LowByte)
- [highByte()](https://www.arduino.cc/en/Reference/HighByte)
- [bitRead()](https://www.arduino.cc/en/Reference/BitRead)
- [bitWrite()](https://www.arduino.cc/en/Reference/BitWrite)
- [bitSet()](https://www.arduino.cc/en/Reference/BitSet)
- [bitClear()](https://www.arduino.cc/en/Reference/BitClear)
- [bit()](https://www.arduino.cc/en/Reference/Bit)

#### External Interrupts

- ~~attachInterrupt()~~
- ~~detachInterrupt()~~

#### Interrupts

- ~~interrupts()~~
- ~~noInterrupts()~~

#### Communication

- Serial
- ~~Stream~~

#### USB (32u4 based boards and Due/Zero only)

- ~~Keyboard~~
- ~~Mouse~~
