within Arduino.Firmata.Internal;
function updateBoard
  extends Modelica.Icons.Function;

  input Integer board;

  external "C" updateBoard(board) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");

end updateBoard;
