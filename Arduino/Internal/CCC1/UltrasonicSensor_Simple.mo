within Arduino.Internal.CCC1;
model UltrasonicSensor_Simple "Model of the UltraSonic Sensor"
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch sensorGround5V
    "Ground if true, 5V if false"
    annotation (Placement(transformation(extent={{-98,-2},{-78,18}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-28,-22})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-4,-24})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=5e-6)
    annotation (Placement(transformation(extent={{16,-34},{36,-14}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=2.5)
    annotation (Placement(transformation(extent={{56,-34},{76,-14}})));
  PulseEmission_FallingEdge startMeasurementFallingEdge(pulseLength=60e-6)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={56,48})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pinSig
    annotation (Placement(transformation(extent={{-130,-2},{-110,18}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin input5V
    "Positive pin (potential p.v > n.v for positive voltage drop v)"
    annotation (Placement(transformation(extent={{-130,-30},{-110,-10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin ground "Negative pin"
    annotation (Placement(transformation(extent={{-130,-70},{-110,-50}})));
equation
  connect(resistor.p,voltageSensor. p)
    annotation (Line(points={{-28,-12},{-4,-12},{-4,-14}},color={0,0,255}));
  connect(voltageSensor.n,resistor. n) annotation (Line(points={{-4,-34},{-16,
          -34},{-16,-32},{-28,-32}},
                                   color={0,0,255}));
  connect(voltageSensor.v, fixedDelay.u)
    annotation (Line(points={{6,-24},{14,-24}}, color={0,0,127}));
  connect(fixedDelay.y, realToBoolean.u)
    annotation (Line(points={{37,-24},{54,-24}},          color={0,0,127}));
  connect(sensorGround5V.n1, resistor.p) annotation (Line(points={{-78,13},{-40,
          13},{-40,14},{-28,14},{-28,-12}}, color={0,0,255}));
  connect(sensorGround5V.p, pinSig)
    annotation (Line(points={{-98,8},{-110,8},{-120,8}}, color={0,0,255}));
  connect(resistor.n, ground) annotation (Line(points={{-28,-32},{-28,-32},{-28,
          -46},{-28,-60},{-120,-60}}, color={0,0,255}));
  connect(input5V, sensorGround5V.n2) annotation (Line(points={{-120,-20},{-90,
          -20},{-60,-20},{-60,8},{-78,8}}, color={0,0,255}));
  connect(startMeasurementFallingEdge.y, sensorGround5V.control) annotation (
      Line(points={{44,48},{44,48},{-88,48},{-88,16}}, color={255,0,255}));
  connect(realToBoolean.y, startMeasurementFallingEdge.u) annotation (Line(
        points={{77,-24},{100,-24},{100,48},{70,48}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,100}}), graphics={
        Rectangle(
          extent={{-120,100},{120,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,-50},{-42,-74}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="GND"),
        Text(
          extent={{-100,-10},{-46,-34}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="5V"),
        Text(
          extent={{-100,18},{-50,-6}},
          lineColor={28,108,200},
          textString="SIG",
          horizontalAlignment=TextAlignment.Left),
        Ellipse(extent={{0,80},{60,20}}, lineColor={28,108,200}),
        Ellipse(extent={{0,-20},{60,-80}}, lineColor={28,108,200})}), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,
            100}}), graphics={
        Text(
          extent={{-36,-68},{36,-78}},
          lineColor={255,255,255},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          textString="Sensor"),
        Rectangle(
          extent={{-106,20},{6,-66}},
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Text(
          extent={{-20,-54},{6,-62}},
          pattern=LinePattern.None,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          textString="Analog",
          lineColor={0,0,0}),
        Rectangle(
          extent={{10,74},{118,-66}},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-106,74},{8,22}},
          fillColor={255,213,170},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Text(
          extent={{14,-54},{42,-64}},
          pattern=LinePattern.None,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          textString="Ultrasonic"),
        Text(
          extent={{-88,74},{-60,64}},
          pattern=LinePattern.None,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          textString="Logical")}));
end UltrasonicSensor_Simple;
