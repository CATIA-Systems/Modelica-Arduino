within Arduino.Firmata.Internal;
function readDigitalPin
  input Integer pin;
  input Boolean init;
  input Integer board;
  input Integer t;
  output Boolean value;

  external "C" value = readDigitalPin(pin, init, board, t) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end readDigitalPin;
