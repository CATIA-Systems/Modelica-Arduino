#include <math.h>
#include "SoftArduino.h"
#include "ModelicaUtilities.h"


static void assertPin(uint8_t pin) {
	if (pin >= NUM_DIGITAL_PINS) {
		ModelicaFormatError("Pin must be < NUM_DIGITAL_PINS = %d but was %d.", NUM_DIGITAL_PINS, pin);
	}
}

void SoftInterrupt::update(int potential) {

	bool executeISR = false;

	switch(mode) {
	case RISING:
		executeISR = prePotential == LOW && potential == HIGH;
		break;
	case FALLING:
		executeISR = prePotential == HIGH && potential == LOW;
		break;
	case CHANGE:
		executeISR = prePotential != potential;
		break;
	}

	prePotential = potential;

	if (executeISR) {
		// execute the service routine
		isr();
	}

}

void pinMode(uint8_t pin, uint8_t mode) {
	//ModelicaFormatMessage("pinMode(%d, %d)\n", pin, mode);

	assertPin(pin);

	switch (mode) {
	case INPUT:
	case INPUT_PULLUP:
		INSTANCE->portMode[pin] = SoftArduino::PORT_MODE_INPUT;
		break;
	case OUTPUT:
		INSTANCE->portMode[pin] = SoftArduino::PORT_MODE_DIGITAL;
		break;
	default:
		ModelicaFormatError("Error calling pinMode(). Mode must be one of INPUT = 0, OUTPUT = 1 or INPUT_PULLUP = 2 but was %d.", mode);
	}
}

void digitalWrite(uint8_t pin, uint8_t val) {

	assertPin(pin);

	INSTANCE->pulseWidth[pin] = (val == HIGH) ? SoftArduino::DEFAULT_PULSE_PERIOD : 0;

	//ModelicaFormatMessage("digitalWrite(%d, %d) -> %d\n", pin, val, INSTANCE.pulseWidth[pin]);
}

int digitalRead(uint8_t pin) {

	assertPin(pin);

	return INSTANCE->potential[pin] > 0.5 ? HIGH : LOW;
}

int analogRead(uint8_t pin) {

	assertPin(pin);

	if (pin < A0 || pin > A7) {
		ModelicaFormatError("Illegal analog pin: %d\n", pin);
	}
	
	return round(INSTANCE->potential[pin] * 1023);
}

void analogReference(uint8_t mode) {
	
	switch(mode) {
	case DEFAULT:
	//case INTERNAL:
	//case INTERNAL1V1:
	case EXTERNAL:
		INSTANCE->analogReferenceMode = mode;
		break;
	default:
		ModelicaFormatError("Illegal analog reference mode: %d\n", mode);
		break;
	}
}

void analogWrite(uint8_t pin, int val) {

	assertPin(pin);

	INSTANCE->portMode[pin] = SoftArduino::PORT_MODE_PWM;
	INSTANCE->pulseWidth[pin] = int((val / 255.) * SoftArduino::DEFAULT_PULSE_PERIOD);

	//ModelicaFormatMessage("analogWrite(%d, %d) -> %d\n", pin, val, INSTANCE.pulseWidth[pin]);
}

unsigned long millis() {
	return INSTANCE->time / 1000;
}

unsigned long micros() {
	return INSTANCE->time;
}

void delay(unsigned long ms) {

	//ModelicaFormatMessage("delay(%d) at %g s\n", ms, INSTANCE.time * 1e-6);
	
	const unsigned long endTime = INSTANCE->time + ms * 1000;

	while (INSTANCE->time < endTime) {
		INSTANCE->outputReady.set();
		INSTANCE->inputReady.wait();
	}
}

void delayMicroseconds(unsigned int us) {
	
	const unsigned long endTime = INSTANCE->time + us;
	
	while (INSTANCE->time < endTime) {
		INSTANCE->outputReady.set();
		INSTANCE->inputReady.wait();
	}
}

void shiftOut(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder, uint8_t val) {

	for (uint8_t i = 0; i < 8; i++) {

		if (bitOrder == LSBFIRST) {
			digitalWrite(dataPin, val & 1);
			val >>= 1;
		} else {
			digitalWrite(dataPin, (val & 128) != 0);
			val <<= 1;
		}

		INSTANCE->outputReady.set();
		INSTANCE->inputReady.wait();

		digitalWrite(clockPin, HIGH);

		INSTANCE->outputReady.set();
		INSTANCE->inputReady.wait();

		digitalWrite(clockPin, LOW);

		INSTANCE->outputReady.set();
		INSTANCE->inputReady.wait();
	}
}

