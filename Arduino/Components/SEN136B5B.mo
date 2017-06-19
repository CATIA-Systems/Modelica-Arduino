within Arduino.Components;
model SEN136B5B "SEN136B5B Ultrasonic Range Finder"
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch sensorGround5V
    "Ground if true, 5V if false"
    annotation (Placement(transformation(extent={{-90,40},{-70,60}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-40})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={0,-50})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=10e-6)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=2.5)
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pinSig
    annotation (Placement(transformation(extent={{-110,40},{-90,60}}),
        iconTransformation(extent={{-110,40},{-90,60}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin input5V
    "Positive pin (potential p.v > n.v for positive voltage drop v)"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin ground "Negative pin"
    annotation (Placement(transformation(extent={{-110,-60},{-90,-40}}),
        iconTransformation(extent={{-110,-60},{-90,-40}})));
  Modelica.Blocks.MathBoolean.FallingEdge startFallingEdge
    annotation (Placement(transformation(extent={{40,-20},{20,0}})));
  Modelica.Blocks.Logical.RSFlipFlop
                     rSFlipFlop
    annotation (Placement(transformation(extent={{0,40},{-20,20}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,70})));
  Modelica.Blocks.Logical.Pre pre1
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={30,30})));
  Modelica.Blocks.Interfaces.RealInput distance annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,0})));
  Modelica.Blocks.Math.Gain metersToSeconds(k=2/340.29)
    annotation (Placement(transformation(extent={{80,12},{60,32}})));
equation
  connect(resistor.p,voltageSensor. p)
    annotation (Line(points={{-50,-30},{-50,-20},{1.77636e-015,-20},{
          1.77636e-015,-40}},                             color={0,0,255}));
  connect(voltageSensor.n,resistor. n) annotation (Line(points={{0,-60},{-50,
          -60},{-50,-50}},         color={0,0,255}));
  connect(voltageSensor.v, fixedDelay.u)
    annotation (Line(points={{10,-50},{10,-50},{18,-50}},
                                                color={0,0,127}));
  connect(fixedDelay.y, realToBoolean.u)
    annotation (Line(points={{41,-50},{50,-50},{58,-50}}, color={0,0,127}));
  connect(sensorGround5V.n1, resistor.p) annotation (Line(points={{-70,55},{-50,
          55},{-50,-30}},                   color={0,0,255}));
  connect(sensorGround5V.p, pinSig)
    annotation (Line(points={{-90,50},{-90,50},{-100,50}},
                                                         color={0,0,255}));
  connect(input5V, sensorGround5V.n2) annotation (Line(points={{-100,0},{-120,0},
          {-60,0},{-60,50},{-70,50}},      color={0,0,255}));
  connect(timer.u,pre1. y)
    annotation (Line(points={{18,70},{18,70},{1,70}},
                                               color={255,0,255}));
  connect(startFallingEdge.y, rSFlipFlop.S) annotation (Line(points={{18,-10},{
          18,-10},{10,-10},{10,24},{2,24}}, color={255,0,255}));
  connect(pre1.u, rSFlipFlop.Q) annotation (Line(points={{-22,70},{-30,70},{-30,
          24},{-21,24}}, color={255,0,255}));
  connect(realToBoolean.y, startFallingEdge.u) annotation (Line(points={{81,-50},
          {81,-50},{90,-50},{90,-10},{44,-10}}, color={255,0,255}));
  connect(timer.y, greaterEqual.u1) annotation (Line(points={{41,70},{60,70},{
          60,30},{42,30}}, color={0,0,127}));
  connect(metersToSeconds.u, distance) annotation (Line(points={{82,22},{90,22},
          {90,0},{120,0}}, color={0,0,127}));
  connect(sensorGround5V.control, rSFlipFlop.Q) annotation (Line(points={{-80,58},
          {-80,70},{-30,70},{-30,24},{-21,24}},     color={255,0,255}));
  connect(greaterEqual.u2, metersToSeconds.y)
    annotation (Line(points={{42,22},{59,22}}, color={0,0,127}));
  connect(rSFlipFlop.R, greaterEqual.y) annotation (Line(points={{2,36},{10,36},
          {10,30},{19,30}}, color={255,0,255}));
  connect(ground, resistor.n)
    annotation (Line(points={{-100,-50},{-50,-50}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}), graphics={
        Rectangle(
          extent={{-60,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-52,-38},{20,-62}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="GND"),
        Text(
          extent={{-52,12},{6,-12}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="5V"),
        Text(
          extent={{-52,62},{16,38}},
          lineColor={28,108,200},
          textString="SIG",
          horizontalAlignment=TextAlignment.Left),
        Ellipse(extent={{20,80},{80,20}},lineColor={28,108,200}),
        Ellipse(extent={{20,-20},{80,-80}},lineColor={28,108,200}),
        Line(points={{-100,50},{-60,50}}, color={28,108,200}),
        Line(points={{-100,0},{-60,0}}, color={28,108,200}),
        Line(points={{-100,-50},{-60,-50}}, color={28,108,200})}),    Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Text(
          extent={{-36,-78},{36,-88}},
          lineColor={255,255,255},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          textString="Sensor")}));
end SEN136B5B;
