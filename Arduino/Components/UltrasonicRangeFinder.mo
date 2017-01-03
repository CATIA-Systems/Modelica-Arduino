within Arduino.Components;
model UltrasonicRangeFinder
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold
      =2.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={40,74})));
  Modelica.Electrical.Analog.Interfaces.Pin vPin
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.Pin sigPin
    annotation (Placement(transformation(extent={{-110,40},{-90,60}})));
  Modelica.Electrical.Analog.Interfaces.Pin gndPin
    annotation (Placement(transformation(extent={{-110,-60},{-90,-40}})));
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch idealCommutingSwitch
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-18,0})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=30e-6)
    annotation (Placement(transformation(extent={{36,-4},{56,16}})));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop
    annotation (Placement(transformation(extent={{-30,70},{-50,90}})));
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch idealCommutingSwitch1
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-60,-2})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold1(
      threshold=2.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={52,110})));
  Modelica.Blocks.Logical.FallingEdge fallingEdge
    annotation (Placement(transformation(extent={{10,64},{-10,84}})));
  Modelica.Blocks.Logical.FallingEdge fallingEdge1
    annotation (Placement(transformation(extent={{10,100},{-10,120}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{12,-2},{26,12}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-2,8},{4,14}})));
equation
  connect(voltageSensor.n, gndPin) annotation (Line(points={{-18,-10},{-18,-50},
          {-100,-50}}, color={0,0,255}));
  connect(idealCommutingSwitch.p, sigPin) annotation (Line(points={{-80,40},{
          -90,40},{-90,50},{-100,50}}, color={0,0,255}));
  connect(voltageSensor.p, idealCommutingSwitch.n1) annotation (Line(points={{
          -18,10},{-18,10},{-18,45},{-60,45}}, color={0,0,255}));
  connect(rSFlipFlop.Q, idealCommutingSwitch.control)
    annotation (Line(points={{-51,86},{-70,86},{-70,48}}, color={255,0,255}));
  connect(idealCommutingSwitch1.n1, gndPin) annotation (Line(points={{-55,-12},
          {-54,-12},{-54,-50},{-100,-50}}, color={0,0,255}));
  connect(idealCommutingSwitch1.n2, vPin) annotation (Line(points={{-60,-12},{
          -60,-20},{-80,-20},{-80,0},{-100,0}}, color={0,0,255}));
  connect(idealCommutingSwitch1.p, idealCommutingSwitch.n2)
    annotation (Line(points={{-60,8},{-60,8},{-60,40}}, color={0,0,255}));
  connect(greaterEqualThreshold1.u, voltageSensor.v) annotation (Line(points={{
          64,110},{70,110},{70,-30},{0,-30},{0,-1.77636e-015},{-8,-1.77636e-015}},
        color={0,0,127}));
  connect(greaterEqualThreshold.y, fallingEdge.u)
    annotation (Line(points={{29,74},{12,74}}, color={255,0,255}));
  connect(fallingEdge.y, rSFlipFlop.R)
    annotation (Line(points={{-11,74},{-28,74}}, color={255,0,255}));
  connect(greaterEqualThreshold.y, idealCommutingSwitch1.control) annotation (
      Line(points={{29,74},{20,74},{20,20},{-40,20},{-40,-2},{-52,-2}}, color={
          255,0,255}));
  connect(fixedDelay.y, greaterEqualThreshold.u)
    annotation (Line(points={{57,6},{60,6},{60,74},{52,74}}, color={0,0,127}));
  connect(fallingEdge1.u, greaterEqualThreshold1.y)
    annotation (Line(points={{12,110},{28,110},{41,110}}, color={255,0,255}));
  connect(fallingEdge1.y, rSFlipFlop.S) annotation (Line(points={{-11,110},{-20,
          110},{-20,96},{-20,86},{-28,86}}, color={255,0,255}));
  connect(switch1.u1, const.y) annotation (Line(points={{10.6,10.6},{10.55,10.6},
          {10.55,11},{4.3,11}}, color={0,0,127}));
  connect(switch1.u3, voltageSensor.v) annotation (Line(points={{10.6,-0.6},{0,
          -0.6},{0,-1.77636e-015},{-8,-1.77636e-015}}, color={0,0,127}));
  connect(fixedDelay.u, switch1.y)
    annotation (Line(points={{34,6},{30,6},{30,5},{26.7,5}}, color={0,0,127}));
  connect(switch1.u2, idealCommutingSwitch.control) annotation (Line(points={{
          10.6,5},{-8,5},{-8,60},{-70,60},{-70,48}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,52},{-30,28}},
          lineColor={28,108,200},
          textString="SIG",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-80,12},{-26,-12}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="5V"),
        Text(
          extent={{-80,-30},{-22,-54}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="GND"),
        Ellipse(extent={{0,80},{60,20}}, lineColor={28,108,200}),
        Ellipse(extent={{0,-20},{60,-80}}, lineColor={28,108,200})}), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end UltrasonicRangeFinder;
