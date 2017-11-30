within Arduino.Internal;
class ExternalArduino "External object of Arduino"
  extends ExternalObject;

  function constructor "Open Arduino"
    input Arduino.Internal.ModelicaFunctions callbacks;
    output ExternalArduino externalArduino;
  external"C" externalArduino =
        ModelicaArduino_open(callbacks) annotation (
    Library="ModelicaArduino");
  end constructor;

  function destructor "Close Arduino"
    input ExternalArduino externalArduino;
  external"C" ModelicaArduino_close(externalArduino) annotation (
  Library="ModelicaArduino");
  end destructor;

annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            lineColor={160,160,164},
            fillColor={160,160,164},
            fillPattern=FillPattern.Solid,
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0)}));
end ExternalArduino;
