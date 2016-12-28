#pragma once

#include "Arduino.h"

typedef void (*InterruptSeriveRoutine)();

#define interruptToDigitalPin(i)  ((i) == 0 ? 2 : ((i) == 1 ? 3 : NOT_A_PIN))

class SoftInterrupt {

public:
	InterruptSeriveRoutine isr;
	int mode; // CHANGE = 1, FALLING = 2 or RISING = 3
	int prePotential; // LOW or HIGH

	explicit SoftInterrupt(InterruptSeriveRoutine isr, int mode, int potential) : isr(isr), mode(mode), prePotential(potential) {}

	void update(int potential);

};

class SoftArduino {

public:
	volatile double time;
	volatile int analogReferenceMode;			 // analog reference mode [DEFAULT, INTERNAL, INTERNAL1V1 or EXTERNAL]
	volatile int analog[NUM_ANALOG_INPUTS];       // voltages of the analog pins
	volatile int digital[NUM_DIGITAL_PINS];       // voltages of the digital pins
	volatile int portMode[NUM_DIGITAL_PINS];		 // 0 = input, 1 = digital, 2 = PWM
	volatile int pulseWidth[NUM_DIGITAL_PINS];    // pulse width [0,255]

	const char *error;

	static SoftArduino instance;

	explicit SoftArduino() : time(0), analogReferenceMode(DEFAULT), error(NULL) {
		interrupts[0] = nullptr;
		interrupts[1] = nullptr;
	}
	
	SoftInterrupt *interrupts[2];

};
