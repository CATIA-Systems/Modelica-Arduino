within Arduino.Components;
model LED

  Modelica.Electrical.Analog.Semiconductors.Diode diode
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(diode.p, pin_p)
    annotation (Line(points={{-10,0},{-100,0}},          color={0,0,255}));
  connect(diode.n, pin_n)
    annotation (Line(points={{10,0},{100,0},{100,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Line(
          points={{-100,0},{100,0}},
          color={0,0,255},
          thickness=0.5), Ellipse(
          extent={{-40,40},{40,-40}},
          fillColor=DynamicSelect({100,0,0}, if diode.i > 0 then {255,0,0} else {100,0,0}),
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end LED;
