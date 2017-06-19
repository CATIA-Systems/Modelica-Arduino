within Arduino.Firmata.Internal;
function writeAnalogPin
  input Integer pin;
  input Integer board;
  input Real value;

  external "C" writeAnalogPin(pin, board, value) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end writeAnalogPin;
