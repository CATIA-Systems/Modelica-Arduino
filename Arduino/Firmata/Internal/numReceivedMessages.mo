within Arduino.Firmata.Internal;
function numReceivedMessages
  input Integer id;
  output Integer count;

  external "C" count = numReceivedMessages(id) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end numReceivedMessages;
