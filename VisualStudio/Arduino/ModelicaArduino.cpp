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


#define INSTANCE SoftArduino::instance


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
 
	if (INSTANCE.error) {
		ModelicaFormatError("Error in setup(): %s", INSTANCE.error);
	}

	hThread = CreateThread(
	NULL, 				   // default security attributes
	0, 					   // use default stack size
	MyThreadFunction, 	   // thread function
	&INSTANCE, // argument to thread function
	0, 					   // use default creation flags
	&dwThreadId); 		   // returns the thread identifier
	 
	if (hThread == NULL) {
		ModelicaFormatError("Failed to create arduino thread. %d.\n", GetLastError());
	}

	return &INSTANCE;
}

void ModelicaArduino_close(void *externalObject) {

	//ModelicaMessage("ModelicaArduino_close()\n");

	// TODO: clean up
	//if (CloseHandle(hThread) != 0)
	//	ModelicaFormatMessage("Handle to thread closed successfully.\n");
}

void ModelicaArduino_update(void *instance__, 
							double time, 
							double analogReference, 
							double *analog, 
							double *digital, 
							int *portMode, 
							double *pulseWidth) {

	if (INSTANCE.error) {
		ModelicaFormatError("Error in loop(): %s", INSTANCE.error);
		return;
	}

	// update the time
	INSTANCE.time = time;

	const double vref = INSTANCE.analogReferenceMode == EXTERNAL ? analogReference : 5.;

	// TODO: assert vref != 0

	for (int i = 0; i < NUM_ANALOG_INPUTS; i++) {

		// map analog input from [0,V_ref] to [0,1023]
		INSTANCE.analog[i] = (analog[i] / vref) * 1023;

	}

	for (int i = 0; i < 14; i++) {

		// map digital input from [0,5] to LOW|HIGH using a threshold of 2.5
		// TODO: add hysteresis
		INSTANCE.digital[i] = digital[i] > 2.5 ? HIGH : LOW;

		portMode[i] = INSTANCE.portMode[i];
		
		pulseWidth[i] = INSTANCE.pulseWidth[i] * 100. / 255.;

	}

	// interrupts
	if (INSTANCE.interruptsEnabled) {
		for (int i = 0; i < 2; i++) {
			if (INSTANCE.interrupts[i]) {
				INSTANCE.interrupts[i]->update(INSTANCE.digital[interruptToDigitalPin(i)]);
			}
		}
	}

}

#endif // MODELICA_ARDUINO_C
