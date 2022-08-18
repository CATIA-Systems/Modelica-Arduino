within Arduino.Internal;
encapsulated function buildSketch

  import Arduino;
  import Modelica;
  input String sketch = "Blink.ino";
  input String cmake = "cmake";
  input String generator = "Visual Studio 17 2022";
  input String platform = "Win32";
  output Boolean success;

protected
  String path = Modelica.Utilities.Files.loadResource("modelica://Arduino/");
  String cppFile = path + "Resources/Source/Arduino/Sketch.cpp";
  String batFile = "buildSketch.bat";

algorithm

  // remove the .cpp file
  Modelica.Utilities.Files.removeFile(cppFile);

  // write the C++ file
  Modelica.Utilities.Streams.print("#include \"Sketch.h\"
  
#include \"Arduino.h\"
#include \"SoftSerial.h\"

SoftSerial Serial;

// include your sketch here
#include \"" + sketch + "\"", cppFile);

  // remove the build script
  Modelica.Utilities.Files.removeFile(batFile);

  // write the build script
  Modelica.Utilities.Streams.print(
    "set CMAKE=\"" + cmake + "\"\n" +
    "set BUILD=\"" + path + "Resources/Source/Arduino/" + platform + "\"\n" +
    "\n" +
    "%CMAKE% -G \"" + generator + "\" -A " + platform + " -S \"" + path + "Resources/Source/Arduino\" -B %BUILD%\n" +
    "if %errorlevel% neq 0 exit /b %errorlevel%\n" +
    "\n" +
    "%CMAKE%  --build %BUILD% --config Release\n" +
    "if %errorlevel% neq 0 exit /b %errorlevel%\n", batFile);

  // call the build script
  success := Modelica.Utilities.System.command("CALL " + batFile) == 0;

  annotation(__Dymola_translate=true);
end buildSketch;
