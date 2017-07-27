#pragma once

typedef struct {

	void(*vFormatMessage)(const char *, va_list);
	void(*vFormatError)(const char *, va_list);

} Callbacks_t;
