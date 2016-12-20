#ifndef MODELICA_ARDUINO_C
#define MODELICA_ARDUINO_C

#include <windows.h>
#include <stdio.h>
#include <conio.h>

#include "ModelicaUtilities.h"


#define LED_BUILTIN  13
#define OUTPUT        0
#define LOW           0
#define HIGH          1


void pinMode(int a, int b) {
	ModelicaFormatMessage("pinMode(%d, %d)\n", a, b);
}

void digitalWrite(int a, int b) {
	ModelicaFormatMessage("digitalWrite(%d, %d)\n", a, b);
}

void delay(int a) {
	ModelicaFormatMessage("delay(%d)\n", a);
}


#include "Blink.c"


DWORD WINAPI MyThreadFunction(LPVOID lpParam) {
	ModelicaFormatMessage("The parameter: %u.\n", *(DWORD*)lpParam);
	return 0;
}


void * ModelicaArduino_open() {

	DWORD dwThreadId, dwThrdParam = 1;
	HANDLE hThread;

	ModelicaMessage("ModelicaArduino_open()\n");

	setup();
 
	hThread = CreateThread(
	NULL, 				// default security attributes
	0, 					// use default stack size
	MyThreadFunction, 	// thread function
	&dwThrdParam, 		// argument to thread function
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

	return (void *)NULL;
}


void ModelicaArduino_close(void *externalObject) {

	ModelicaMessage("ModelicaArduino_close()\n");

}

void ModelicaArduino_update(void *object, double time) {

	loop();

}

#endif // MODELICA_ARDUINO_C
