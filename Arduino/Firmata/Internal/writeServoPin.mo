within Arduino.Firmata.Internal;
function writeServoPin
  extends Modelica.Icons.Function;

  input Integer pin;
  input Integer board;
  input Real value;
  input Integer minPulse;
  input Integer maxPulse;

  external "C" writeServoPin(pin, board, value, minPulse, maxPulse) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end writeServoPin;
