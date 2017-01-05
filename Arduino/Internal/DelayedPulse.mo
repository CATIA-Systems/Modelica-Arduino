within Arduino.Internal;
model DelayedPulse
  Modelica.Blocks.Logical.Edge edge1
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=
        pulseLength)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Logical.Edge edge2
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop
    annotation (Placement(transformation(extent={{-10,54},{-30,74}})));
  Modelica.Blocks.Interfaces.BooleanInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.BooleanOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Real pulseLength=0 "Length of the pulse";
equation
  connect(edge2.y, rSFlipFlop.R) annotation (Line(points={{81,0},{84,0},{84,60},
          {-8,60},{-8,58}}, color={255,0,255}));
  connect(greaterThreshold.y, edge2.u)
    annotation (Line(points={{41,0},{49.5,0},{58,0}}, color={255,0,255}));
  connect(timer.y, greaterThreshold.u)
    annotation (Line(points={{9,0},{9,0},{18,0}}, color={0,0,127}));
  connect(edge1.y, rSFlipFlop.S) annotation (Line(points={{-59,0},{-54,0},{-54,
          92},{8,92},{8,70},{-8,70}}, color={255,0,255}));
  connect(u, edge1.u)
    annotation (Line(points={{-120,0},{-120,0},{-82,0}}, color={255,0,255}));
  connect(y, rSFlipFlop.Q) annotation (Line(points={{110,0},{92,0},{92,-40},{
          -48,-40},{-48,70},{-31,70}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DelayedPulse;
