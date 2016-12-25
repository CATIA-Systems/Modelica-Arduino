#include "SoftArduino.h"
#include "ModelicaUtilities.h"

extern "C" {

SoftArduino SoftArduino::instance;


void pinMode(uint8_t pin, uint8_t mode) {
	//ModelicaFormatMessage("pinMode(%d, %d)\n", pin, mode);
	SoftArduino::instance.portMode[pin] = mode;
}

void digitalWrite(uint8_t pin, uint8_t val) {
	SoftArduino::instance.pulseWidth[pin] = (val == HIGH) ? 255 : 0;
	//ModelicaFormatMessage("digitalWrite(%d, %d) -> %f\n", pin, val, SoftArduino::instance.pulseWidth[pin]);
}

int digitalRead(uint8_t pin) {
	// ModelicaFormatMessage("digitalRead(%d) -> %f\n", pin, instance.digital[pin]);
	return SoftArduino::instance.digital[pin] > 2.5 ? HIGH : LOW;
}

int analogRead(uint8_t pin) {

	if (pin < A0 || pin > A7) {
		ModelicaFormatError("Illegal analog pin: %d\n", pin);
	}

	// TODO: clip [0, 1023]?

	//ModelicaFormatMessage("analogRead(%d) -> %d\n", pin, val);
	
	return SoftArduino::instance.analog[pin - A0];
}

void analogReference(uint8_t mode) {
	
	switch(mode) {
	case DEFAULT:
	//case INTERNAL:
	//case INTERNAL1V1:
	case EXTERNAL:
		SoftArduino::instance.analogReferenceMode = mode;
		break;
	default:
		ModelicaFormatError("Illegal analog reference mode: %d\n", mode);
		break;
	}
}

void analogWrite(uint8_t pin, int val) {
	SoftArduino::instance.portMode[pin] = OUTPUT;
	SoftArduino::instance.pulseWidth[pin] = val; 
}

void delay(unsigned long ms) {
	//ModelicaFormatMessage("delay at %f\n", ArduinoUno::instance.time);
	double end_time = SoftArduino::instance.time + ms * 1e-3;
	while (SoftArduino::instance.time < end_time) {
		// idle
	}
}

unsigned long millis() {
	return SoftArduino::instance.time * 1000;
}

}
