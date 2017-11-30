#pragma once

#ifdef _MSC_VER
#define EXPORT __declspec(dllexport)
#else
#define EXPORT __attribute__((visibility("default")))
#endif

#ifdef __cplusplus
extern "C" {
#endif

EXPORT void * ModelicaArduino_open(void *callbacks);

EXPORT void ModelicaArduino_close(void *externalObject);

EXPORT void ModelicaArduino_update(void *instance,
							double time, 
							double analogReference, 
							/*in*/ double *analog, 
							/*in*/ double *digital, 
							/*out*/ int *portMode, 
							/*out*/ int *pulseWidth,
							/*out*/ int *pulsePeriod,
							/*out*/ int *outputVoltage /* TODO: remove (obsolete) */);

#ifdef __cplusplus
} // extern "C"
#endif
