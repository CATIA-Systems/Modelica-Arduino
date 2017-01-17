within Arduino.Internal;
model RangeFinderTest
              extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Sources.PulseVoltage pulseVoltage(
    V=5,
    width=5,
    period=100e-6,
    startTime=200e-6) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-60,-30})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,-30})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(extent={{-40,-2},{-20,18}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=time < 210e-6)
    annotation (Placement(transformation(extent={{-62,30},{-42,50}})));
equation
  connect(ground.p, constantVoltage.n)
    annotation (Line(points={{0,-60},{-30,-60},{-30,-40}}, color={0,0,255}));
  connect(pulseVoltage.n, constantVoltage.n) annotation (Line(points={{-60,-40},
          {-60,-60},{-30,-60},{-30,-40}}, color={0,0,255}));
  connect(pulseVoltage.p, idealClosingSwitch.p)
    annotation (Line(points={{-60,-20},{-60,8},{-40,8}}, color={0,0,255}));
  connect(booleanExpression.y, idealClosingSwitch.control)
    annotation (Line(points={{-41,40},{-30,40},{-30,15}}, color={255,0,255}));
  connect(ultrasonicRangeFinder3_1.sigPin, idealClosingSwitch.n)
    annotation (Line(points={{40,8},{30,8},{-20,8}}, color={0,0,255}));
  connect(constantVoltage.p, ultrasonicRangeFinder3_1.vPin) annotation (Line(
        points={{-30,-20},{-30,-20},{-30,-2},{40,-2},{40,0}}, color={0,0,255}));
  connect(ground.p, ultrasonicRangeFinder3_1.gndPin) annotation (Line(points={{
          0,-60},{0,-60},{0,-8},{40,-8}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,80}})),                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    experiment(StopTime=0.0005));
end RangeFinderTest;
