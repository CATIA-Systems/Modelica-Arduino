within Arduino.Firmata.Internal;
function numReceivedMessages
  extends Modelica.Icons.Function;

  input Integer id;
  output Integer count;

  external "C" count = numReceivedMessages(id) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end numReceivedMessages;
