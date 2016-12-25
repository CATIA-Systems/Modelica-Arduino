#pragma once

#include "Print.h"
#include "ModelicaUtilities.h"


class SoftSerial : public Print {

public:

	void begin(unsigned long baud) { }

	size_t write(uint8_t c) override {
		return write(&c, 1);
	}

	size_t write(const uint8_t *buffer, size_t size) override {
		ModelicaMessage(reinterpret_cast<const char *>(buffer));
		return size;
	}

};
