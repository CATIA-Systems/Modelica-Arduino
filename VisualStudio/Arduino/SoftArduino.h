#pragma once

#include "Arduino.h"

class SoftArduino {

public:
	volatile double time;
	int analog[NUM_ANALOG_INPUTS];       // voltages of the analog pins
	int digital[NUM_DIGITAL_PINS];       // voltages of the digital pins
	int portMode[NUM_DIGITAL_PINS];		 // 0 = input, 1 = digital, 2 = PWM
	int pulseWidth[NUM_DIGITAL_PINS];    // pulse width [0,255]

	const char *error;

	static SoftArduino instance;

	SoftArduino() : time(0), error(NULL) {

	}

};
