within Arduino.Firmata.Internal;
function getBoardId
  input Firmata.Internal.ExternalFirmata board;
  output Integer id;

  external "C" id = getBoardId(board) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
end getBoardId;
