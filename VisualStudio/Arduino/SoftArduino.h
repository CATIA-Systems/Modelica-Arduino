#pragma once

#include "Arduino.h"

typedef void (*InterruptSeriveRoutine)();

#define interruptToDigitalPin(i)  ((i) == 0 ? 2 : ((i) == 1 ? 3 : NOT_A_PIN))

#define DEFAULT_PULSE_WIDTH 2000  // default pulse width in microseconds 


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
	volatile unsigned long time = 0;                 // current time in micro seconds
	volatile int analogReferenceMode = DEFAULT;      // analog reference mode [DEFAULT, INTERNAL, INTERNAL1V1 or EXTERNAL]
	volatile int analog[NUM_ANALOG_INPUTS] = {};     // voltages of the analog pins [0, 255]
	volatile int digital[NUM_DIGITAL_PINS] = {};     // voltages of the digital pins [0, 255]
	volatile int portMode[NUM_DIGITAL_PINS] = {};	 // 0 = input, 1 = digital, 2 = PWM
	volatile int pulseWidth[NUM_DIGITAL_PINS] = {};  // pulse width in microseconds
	volatile int pulsePeriod[NUM_DIGITAL_PINS] = {}; // pulse period in microseconds

	volatile bool interruptsEnabled = true;
	SoftInterrupt *interrupts[2] = {};

	const char *error = nullptr;

	static SoftArduino instance;

	explicit SoftArduino();
	
};
