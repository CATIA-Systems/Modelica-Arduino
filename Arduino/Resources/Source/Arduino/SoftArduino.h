#pragma once

#include <thread>
#include "Event.h"

#include "Arduino.h"

typedef void (*InterruptSeriveRoutine)();

#define interruptToDigitalPin(i)  ((i) == 0 ? 2 : ((i) == 1 ? 3 : NOT_A_PIN))

#define INSTANCE SoftArduino::getInstance()


class SoftInterrupt {

public:
	InterruptSeriveRoutine isr;
	int mode;         // CHANGE = 1, FALLING = 2 or RISING = 3
	int prePotential; // LOW or HIGH

	explicit SoftInterrupt(InterruptSeriveRoutine isr, int mode, int potential) : isr(isr), mode(mode), prePotential(potential) {}

	void update(int potential);

};


class SoftArduino {

public:
	static const int PORT_MODE_INPUT      = 0;
	static const int PORT_MODE_DIGITAL    = 1;
	static const int PORT_MODE_PWM        = 2;
	static const int DEFAULT_PULSE_PERIOD = 2000; // default pulse period in microseconds 

	unsigned long time = 0;                   // current time in micro seconds
	int analogReferenceMode = DEFAULT;        // analog reference mode [DEFAULT, INTERNAL, INTERNAL1V1 or EXTERNAL]
	double potential[NUM_DIGITAL_PINS] = {};  // potential of the pins normalized to the reference voltage
	int portMode[NUM_DIGITAL_PINS] = {};	  // 0 = input, 1 = digital, 2 = PWM
	int pulseWidth[NUM_DIGITAL_PINS] = {};    // pulse width in microseconds
	int pulsePeriod[NUM_DIGITAL_PINS] = { DEFAULT_PULSE_PERIOD }; // pulse period in microseconds

	bool interruptsEnabled = true;

	SoftInterrupt *interrupts[2] = {};

	const char *error = nullptr;

	void update();

	static SoftArduino* getInstance() {
		static SoftArduino instance;
		return &instance;
	}

	std::thread thread;
	std::atomic<bool> terminate;
	Event inputReady;
	Event outputReady;

private:
	explicit SoftArduino();
	~SoftArduino();

	static void runSketch();

};
