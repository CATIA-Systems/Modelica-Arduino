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
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=10e-6)
    annotation (Placement(transformation(extent={{16,-34},{36,-14}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=2.5)
    annotation (Placement(transformation(extent={{56,-34},{76,-14}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pinSig
    annotation (Placement(transformation(extent={{-130,-2},{-110,18}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin input5V
    "Positive pin (potential p.v > n.v for positive voltage drop v)"
    annotation (Placement(transformation(extent={{-130,-30},{-110,-10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin ground "Negative pin"
    annotation (Placement(transformation(extent={{-130,-70},{-110,-50}})));
  Modelica.Blocks.MathBoolean.FallingEdge falling1
    annotation (Placement(transformation(extent={{146,30},{130,46}})));
  Modelica.Blocks.Logical.RSFlipFlop
                     rSFlipFlop
    annotation (Placement(transformation(extent={{100,50},{80,30}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{20,30},{0,50}})));
  Modelica.Blocks.Logical.Pre pre1
    annotation (Placement(transformation(extent={{60,30},{40,50}})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={68,72})));
  Modelica.Blocks.Interfaces.RealInput distance annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
  Modelica.Blocks.Math.Gain metersToSeconds(k=2/340.29)
    annotation (Placement(transformation(extent={{22,86},{42,106}})));
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
  connect(timer.u,pre1. y)
    annotation (Line(points={{22,40},{24,40},{39,40}},
                                               color={255,0,255}));
  connect(falling1.y, rSFlipFlop.S) annotation (Line(points={{128.4,38},{116,38},
          {116,34},{102,34}}, color={255,0,255}));
  connect(pre1.u, rSFlipFlop.Q) annotation (Line(points={{62,40},{70,40},{70,34},
          {79,34}}, color={255,0,255}));
  connect(greaterEqual.y, rSFlipFlop.R) annotation (Line(points={{79,72},{79,78},
          {52,78},{60,78},{116,78},{116,46},{102,46}}, color={255,0,255}));
  connect(sensorGround5V.control, rSFlipFlop.Q) annotation (Line(points={{-88,
          16},{-88,16},{70,16},{70,34},{79,34}}, color={255,0,255}));
  connect(realToBoolean.y, falling1.u) annotation (Line(points={{77,-24},{122,
          -24},{164,-24},{164,38},{149.2,38}}, color={255,0,255}));
  connect(timer.y, greaterEqual.u1) annotation (Line(points={{-1,40},{-8,40},{
          -12,40},{-12,72},{56,72}}, color={0,0,127}));
  connect(greaterEqual.u2, metersToSeconds.y)
    annotation (Line(points={{56,80},{56,96},{43,96}}, color={0,0,127}));
  connect(metersToSeconds.u, distance)
    annotation (Line(points={{20,96},{0,96},{0,120}}, color={0,0,127}));
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
          textString="Sensor")}));
end UltrasonicSensor_Simple;
