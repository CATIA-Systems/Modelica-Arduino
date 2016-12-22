# Simulate Arduino Sketches in Dymola

With the Arduino Modelica library you can try out your sketches in a purely virtual environment.

## Prerequistites

- Dymola 2017 FD01 (Windows)
- Visual Studio 2012

## Simulate a Sketch

Save your sketch

## Arduino API

Functions labeled  `available` can be used in sketches

#### Digital I/O

- pinMode() `available`
- digitalWrite() `available`
- digitalRead() `available`

#### Analog I/O

- analogReference()
- analogRead() `available`
- analogWrite() - PWM `available`

#### Due & Zero only

- analogReadResolution()
- analogWriteResolution()

#### Advanced I/O

- tone()
- noTone()
- shiftOut()
- shiftIn()
- pulseIn()

#### Time

- millis()
- micros()
- delay() `available`
- delayMicroseconds()

#### Math

- min()
- max()
- abs()
- constrain()
- map()
- pow()
- sqrt()

#### Trigonometry

- sin()
- cos()
- tan()

#### Characters

- isAlphaNumeric()
- isAlpha()
- isAscii()
- isWhitespace()
- isControl()
- isDigit()
- isGraph()
- isLowerCase()
- isPrintable()
- isPunct()
- isSpace()
- isUpperCase()
- isHexadecimalDigit()

#### Random Numbers

- randomSeed()
- random()

#### Bits and Bytes

- lowByte()
- highByte()
- bitRead()
- bitWrite()
- bitSet()
- bitClear()
- bit()

#### External Interrupts

- attachInterrupt()
- detachInterrupt()

#### Interrupts

- interrupts()
- noInterrupts()

#### Communication

Serial
Stream

#### USB (32u4 based boards and Due/Zero only)

- Keyboard
- Mouse
