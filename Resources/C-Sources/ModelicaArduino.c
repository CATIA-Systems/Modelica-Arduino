#ifndef MODELICA_ARDUINO_C
#define MODELICA_ARDUINO_C

#include <windows.h>
#include <stdio.h>
#include <conio.h>

#include <math.h> // for fmod()

#include "ModelicaUtilities.h"


#define LED_BUILTIN  13
#define OUTPUT        0
#define LOW           0
#define HIGH          1


typedef struct {

	double time;
	int builtInLedOn;

} State_t;


static State_t state_s;


void pinMode(int a, int b) {
	ModelicaFormatMessage("pinMode(%d, %d)\n", a, b);
}

void digitalWrite(int id, int value) {
	
	ModelicaFormatMessage("digitalWrite(%d, %d)\n", id, value);

	switch(id) {
	case LED_BUILTIN: state_s.builtInLedOn = value; break;
	default: break;
	}
}

void delay(int ms) {

	double end_time = state_s.time + ms * 1e-3;
	
	ModelicaFormatMessage("delay(%d)\n", ms);

	while (state_s.time < end_time) {
		// idle
		ModelicaFormatMessage("idle: %f < %f\n", state_s.time , end_time);
	}

}


#include "Blink.c"


DWORD WINAPI MyThreadFunction(LPVOID lpParam) {

	//State_t *state = (State_t *)lpParam;

	ModelicaFormatMessage("The parameter: %u.\n", *(DWORD*)lpParam);

	for(;;) {
		//state->builtInLedOn = fmod(state->time, 1) > 0.5 ? 5 : 0;
		loop();
	}

	return 0;
}


void * ModelicaArduino_open() {

	DWORD dwThreadId, dwThrdParam = 1;
	HANDLE hThread;
	State_t *state;

	ModelicaMessage("ModelicaArduino_open()\n");

	state = &state_s; //malloc(sizeof(State_t));

	setup();
 
	hThread = CreateThread(
	NULL, 				// default security attributes
	0, 					// use default stack size
	MyThreadFunction, 	// thread function
	state, 		        // argument to thread function
	0, 					// use default creation flags
	&dwThreadId); 		// returns the thread identifier
	 
	ModelicaFormatMessage("The thread ID: %d.\n", dwThreadId);
	 
	// Check the return value for success. If something wrong...
	if (hThread == NULL)
		ModelicaFormatMessage("CreateThread() failed, error: %d.\n", GetLastError());
	//else, gives some prompt...
	else
		ModelicaFormatMessage("It seems the CreateThread() is OK lol!\n");

	if (CloseHandle(hThread) != 0)
		ModelicaFormatMessage("Handle to thread closed successfully.\n");

	//return (void *)NULL;

	return state;
}


void ModelicaArduino_close(void *externalObject) {

	ModelicaMessage("ModelicaArduino_close()\n");

}

void ModelicaArduino_update(void *instance, double time, double *builtInLedOn) {

	//*builtInLedOn = fmod(time, 1) > 0.5 ? 5 : 0;
	//State_t *state = (State_t *)instance;
	//state->time = time;
	//*builtInLedOn = state->builtInLedOn;

	state_s.time = time;
	*builtInLedOn = state_s.builtInLedOn;

}

#endif // MODELICA_ARDUINO_C
