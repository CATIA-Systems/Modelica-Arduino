within Arduino.Internal;
encapsulated function buildSketch
  import Modelica;
  input String path;
  input String sketch;
  output Boolean success;
protected
  String cppFile;
  //String mscver = "14";
algorithm

  //Modelica.Utilities.Streams.print("Compiling sketch...");

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

  // remove the old .lib files
  //Modelica.Utilities.Files.removeFile(path + "Resources/Library/win64/ModelicaArduino.lib");
  //Modelica.Utilities.Files.removeFile(path + "Resources/Library/win32/ModelicaArduino.lib");

  // build the library
  Modelica.Utilities.System.command("call \"" + path + "Resources/Source/Arduino/build_sketch.bat\"");

  //Modelica.Utilities.System.command("call \"%VS" + mscver + "0COMNTOOLS%vsvars32.bat\" && cd /d \"" + path + "../VisualStudio/Arduino\" && nmake clean build");
  //Modelica.Utilities.System.command("\"%VS" + mscver + "0COMNTOOLS%..\..\VC\vcvarsall.bat\" " + platform + " && cd /d \"" + path + "../VisualStudio/Arduino\" && nmake clean build");
  //Modelica.Utilities.System.command("call \"%VS140COMNTOOLS%..\..\VC\vcvarsall.bat\" && cd /d \"Z:/Development/Playground/ModelicaArduino/Arduino/../VisualStudio/Arduino\" && nmake clean build");

  //Modelica.Utilities.System.command("call \"%VS" + mscver + "0COMNTOOLS%vsvars32.bat\" && msbuild " + path + "../VisualStudio/Arduino/Arduino.vcxproj /t:Clean,Build /p:VisualStudioVersion=" + mscver + ".0 /p:Configuration=Release /p:Platform=win32");
  //Modelica.Utilities.System.command("call \"%VS" + mscver + "0COMNTOOLS%vsvars32.bat\" && msbuild " + path + "../VisualStudio/Arduino/Arduino.vcxproj /t:Clean,Build /p:VisualStudioVersion=" + mscver + ".0 /p:Configuration=Release /p:Platform=x64");

  success := true;
  annotation(translate=true);
end buildSketch;
