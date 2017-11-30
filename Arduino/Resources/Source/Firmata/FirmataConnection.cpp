/*  
 * Firmata Interface
 *
 * Copyright 2017 Dassault Systemes.
 *
 * Developed by Torsten Sommer (torsten.sommer@3ds.com) based on the 
 * "ModelPlug" library C++ sources by Leonardo Laguna Ruiz and 
 * "Firmata GUI-friendly queries test" by Paul Stoffregen (paul@pjrc.com)
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

#include <algorithm>
#include <vector>

#include "serial.h"
#include "ModelicaFirmata.h"
#include "FirmataConnection.h"


#define MODE_INPUT    0x00
#define MODE_OUTPUT   0x01
#define MODE_ANALOG   0x02
#define MODE_PWM      0x03
#define MODE_SERVO    0x04
#define MODE_SHIFT    0x05
#define MODE_I2C      0x06

#define START_SYSEX             0xF0 // start a MIDI Sysex message
#define END_SYSEX               0xF7 // end a MIDI Sysex message
#define PIN_MODE_QUERY          0x72 // ask for current and supported pin modes
#define PIN_MODE_RESPONSE       0x73 // reply with current and supported pin modes

#define RESERVED_COMMAND        0x00 // 2nd SysEx data byte is a chip-specific command (AVR, PIC, TI, etc).
#define ANALOG_MAPPING_QUERY    0x69 // ask for mapping of analog to pin numbers
#define ANALOG_MAPPING_RESPONSE 0x6A // reply with mapping info
#define CAPABILITY_QUERY        0x6B // ask for supported modes and resolution of all pins
#define CAPABILITY_RESPONSE     0x6C // reply with supported modes and resolution
#define PIN_STATE_QUERY         0x6D // ask for a pin's current mode and value
#define PIN_STATE_RESPONSE      0x6E // reply with a pin's current mode and value
#define EXTENDED_ANALOG         0x6F // analog write (PWM, Servo, etc) to any pin
#define SERVO_CONFIG            0x70 // set max angle, minPulse, maxPulse, freq
#define STRING_DATA             0x71 // a string message with 14-bits per char
#define SHIFT_DATA              0x75 // shiftOut config/data message (34 bits)
#define I2C_REQUEST             0x76 // I2C request messages from a host to an I/O board
#define I2C_REPLY               0x77 // I2C reply messages from an I/O board to a host
#define I2C_CONFIG              0x78 // Configure special I2C settings such as power pins and delay times
#define REPORT_FIRMWARE         0x79 // report name and version of the firmware
#define SAMPLING_INTERVAL       0x7A // sampling interval
#define SYSEX_NON_REALTIME      0x7E // MIDI Reserved for non-realtime messages
#define SYSEX_REALTIME          0x7F // MIDI Reserved for realtime messages


std::vector<FirmataConnection *> FirmataConnection::m_ports;


int FirmataConnection::write(const void *ptr, int len){
	const auto status =  m_serial.Write(ptr,len);
	m_sent++;
	return status;
}

int FirmataConnection::read(void *ptr, int count, int timeout){

	if (m_serial.Is_open() && (m_serial.Input_wait(timeout) > 0)) {
		return m_serial.Read(ptr, count);
	}

	return 0;
}

FirmataConnection::FirmataConnection(
	std::string port, 
	bool showCapabilitites, 
	int samplingInterval, 
	int baudRate, 
	vFormatMessageTYPE *vFormatMessage,
	vFormatErrorTYPE *vFormatError) :

	m_showCapabilities(showCapabilitites),
	m_samplingInterval(samplingInterval),
	m_baudRate(baudRate) {
	
	// Initialize the pin information
	for (int i=0; i < 128; i++) {
		m_pinInfo[i].mode = 255;
		m_pinInfo[i].analog_channel = 127;
		m_pinInfo[i].supported_modes = 0;
		m_pinInfo[i].value = 0;
		m_pinInfo[i].next_value = 0;
		m_pinInfo[i].ready = 0;
	}

	// set the callback functions
	m_vFormatMessage = vFormatMessage;
	m_vFormatError = vFormatError;

	const auto availablePorts = getPortList();

	info("Number of connections: %d\n", m_ports.size());

	// list the available ports
	info("AVAILABLE PORTS: %d\n", availablePorts.size());
	for (auto &port : availablePorts) {
		info("\t%s\n", port.c_str());
	}

	if (port.empty()) {
		
		// check if any ports are available
		if (availablePorts.empty()) {
			error("No COM ports available to connect.\n");
			return;
		}

		// take the first available port
		m_portName = availablePorts[0];

		info("Auto selecting port '%s'\n", m_portName.c_str());

	} else {

		m_portName = port;

		// check if the port exists
		bool portExists = false;

		for (auto &availablePort : availablePorts) {
			if (availablePort == m_portName) {
				portExists = true;
				break;
			}
		}
	
		if (!portExists) {
			error("The port '%s' does not exist\n", m_portName.c_str());
		}

	}

	info("Connecting to port '%s'...\n", m_portName.c_str());

	// check if the port is already used
	for (auto port_ : m_ports) {
		if (port_->getPortName() == m_portName) {
			error("Port \"%s\" is already in use.\n", m_portName.c_str());
		}
	}
	
	if (openPort() == 0) {
		m_ports.push_back(this);
		initialize(false);
	} else {
		error("Failed to open connection on port '%s'", m_portName.c_str());
	}
}

void FirmataConnection::setPinMode(uint32_t pin, uint32_t mode){

	if (mode != m_pinInfo[pin].mode && m_ready) {
		// send the mode change message
		uint8_t buf[4];
		buf[0] = 0xF4;
		buf[1] = pin;
		buf[2] = mode;
		write(buf, 3);
		m_pinInfo[pin].mode = mode;
		m_pinInfo[pin].value = 0;
		m_pinInfo[pin].next_value = 0;
		info("[Firmata]: %s setting pin %i to mode %i\n",m_portName.c_str(),pin,mode);
	}
}

void FirmataConnection::setServoConfig(uint32_t pin,uint32_t min,uint32_t max) {

	if (m_ready){
		uint8_t buf[8];
		buf[0] = START_SYSEX;
		buf[1] = SERVO_CONFIG;
		buf[2] = pin;
		buf[3] = min & 0x7F;
		buf[4] = (min >> 7) & 0x7F;
		buf[5] = max & 0x7F;
		buf[6] = (max >> 7) & 0x7F;
		buf[7] = END_SYSEX;
		write(buf, 8);
	}
}

FirmataConnection * FirmataConnection::getBoard(uint32_t id) {
	return m_ports[id];
}

int FirmataConnection::getPortIndex(FirmataConnection * elem) {

	unsigned pos = std::find(m_ports.begin(), m_ports.end(), elem) - m_ports.begin();
	
	if (pos >= m_ports.size()) {
		return -1; // not found
	}
	
	return pos;
}

void FirmataConnection::writeDigitalPin(uint32_t pin, uint32_t value) {

	if (m_ready) {
		
		if (m_pinInfo[pin].mode != MODE_OUTPUT) {
			setPinMode(pin, MODE_OUTPUT);
		}

		m_pinInfo[pin].next_value = value;
	}
}

void FirmataConnection::writeAnalogPin(uint32_t pin, uint32_t value) {

	if (m_ready) {

		if (m_pinInfo[pin].mode != MODE_PWM) {
			setPinMode(pin, MODE_PWM);
		}
			
		m_pinInfo[pin].next_value = value;
	}
}

void FirmataConnection::writeServoPin(uint32_t pin, uint32_t value, int min, int max) {

	if (m_ready) {
		
		if (m_pinInfo[pin].mode != MODE_SERVO) {
			setPinMode(pin, MODE_SERVO);
			setServoConfig(pin, min, max);
		}

		m_pinInfo[pin].next_value = value;
	}
}

double FirmataConnection::readAnalogPin(uint32_t pin, double min, double max, double init) {
	
	if (m_ready) {

		if (m_pinInfo[pin].mode != MODE_ANALOG) {
			setPinMode(pin, MODE_ANALOG);
		}

		if (m_pinInfo[pin].ready) {
			return min + ((m_pinInfo[pin].value / 1023.0) * (max - min));
		}
	}

	return init;
}

uint32_t FirmataConnection::readDigitalPin(uint32_t pin, int init) {

	if (m_ready) {
		
		if (m_pinInfo[pin].mode != MODE_INPUT) {
			setPinMode(pin, MODE_INPUT);
		}

		if (m_pinInfo[pin].ready) {
			return m_pinInfo[pin].value;
		}	
	}

	return init;
}

void FirmataConnection::reportFirmware(){
	uint8_t buf[3];
	buf[0] = START_SYSEX;
	buf[1] = REPORT_FIRMWARE; // read firmata name & version
	buf[2] = END_SYSEX;
	write(buf, 3);
}

void FirmataConnection::setSamplingInterval(){
	uint8_t buf[5];
	buf[0] = START_SYSEX;
	buf[1] = SAMPLING_INTERVAL; // read firmata name & version
	buf[2] = m_samplingInterval & 0x7F;
	buf[3] = (m_samplingInterval >> 7) & 0x7F;
	buf[4] = END_SYSEX;
	write(buf, 5);
	info("[Firmata]: Setting sampling interval to %i ms for board %s\n", m_samplingInterval, m_portName.c_str());
}

void FirmataConnection::showPinCapabilities() {

	info("[Firmata]: Board %s capabilities\n", m_portName.c_str());
	
	for (int pin = 0; pin < 128; pin++) {
		
		if (m_pinInfo[pin].supported_modes != 0) {
			
			info("- Pin %i supports: ", pin);
			
			if (m_pinInfo[pin].supported_modes & (1 << MODE_INPUT))  info(" DigitalInput");
			if (m_pinInfo[pin].supported_modes & (1 << MODE_OUTPUT)) info(" - DigitalOutput");
			if (m_pinInfo[pin].supported_modes & (1 << MODE_ANALOG)) info(" - AnalogInput(A%d)", m_pinInfo[pin].analog_channel);
			if (m_pinInfo[pin].supported_modes & (1 << MODE_PWM))    info(" - AnalogOutput");
			if (m_pinInfo[pin].supported_modes & (1 << MODE_SERVO))  info(" - Servo");
			
			info("\n");
		}
	}
}

void FirmataConnection::updateBoard(int timeout) {

	uint8_t buf[1024];
	int r;
	
	// write the output values
	if (m_ready) {

		for (int pin = 0; pin < 128; pin++) {

			if (m_pinInfo[pin].value != m_pinInfo[pin].next_value && 
				(m_pinInfo[pin].mode == MODE_OUTPUT || m_pinInfo[pin].mode == MODE_PWM || m_pinInfo[pin].mode == MODE_SERVO)) {

				m_pinInfo[pin].value = m_pinInfo[pin].next_value;

				// Digital output
				if (m_pinInfo[pin].mode == MODE_OUTPUT) {
					int port_num = pin / 8;
					int port_val = 0;
					for (int i = 0; i < 8; i++) {
						int p = port_num * 8 + i;
						if (m_pinInfo[p].mode == MODE_OUTPUT || m_pinInfo[p].mode == MODE_INPUT) {
							if (m_pinInfo[p].value) {
								port_val |= (1 << i);
							}
						}
					}
					uint8_t buf[3];
					buf[0] = 0x90 | port_num;
					buf[1] = port_val & 0x7F;
					buf[2] = (port_val >> 7) & 0x7F;
					write(buf, 3);
				}

				// Analog output or servo
				if (m_pinInfo[pin].mode == MODE_PWM || m_pinInfo[pin].mode == MODE_SERVO) {
					
					uint32_t value = m_pinInfo[pin].value;

					if (pin <= 15 && value <= 16383) {
						uint8_t buf[3];
						buf[0] = 0xE0 | pin;
						buf[1] = value & 0x7F;
						buf[2] = (value >> 7) & 0x7F;
						write(buf, 3);
					} else {
						uint8_t buf[12];
						int len = 4;
						buf[0] = 0xF0;
						buf[1] = 0x6F;
						buf[2] = pin;
						buf[3] = value & 0x7F;
						if (value > 0x00000080) buf[len++] = (value >> 7) & 0x7F;
						if (value > 0x00004000) buf[len++] = (value >> 14) & 0x7F;
						if (value > 0x00200000) buf[len++] = (value >> 21) & 0x7F;
						if (value > 0x10000000) buf[len++] = (value >> 28) & 0x7F;
						buf[len++] = 0xF7;
						write(buf, len);
					}
				}

			}

		} 

	} // ready

	// receieve bytes from the serial port
	r = read(buf, sizeof(buf), timeout);

	if (r) {
		Parse(buf, r);
	}
}

void FirmataConnection::Parse(const uint8_t *buf, int len)
{
	const uint8_t *p, *end;

	p = buf;
	end = p + len;
	for (p = buf; p < end; p++) {
		uint8_t msn = *p & 0xF0;
		if (msn == 0xE0 || msn == 0x90 || *p == 0xF9) {
			m_parseCommandLen = 3;
			m_parseCount = 0;
		} else if (msn == 0xC0 || msn == 0xD0) {
			m_parseCommandLen = 2;
			m_parseCount = 0;
		} else if (*p == START_SYSEX) {
			m_parseCount = 0;
			m_parseCommandLen = sizeof(m_parseBuf);
		} else if (*p == END_SYSEX) {
			m_parseCommandLen = m_parseCount + 1;
		} else if (*p & 0x80) {
			m_parseCommandLen = 1;
			m_parseCount = 0;
		}
		if (m_parseCount < (int)sizeof(m_parseBuf)) {
			m_parseBuf[m_parseCount++] = *p;
		}
		if (m_parseCount == m_parseCommandLen) {
			DoMessage();
			m_parseCount = m_parseCommandLen = 0;
		}
	}

	m_received++;
}

void FirmataConnection::DoMessage(void) {
	 
	uint8_t cmd = (m_parseBuf[0] & 0xF0);

	if (cmd == 0xE0 && m_parseCount == 3) {

		int analog_ch = (m_parseBuf[0] & 0x0F);
		int analog_val = m_parseBuf[1] | (m_parseBuf[2] << 7);

		for (int pin = 0; pin < 128; pin++) {

			if (m_pinInfo[pin].analog_channel == analog_ch) {
				m_pinInfo[pin].value = analog_val;
				m_pinInfo[pin].ready = 1;	
				return;
			}
		}
		
		return;
	}

	if (cmd == 0x90 && m_parseCount == 3) {

		int port_num = (m_parseBuf[0] & 0x0F);
		int port_val = m_parseBuf[1] | (m_parseBuf[2] << 7);
		int pin = port_num * 8;

		for (int mask=1; mask & 0xFF; mask <<= 1, pin++) {

			if (m_pinInfo[pin].mode == MODE_INPUT) {
				
				uint32_t val = (port_val & mask) ? 1 : 0;
				
				if (m_pinInfo[pin].value != val) {
					m_pinInfo[pin].value = val;
					m_pinInfo[pin].ready = 1;
				}
			}
		}
		return;
	}

	if (m_parseBuf[0] == START_SYSEX && m_parseBuf[m_parseCount-1] == END_SYSEX) {

		// Sysex message
		if (m_parseBuf[1] == REPORT_FIRMWARE) {

			char name[140];
			int len=0;
			for (int i=4; i < m_parseCount-2; i+=2) {
				name[len++] = (m_parseBuf[i] & 0x7F)
				  | ((m_parseBuf[i+1] & 0x7F) << 7);
			}
			name[len++] = '-';
			name[len++] = m_parseBuf[2] + '0';
			name[len++] = '.';
			name[len++] = m_parseBuf[3] + '0';
			name[len++] = 0;
			info("[Firmata]: %s %s\n", m_portName.c_str(), name);
			m_ready = true;
			// query the board's capabilities only after hearing the
			// REPORT_FIRMWARE message.  For boards that reset when
			// the port open (eg, Arduino with reset=DTR), they are
			// not ready to communicate for some time, so the only
			// way to reliably query their capabilities is to wait
			// until the REPORT_FIRMWARE message is heard.
			uint8_t buf[80];
			len=0;
			buf[len++] = START_SYSEX;
			buf[len++] = ANALOG_MAPPING_QUERY; // read analog to pin # info
			buf[len++] = END_SYSEX;
			buf[len++] = START_SYSEX;
			buf[len++] = CAPABILITY_QUERY; // read capabilities
			buf[len++] = END_SYSEX;
			for (int i=0; i<16; i++) {
				buf[len++] = 0xC0 | i;  // report analog
				buf[len++] = 1;
				buf[len++] = 0xD0 | i;  // report digital
				buf[len++] = 1;
			}
			write(buf, len);
			setSamplingInterval();

		} else if (m_parseBuf[1] == CAPABILITY_RESPONSE) {

			int pin, i, n;
			for (pin=0; pin < 128; pin++) {
				m_pinInfo[pin].supported_modes = 0;
			}
			for (i=2, n=0, pin=0; i<m_parseCount; i++) {
				if (m_parseBuf[i] == 127) {
					pin++;
					n = 0;
					continue;
				}
				if (n == 0) {
					// first byte is supported mode
					m_pinInfo[pin].supported_modes |= (1<<m_parseBuf[i]);
				}
				n = n ^ 1;
			}
			if(m_showCapabilities) {
				showPinCapabilities();
				m_showCapabilities = false;
			}
			// send a state query for for every pin with any modes
			for (pin=0; pin < 128; pin++) {
				uint8_t buf[512];
				int len=0;
				if (m_pinInfo[pin].supported_modes) {
					buf[len++] = START_SYSEX;
					buf[len++] = PIN_STATE_QUERY;
					buf[len++] = pin;
					buf[len++] = END_SYSEX;
				}
				write(buf, len);
			}

		} else if (m_parseBuf[1] == ANALOG_MAPPING_RESPONSE) {

			int pin = 0;

			for (int i = 2; i < m_parseCount - 1; i++) {
				m_pinInfo[pin].analog_channel = m_parseBuf[i];
				pin++;
			}

			return;

		} else if (m_parseBuf[1] == PIN_STATE_RESPONSE && m_parseCount >= 6) {

			int pin = m_parseBuf[2];
			m_pinInfo[pin].mode = m_parseBuf[3];
			m_pinInfo[pin].value = m_parseBuf[4];
			if (m_parseCount > 6) m_pinInfo[pin].value |= (m_parseBuf[5] << 7);
			if (m_parseCount > 7) m_pinInfo[pin].value |= (m_parseBuf[6] << 14);
		}

		return;
	}
}

void FirmataConnection::info(const char * format, ...) {

	va_list vl;
	va_start(vl, format);

	if (m_vFormatMessage) {
		m_vFormatMessage(format, vl);
	} else {
		vprintf(format, vl);
	}

	va_end(vl);
}

void FirmataConnection::error(const char * format, ...) {

	va_list vl;
	va_start(vl, format);

	if (m_vFormatError) {
		m_vFormatError(format, vl);
	} else {
		vprintf(format, vl);
	}

	va_end(vl);
}

std::vector<std::string> FirmataConnection::getPortList() {
	return m_serial.port_list();
}

std::string FirmataConnection::getPortName() {
	return m_portName;
}

int FirmataConnection::openPort() {
		
	m_serial.Open(m_portName);
	m_serial.Set_baud(m_baudRate);
		
	if (m_serial.Is_open()) {
		info("Using port %s with baud rate %i\n", m_portName.c_str(), m_baudRate);
		return 0;
	}

	return -1;
}

void FirmataConnection::initialize(bool dtr) {
	m_serial.Set_control(dtr ? 1 : 0, -1);
	updateBoard(5);
	reportFirmware();
	updateBoard(5);
}

void FirmataConnection::closePort() {
	
	if (m_serial.Is_open()) {
		m_serial.Close();
	}

	// update the connections
	auto it = std::find(m_ports.begin(), m_ports.end(), this);

	if (it != m_ports.end()) {
		m_ports.erase(it);
	}
	
}
