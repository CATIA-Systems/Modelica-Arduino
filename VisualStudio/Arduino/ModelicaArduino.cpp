#ifndef MODELICA_ARDUINO_C
#define MODELICA_ARDUINO_C

#include <windows.h>
#include <stdio.h>
#include <conio.h>

#include "ModelicaUtilities.h"

#include "ModelicaArduino.h"

#include "Arduino.h"
//#include "SoftSerial.h"
#include <stdint.h>
#include "Wiring.h"


//SoftSerial Serial;


//#include "Fade.ino"


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
 
	if (ArduinoUno::instance.error) {
		ModelicaFormatError("Error in setup(): %s", ArduinoUno::instance.error);
	}

	hThread = CreateThread(
	NULL, 				   // default security attributes
	0, 					   // use default stack size
	MyThreadFunction, 	   // thread function
	&ArduinoUno::instance, // argument to thread function
	0, 					   // use default creation flags
	&dwThreadId); 		   // returns the thread identifier
	 
	if (hThread == NULL) {
		ModelicaFormatError("Failed to create arduino thread. %d.\n", GetLastError());
	}

	return &ArduinoUno::instance;
}

void ModelicaArduino_close(void *externalObject) {

	//ModelicaMessage("ModelicaArduino_close()\n");

	// TODO: clean up
	//if (CloseHandle(hThread) != 0)
	//	ModelicaFormatMessage("Handle to thread closed successfully.\n");
}

void ModelicaArduino_update(void *instance__, double time, double *analog, double *digital, int *portMode, double *pulseWidth) {

	if (ArduinoUno::instance.error) {
		ModelicaFormatError("Error in loop(): %s", ArduinoUno::instance.error);
		return;
	}

	ArduinoUno::instance.time = time;

	for (int i = 0; i < 6; i++) {
		ArduinoUno::instance.analog[i] = analog[i];
	}

	for (int i = 0; i < 14; i++) {
		ArduinoUno::instance.digital[i] = digital[i];
		portMode[i] = ArduinoUno::instance.portMode[i];
		pulseWidth[i] = ArduinoUno::instance.pulseWidth[i];
	}

}

#endif // MODELICA_ARDUINO_C
