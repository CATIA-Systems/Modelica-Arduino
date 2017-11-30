/*
* Modelica interface functions for the ExternalFirmata object
*
* Copyright 2017 Dassault Systemes. Dveloped by Torsten Sommer (torsten.sommer@3ds.com).
*
*  This program is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "ModelicaFirmata.h"
#include "FirmataConnection.h"

#include "ModelicaUtilityFunctions.h"


/** Clamps value between 0 and 1 and returns value. */
inline double clamp01(double value) {
	return value > 1.0 ? 1.0 : (value < 0.0 ? 0.0 : value);
}


void *createFirmataConnection(const char *port, int showCapabilitites, int samplingMs, int baudRate, int dtr, void *callbacks) {
	
	auto cb = reinterpret_cast<ModelicaUtilityFunctions_t *>(callbacks);
	setModelicaUtilityFunctions(cb);
	return new FirmataConnection(port, showCapabilitites, samplingMs, baudRate, cb->ModelicaVFormatMessage, cb->ModelicaVFormatError);
}


void freeFirmataConnection(void *object) {

	if (object) {
		auto board = reinterpret_cast<FirmataConnection *>(object);
		board->closePort();
		delete board;
	}
}


void updateBoard(int id) {
	auto board = FirmataConnection::getBoard(id);
	board->updateBoard(0);
}


int getBoardId(void *object) {

	if (object) {
		return FirmataConnection::getPortIndex(reinterpret_cast<FirmataConnection *>(object));
	}

	return -1;
}


double readAnalogPin(int pin, double min, double max, double init, int id) {
	auto board = FirmataConnection::getBoard(id);
	return board->readAnalogPin(pin, min, max, init);
}


int readDigitalPin(int pin, int init, int id) {
	auto board = FirmataConnection::getBoard(id);
	return board->readDigitalPin(pin, init);
}


void writeAnalogPin(int pin, int id, double value) {
	auto board = FirmataConnection::getBoard(id);
	board->writeAnalogPin(pin, uint32_t(clamp01(value) * 255));
}


void writeDigitalPin(int pin, int id, int value) {
	auto board = FirmataConnection::getBoard(id);
	board->writeDigitalPin(pin, value);
}


void writeServoPin(int pin, int id, double value, int min, int max) {
	auto board = FirmataConnection::getBoard(id);
	board->writeServoPin(pin, int(clamp01(value) * 180), min, max);
}

int numSentMessages(int id) {
	auto board = FirmataConnection::getBoard(id);
	return board->numSentMessages();
}

int numReceivedMessages(int id) {
	auto board = FirmataConnection::getBoard(id);
	return board->numReceivedMessages();
}
