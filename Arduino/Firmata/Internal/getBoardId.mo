within Arduino.Firmata.Internal;
function getBoardId
  extends Modelica.Icons.Function;

  input Firmata.Internal.ExternalFirmata board;
  output Integer id;

  external "C" id = getBoardId(board) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end getBoardId;
