/*  Serial port object for use with wxWidgets
 *  Copyright 2010, Paul Stoffregen (paul@pjrc.com)
 *  Modified by: Leonardo Laguna Ruiz
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


#include "serial.h"


#if defined(LINUX)
  #include <sys/types.h>
  #include <fcntl.h>
  #include <errno.h>
  #include <sys/select.h>
  #include <termios.h>
  #include <unistd.h>
  #include <dirent.h>
  #include <sys/stat.h>
  #include <sys/ioctl.h>
  #include <linux/serial.h>
  #include <errno.h>
  #include <stdio.h>
  #include <string.h>
#elif defined(MACOSX)
  #include <stdio.h>
  #include <string.h>
  #include <unistd.h>
  #include <fcntl.h>
  #include <sys/ioctl.h>
  #include <errno.h>
  #include <paths.h>
  #include <termios.h>
  #include <sysexits.h>
  #include <sys/param.h>
  #include <sys/select.h>
  #include <sys/time.h>
  #include <time.h>
  #include <CoreFoundation/CoreFoundation.h>
  #include <IOKit/IOKitLib.h>
  #include <IOKit/serial/IOSerialKeys.h>
  #include <IOKit/IOBSD.h>
#elif defined(WINDOWS)
  #include <windows.h>
  #define win32_err(s) FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, NULL, \
			GetLastError(), 0, (s), sizeof(s), NULL)
  #define QUERYDOSDEVICE_BUFFER_SIZE 262144
  #if _MSC_VER
	#define snprintf _snprintf_s
  #endif
#else
  #error "This platform is unsupported, sorry"
#endif




Serial::Serial()
{
	port_is_open = 0;
	baud_rate = 38400;	// default baud rate
}

Serial::~Serial()
{
	Close();
}



// Open a port, by name.  Return 0 on success, non-zero for error
int Serial::Open(const string& name)
{
	Close();
#if defined(LINUX)
	struct serial_struct kernel_serial_settings;
	int bits;
	port_fd = open(name.c_str(), O_RDWR | O_NOCTTY | O_NONBLOCK);
	if (port_fd < 0) {
		if (errno == EACCES) {
			error_msg = "Unable to access " + name + ", insufficient permission";
			// TODO: we could look at the permission bits and owner
			// to make a better message here
		} else if (errno == EISDIR) {
			error_msg = "Unable to open " + name +
				", Object is a directory, not a serial port";
		} else if (errno == ENODEV || errno == ENXIO) {
			error_msg = "Unable to open " + name +
				", Serial port hardware not installed";
		} else if (errno == ENOENT) {
			error_msg = "Unable to open " + name +
				", Device name does not exist";
		} else {
			error_msg = "Unable to open " + name +
				", " + strerror(errno);
		}
		return -1;
	}
	if (ioctl(port_fd, TIOCMGET, &bits) < 0) {
		close(port_fd);
		error_msg = "Unable to query serial port signals";
		return -1;
	}
	bits &= ~(TIOCM_DTR | TIOCM_RTS);
	if (ioctl(port_fd, TIOCMSET, &bits) < 0) {
		close(port_fd);
		error_msg = "Unable to control serial port signals";
		return -1;
	}
	if (tcgetattr(port_fd, &settings_orig) != 0) {
		close(port_fd);
		error_msg = "Unable to query serial port settings (perhaps not a serial port)";
		return -1;
	}
	memset(&settings, 0, sizeof(settings));
	settings.c_iflag = IGNBRK | IGNPAR;
	settings.c_cflag = CS8 | CREAD | HUPCL | CLOCAL;
	Set_baud(baud_rate);
	if (ioctl(port_fd, TIOCGSERIAL, &kernel_serial_settings) == 0) {
		kernel_serial_settings.flags |= ASYNC_LOW_LATENCY;
		ioctl(port_fd, TIOCSSERIAL, &kernel_serial_settings);
	}
	tcflush(port_fd, TCIFLUSH);
#elif defined(MACOSX)
	int bits;
	port_fd = open(name.c_str(), O_RDWR | O_NOCTTY | O_NONBLOCK);
	if (port_fd < 0) {
		error_msg = "Unable to open " + name + ", " + strerror(errno);
		return -1;
	}
	if (ioctl(port_fd, TIOCEXCL) == -1) {
		close(port_fd);
		error_msg = "Unable to get exclussive access to port " + name;
		return -1;
	}
	if (ioctl(port_fd, TIOCMGET, &bits) < 0) {
		close(port_fd);
		error_msg = "Unable to query serial port signals on " + name;
		return -1;
	}
	bits &= ~(TIOCM_DTR | TIOCM_RTS);
	if (ioctl(port_fd, TIOCMSET, &bits) < 0) {
		close(port_fd);
		error_msg = "Unable to control serial port signals on " + name;
		return -1;
	}
	if (tcgetattr(port_fd, &settings_orig) < 0) {
		close(port_fd);
		error_msg = "Unable to access baud rate on port " + name;
		return -1;
	}
	memset(&settings, 0, sizeof(settings));
	settings.c_cflag = CS8 | CLOCAL | CREAD | HUPCL;
	settings.c_iflag = IGNBRK | IGNPAR;
	Set_baud(baud_rate);
	tcflush(port_fd, TCIFLUSH);
#elif defined(WINDOWS)
	COMMCONFIG cfg;
	COMMTIMEOUTS timeouts;
	int got_default_cfg=0, port_num;
	char buf[1024], name_createfile[64], name_commconfig[64], *p;
	DWORD len;

	snprintf(buf, sizeof(buf), "%s", name.c_str());
	p = strstr(buf, "COM");
	if (p && sscanf(p + 3, "%d", &port_num) == 1) {
		//printf("port_num = %d\n", port_num);
		snprintf(name_createfile, sizeof(name_createfile), "\\\\.\\COM%d", port_num);
		snprintf(name_commconfig, sizeof(name_commconfig), "COM%d", port_num);
	} else {
		snprintf(name_createfile, sizeof(name_createfile), "%s", name.c_str());
		snprintf(name_commconfig, sizeof(name_commconfig), "%s", name.c_str());
	}
	len = sizeof(COMMCONFIG);
	if (GetDefaultCommConfig(name_commconfig, &cfg, &len)) {
		// this prevents unintentionally raising DTR when opening
		// might only work on COM1 to COM9
		got_default_cfg = 1;
		memcpy(&port_cfg_orig, &cfg, sizeof(COMMCONFIG));
		cfg.dcb.fDtrControl = DTR_CONTROL_DISABLE;
		cfg.dcb.fRtsControl = RTS_CONTROL_DISABLE;
		SetDefaultCommConfig(name_commconfig, &cfg, sizeof(COMMCONFIG));
	} else {
		printf("error with GetDefaultCommConfig\n");
	}
	port_handle = CreateFile(name_createfile, GENERIC_READ | GENERIC_WRITE,
	   0, 0, OPEN_EXISTING, FILE_FLAG_OVERLAPPED, NULL);
	if (port_handle == INVALID_HANDLE_VALUE) {
		win32_err(buf);
		error_msg =  "Unable to open " + name + ", " + buf;
		return -1;
	}
	len = sizeof(COMMCONFIG);
	if (!GetCommConfig(port_handle, &port_cfg, &len)) {
		CloseHandle(port_handle);
		win32_err(buf);
		error_msg = "Unable to read communication config on " + name + ", " + buf;
		return -1;
	}
	if (!got_default_cfg) {
		memcpy(&port_cfg_orig, &port_cfg, sizeof(COMMCONFIG));
	}
	// http://msdn2.microsoft.com/en-us/library/aa363188(VS.85).aspx
	port_cfg.dcb.BaudRate = baud_rate;
	port_cfg.dcb.fBinary = TRUE;
	port_cfg.dcb.fParity = FALSE;
	port_cfg.dcb.fOutxCtsFlow = FALSE;
	port_cfg.dcb.fOutxDsrFlow = FALSE;
	port_cfg.dcb.fDtrControl = DTR_CONTROL_ENABLE;
	port_cfg.dcb.fDsrSensitivity = FALSE;
	port_cfg.dcb.fTXContinueOnXoff = TRUE;	// ???
	port_cfg.dcb.fOutX = FALSE;
	port_cfg.dcb.fInX = FALSE;
	port_cfg.dcb.fErrorChar = FALSE;
	port_cfg.dcb.fNull = FALSE;
	port_cfg.dcb.fRtsControl = RTS_CONTROL_DISABLE;
	port_cfg.dcb.fAbortOnError = FALSE;
	port_cfg.dcb.ByteSize = 8;
	port_cfg.dcb.Parity = NOPARITY;
	port_cfg.dcb.StopBits = ONESTOPBIT;
	if (!SetCommConfig(port_handle, &port_cfg, sizeof(COMMCONFIG))) {
		CloseHandle(port_handle);
		win32_err(buf);
		error_msg = "Unable to write communication config to " + name + ", " + buf;
		return -1;
	}
	if (!EscapeCommFunction(port_handle, CLRDTR | CLRRTS)) {
		CloseHandle(port_handle);
		win32_err(buf);
		error_msg = "Unable to control serial port signals on " + name + ", " + buf;
		return -1;
	}
	// http://msdn2.microsoft.com/en-us/library/aa363190(VS.85).aspx
	// setting to all zeros means timeouts are not used
	//timeouts.ReadIntervalTimeout		= 0;
	timeouts.ReadIntervalTimeout		= MAXDWORD;
	timeouts.ReadTotalTimeoutMultiplier	= 0;
	timeouts.ReadTotalTimeoutConstant	= 0;
	timeouts.WriteTotalTimeoutMultiplier	= 0;
	timeouts.WriteTotalTimeoutConstant	= 0;
	if (!SetCommTimeouts(port_handle, &timeouts)) {
		CloseHandle(port_handle);
		win32_err(buf);
		error_msg = "Unable to write timeout settings to " + name + ", " + buf;
		return -1;
	}
#endif
	port_name = name;
	port_is_open = 1;
	return 0;
}

string Serial::get_name(void)
{
	if (!port_is_open) return "";
	return port_name;
}



// Return the last error message in a (hopefully) user friendly format
string Serial::error_message(void)
{
	return error_msg;
}

int Serial::Is_open(void)
{
	return port_is_open;
}

// Close the port
void Serial::Close(void)
{
	if (!port_is_open) return;
	Output_flush();
	Input_discard();
	port_is_open = 0;
	port_name = "";
#if defined(LINUX) || defined(MACOSX)
	tcsetattr(port_fd, TCSANOW, &settings_orig);
	close(port_fd);
#elif defined(WINDOWS)
	//SetCommConfig(port_handle, &port_cfg_orig, sizeof(COMMCONFIG));
	CloseHandle(port_handle);
#endif
}






// set the baud rate
int Serial::Set_baud(int baud)
{
	if (baud <= 0) return -1;
	//printf("set_baud: %d\n", baud);
	baud_rate = baud;
	if (!port_is_open) return -1;
#if defined(LINUX)
	speed_t spd;
	switch (baud) {
		case 230400:	spd = B230400;	break;
		case 115200:	spd = B115200;	break;
		case 57600:	spd = B57600;	break;
		case 38400:	spd = B38400;	break;
		case 19200:	spd = B19200;	break;
		case 9600:	spd = B9600;	break;
		case 4800:	spd = B4800;	break;
		case 2400:	spd = B2400;	break;
		case 1800:	spd = B1800;	break;
		case 1200:	spd = B1200;	break;
		case 600:	spd = B600;	break;
		case 300:	spd = B300;	break;
		case 200:	spd = B200;	break;
		case 150:	spd = B150;	break;
		case 134:	spd = B134;	break;
		case 110:	spd = B110;	break;
		case 75:	spd = B75;	break;
		case 50:	spd = B50;	break;
		#ifdef B460800
		case 460800:	spd = B460800;	break;
		#endif
		#ifdef B500000
		case 500000:	spd = B500000;	break;
		#endif
		#ifdef B576000
		case 576000:	spd = B576000;	break;
		#endif
		#ifdef B921600
		case 921600:	spd = B921600;	break;
		#endif
		#ifdef B1000000
		case 1000000:	spd = B1000000;	break;
		#endif
		#ifdef B1152000
		case 1152000:	spd = B1152000;	break;
		#endif
		#ifdef B1500000
		case 1500000:	spd = B1500000;	break;
		#endif
		#ifdef B2000000
		case 2000000:	spd = B2000000;	break;
		#endif
		#ifdef B2500000
		case 2500000:	spd = B2500000;	break;
		#endif
		#ifdef B3000000
		case 3000000:	spd = B3000000;	break;
		#endif
		#ifdef B3500000
		case 3500000:	spd = B3500000;	break;
		#endif
		#ifdef B4000000
		case 4000000:	spd = B4000000;	break;
		#endif
		#ifdef B7200
		case 7200:	spd = B7200;	break;
		#endif
		#ifdef B14400
		case 14400:	spd = B14400;	break;
		#endif
		#ifdef B28800
		case 28800:	spd = B28800;	break;
		#endif
		#ifdef B76800
		case 76800:	spd = B76800;	break;
		#endif
		default: {
			return -1;
		}
	}
	cfsetospeed(&settings, spd);
	cfsetispeed(&settings, spd);
	if (tcsetattr(port_fd, TCSANOW, &settings) < 0) return -1;
#elif defined(MACOSX)
	cfsetospeed(&settings, (speed_t)baud);
	cfsetispeed(&settings, (speed_t)baud);
	if (tcsetattr(port_fd, TCSANOW, &settings) < 0) return -1;
#elif defined(WINDOWS)
	DWORD len = sizeof(COMMCONFIG);
	port_cfg.dcb.BaudRate = baud;
	SetCommConfig(port_handle, &port_cfg, len);
#endif
	return 0;
}

int Serial::Set_baud(const string& baud_str)
{
	unsigned long b;
	b = atoi(baud_str.c_str());
	if (!b) return -1;
	return Set_baud((int)b);
}


// Read from the serial port.  Returns only the bytes that are
// already received, up to count.  This always returns without delay,
// returning 0 if nothing has been received
int Serial::Read(void *ptr, int count)
{
	if (!port_is_open) return -1;
	if (count <= 0) return 0;
#if defined(LINUX)
	int n, bits;
	n = read(port_fd, ptr, count);
	if (n < 0 && (errno == EAGAIN || errno == EINTR)) return 0;
	if (n == 0 && ioctl(port_fd, TIOCMGET, &bits) < 0) return -99;
	return n;
#elif defined(MACOSX)
	int n;
	n = read(port_fd, ptr, count);
	if (n < 0 && (errno == EAGAIN || errno == EINTR)) return 0;
	return n;
#elif defined(WINDOWS)
	// first, we'll find out how many bytes have been received
	// and are currently waiting for us in the receive buffer.
	//   http://msdn.microsoft.com/en-us/library/ms885167.aspx
	//   http://msdn.microsoft.com/en-us/library/ms885173.aspx
	//   http://source.winehq.org/WineAPI/ClearCommError.html
	COMSTAT st;
	DWORD errmask=0, num_read, num_request;
	OVERLAPPED ov;
	int r;
	if (!ClearCommError(port_handle, &errmask, &st)) return -1;
	//printf("Read, %d requested, %lu buffered\n", count, st.cbInQue);
	if (st.cbInQue <= 0) return 0;
	// now do a ReadFile, now that we know how much we can read
	// a blocking (non-overlapped) read would be simple, but win32
	// is all-or-nothing on async I/O and we must have it enabled
	// because it's the only way to get a timeout for WaitCommEvent
	num_request = ((DWORD)count < st.cbInQue) ? (DWORD)count : st.cbInQue;
	ov.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
	if (ov.hEvent == NULL) return -1;
	ov.Internal = ov.InternalHigh = 0;
	ov.Offset = ov.OffsetHigh = 0;
	if (ReadFile(port_handle, ptr, num_request, &num_read, &ov)) {
		// this should usually be the result, since we asked for
		// data we knew was already buffered
		//printf("Read, immediate complete, num_read=%lu\n", num_read);
		r = num_read;
	} else {
		if (GetLastError() == ERROR_IO_PENDING) {
			if (GetOverlappedResult(port_handle, &ov, &num_read, TRUE)) {
				//printf("Read, delayed, num_read=%lu\n", num_read);
				r = num_read;
			} else {
				//printf("Read, delayed error\n");
				r = -1;
			}
		} else {
			//printf("Read, error\n");
			r = -1;
		}
	}
	CloseHandle(ov.hEvent);
	// TODO: how much overhead does creating new event objects on
	// every I/O request really cost?  Would it be better to create
	// just 3 when we open the port, and reset/reuse them every time?
	// Would mutexes or critical sections be needed to protect them?
	return r;
#endif
}

// Write to the serial port.  This blocks until the data is
// sent (or in a buffer to be sent).  All bytes are written,
// unless there is some sort of error.
int Serial::Write(const void *ptr, int len)
{
	//printf("Write %d\n", len);
	if (!port_is_open) return -1;
#if defined(LINUX) || defined(MACOSX)
	int n, written=0;
	fd_set wfds;
	struct timeval tv;
	while (written < len) {
		n = write(port_fd, (const char *)ptr + written, len - written);
		if (n < 0 && (errno == EAGAIN || errno == EINTR)) n = 0;
		//printf("Write, n = %d\n", n);
		if (n < 0) return -1;
		if (n > 0) {
			written += n;
		} else {
			tv.tv_sec = 10;
			tv.tv_usec = 0;
			FD_ZERO(&wfds);
			FD_SET(port_fd, &wfds);
			n = select(port_fd+1, NULL, &wfds, NULL, &tv);
			if (n < 0 && errno == EINTR) n = 1;
			if (n <= 0) return -1;
		}
	}
	return written;
#elif defined(WINDOWS)
	DWORD num_written;
	OVERLAPPED ov;
	int r;
	ov.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
	if (ov.hEvent == NULL) return -1;
	ov.Internal = ov.InternalHigh = 0;
	ov.Offset = ov.OffsetHigh = 0;
	if (WriteFile(port_handle, ptr, len, &num_written, &ov)) {
		//printf("Write, immediate complete, num_written=%lu\n", num_written);
		r = num_written;
	} else {
		if (GetLastError() == ERROR_IO_PENDING) {
			if (GetOverlappedResult(port_handle, &ov, &num_written, TRUE)) {
				//printf("Write, delayed, num_written=%lu\n", num_written);
				r = num_written;
			} else {
				//printf("Write, delayed error\n");
				r = -1;
			}
		} else {
			//printf("Write, error\n");
			r = -1;
		}
	};
	CloseHandle(ov.hEvent);
	return r;
#endif
}

// Wait up to msec for data to become available for reading.
// return 0 if timeout, or non-zero if one or more bytes are
// received and can be read.  -1 if an error occurs
int Serial::Input_wait(int msec)
{
	if (!port_is_open) return -1;
#if defined(LINUX) || defined(MACOSX)
	fd_set rfds;
	struct timeval tv;
	tv.tv_sec = msec / 1000;
	tv.tv_usec = (msec % 1000) * 1000;
	FD_ZERO(&rfds);
	FD_SET(port_fd, &rfds);
	return select(port_fd+1, &rfds, NULL, NULL, &tv);
#elif defined(WINDOWS)
	// http://msdn2.microsoft.com/en-us/library/aa363479(VS.85).aspx
	// http://msdn2.microsoft.com/en-us/library/aa363424(VS.85).aspx
	// http://source.winehq.org/WineAPI/WaitCommEvent.html
	COMSTAT st;
	DWORD errmask=0, eventmask=EV_RXCHAR, ret;
	OVERLAPPED ov;
	int r;
	// first, request comm event when characters arrive
	if (!SetCommMask(port_handle, EV_RXCHAR)) return -1;
	// look if there are characters in the buffer already
	if (!ClearCommError(port_handle, &errmask, &st)) return -1;
	//printf("Input_wait, %lu buffered, timeout = %d ms\n", st.cbInQue, msec);
	if (st.cbInQue > 0) return 1;

	ov.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
	if (ov.hEvent == NULL) return -1;
	ov.Internal = ov.InternalHigh = 0;
	ov.Offset = ov.OffsetHigh = 0;
	if (WaitCommEvent(port_handle, &eventmask, &ov)) {
		//printf("Input_wait, WaitCommEvent, immediate success\n");
		r = 1;
	} else {
		if (GetLastError() == ERROR_IO_PENDING) {
			ret = WaitForSingleObject(ov.hEvent, msec);
			if (ret == WAIT_OBJECT_0) {
				//printf("Input_wait, WaitCommEvent, delayed success\n");
				r = 1;
			} else if (ret == WAIT_TIMEOUT) {
				//printf("Input_wait, WaitCommEvent, timeout\n");
				GetCommMask(port_handle, &eventmask);
				r = 0;
			} else {  // WAIT_FAILED or WAIT_ABANDONED
				//printf("Input_wait, WaitCommEvent, delayed error\n");
				r = -1;
			}
		} else {
			//printf("Input_wait, WaitCommEvent, immediate error\n");
			r = -1;
		}
	}
	SetCommMask(port_handle, 0);
	CloseHandle(ov.hEvent);
	return r;
#endif
}

// Discard all received data that hasn't been read
void Serial::Input_discard(void)
{
	if (!port_is_open) return;
#if defined(LINUX) || defined(MACOSX)
	// does this really work properly (and is it thread safe) on Linux??
	tcflush(port_fd, TCIFLUSH);
#elif defined(WINDOWS)
	PurgeComm(port_handle, PURGE_RXCLEAR);
#endif
}

// Wait for all transmitted data with Write to actually leave the serial port
void Serial::Output_flush(void)
{
	if (!port_is_open) return;
#if defined(LINUX) || defined(MACOSX)
	tcdrain(port_fd);
#elif defined(WINDOWS)
	FlushFileBuffers(port_handle);
#endif
}


// set DTR and RTS,  0 = low, 1=high, -1=unchanged
int Serial::Set_control(int dtr, int rts)
{
	if (!port_is_open) return -1;
#if defined(LINUX) || defined(MACOSX)
	// on Mac OS X, "man 4 tty"
	// on Linux, where is this actually documented?
	int bits;
	if (ioctl(port_fd, TIOCMGET, &bits) < 0) return -1;
	if (dtr == 1) {
		bits |= TIOCM_DTR;
	} else if (dtr == 0) {
		bits &= ~TIOCM_DTR;
	}
	if (rts == 1) {
		bits |= TIOCM_RTS;
	} else if (rts == 0) {
		bits &= ~TIOCM_RTS;
	}
	if (ioctl(port_fd, TIOCMSET, &bits) < 0) return -1;;
#elif defined(WINDOWS)
	// http://msdn.microsoft.com/en-us/library/aa363254(VS.85).aspx
	if (dtr == 1) {
		if (!EscapeCommFunction(port_handle, SETDTR)) return -1;
	} else if (dtr == 0) {
		if (!EscapeCommFunction(port_handle, CLRDTR)) return -1;
	}
	if (rts == 1) {
		if (!EscapeCommFunction(port_handle, SETRTS)) return -1;
	} else if (rts == 0) {
		if (!EscapeCommFunction(port_handle, CLRRTS)) return -1;
	}
#endif
	return 0;
}



#if defined(LINUX)
// All linux serial port device names.  Hopefully all of them anyway.  This
// is a long list, but each entry takes only a few bytes and a quick strcmp()
static const char *devnames[] = {
"S",	// "normal" Serial Ports - MANY drivers using this
"USB",	// USB to serial converters
"ACM",	// USB serial modem, CDC class, Abstract Control Model
"MI",	// MOXA Smartio/Industio family multiport serial... nice card, I have one :-)
"MX",	// MOXA Intellio family multiport serial
"C",	// Cyclades async multiport, no longer available, but I have an old ISA one! :-)
"D",	// Digiboard (still in 2.6 but no longer supported), new Moschip MCS9901
"P",	// Hayes ESP serial cards (obsolete)
"M",	// PAM Software's multimodem & Multitech ISI-Cards
"E",	// Stallion intelligent multiport (no longer made)
"L",	// RISCom/8 multiport serial
"W",	// specialix IO8+ multiport serial
"X",	// Specialix SX series cards, also SI & XIO series
"SR",	// Specialix RIO serial card 257+
"n",	// Digi International Neo (yes lowercase 'n', drivers/serial/jsm/jsm_driver.c)
"FB",	// serial port on the 21285 StrongArm-110 core logic chip
"AM",	// ARM AMBA-type serial ports (no DTR/RTS)
"AMA",	// ARM AMBA-type serial ports (no DTR/RTS)
"AT",	// Atmel AT91 / AT32 Serial ports
"BF",	// Blackfin 5xx serial ports (Analog Devices embedded DSP chips)
"CL",	// CLPS711x serial ports (ARM processor)
"A",	// ICOM Serial
"SMX",	// Motorola IMX serial ports
"SOIC",	// ioc3 serial
"IOC",	// ioc4 serial
"PSC",	// Freescale MPC52xx PSCs configured as UARTs
"MM",	// MPSC (UART mode) on Marvell GT64240, GT64260, MV64340...
"B",	// Mux console found in some PA-RISC servers
"NX",	// NetX serial port
"PZ",	// PowerMac Z85c30 based ESCC cell found in the "macio" ASIC
"SAC",	// Samsung S3C24XX onboard UARTs
"SA",	// SA11x0 serial ports
"AM",	// KS8695 serial ports & Sharp LH7A40X embedded serial ports
"TX",	// TX3927/TX4927/TX4925/TX4938 internal SIO controller
"SC",	// Hitachi SuperH on-chip serial module
"SG",	// C-Brick Serial Port (and console) SGI Altix machines
"HV",	// SUN4V hypervisor console
"UL",	// Xilinx uartlite serial controller
"VR",	// NEC VR4100 series Serial Interface Unit
"CPM",	// CPM (SCC/SMC) serial ports; core driver
"Y",	// Amiga A2232 board
"SL",	// Microgate SyncLink ISA and PCI high speed multiprotocol serial
"SLG",	// Microgate SyncLink GT (might be sync HDLC only?)
"SLM",	// Microgate SyncLink Multiport high speed multiprotocol serial
"CH",	// Chase Research AT/PCI-Fast serial card
"F",	// Computone IntelliPort serial card
"H",	// Chase serial card
"I",	// virtual modems
"R",	// Comtrol RocketPort
"SI",	// SmartIO serial card
"T",	// Technology Concepts serial card
"V"	// Comtrol VS-1000 serial controller
};
#define NUM_DEVNAMES (sizeof(devnames) / sizeof(const char *))
#endif



#if defined(MACOSX)
static void macos_ports(io_iterator_t  * PortIterator, vector<string>& list)
{
	io_object_t modemService;
	CFTypeRef nameCFstring;
	char s[MAXPATHLEN];

	while ((modemService = IOIteratorNext(*PortIterator))) {
		nameCFstring = IORegistryEntryCreateCFProperty(modemService, 
		   CFSTR(kIOCalloutDeviceKey), kCFAllocatorDefault, 0);
		if (nameCFstring) {
			if (CFStringGetCString((const __CFString *)nameCFstring,
			   s, sizeof(s), kCFStringEncodingASCII)) {
				list.push_back(s);
			}
			CFRelease(nameCFstring);
		}
		IOObjectRelease(modemService);
	}
}
#endif


// Return a list of all serial ports
vector<string> Serial::port_list()
{
	vector<string> list;
#if defined(LINUX)
	// This is ugly guessing, but Linux doesn't seem to provide anything else.
	// If there really is an API to discover serial devices on Linux, please
	// email paul@pjrc.com with the info.  Please?
	// The really BAD aspect is all ports get DTR raised briefly, because linux
	// has no way to open the port without raising DTR, and there isn't any way
	// to tell if the device file really represents hardware without opening it.
	// maybe sysfs or udev provides a useful API??
	DIR *dir;
	struct dirent *f;
	struct stat st;
	unsigned int i, len[NUM_DEVNAMES];
	char s[512];
	int fd, bits;
	termios mytios;

	dir = opendir("/dev/");
	if (dir == NULL) return list;
	for (i=0; i<NUM_DEVNAMES; i++) len[i] = strlen(devnames[i]);
	// Read all the filenames from the /dev directory...
	while ((f = readdir(dir)) != NULL) {
		// ignore everything that doesn't begin with "tty"
		if (strncmp(f->d_name, "tty", 3)) continue;
		// ignore anything that's not a known serial device name
		for (i=0; i<NUM_DEVNAMES; i++) {
			if (!strncmp(f->d_name + 3, devnames[i], len[i])) break;
		}
		if (i >= NUM_DEVNAMES) continue;
		snprintf(s, sizeof(s), "/dev/%s", f->d_name);
		// check if it's a character type device (almost certainly is)
		if (stat(s, &st) != 0 || !(st.st_mode & S_IFCHR)) continue;
		// now see if we can open the file - if the device file is
		// populating /dev but doesn't actually represent a loaded
		// driver, this is where we will detect it.
		fd = open(s, O_RDONLY | O_NOCTTY | O_NONBLOCK);
		if (fd < 0) {
			// if permission denied, give benefit of the doubt
			// (otherwise the port will be invisible to the user
			// and we won't have a to alert them to the permssion
			// problem)
			if (errno == EACCES) list.push_back(s);
			// any other error, assume it's not a real device
			continue;
		}
		// does it respond to termios requests? (probably will since
		// the name began with tty).  Some devices where a single
		// driver exports multiple names will open but this is where
		// we can really tell if they work with real hardare.
		if (tcgetattr(fd, &mytios) != 0) {
			close(fd);
			continue;
		}
		// does it respond to reading the control signals?  If it's
		// some sort of non-serial terminal (eg, pseudo terminals)
		// this is where we will detect it's not really a serial port
		if (ioctl(fd, TIOCMGET, &bits) < 0) {
			close(fd);
			continue;
		}
		// it passed all the tests, it's a serial port, or some sort
		// of "terminal" that looks exactly like a real serial port!
		close(fd);
		// unfortunately, Linux always raises DTR when open is called.
		// not nice!  Every serial port is going to get DTR raised
		// and then lowered.  I wish there were a way to prevent this,
		// but it seems impossible.
		list.push_back(s);
	}
	closedir(dir);
#elif defined(MACOSX)
	// adapted from SerialPortSample.c, by Apple
	// http://developer.apple.com/samplecode/SerialPortSample/listing2.html
	// and also testserial.c, by Keyspan
	// http://www.keyspan.com/downloads-files/developer/macosx/KesypanTestSerial.c
	// www.rxtx.org, src/SerialImp.c seems to be based on Keyspan's testserial.c
	// neither keyspan nor rxtx properly release memory allocated.
	// more documentation at:
	// http://developer.apple.com/documentation/DeviceDrivers/Conceptual/WorkingWSerial/WWSerial_SerialDevs/chapter_2_section_6.html
	mach_port_t masterPort;
	CFMutableDictionaryRef classesToMatch;
	io_iterator_t serialPortIterator;
	if (IOMasterPort(NULL, &masterPort) != KERN_SUCCESS) return list;
	// a usb-serial adaptor is usually considered a "modem",
	// especially when it implements the CDC class spec
	classesToMatch = IOServiceMatching(kIOSerialBSDServiceValue);
	if (!classesToMatch) return list;
	CFDictionarySetValue(classesToMatch, CFSTR(kIOSerialBSDTypeKey),
	   CFSTR(kIOSerialBSDModemType));
	if (IOServiceGetMatchingServices(masterPort, classesToMatch,
	   &serialPortIterator) != KERN_SUCCESS) return list;
	macos_ports(&serialPortIterator, list);
	IOObjectRelease(serialPortIterator);
	// but it might be considered a "rs232 port", so repeat this
	// search for rs232 ports
	classesToMatch = IOServiceMatching(kIOSerialBSDServiceValue);
	if (!classesToMatch) return list;
	CFDictionarySetValue(classesToMatch, CFSTR(kIOSerialBSDTypeKey),
	   CFSTR(kIOSerialBSDRS232Type));
	if (IOServiceGetMatchingServices(masterPort, classesToMatch,
	   &serialPortIterator) != KERN_SUCCESS) return list;
	macos_ports(&serialPortIterator, list);
	IOObjectRelease(serialPortIterator);
#elif defined(WINDOWS)
	// http://msdn.microsoft.com/en-us/library/aa365461(VS.85).aspx
	// page with 7 ways - not all of them work!
	// http://www.naughter.com/enumser.html
	// may be possible to just query the windows registary
	// http://it.gps678.com/2/ca9c8631868fdd65.html
	// search in HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\SERIALCOMM
	// Vista has some special new way, vista-only
	// http://msdn2.microsoft.com/en-us/library/aa814070(VS.85).aspx
	char *buffer, *p;
	//DWORD size = QUERYDOSDEVICE_BUFFER_SIZE;
	DWORD ret;

	buffer = (char *)malloc(QUERYDOSDEVICE_BUFFER_SIZE);
	if (buffer == NULL) return list;
	memset(buffer, 0, QUERYDOSDEVICE_BUFFER_SIZE);
	ret = QueryDosDeviceA(NULL, buffer, QUERYDOSDEVICE_BUFFER_SIZE);
	if (ret) {
		//printf("Detect Serial using QueryDosDeviceA: ");
		for (p = buffer; *p; p += strlen(p) + 1) {
			if (strncmp(p, "COM", 3)) continue;
			list.push_back(string(p) );
			//printf(":  %s\n", p);
		}
	} else {
		char buf[1024];
		win32_err(buf);
		printf("QueryDosDeviceA failed, error \"%s\"\n", buf);
		printf("Detect Serial using brute force GetDefaultCommConfig probing: ");
		for (int i=1; i<=32; i++) {
			printf("try  %s", buf);
			COMMCONFIG cfg;
			DWORD len;
			snprintf(buf, sizeof(buf), "COM%d", i);
			if (GetDefaultCommConfig(buf, &cfg, &len)) {
				std::ostringstream name;
  				name << "COM" << i << ":";
				list.push_back(name.str());
				printf(":  %s", buf);
			}
		}
	}
	free(buffer);
#endif
	std::sort (list.begin(), list.end());
	return list;
}








