within Arduino.Firmata.Internal;
function numSentMessages
  extends Modelica.Icons.Function;

  input Integer id;
  output Integer count;

  external "C" count = numSentMessages(id) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end numSentMessages;
