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
							/*in*/ double *potential,
							/*out*/ int *portMode, 
							/*out*/ int *pulseWidth,
							/*out*/ int *pulsePeriod);

#ifdef __cplusplus
} // extern "C"
#endif
