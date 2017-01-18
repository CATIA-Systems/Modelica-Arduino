within Arduino.Internal;
model Average

  Modelica.Blocks.Continuous.Integrator integrator1
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=delayTime)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Continuous.Integrator integrator2
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Modelica.SIunits.Time delayTime = 0.1 "Delay time of output with respect to input signal";
equation
  connect(fixedDelay.y, integrator2.u)
    annotation (Line(points={{-19,-30},{-2,-30}}, color={0,0,127}));
  connect(integrator2.y, add.u2) annotation (Line(points={{21,-30},{40,-30},{40,
          -6},{58,-6}}, color={0,0,127}));
  connect(integrator1.y, add.u1)
    annotation (Line(points={{1,30},{40,30},{40,6},{58,6}}, color={0,0,127}));
  connect(integrator1.u, u) annotation (Line(points={{-22,30},{-60,30},{-60,0},{
          -120,0}}, color={0,0,127}));
  connect(fixedDelay.u, u) annotation (Line(points={{-42,-30},{-60,-30},{-60,0},
          {-120,0}}, color={0,0,127}));
  connect(add.y, y) annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Average;
