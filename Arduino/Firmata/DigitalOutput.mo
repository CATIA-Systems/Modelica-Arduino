within Arduino.Firmata;
model DigitalOutput

  parameter Integer digitalPin(min=0, max=13) "Digital pin";

  Internal.PinConnector pinConnector
    annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Blocks.Interfaces.BooleanInput value
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

equation
  Firmata.Internal.writeDigitalPin(
    digitalPin,
    pinConnector,
    value);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Polygon(
          points={{100,0},{20,80},{-100,80},{-100,-80},{20,-80},{100,0}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                          Line(points={{-82,-16},{-22,-16},{-22,28},{20,28},{20,
              -16},{48,-16}}, color={255,0,255}),
                                 Text(
          extent={{-90,-36},{20,-70}},
          lineColor={0,0,0},
          textString="D%digitalPin")}),   Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end DigitalOutput;
