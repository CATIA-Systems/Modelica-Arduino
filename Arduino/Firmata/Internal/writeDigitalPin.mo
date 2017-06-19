within Arduino.Firmata.Internal;
function writeDigitalPin
  input Integer pin;
  input Integer board;
  input Boolean value;

  external "C" writeDigitalPin(pin, board, value) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end writeDigitalPin;
