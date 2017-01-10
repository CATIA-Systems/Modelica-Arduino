within Arduino.Internal.CCC1;
model AnalogRangeFinderTest_Flat_Simplified
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
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch ArduinoEmitListen(Goff=1e-9)
    "Emit (=closed) if true, listen (=open) if false"
    annotation (Placement(transformation(extent={{-56,-2},{-36,18}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=time < 210e-6)
    annotation (Placement(transformation(extent={{-78,30},{-58,50}})));
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch SensorGround5V
    "Ground if false, 5V if true"
    annotation (Placement(transformation(extent={{-6,-2},{14,18}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={64,-22})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={88,-24})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=5e-6)
    annotation (Placement(transformation(extent={{108,-34},{128,-14}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=2.5)
    annotation (Placement(transformation(extent={{138,-34},{158,-14}})));
  PulseEmission_FallingEdge pulseEmission_FallingEdge(pulseLength=5e-6)
    annotation (Placement(transformation(extent={{176,-34},{196,-14}})));
  LogicalDelay logicalDelay1(delayTime=30e-6)
    annotation (Placement(transformation(extent={{196,38},{176,58}})));
  PulseEmission_FallingEdge pulseEmission_FallingEdge1(pulseLength=5e-6)
    annotation (Placement(transformation(extent={{148,38},{128,58}})));
equation
  connect(ground.p, constantVoltage.n)
    annotation (Line(points={{-46,-60},{-46,-60},{-46,-40}},
                                                           color={0,0,255}));
  connect(pulseVoltage.p, ArduinoEmitListen.p)
    annotation (Line(points={{-76,-20},{-76,8},{-56,8}}, color={0,0,255}));
  connect(booleanExpression.y, ArduinoEmitListen.control)
    annotation (Line(points={{-57,40},{-46,40},{-46,15}}, color={255,0,255}));
  connect(resistor.n, ground.p)
    annotation (Line(points={{64,-32},{64,-60},{-46,-60}}, color={0,0,255}));
  connect(resistor.p, voltageSensor.p)
    annotation (Line(points={{64,-12},{88,-12},{88,-14}}, color={0,0,255}));
  connect(voltageSensor.n, resistor.n) annotation (Line(points={{88,-34},{76,
          -34},{76,-32},{64,-32}}, color={0,0,255}));
  connect(ground.p, pulseVoltage.n)
    annotation (Line(points={{-46,-60},{-76,-60},{-76,-40}}, color={0,0,255}));
  connect(voltageSensor.v, fixedDelay.u)
    annotation (Line(points={{98,-24},{106,-24}}, color={0,0,127}));
  connect(fixedDelay.y, realToBoolean.u)
    annotation (Line(points={{129,-24},{132,-24},{136,-24}}, color={0,0,127}));
  connect(realToBoolean.y, pulseEmission_FallingEdge.u)
    annotation (Line(points={{159,-24},{172,-24}}, color={255,0,255}));
  connect(pulseEmission_FallingEdge.y, logicalDelay1.u) annotation (Line(points=
         {{198,-24},{204,-24},{208,-24},{208,48},{200,48}}, color={255,0,255}));
  connect(logicalDelay1.y, pulseEmission_FallingEdge1.u)
    annotation (Line(points={{174,48},{174,48},{152,48}}, color={255,0,255}));
  connect(ArduinoEmitListen.n, SensorGround5V.p)
    annotation (Line(points={{-36,8},{-6,8}}, color={0,0,255}));
  connect(SensorGround5V.n1, resistor.p) annotation (Line(points={{14,13},{52,
          13},{52,14},{64,14},{64,-12}}, color={0,0,255}));
  connect(constantVoltage.p, SensorGround5V.n2) annotation (Line(points={{-46,
          -20},{-2,-20},{36,-20},{36,8},{14,8}}, color={0,0,255}));
  connect(pulseEmission_FallingEdge1.y, SensorGround5V.control) annotation (
      Line(points={{126,48},{66,48},{4,48},{4,16}}, color={255,0,255}));
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
          textString="Arduino board"),
        Rectangle(
          extent={{-30,80},{212,-80}},
          lineColor={28,108,200},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{56,-68},{128,-78}},
          lineColor={255,255,255},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          textString="Sensor"),
        Rectangle(
          extent={{-28,20},{98,-66}},
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Text(
          extent={{72,-54},{98,-62}},
          pattern=LinePattern.None,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          textString="Analog",
          lineColor={0,0,0}),
        Rectangle(
          extent={{102,74},{210,-66}},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-26,74},{100,22}},
          fillColor={255,213,170},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Text(
          extent={{106,-54},{134,-64}},
          pattern=LinePattern.None,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          textString="Ultrasonic"),
        Text(
          extent={{-26,74},{2,64}},
          pattern=LinePattern.None,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          textString="Logical")}),
    experiment(StopTime=0.0005));
end AnalogRangeFinderTest_Flat_Simplified;
