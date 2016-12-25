#pragma once

#ifdef __cplusplus
extern "C" {
#endif

void * ModelicaArduino_open();

void ModelicaArduino_close(void *externalObject);

void ModelicaArduino_update(void *instance, double time, /*in*/ double *analog, /*in*/ double *digital, /*out*/ int *portMode, /*out*/ double *pulseWidth);

#ifdef __cplusplus
} // extern "C"
#endif
