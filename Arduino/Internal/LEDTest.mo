within Arduino.Internal;
model LEDTest
  DigitalPort digitalPort
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=0.5)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.SawTooth sawTooth(amplitude=100, period=0.5)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Components.LED2 lED2_1
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,0})));
equation
  connect(booleanStep.y, digitalPort.isInput) annotation (Line(points={{-59,30},
          {-40,30},{-40,4},{-22,4}}, color={255,0,255}));
  connect(sawTooth.y, digitalPort.pulseWidth) annotation (Line(points={{-59,-30},
          {-50,-30},{-40,-30},{-40,-4},{-22,-4}}, color={0,0,127}));
  connect(digitalPort.pin, lED2_1.p)
    annotation (Line(points={{0,0},{10,0},{20,0}}, color={0,0,255}));
  connect(lED2_1.n, resistor.p)
    annotation (Line(points={{40,0},{50,0}}, color={0,0,255}));
  connect(ground.p, resistor.n)
    annotation (Line(points={{80,-20},{80,0},{70,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end LEDTest;
