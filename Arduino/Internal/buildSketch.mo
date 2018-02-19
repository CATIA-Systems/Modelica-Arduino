within Arduino.Internal;
encapsulated function buildSketch
  import Modelica;
  input String path;
  input String sketch;
  output Boolean success;
protected
  String cppFile;
algorithm

  cppFile := path + "Resources/Source/Arduino/Sketch.cpp";

  // remove the .cpp file
  Modelica.Utilities.Files.removeFile(cppFile);

  // write the file
  Modelica.Utilities.Streams.print("#include \"Sketch.h\"
  
#include \"Arduino.h\"
#include \"SoftSerial.h\"

SoftSerial Serial;

// include your sketch here
#include \"" + sketch + "\"", cppFile);

  // build the library
  Modelica.Utilities.System.command("call \"" + path + "Resources/Source/Arduino/build_sketch.bat\"");

  success := true;
  annotation(translate=true);
end buildSketch;
