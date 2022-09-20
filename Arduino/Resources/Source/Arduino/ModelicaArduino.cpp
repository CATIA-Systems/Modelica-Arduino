#include <Windows.h>
#include <stdio.h>
#include <conio.h>

#include "ModelicaArduino.h"
#include "ModelicaUtilities.h"
#include "ModelicaUtilityFunctions.h"

#include "Arduino.h"
#include <stdint.h>
#include "SoftArduino.h"


/** Constructor function of the external object */
void * ModelicaArduino_open(void *callbacks) {

	setModelicaUtilityFunctions(reinterpret_cast<ModelicaUtilityFunctions_t *>(callbacks));
	
	return INSTANCE;
}

/** Destructor function of the external object */
void ModelicaArduino_close(void *externalObject) {
	//ModelicaMessage("ModelicaArduino_close()\n");
}

void ModelicaArduino_update(void *instance__,
							double time, 
							double analogReference, 
							double *potential,
							int *portMode, 
							int *pulseWidth,
							int *pulsePeriod) {

	if (INSTANCE->error) {
		ModelicaFormatError("Error in loop(): %s", INSTANCE->error);
		return;
	}

	if (INSTANCE->analogReferenceMode == EXTERNAL && analogReference == 0) {
		ModelicaFormatError("Reference voltage must not be 0.");
		return;
	}

	// update the time
	INSTANCE->time = static_cast<unsigned long>(time * 1e6);

	const double V_ref = INSTANCE->analogReferenceMode == EXTERNAL ? analogReference : 5.;

	for (int i = 0; i < NUM_DIGITAL_PINS; i++) {
		INSTANCE->potential[i] = potential[i] / V_ref;
	}

	INSTANCE->update();

	for (int i = 0; i < NUM_DIGITAL_PINS; i++) {
		portMode[i] = INSTANCE->portMode[i];
		pulseWidth[i] = INSTANCE->pulseWidth[i];
		pulsePeriod[i] = INSTANCE->pulsePeriod[i];
	}

	// interrupts
	if (INSTANCE->interruptsEnabled) {
		for (int i = 0; i < 2; i++) {
			if (INSTANCE->interrupts[i]) {
				const int p = INSTANCE->potential[interruptToDigitalPin(i)] > 0.5 ? HIGH : LOW;
				INSTANCE->interrupts[i]->update(p);
			}
		}
	}

}
