
const byte ledPin = 13;
const byte interruptPin = 2;
volatile byte state = LOW;

void blink() {
  Serial.println(state);
  state = !state;
}

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(interruptPin, INPUT);
  attachInterrupt(digitalPinToInterrupt(interruptPin), blink, CHANGE);
}

void loop() {
  digitalWrite(ledPin, state);
}
