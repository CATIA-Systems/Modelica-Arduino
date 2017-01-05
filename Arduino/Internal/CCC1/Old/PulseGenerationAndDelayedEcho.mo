within Arduino.Internal.CCC1.Old;
model PulseGenerationAndDelayedEcho
  extends Old.PulseGeneration(pulse(period=1e-4), greaterThreshold(threshold=
          5e-6));
  LogicalDelay logicalDelay1(delayTime=30e-6)
    annotation (Placement(transformation(extent={{156,16},{136,36}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=5e-6)
    annotation (Placement(transformation(extent={{-30,-34},{-10,-14}})));
equation
  connect(logicalDelay1.u, rSFlipFlop.Q) annotation (Line(points={{160,26},{170,
          26},{170,-24},{89,-24}}, color={255,0,255}));
  annotation (Diagram(graphics={
        Line(points={{2,0},{196,0}}, color={0,0,0}),
        Text(
          extent={{70,-2},{122,-8}},
          lineColor={217,67,180},
          fillColor={212,255,255},
          fillPattern=FillPattern.Solid,
          textString="Emission"),
        Text(
          extent={{70,8},{122,2}},
          lineColor={217,67,180},
          fillColor={212,255,255},
          fillPattern=FillPattern.Solid,
          textString="Reception")}));
end PulseGenerationAndDelayedEcho;
