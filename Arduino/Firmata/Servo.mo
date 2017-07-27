within Arduino.Firmata;
model Servo

  parameter Integer digitalPin(min=0, max=13) "Digital PWM pin (~)";
  parameter Integer minPulse = 544 "Minimum pulse";
  parameter Integer maxPulse = 2400 "Maximum pulse";

  Internal.PinConnector pinConnector
    annotation (Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{84,-16},{116,16}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

equation
  Firmata.Internal.writeServoPin(
    digitalPin,
    pinConnector,
    u,
    minPulse,
    maxPulse);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Polygon(
          points={{100,0},{20,80},{-100,80},{-100,-80},{20,-80},{100,0}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-38,44},{14,-50}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-8,18},{36,28},{44,12},{8,-18},{-8,18}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-20,20},{20,-20}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{30,30},{50,10}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-4,18},{40,28},{46,14},{8,-18},{-4,18}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-8,8},{8,-8}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{36,24},{44,16}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-12,60},{0,68},{12,66},{-12,60}},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                                 Text(
          extent={{-94,18},{-44,-18}},
          lineColor={0,0,0},
          textString="D%digitalPin")}),   Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end Servo;
