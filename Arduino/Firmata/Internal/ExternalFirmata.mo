within Arduino.Firmata.Internal;
class ExternalFirmata
  extends ExternalObject;

  function constructor
    input String port;
    input Boolean showCapabilities;
    input Integer samplingMs;
    input Integer baudRate;
    input Boolean useDTR;
    input Firmata.Internal.ModelicaFunctions callbacks;
    output ExternalFirmata externalFirmata;
  external"C" externalFirmata = createFirmataConnection(port, showCapabilities, samplingMs, baudRate, useDTR, callbacks) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
  end constructor;

  function destructor
    input ExternalFirmata externalFirmata;
  external"C" freeFirmataConnection(externalFirmata) annotation (
    Library={"ModelicaFirmata"},
    LibraryDirectory="modelica://Arduino/Resources/Library");
  end destructor;

annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            lineColor={160,160,164},
            fillColor={160,160,164},
            fillPattern=FillPattern.Solid,
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0)}));
end ExternalFirmata;
