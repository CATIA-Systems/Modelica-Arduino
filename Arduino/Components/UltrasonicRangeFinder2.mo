within Arduino.Components;
model UltrasonicRangeFinder2

  Modelica.Electrical.Analog.Interfaces.Pin vPin
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.Pin sigPin
    annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Electrical.Analog.Interfaces.Pin gndPin
    annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch idealCommutingSwitch
    annotation (Placement(transformation(extent={{-18,30},{2,50}})));

  parameter Real delayTime = 30e-6;
  parameter Real delayMax(min=0, start=1) = 1 "maximum delay time";

protected
  Real sigOut;
  Boolean sigOutBool;
  Boolean listening;

public
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=2.5)
    annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={48,-30})));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop
    annotation (Placement(transformation(extent={{88,74},{68,94}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{10,80},{-10,100}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{120,-40},{140,-20}})));
  Modelica.Blocks.Logical.FallingEdge fallingEdge
    annotation (Placement(transformation(extent={{160,-40},{180,-20}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold=30e-6)
    annotation (Placement(transformation(extent={{-28,80},{-48,100}})));
  Modelica.Blocks.Logical.Edge edge1
    annotation (Placement(transformation(extent={{-26,54},{-6,74}})));
  Internal.BooleanSinglePulse booleanSinglePulse
    annotation (Placement(transformation(extent={{56,16},{76,36}})));
equation
  connect(vPin, idealCommutingSwitch.n1) annotation (Line(points={{-100,0},{32,0},
          {32,45},{2,45}},               color={0,0,255}));
  connect(idealCommutingSwitch.n2, gndPin) annotation (Line(points={{2,40},{8,40},
          {8,34},{8,-40},{-100,-40}},         color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{200,100}}),                                  graphics={
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
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{200,
            100}})));
  sigOut = delay(sigPin.v, delayTime, delayMax);
  sigOutBool = delay(sigPin.v, delayTime, delayMax) > 2.5;

  connect(idealCommutingSwitch.p, idealClosingSwitch.n)
    annotation (Line(points={{-18,40},{-40,40}}, color={0,0,255}));
  connect(idealClosingSwitch.p, sigPin)
    annotation (Line(points={{-60,40},{-100,40}}, color={0,0,255}));
  connect(voltageSensor.p, sigPin) annotation (Line(points={{48,-20},{-76,-20},
          {-76,40},{-100,40}}, color={0,0,255}));
  connect(voltageSensor.n, gndPin) annotation (Line(points={{48,-40},{48,-52},{
          8,-52},{8,-40},{-100,-40}}, color={0,0,255}));
  connect(greaterThreshold.u, voltageSensor.v)
    annotation (Line(points={{68,-30},{68,-30},{58,-30}}, color={0,0,127}));
  connect(greaterThreshold.y, and1.u2) annotation (Line(points={{91,-30},{104,
          -30},{104,-38},{118,-38}}, color={255,0,255}));
  connect(rSFlipFlop.QI, and1.u1) annotation (Line(points={{67,78},{56,78},{56,
          60},{110,60},{110,-30},{118,-30}}, color={255,0,255}));
  connect(and1.y, fallingEdge.u) annotation (Line(points={{141,-30},{149.5,-30},
          {158,-30}}, color={255,0,255}));
  connect(fallingEdge.y, rSFlipFlop.S) annotation (Line(points={{181,-30},{186,
          -30},{186,90},{90,90}}, color={255,0,255}));
  connect(timer.u, rSFlipFlop.Q)
    annotation (Line(points={{12,90},{67,90}}, color={255,0,255}));
  connect(greaterThreshold1.u, timer.y)
    annotation (Line(points={{-26,90},{-11,90}}, color={0,0,127}));
  connect(greaterThreshold1.y, edge1.u) annotation (Line(points={{-49,90},{-58,
          90},{-58,64},{-28,64}}, color={255,0,255}));
  connect(edge1.y, rSFlipFlop.R) annotation (Line(points={{-5,64},{16,64},{114,
          64},{114,78},{90,78},{90,78}}, color={255,0,255}));
end UltrasonicRangeFinder2;
