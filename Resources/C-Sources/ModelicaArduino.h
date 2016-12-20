#ifndef MODELICA_ARDUINO_H
#define MODELICA_ARDUINO_H

void * ModelicaArduino_open();

void ModelicaArduino_close(void *externalObject);

void ModelicaArduino_update(void *instance, double time, double *builtInLedOn);

#endif // MODELICA_ARDUINO_H
