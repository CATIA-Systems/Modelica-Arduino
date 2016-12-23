# Simulate Arduino Sketches in Dymola

With the Arduino Modelica library you can try out your sketches in a purely virtual environment.

## Prerequistites

- Dymola 2017 FD01 (Windows)
- Visual Studio 2012

## Simulate a Sketch

1. Save your sketch as `Arduino/Resources/C-Sources/sketch.ino`
2. Load the Arduino library in Dymola
3. Create an instance of `Arduino/Components/ArduinoUno` in your model
4. Simulate your model

> Hint: if you change your sketch you have to re-build the model

## Limitations

Currently you can use only one instance of ArduinoUno in your Modelica model.

## Arduino API

Functions that cannot be used in sketches are ~~striked through~~

#### Digital I/O

- ~~pinMode()~~
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

- millis()
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
