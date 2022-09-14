within Arduino.Internal;
function clean "Remove the generated CMake project"
  extends Modelica.Icons.Function;

  output Boolean success;

protected
  String path = Modelica.Utilities.Files.loadResource("modelica://Arduino/");

algorithm
  success := system("rmdir \"" + path + "Resources/Source/Arduino/x64\" /s /q") == 0;

end clean;
