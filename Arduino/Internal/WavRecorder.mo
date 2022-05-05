within Arduino.Internal;
class WavRecorder
  extends ExternalObject;

  function constructor
    input String filename;
    output WavRecorder wavRecorder;

    external "C" wavRecorder = WavRecorder_create(filename) annotation (
      Include = "#include \"WavRecorder.c\"",
      IncludeDirectory="modelica://Arduino/Resources/Include");
  end constructor;

  function destructor
    input WavRecorder wavRecorder;
  external "C" WavRecorder_free(wavRecorder) annotation (
      Include = "#include \"WavRecorder.c\"",
      IncludeDirectory="modelica://Arduino/Resources/Include");
  end destructor;

  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            lineColor={160,160,164},
            fillColor={160,160,164},
            fillPattern=FillPattern.Solid,
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0)}));
end WavRecorder;
