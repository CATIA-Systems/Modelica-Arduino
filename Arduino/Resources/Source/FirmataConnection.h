#pragma once

#include <stdio.h>
#include <stdint.h>
#include <algorithm>
#include <vector>
#include "serial.h"

#include "ModelicaUtilityFunctions.h"


typedef struct {
	uint8_t  mode;
	uint8_t  analog_channel;
	uint64_t supported_modes;
	uint32_t value;
	uint32_t next_value;
	uint8_t  ready;
} pin_t;


class FirmataConnection {

public:
	explicit FirmataConnection(std::string port, bool showCapabilitites = false, int samplingInterval = 10, int baudRate = 57600, Callbacks_t *callbacks = nullptr);

	std::string getPortName();
	int openPort();
	void closePort();
	std::vector<std::string> getPortList();
	void setPinMode(uint32_t pin, uint32_t mode);
	void writeDigitalPin(uint32_t pin, uint32_t value);
	void writeAnalogPin(uint32_t pin, uint32_t value);
	void writeServoPin(uint32_t pin, uint32_t value, int min, int max);
	double readAnalogPin(uint32_t pin, double min, double max, double init);
	uint32_t readDigitalPin(uint32_t pin, int init);
	void setServoConfig(uint32_t pin, uint32_t min, uint32_t max);

public:
	static FirmataConnection *getBoard(uint32_t id);
	static int getPortIndex(FirmataConnection* elem);

	void initialize(bool dtr);
	void updateBoard(int timeout);
	void reportFirmware();
	void showPinCapabilities();
	void setSamplingInterval();
	void setAsFakePort();

	inline int numSentMessages() { return m_sent; }
	inline int numReceivedMessages() { return m_received; }

private:
	int m_sent = 0;
	int m_received = 0;

	static std::vector<FirmataConnection *> m_ports;

	int write(const void *ptr, int len);
	int read(void *ptr, int count, int timeout);
	void Parse(const uint8_t *buf, int len);
	void DoMessage(void);

	// logging functions
	void info(const char *format, ...);
	void error(const char *format, ...);

	pin_t m_pinInfo[128];
	std::string m_portName;
	bool m_showCapabilities;
	int m_samplingInterval;
	int m_baudRate;
	Serial m_serial;
	bool m_ready = false;

	int m_parseCount = -1;
	int m_parseCommandLen = -1;
	uint8_t m_parseBuf[4096];

	// callbacks
	void (*cb_vFormatMessage)(const char *, va_list) = nullptr;
	void (*cb_vFormatError)(const char *, va_list) = nullptr;

};
