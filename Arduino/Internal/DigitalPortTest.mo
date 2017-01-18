within Arduino.Internal;
model DigitalPortTest
  DigitalPort digitalPort
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=0.5)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.SawTooth sawTooth(amplitude=100, period=0.5)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
equation
  connect(booleanStep.y, digitalPort.isInput) annotation (Line(points={{-59,30},
          {-40,30},{-40,4},{-22,4}}, color={255,0,255}));
  connect(sawTooth.y, digitalPort.pulseWidth) annotation (Line(points={{-59,-30},
          {-50,-30},{-40,-30},{-40,-4},{-22,-4}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DigitalPortTest;
