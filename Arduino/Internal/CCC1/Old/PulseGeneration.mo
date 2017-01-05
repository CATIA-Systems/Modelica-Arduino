within Arduino.Internal.CCC1.Old;
model PulseGeneration
              extends Modelica.Icons.Example;

  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=2.5)
    annotation (Placement(transformation(extent={{4,-34},{24,-14}})));
  Modelica.Blocks.MathBoolean.FallingEdge falling1
    annotation (Placement(transformation(extent={{40,-32},{56,-16}})));
  Modelica.Blocks.Logical.RSFlipFlop
                     rSFlipFlop
    annotation (Placement(transformation(extent={{68,-40},{88,-20}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{88,-64},{68,-44}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.01)
    annotation (Placement(transformation(extent={{60,-64},{40,-44}})));
  Modelica.Blocks.Sources.Pulse pulse(amplitude=5, period=0.4)
    annotation (Placement(transformation(extent={{-70,-34},{-50,-14}})));
  Modelica.Blocks.Logical.Pre pre1
    annotation (Placement(transformation(extent={{116,-64},{96,-44}})));
equation
  connect(realToBoolean.y, falling1.u)
    annotation (Line(points={{25,-24},{36.8,-24}},   color={255,0,255}));
  connect(falling1.y, rSFlipFlop.S) annotation (Line(points={{57.6,-24},{62,-24},
          {66,-24}},       color={255,0,255}));
  connect(timer.y,greaterThreshold. u)
    annotation (Line(points={{67,-54},{67,-54},{62,-54}},
                                                  color={0,0,127}));
  connect(greaterThreshold.y, rSFlipFlop.R) annotation (Line(points={{39,-54},{
          36,-54},{36,-36},{66,-36}},     color={255,0,255}));
  connect(realToBoolean.u, pulse.y)
    annotation (Line(points={{2,-24},{-8,-24},{-49,-24}}, color={0,0,127}));
  connect(timer.u, pre1.y)
    annotation (Line(points={{90,-54},{95,-54}}, color={255,0,255}));
  connect(rSFlipFlop.Q, pre1.u) annotation (Line(points={{89,-24},{89,-24},{126,
          -24},{126,-54},{118,-54}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,80}})),                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{220,
            100}}), graphics={
        Rectangle(
          extent={{-2,74},{200,-80}},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Text(
          extent={{170,72},{198,62}},
          pattern=LinePattern.None,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          textString="Ultrasonic")}),
    experiment(StopTime=0.0005));
end PulseGeneration;
