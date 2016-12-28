int pin = 2;

unsigned long duration;

void setup() {
	pinMode(pin, INPUT);
}

void loop() {
	duration = pulseIn(pin, HIGH, 2000000L);
	Serial.println(duration);
}
