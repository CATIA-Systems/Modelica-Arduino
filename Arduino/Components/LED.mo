within Arduino.Components;
model LED
          extends Modelica.Electrical.Analog.Interfaces.OnePort;

  Modelica.Electrical.Analog.Semiconductors.Diode diode(Ids(displayUnit="mA")=
         0.02)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Math.Mean mean(f=10)
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{20,10},{40,-10}})));
equation
  connect(diode.p, p)
    annotation (Line(points={{-40,0},{-100,0}}, color={0,0,255}));
  connect(diode.n, currentSensor.p)
    annotation (Line(points={{-20,0},{20,0}}, color={0,0,255}));
  connect(currentSensor.n, pin_n)
    annotation (Line(points={{40,0},{100,0}}, color={0,0,255}));
  connect(currentSensor.i, mean.u) annotation (Line(points={{30,10},{30,26},{6,26},
          {6,50},{18,50}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Line(
          points={{-100,0},{100,0}},
          color={0,0,255},
          thickness=0.5), Ellipse(
          extent={{-60,60},{60,-60}},
          fillColor=DynamicSelect({100,0,0}, if diode.i > 0 then {100 + (diode.i / 0.02) * 155,0,0} else {100,0,0}),
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end LED;
