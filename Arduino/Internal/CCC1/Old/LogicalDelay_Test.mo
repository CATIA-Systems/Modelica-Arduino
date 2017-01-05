within Arduino.Internal.CCC1.Old;
model LogicalDelay_Test
  LogicalDelay logicalDelay(delayTime=0.1)
    annotation (Placement(transformation(extent={{6,-4},{14,4}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(
    width=50,
    period=0.5,
    startTime=0.1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(logicalDelay.u, booleanPulse.y)
    annotation (Line(points={{4.4,0},{-18,0},{-39,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end LogicalDelay_Test;
