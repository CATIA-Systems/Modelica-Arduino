within Arduino.Firmata;
model AnalogInput

  parameter Integer analogInputPin(min=0, max=5) "Analog input pin";
  parameter Real initValue = 0 "Initial value";
  parameter Real minValue = 0 "Minimum value";
  parameter Real maxValue = 1 "Maximum value";

  Internal.PinConnector pinConnector
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-116,-16},{-84,16}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation

    when (sample(0, 0.001)) then
    y = Firmata.Internal.readAnalogPin(
      15 + analogInputPin,
      minValue,
      maxValue,
      initValue,
      pinConnector);
    end when
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Polygon(
          points={{-100,0},{-20,80},{100,80},{100,-80},{-20,-80},{-100,0}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-78,66}},
          color={0,0,0},
          pattern=LinePattern.None),
        Line(
          points={{-40,0},{-10,40},{20,0},{50,-40},{80,0}},
          color={28,108,200},
          smooth=Smooth.Bezier), Text(
          extent={{-20,-38},{90,-72}},
          lineColor={0,0,0},
          textString="A%analogInputPin")}),
                                       Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    experiment,
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));

end AnalogInput;
