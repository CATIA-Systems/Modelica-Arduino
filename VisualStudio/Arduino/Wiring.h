#include "Arduino.h"

class ArduinoUno {

public:
	volatile double time;
	double analog[NUM_ANALOG_INPUTS];     // voltages of the analog pins
	double digital[NUM_DIGITAL_PINS];     // voltages of the digital pins
	int portMode[NUM_DIGITAL_PINS];       // 0 = input, 1 = digital, 2 = PWM
	double pulseWidth[NUM_DIGITAL_PINS];

	const char *error;

	static ArduinoUno instance;

	ArduinoUno() : time(0), error(NULL) {

	}

};
