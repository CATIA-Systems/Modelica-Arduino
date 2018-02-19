# Changelog

## [0.1.0] (2018-02-19)

### Added
- 6 degree-of-freedom robot arm model w/ 3-d animation (replaces Braccio)

### Changed
- PWM signals are now generated w/o sample() operator for Modelica compliance
- Compile external ArduinoUno object as dynamic instead of static library


## [0.0.5] (2017-11-13)

### Added
- Experimental support for 3DEXPERIENCE DBM
- documentation strings in models

### Changed
- Arduino.Components.ArduinoUno changed from block to model to avoid warnings
- source code moved to Arduino/Resources to support import into DBM
- sketch is now built with nmake insteaad of msbuild to support Visual Studio Express


## [0.0.4] (2017-07-27)

### Added
- Servo library and models
- Braccio library and examples
- Firmata package to connect Modelica models to the real world

### Changed
- Arduino block changed to schematic design


## [0.0.3] (2017-05-25)

### Added
- Automatic build of the sketch


## [0.0.2] (2017-01-26)

### Added
- HTML documentation added
- Help boxes added to examples


## [0.0.1] (2017-01-24)

### Added
- Arduino API support extended
- Examples added
- External library support added
- Documentation extended
- Digital pins changed from analog voltage to PWM
- Ultrasonic range finder model added


## [0.0.0] (2016-12-26)

### Added
- Initial version
