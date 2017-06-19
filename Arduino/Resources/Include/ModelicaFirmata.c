#ifndef MODELICA_FIRMATA_C
#define MODELICA_FIRMATA_C


#include "ModelicaUtilityFunctions.h"


void * ModelicaFirmata_getModelicaFunctions() {

	Callbacks_t *functions = (Callbacks_t *)malloc(sizeof(Callbacks_t));

	functions->vFormatMessage = ModelicaVFormatMessage;
	functions->vFormatError = ModelicaVFormatError;

	//ModelicaFormatMessage("ModeliccaFirmata_getModelicaFunctions() = %p\n", functions->message);
	//functions->message("Calling functions->message\n");

	return functions;
}


void ModelicaFirmata_freeModelicaFunctions(void *functions) {
	
	//ModelicaFormatMessage("ModeliccaFirmata_freeModelicaFunctions()\n");

	free(functions);

}


#endif // MODELICA_FIRMATA_C
