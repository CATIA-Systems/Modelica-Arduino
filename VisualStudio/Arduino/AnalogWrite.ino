
const int pin = 2;

void setup() {
  pinMode(pin, OUTPUT);
}

void loop() {

  double v = sin(millis() / 1000.0) * 1000;

  if (v >= 0) {
	
	pinMode(pin, OUTPUT);
	analogWrite(pin, map(v, 0, 1000, 0, 255));
  
  } else {
	
	pinMode(pin, INPUT);

  }

  delay(100);

}
