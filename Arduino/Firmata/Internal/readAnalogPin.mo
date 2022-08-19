within Arduino.Firmata.Internal;
function readAnalogPin
  extends Modelica.Icons.Function;

  input Integer pin;
  input Real min;
  input Real max;
  input Real init;
  input Integer board;
  output Real value;

  external "C" value = readAnalogPin(pin, min, max, init, board) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end readAnalogPin;
