within Arduino.Internal;
encapsulated function buildSketch
  import Modelica;
  input String path;
  input String sketch;
  output Boolean b;
protected
  String cppFile;
algorithm

  cppFile := path + "../VisualStudio/Arduino/Sketch.cpp";

  // remove the .cpp file
  Modelica.Utilities.Files.removeFile(cppFile);

  // write the file
  Modelica.Utilities.Streams.print("#include \"Sketch.h\"\n
#include \"Arduino.h\"
#include \"SoftSerial.h\"

SoftSerial Serial;

// include your sketch here
#include \"" + sketch + "\"", cppFile);

  //Modelica.Utilities.System.command("echo " + path + " " + sketch + " > echo.txt");

  // remove the old .lib file
  Modelica.Utilities.Files.removeFile(path + "Resources/Library/win32/ModelicaArduino.lib");

  // call the build script
  Modelica.Utilities.System.command("call \"%VS120COMNTOOLS%/vsvars32.bat\" && msbuild " + path + "../VisualStudio/Arduino/Arduino.vcxproj /t:Clean,Build /p:Configuration=Release /p:Platform=win32");

  b:=true;
  annotation(translate=true);
end buildSketch;
