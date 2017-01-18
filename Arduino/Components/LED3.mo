within Arduino.Components;
model LED3
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  Modelica.Electrical.Analog.Semiconductors.Diode diode
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(diode.p, p)
    annotation (Line(points={{-10,0},{-100,0}}, color={0,0,255}));
  connect(diode.n, n)
    annotation (Line(points={{10,0},{100,0}}, color={0,0,255}));
end LED3;
