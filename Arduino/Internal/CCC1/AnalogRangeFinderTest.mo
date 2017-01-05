within Arduino.Internal.CCC1;
model AnalogRangeFinderTest
              extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Sources.PulseVoltage pulseVoltage(
    V=5,
    width=5,
    period=100e-6,
    startTime=200e-6) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-76,-30})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-46,-30})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-56,-80},{-36,-60}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch arduinoEmitListen
    "Emit (=closed) if true, listen (=open) if false"
    annotation (Placement(transformation(extent={{-56,-2},{-36,18}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=time < 210e-6)
    annotation (Placement(transformation(extent={{-78,30},{-58,50}})));
  UltrasonicSensor ultrasonicSensor
    annotation (Placement(transformation(extent={{2,-58},{140,64}})));
equation
  connect(ground.p, constantVoltage.n)
    annotation (Line(points={{-46,-60},{-46,-60},{-46,-40}},
                                                           color={0,0,255}));
  connect(pulseVoltage.p,arduinoEmitListen. p)
    annotation (Line(points={{-76,-20},{-76,8},{-56,8}}, color={0,0,255}));
  connect(booleanExpression.y,arduinoEmitListen. control)
    annotation (Line(points={{-57,40},{-46,40},{-46,15}}, color={255,0,255}));
  connect(ground.p, pulseVoltage.n)
    annotation (Line(points={{-46,-60},{-76,-60},{-76,-40}}, color={0,0,255}));
  connect(arduinoEmitListen.n, ultrasonicSensor.pinSig) annotation (Line(points
        ={{-36,8},{-20,8},{-20,7.88},{2,7.88}}, color={0,0,255}));
  connect(ground.p, ultrasonicSensor.ground) annotation (Line(points={{-46,-60},
          {-34,-60},{-20,-60},{-20,-33.6},{2,-33.6}}, color={0,0,255}));
  connect(constantVoltage.p, ultrasonicSensor.input5V)
    annotation (Line(points={{-46,-20},{-46,-9.2},{2,-9.2}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,80}})),                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{220,
            100}}), graphics={
        Rectangle(
          extent={{-100,60},{-32,-80}},
          lineColor={28,108,200},
          fillColor={170,255,213},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-96,-66},{-60,-76}},
          lineColor={28,108,200},
          fillColor={170,255,213},
          fillPattern=FillPattern.Solid,
          textString="Arduino board")}),
    experiment(StopTime=0.0005));
end AnalogRangeFinderTest;
