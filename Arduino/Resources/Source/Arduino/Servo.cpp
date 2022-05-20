#include "Servo.h"
#include "SoftArduino.h"
#include "ModelicaUtilities.h"


#define INSTANCE SoftArduino::instance


uint8_t Servo::attach(int pin) {

	//ModelicaFormatMessage("Servo::attach(%d)\n", pin);
	
	// TODO: Check pin >= 0 && pin < NUM_PINS

	m_pin = pin;

	INSTANCE->portMode[pin] = SoftArduino::PORT_MODE_PWM;
	INSTANCE->pulsePeriod[pin] = REFRESH_INTERVAL;

	return 1;
}

uint8_t Servo::attach(int pin, int min, int max) {

	// TODO: check min < max

	m_minPulseWidth = min;
	m_maxPulseWidth = max;

	return attach(pin);
}

void Servo::detach() {

	INSTANCE->portMode[m_pin] = SoftArduino::PORT_MODE_DIGITAL;
	INSTANCE->pulsePeriod[m_pin] = SoftArduino::DEFAULT_PULSE_PERIOD;

	m_pin = -1;
}

void Servo::write(int value) {

	//ModelicaFormatMessage("Servo::write(%d)\n", value);

	if (value < 200) {
		int pulseWidth = static_cast<int>(m_minPulseWidth + (m_maxPulseWidth - m_minPulseWidth) * (value / 180.));
		writeMicroseconds(pulseWidth);
	} else {
		writeMicroseconds(value);
	}

}

void Servo::writeMicroseconds(int value) {

	if (m_pin < 0 || m_pin >= NUM_DIGITAL_PINS) {
		ModelicaFormatError("Failed to write microseconds. Illegal pin: %d\n", m_pin);
		return;
	}

	m_pulseWidth = value;

	INSTANCE->pulseWidth[m_pin] = m_pulseWidth;
}

int Servo::read() {
	// calculate the angle from the current pulse width
	return int(180. * (m_pulseWidth - m_minPulseWidth) / (m_maxPulseWidth - m_minPulseWidth));
}

int Servo::readMicroseconds() {
	return m_pulseWidth;
}

bool Servo::attached() {
	return m_pin >= 0;
}