uint8_t shiftIn(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder) {
	
	uint8_t value = 0;

	for (uint8_t i = 0; i < 8; ++i) {

		digitalWrite(clockPin, HIGH);

		INSTANCE->outputReady.set();
		INSTANCE->inputReady.wait();

		if (bitOrder == LSBFIRST) {
			value |= digitalRead(dataPin) << i;
		} else {
			value |= digitalRead(dataPin) << (7 - i);
		}

		digitalWrite(clockPin, LOW);

		INSTANCE->outputReady.set();
		INSTANCE->inputReady.wait();
	}

	return value;
}

void attachInterrupt(uint8_t interrupt, void (*isr)(void), int mode) {

	// ModelicaFormatMessage("attachInterrupt(%d, %d, %d)\n", interrupt, isr, mode);

	if (interrupt != 0 && interrupt != 1) {
		ModelicaFormatError("Illegal interrupt: %d", interrupt);
	}

	const int pin = interruptToDigitalPin(interrupt);
	const int potential = INSTANCE->potential[pin] > 0.5 ? HIGH : LOW;
	INSTANCE->interrupts[interrupt] = new SoftInterrupt(isr, mode, potential);
}

void detachInterrupt(uint8_t interrupt) {
	auto ir = INSTANCE->interrupts[interrupt];
	INSTANCE->interrupts[interrupt] = nullptr;
	delete ir;
}

void interrupts() { 
	INSTANCE->interruptsEnabled = true;
}

void noInterrupts() {
	INSTANCE->interruptsEnabled = false;
}

unsigned long pulseIn(const uint8_t pin, const uint8_t state, unsigned long timeout) {

	assertPin(pin);

	unsigned long currentTime = INSTANCE->time;
	const unsigned long endTime = currentTime + timeout;
	uint8_t preState = INSTANCE->potential[pin] > 0.5 ? HIGH : LOW;
	long startTime = -1;

	// until the timeout is reached...
	while(currentTime < endTime) {

		const uint8_t currentState = INSTANCE->potential[pin] > 0.5 ? HIGH : LOW;
		currentTime = INSTANCE->time;

		if (startTime < 0 && preState != state && currentState == state) {

				// start measurement
				startTime = currentTime;

		} else if (startTime >= 0 && preState == state && currentState != state) {

				// return the elapsed time
				return currentTime - startTime;
		}

		// remember the state
		preState = currentState;

		INSTANCE->outputReady.set();
		INSTANCE->inputReady.wait();
	}

	// timed out
	return 0;
}

unsigned long pulseInLong(uint8_t pin, uint8_t state, unsigned long timeout) {
	return pulseIn(pin, state, timeout);
}

void tone(uint8_t pin, unsigned int frequency, unsigned long duration) {

	assertPin(pin);

	const int period = static_cast<int>(1e6 / frequency);  // period in microseconds

	INSTANCE->portMode[pin] = SoftArduino::PORT_MODE_PWM;
	INSTANCE->pulseWidth[pin] = period / 2;
	INSTANCE->pulsePeriod[pin] = period;

	if (duration > 0) {
		delay(duration);
	}
}

void noTone(uint8_t pin) {

	assertPin(pin);

	INSTANCE->portMode[pin] = SoftArduino::PORT_MODE_DIGITAL;
	INSTANCE->pulseWidth[pin] = 0;
}

SoftArduino::SoftArduino() : 
	terminate(false), 
	inputReady(false, false), 
	outputReady(false, false) {

	// intialize pulsePeriod
	for (int i = 0; i < NUM_DIGITAL_PINS; i++) {
		pulsePeriod[i] = DEFAULT_PULSE_PERIOD;
	}

	thread = std::thread(runSketch);
}

SoftArduino::~SoftArduino() {
	terminate = true;
	INSTANCE->inputReady.set();
	thread.join();
}

void SoftArduino::update() {
	INSTANCE->inputReady.set();
	INSTANCE->outputReady.wait();
}

void SoftArduino::runSketch() {

	INSTANCE->inputReady.wait();

	setup();

	INSTANCE->outputReady.set();

	while (!INSTANCE->terminate) {
		INSTANCE->inputReady.wait();
		loop();
		INSTANCE->outputReady.set();
	}

}
