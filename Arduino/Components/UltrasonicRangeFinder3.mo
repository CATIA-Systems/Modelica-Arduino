within Arduino.Components;
model UltrasonicRangeFinder3

  Modelica.Electrical.Analog.Interfaces.Pin vPin
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.Pin sigPin
    annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Electrical.Analog.Interfaces.Pin gndPin
    annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch idealCommutingSwitch
    annotation (Placement(transformation(extent={{-18,30},{2,50}})));

public
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Internal.DelayedPulse delayedPulse(pulseLength=30e-6)
    annotation (Placement(transformation(extent={{180,0},{200,20}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={60,10})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=2.5)
    annotation (Placement(transformation(extent={{80,0},{100,20}})));
  Internal.DelayedPulse delayedPulse1(pulseLength=40e-6)
    annotation (Placement(transformation(extent={{100,60},{80,80}})));
  Internal.DelayedPulse delayedPulse2(pulseLength=5e-6)
    annotation (Placement(transformation(extent={{180,60},{160,80}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{220,60},{200,80}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{140,20},{160,0}})));
  Modelica.Blocks.Logical.Not not2
    annotation (Placement(transformation(extent={{80,84},{100,104}})));
equation

  connect(vPin, idealCommutingSwitch.n1) annotation (Line(points={{-100,0},{32,0},
          {32,45},{2,45}},               color={0,0,255}));
  connect(idealCommutingSwitch.n2, gndPin) annotation (Line(points={{2,40},{8,40},
          {8,34},{8,-40},{-100,-40}},         color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {240,100}}),                                        graphics={
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
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{240,100}})));
  connect(idealCommutingSwitch.p, idealClosingSwitch.n)
    annotation (Line(points={{-18,40},{-40,40}}, color={0,0,255}));

  connect(idealClosingSwitch.p, sigPin)
    annotation (Line(points={{-60,40},{-100,40}}, color={0,0,255}));
  connect(voltageSensor.n, gndPin)
    annotation (Line(points={{60,0},{60,-40},{-100,-40}}, color={0,0,255}));
  connect(voltageSensor.p, sigPin) annotation (Line(points={{60,20},{60,60},{-80,
          60},{-80,40},{-100,40}}, color={0,0,255}));
  connect(greaterThreshold.u, voltageSensor.v)
    annotation (Line(points={{78,10},{74,10},{70,10}}, color={0,0,127}));
  connect(not1.y, delayedPulse2.u)
    annotation (Line(points={{199,70},{199,70},{182,70}}, color={255,0,255}));
  connect(delayedPulse.y, not1.u) annotation (Line(points={{201,10},{232,10},{232,
          42},{232,58},{232,70},{222,70}}, color={255,0,255}));
  connect(delayedPulse1.y, idealClosingSwitch.control) annotation (Line(points={
          {79,70},{14,70},{-50,70},{-50,47}}, color={255,0,255}));
  connect(and1.y, delayedPulse.u) annotation (Line(points={{161,10},{169.5,10},{
          178,10}}, color={255,0,255}));
  connect(and1.u1, greaterThreshold.y)
    annotation (Line(points={{138,10},{101,10}}, color={255,0,255}));
  connect(not2.y, and1.u2) annotation (Line(points={{101,94},{110,94},{120,94},{
          120,18},{138,18}}, color={255,0,255}));
  connect(not2.u, idealClosingSwitch.control) annotation (Line(points={{78,94},{
          60,94},{60,70},{-50,70},{-50,47}}, color={255,0,255}));
  connect(delayedPulse1.u, greaterThreshold.y) annotation (Line(points={{102,70},
          {110,70},{110,10},{101,10}}, color={255,0,255}));
  connect(delayedPulse2.y, idealCommutingSwitch.control) annotation (Line(
        points={{159,70},{148,70},{148,120},{-8,120},{-8,48}}, color={255,0,255}));
end UltrasonicRangeFinder3;
