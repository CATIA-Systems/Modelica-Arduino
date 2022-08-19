within Arduino.Internal;
encapsulated function buildSketchOM
  extends Modelica.Icons.Function;

  import Arduino;
  import Modelica;
  input String sketch = "Blink.ino";
  input String cmake = "C:/Program Files/CMake/bin/cmake.exe" "Absolute path to the CMake executable";
  input String generator = "Visual Studio 17 2022" "CMake generator to build the Sketch" annotation(choices(choice="Visual Studio 14 2015", choice="Visual Studio 15 2017", choice="Visual Studio 16 2019", choice="Visual Studio 17 2022"));
  input String platform = "x64" annotation(choices(choice="Win32", choice="x64"));
  output Boolean success;

protected
  String path = Modelica.Utilities.Files.loadResource("modelica://Arduino/");
  String cppFile = path + "Resources/Source/Arduino/Sketch.cpp";
  String batFile = "buildSketch.bat";

algorithm

  // remove the .cpp file
  remove(cppFile);

  // write the C++ file
  writeFile(cppFile, "#include \"Sketch.h\"
  
#include \"Arduino.h\"
#include \"SoftSerial.h\"

SoftSerial Serial;

// include your sketch here
#include \"" + sketch + "\"");

  // remove the build script
  remove(batFile);

  // write the build script
  writeFile(batFile,
    "set CMAKE=\"" + cmake + "\"\n" +
    "set BUILD=\"" + path + "Resources/Source/Arduino/" + platform + "\"\n" +
    "\n" +
    "%CMAKE% -G \"" + generator + "\" -A " + platform + " -S \"" + path + "Resources/Source/Arduino\" -B %BUILD%\n" +
    "if %errorlevel% neq 0 exit /b %errorlevel%\n" +
    "\n" +
    "%CMAKE%  --build %BUILD% --config Release\n" +
    "if %errorlevel% neq 0 exit /b %errorlevel%\n");

  // call the build script
  success := system(batFile + " > buildSketch.log") == 0;

end buildSketchOM;
