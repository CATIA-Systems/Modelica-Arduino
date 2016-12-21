#ifndef MODELICA_ARDUINO_H
#define MODELICA_ARDUINO_H

void * ModelicaArduino_open();

void ModelicaArduino_close(void *externalObject);

void ModelicaArduino_update(void *instance, double time, /*in*/ double *analog, /*out*/ int *portMode, /*out*/ double *pulseWidth);

#endif // MODELICA_ARDUINO_H
