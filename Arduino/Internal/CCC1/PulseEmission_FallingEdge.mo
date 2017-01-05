within Arduino.Internal.CCC1;
model PulseEmission_FallingEdge
  extends Modelica.Blocks.Interfaces.PartialBooleanSISO_small;
  Modelica.Blocks.MathBoolean.FallingEdge falling1
    annotation (Placement(transformation(extent={{-46,-8},{-30,8}})));
  Modelica.Blocks.Logical.RSFlipFlop
                     rSFlipFlop
    annotation (Placement(transformation(extent={{-10,-16},{10,4}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{2,-50},{-18,-30}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=
        pulseLength)
    annotation (Placement(transformation(extent={{-26,-50},{-46,-30}})));
  Modelica.Blocks.Logical.Pre pre1
    annotation (Placement(transformation(extent={{30,-50},{10,-30}})));
  parameter Modelica.SIunits.Time pulseLength=0 "Length of the pulse";
equation
  connect(falling1.y,rSFlipFlop. S) annotation (Line(points={{-28.4,0},{-12,0}},
                           color={255,0,255}));
  connect(timer.y,greaterThreshold. u)
    annotation (Line(points={{-19,-40},{-19,-40},{-24,-40}},
                                                  color={0,0,127}));
  connect(greaterThreshold.y,rSFlipFlop. R) annotation (Line(points={{-47,-40},{
          -50,-40},{-50,-12},{-12,-12}},  color={255,0,255}));
  connect(timer.u, pre1.y)
    annotation (Line(points={{4,-40},{9,-40}}, color={255,0,255}));
  connect(rSFlipFlop.Q, pre1.u) annotation (Line(points={{11,0},{11,0},{60,0},{60,
          -40},{32,-40}}, color={255,0,255}));
  connect(u, falling1.u)
    annotation (Line(points={{-140,0},{-49.2,0}}, color={255,0,255}));
  connect(y, rSFlipFlop.Q)
    annotation (Line(points={{120,0},{11,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PulseEmission_FallingEdge;
