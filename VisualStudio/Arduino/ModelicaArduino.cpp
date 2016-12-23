#ifndef MODELICA_ARDUINO_C
#define MODELICA_ARDUINO_C

#define DYMOLA_STATIC

#include <windows.h>
#include <stdio.h>
#include <conio.h>

#include <math.h> // for fmod()

//#include <float.h> // for isnan(), isinf()
//#define isnan(x) _isnan(x)
//#define isinf(x) (!_finite(x))

#include "ModelicaUtilities.h"

extern "C" {

#include "ModelicaArduino.h"

}

#include "Arduino.h"

#include "Print.h"

#include <stdint.h>
//typedef bool BOOL;
typedef uint8_t BYTE;
typedef int8_t INT8;
typedef uint8_t UNINT8;
typedef int16_t INT16;
typedef uint16_t UINT16;
typedef int32_t INT32;
typedef uint32_t UNINT32;
typedef int64_t INT64;
typedef uint64_t UINT64;

// from Print.h
//#define DEC 10
//#define HEX 16
//#define OCT 8
//#define BIN 2


//// from pins_arduino.h
//#define LED_BUILTIN 13
//
//#define PIN_A0   (0)
//#define PIN_A1   (1)
//#define PIN_A2   (2)
//#define PIN_A3   (3)
//#define PIN_A4   (4)
//#define PIN_A5   (5)
//#define PIN_A6   (6)
//#define PIN_A7   (7)
//
//static const uint8_t A0 = PIN_A0;
//static const uint8_t A1 = PIN_A1;
//static const uint8_t A2 = PIN_A2;
//static const uint8_t A3 = PIN_A3;
//static const uint8_t A4 = PIN_A4;
//static const uint8_t A5 = PIN_A5;
//static const uint8_t A6 = PIN_A6;
//static const uint8_t A7 = PIN_A7;
//
//// from Arduino.h
//#define HIGH 0x1
//#define LOW  0x0
//
//#define INPUT 0x0
//#define OUTPUT 0x1
//#define INPUT_PULLUP 0x2


class Arduino {

public:
	volatile double time;
	double analog[8];      // voltages of the analog pins
	double digital[15];    // voltages of the digital pins
	int portMode[15];      // 0 = input, 1 = digital, 2 = PWM
	double pulseWidth[15];

	const char *error;

	Arduino() : time(0), error(NULL) {

	}

};


Arduino instance;

/*
void pinMode(uint8_t, uint8_t);
void digitalWrite(uint8_t, uint8_t);
int digitalRead(uint8_t);
int analogRead(uint8_t);
void analogReference(uint8_t mode);
void analogWrite(uint8_t, int);

unsigned long millis(void);
unsigned long micros(void);
void delay(unsigned long);
void delayMicroseconds(unsigned int us);
unsigned long pulseIn(uint8_t pin, uint8_t state, unsigned long timeout);
unsigned long pulseInLong(uint8_t pin, uint8_t state, unsigned long timeout);
*/

void pinMode(int pin, int mode) {
	//ModelicaFormatMessage("pinMode(%d, %d)\n", pin, mode);
	instance.portMode[pin] = mode;
}

void digitalWrite(int pin, int val) {
	instance.pulseWidth[pin] = (val == HIGH) ? 100 : 0;
	ModelicaFormatMessage("digitalWrite(%d, %d) -> %f\n", pin, val, instance.pulseWidth[pin]);
}

int digitalRead(uint8_t pin) {
	// ModelicaFormatMessage("digitalRead(%d) -> %f\n", pin, instance.digital[pin]);
	return instance.digital[pin] > 2.5 ? HIGH : LOW;
}

int analogRead(uint8_t pin) {
	// TODO: clip [0, 1023]
	return (instance.analog[pin - 14] / 5) * 1024;
}

void delay(int ms) {
	ModelicaFormatMessage("delay at %f\n", instance.time);
	double end_time = instance.time + ms * 1e-3;
	while (instance.time < end_time) {
		// idle
	}
}

void analogWrite(uint8_t, int) {
	instance.error = "analogWrite() is not supported";
}

unsigned long millis() {
	return instance.time * 1000;
}

//// from WMath.cpp
//
//extern "C" {
//  #include "stdlib.h"
//}
//
//void randomSeed(unsigned long seed) {
//  if (seed != 0) {
//    srand(seed);
//  }
//}
//
//long random(long howbig) {
//  if (howbig == 0) {
//    return 0;
//  }
//  return rand() % howbig;
//}
//
//long random(long howsmall, long howbig) {
//  if (howsmall >= howbig) {
//    return howsmall;
//  }
//  long diff = howbig - howsmall;
//  return random(diff) + howsmall;
//}
//
//long map(long x, long in_min, long in_max, long out_min, long out_max) {
//  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
//}
//
//unsigned int makeWord(unsigned int w) { return w; }
//unsigned int makeWord(unsigned char h, unsigned char l) { return (h << 8) | l; }

// end WMath.cpp

class SoftSerial : public Print {

public:

    void begin(unsigned long baud) { }

    size_t write(uint8_t c) override {
    	return write(&c, 1);
    }

    size_t write(const uint8_t *buffer, size_t size) override {
    	ModelicaMessage(reinterpret_cast<const char *>(buffer));
    	return size;
    }

};


SoftSerial Serial;


#include "Functions.ino"


DWORD WINAPI MyThreadFunction(LPVOID lpParam) {

	for(;;) {
		loop();
	}

	return 0;
}


void * ModelicaArduino_open() {

	DWORD dwThreadId, dwThrdParam = 1;
	HANDLE hThread;
	
	setup();
 
	if (instance.error) {
		ModelicaFormatError("Error in setup(): %s", instance.error);
	}

	hThread = CreateThread(
	NULL, 				// default security attributes
	0, 					// use default stack size
	MyThreadFunction, 	// thread function
	&instance, 		    // argument to thread function
	0, 					// use default creation flags
	&dwThreadId); 		// returns the thread identifier
	 
	if (hThread == NULL) {
		ModelicaFormatError("Failed to create arduino thread. %d.\n", GetLastError());
	}



	return &instance;
}

void ModelicaArduino_close(void *externalObject) {

	//ModelicaMessage("ModelicaArduino_close()\n");

	// TODO: clean up
	//if (CloseHandle(hThread) != 0)
	//	ModelicaFormatMessage("Handle to thread closed successfully.\n");
}

void ModelicaArduino_update(void *instance__, double time, double *analog, double *digital, int *portMode, double *pulseWidth) {

	if (instance.error) {
		ModelicaFormatError("Error in loop(): %s", instance.error);
		return;
	}

	instance.time = time;

	for (int i = 0; i < 6; i++) {
		instance.analog[i] = analog[i];
	}

	for (int i = 0; i < 14; i++) {
		instance.digital[i] = digital[i];
		portMode[i] = instance.portMode[i];
		pulseWidth[i] = instance.pulseWidth[i];
	}

}

#endif // MODELICA_ARDUINO_C
