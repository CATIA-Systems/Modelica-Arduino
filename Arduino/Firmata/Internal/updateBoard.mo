within Arduino.Firmata.Internal;
function updateBoard

  input Integer board;

  external "C" updateBoard(board) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");

end updateBoard;
