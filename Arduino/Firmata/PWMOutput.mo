within Arduino.Firmata;
model PWMOutput

  parameter Integer digitalPin(min=0, max=13) "Digital PWM pin (~)";
  parameter Real minValue = 0 "Minimum value";
  parameter Real maxValue = 1 "Maximum value";

  Internal.PinConnector pinConnector
    annotation (Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{84,-16},{116,16}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

protected
  Real scaledValue = (u - minValue) / (maxValue - minValue);

equation
  Firmata.Internal.writeAnalogPin(
    digitalPin,
    pinConnector,
    scaledValue);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Polygon(
          points={{100,0},{20,80},{-100,80},{-100,-80},{20,-80},{100,0}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Line(points={{-78,-16},{-66,-16},{-66,
              28},{-54,28},{-54,-16},{-14,-16},{-14,28},{28,28},{28,-16},{56,
              -16}}, color={28,108,200}),
                                 Text(
          extent={{-90,-34},{20,-68}},
          lineColor={0,0,0},
          textString="D%digitalPin")}),   Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end PWMOutput;
