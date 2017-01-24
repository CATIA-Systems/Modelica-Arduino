/********************************************************
 * PID Basic Example
 * Reading analog input 0 to control analog PWM output 3
 ********************************************************/

#include <PID_v1.h>

#define PIN_INPUT A0
#define PIN_OUTPUT 3

//Define Variables we'll be connecting to
double Setpoint = 10000, Input, Output;

//Specify the links and initial tuning parameters
// Kp = 0...10	
// Ki = 0...50
// Kd = 0...1e-3
// Setpoint = 0...12400


const double Kp_max = 10;
const double Ki_max = 50;
const double Kd_max = 1e-3;


const double Setpoint_max = 12400;

double Kp=0.01, Ki=4, Kd=0.00001;

PID myPID(&Input, &Output, &Setpoint, Kp, Ki, Kd, DIRECT);

void update() {

  Input = (analogRead(PIN_INPUT) / 1023.) * Setpoint_max;

  Kp = (analogRead(A1) / 1023.) * Kp_max;
  Ki = (analogRead(A2) / 1023.) * Ki_max;
  Kd = (analogRead(A3) / 1023.) * Kd_max;

  Setpoint = (analogRead(A4) / 1023.) * Setpoint_max;
}

void setup() {

	myPID.SetMode(AUTOMATIC);
	myPID.SetSampleTime(1);
}

void loop() {

	ModelicaFormatMessage("Input=%g, Kp=%g, Ki=%g, Kd=%g, Setpoint=%g\n", Input, Kp, Ki, Kd, Setpoint);

	update();

	myPID.Compute();

	analogWrite(PIN_OUTPUT, Output);
}
