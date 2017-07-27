within Arduino.Components;
model Servo

  parameter Modelica.SIunits.Time minPulseWidth = 544e-6  "The pulse width corresponding to the minimum (0-degree) angle on the servo";
  parameter Modelica.SIunits.Time maxPulseWidth = 2400e-6 "The pulse width corresponding to the maximum (180-degree) angle on the servo";
  parameter Modelica.SIunits.Angle minAngle = Modelica.Constants.pi / 2;
  parameter Modelica.SIunits.Angle maxAngle = -Modelica.Constants.pi / 2;

  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-140,0})));
  Modelica.Electrical.Analog.Interfaces.NegativePin GND "Negative armature pin"
    annotation (Placement(transformation(extent={{-170,-70},{-150,-50}}),
        iconTransformation(extent={{-110,-50},{-90,-30}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin SIG "positive pin"
    annotation (Placement(transformation(extent={{-170,50},{-150,70}}),
        iconTransformation(extent={{-110,30},{-90,50}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Blocks.Discrete.TriggeredSampler triggeredSampler
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.FallingEdge fallingEdge
    annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
  Modelica.Blocks.Logical.Pre pre1
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=2.5)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=0)
    annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Modelica.Blocks.Math.Gain gain(k=1/(maxPulseWidth - minPulseWidth))
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Constant const(k=minPulseWidth)
    annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Flange of shaft"
    annotation (Placement(transformation(extent={{150,-10},{170,10}}),
        iconTransformation(extent={{88,-12},{110,10}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  Modelica.Blocks.Sources.Constant const1(k=minAngle)
    annotation (Placement(transformation(extent={{40,-20},{60,0}})));
  Modelica.Blocks.Math.Gain gain1(k=maxAngle - minAngle)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
equation
  connect(voltageSensor.n, GND)
    annotation (Line(points={{-140,-10},{-140,-60},{-160,-60}},
                                                             color={0,0,255}));
  connect(voltageSensor.p, SIG)
    annotation (Line(points={{-140,10},{-140,60},{-160,60}},
                                                           color={0,0,255}));
  connect(timer.y,triggeredSampler. u)
    annotation (Line(points={{-29,0},{-12,0}},
                                            color={0,0,127}));
  connect(fallingEdge.y,triggeredSampler. trigger) annotation (Line(points={{-29,-40},
          {0,-40},{0,-11.8}},        color={255,0,255}));
  connect(timer.u,pre1. y)
    annotation (Line(points={{-52,0},{-59,0}}, color={255,0,255}));
  connect(greaterThreshold.y,pre1. u) annotation (Line(points={{-99,0},{-82,0}},
                            color={255,0,255}));
  connect(fallingEdge.u,pre1. u) annotation (Line(points={{-52,-40},{-90,-40},{
          -90,0},{-82,0}},
                       color={255,0,255}));
  connect(triggeredSampler.y,add. u2) annotation (Line(points={{11,0},{20,0},{
          20,40},{-88,40},{-88,64},{-82,64},{-82,64}},
                                           color={0,0,127}));
  connect(const.y,add. u1) annotation (Line(points={{-99,70},{-90,70},{-90,76},
          {-82,76}},color={0,0,127}));
  connect(add.y,gain. u)
    annotation (Line(points={{-59,70},{-42,70}},
                                               color={0,0,127}));
  connect(greaterThreshold.u, voltageSensor.v)
    annotation (Line(points={{-122,0},{-130,0}},
                                               color={0,0,127}));
  connect(gain.y, limiter.u) annotation (Line(points={{-19,70},{-2,70}},
                     color={0,0,127}));
  connect(limiter.y, gain1.u)
    annotation (Line(points={{21,70},{38,70}}, color={0,0,127}));
  connect(position.flange, flange)
    annotation (Line(points={{140,0},{160,0}}, color={0,0,0}));
  connect(const1.y, add1.u2) annotation (Line(points={{61,-10},{78,-10},{78,-6},
          {84,-6}}, color={0,0,127}));
  connect(add1.y, position.phi_ref)
    annotation (Line(points={{107,0},{118,0}}, color={0,0,127}));
  connect(add1.u1, gain1.y)
    annotation (Line(points={{84,6},{74,6},{74,70},{61,70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-50,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-38,60},{92,20}},
          lineColor={28,108,200},
          textString="SIG",
          horizontalAlignment=TextAlignment.Left),
        Line(points={{-90,40},{-50,40}},  color={28,108,200}),
        Line(points={{-90,-40},{-50,-40}},  color={28,108,200}),
        Text(
          extent={{-40,-20},{94,-60}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="GND")}),                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},{160,100}})));
end Servo;
