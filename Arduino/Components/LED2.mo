within Arduino.Components;
model LED2
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  Modelica.Electrical.Analog.Semiconductors.Diode2 diode(Vf=1.6, Ids(
        displayUnit="mA"))
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Math.Mean mean(f=10)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{20,10},{40,-10}})));
equation
  connect(diode.p, p)
    annotation (Line(points={{-40,0},{-100,0}}, color={0,0,255}));
  connect(diode.n,currentSensor. p)
    annotation (Line(points={{-20,0},{20,0}}, color={0,0,255}));
  connect(currentSensor.i,mean. u) annotation (Line(points={{30,10},{30,24},{30,
          50},{38,50}},    color={0,0,127}));
  connect(currentSensor.n, n)
    annotation (Line(points={{40,0},{70,0},{100,0}}, color={0,0,255}));
  annotation (Icon(graphics={
        Ellipse(
          extent={{-60,60},{60,-60}},
          lineColor={0,0,0},
          fillColor=DynamicSelect({100,0,0}, if mean.y > 0 then {100 + (mean.y / 0.02) * 155,0,0} else {100,0,0}),
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{30,0},{-30,40},{-30,-40},{30,0}},
          lineColor={0,0,0}),
        Line(points={{-90,0},{-30,0}},color={0,0,255}),
        Line(points={{30,0},{90,0}}, color={0,0,255}),
        Line(points={{30,40},{30,-40}}, color={0,0,255}),
        Line(points={{38,52},{58,72}}, color={28,108,200}),
        Polygon(
          points={{52,73},{59,73},{59,66},{52,73}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),
        Polygon(
          points={{68,59},{75,59},{75,52},{68,59}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),
        Line(points={{54,38},{74,58}}, color={28,108,200})}));
end LED2;
