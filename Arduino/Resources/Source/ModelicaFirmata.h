#pragma once

#ifdef _MSC_VER
    #define EXPORT __declspec(dllexport)
#else
    #define EXPORT __attribute__((visibility("default")))
#endif

extern "C" {

EXPORT void *createFirmataConnection(const char *port, int showCapabilitites, int samplingMs, int baudRate, int dtr, void *callbacks);
EXPORT void freeFirmataConnection(void *object);

EXPORT void updateBoard(int id);
EXPORT int getBoardId(void *object);

EXPORT double readAnalogPin  (int pin, double min, double max, double init, int id);
EXPORT int    readDigitalPin (int pin, int init, int id);
EXPORT void   writeAnalogPin (int pin, int id, double value);
EXPORT void   writeDigitalPin(int pin, int id, int value);
EXPORT void   writeServoPin  (int pin, int id, double value, int min, int max);

EXPORT int numSentMessages(int id);
EXPORT int numReceivedMessages(int id);

}
