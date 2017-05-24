within ;
package Arduino

  extends Modelica.Icons.Package;




protected 
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
#include \""   + sketch + "\"", cppFile);

    //Modelica.Utilities.System.command("echo " + path + " " + sketch + " > echo.txt");

    // remove the old .lib file
    Modelica.Utilities.Files.removeFile(path + "Resources/Library/win32/ModelicaArduino.lib");

    // call the build script
    Modelica.Utilities.System.command("call \"%VS120COMNTOOLS%/vsvars32.bat\" && msbuild " + path + "../VisualStudio/Arduino/Arduino.vcxproj /t:Clean,Build /p:Configuration=Release /p:Platform=win32");

    b:=true;
    annotation(translate=true);
  end buildSketch;

  annotation (uses(Modelica(version="3.2.2")), version="0.0.1", Icon(graphics={
        Ellipse(
          extent={{-80,38},{4,-38}},
          lineColor={0,135,143},
          lineThickness=0.5),
        Ellipse(
          extent={{4,38},{88,-38}},
          lineColor={0,135,143},
          lineThickness=0.5),
        Line(
          points={{-56,0},{-24,0}},
          color={0,135,143},
          smooth=Smooth.Bezier),
        Line(
          points={{24,0},{68,0}},
          color={0,135,143},
          smooth=Smooth.Bezier),
        Line(
          points={{-20,-4.8986e-016},{12,0}},
          color={0,135,143},
          smooth=Smooth.Bezier,
          origin={46,4},
          rotation=90)}));
end Arduino;
