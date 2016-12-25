#ifndef MODELICA_ARDUINO_C
#define MODELICA_ARDUINO_C

#include <windows.h>
#include <stdio.h>
#include <conio.h>

#include "ModelicaUtilities.h"

#include "ModelicaArduino.h"

#include "Arduino.h"
#include <stdint.h>
#include "SoftArduino.h"


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
 
	if (SoftArduino::instance.error) {
		ModelicaFormatError("Error in setup(): %s", SoftArduino::instance.error);
	}

	hThread = CreateThread(
	NULL, 				   // default security attributes
	0, 					   // use default stack size
	MyThreadFunction, 	   // thread function
	&SoftArduino::instance, // argument to thread function
	0, 					   // use default creation flags
	&dwThreadId); 		   // returns the thread identifier
	 
	if (hThread == NULL) {
		ModelicaFormatError("Failed to create arduino thread. %d.\n", GetLastError());
	}

	return &SoftArduino::instance;
}

void ModelicaArduino_close(void *externalObject) {

	//ModelicaMessage("ModelicaArduino_close()\n");

	// TODO: clean up
	//if (CloseHandle(hThread) != 0)
	//	ModelicaFormatMessage("Handle to thread closed successfully.\n");
}

void ModelicaArduino_update(void *instance__, double time, double *analog, double *digital, int *portMode, double *pulseWidth) {

	if (SoftArduino::instance.error) {
		ModelicaFormatError("Error in loop(): %s", SoftArduino::instance.error);
		return;
	}

	// update the time
	SoftArduino::instance.time = time;

	for (int i = 0; i < NUM_ANALOG_INPUTS; i++) {

		// map analog input from [0,5] to [0,1023]
		SoftArduino::instance.analog[i] = (analog[i] / 5.) * 1023;

	}

	for (int i = 0; i < 14; i++) {

		// map digital input from [0,5] to LOW|HIGH using a threshold of 2.5
		SoftArduino::instance.digital[i] = digital[i] > 2.5 ? HIGH : LOW;

		portMode[i] = SoftArduino::instance.portMode[i];
		
		pulseWidth[i] = (SoftArduino::instance.pulseWidth[i] / 255.) * 100.;
	}

}

#endif // MODELICA_ARDUINO_C
