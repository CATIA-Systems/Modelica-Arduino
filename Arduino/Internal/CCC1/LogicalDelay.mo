within Arduino.Internal.CCC1;
block LogicalDelay "Delay a rising edge of the input."
  extends Modelica.Blocks.Interfaces.PartialBooleanSISO_small;
  parameter Modelica.SIunits.Time delayTime "Delay time";

  Modelica.Blocks.Math.BooleanToReal booleanToReal
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=delayTime)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(u, booleanToReal.u)
    annotation (Line(points={{-140,0},{-112,0},{-82,0}}, color={255,0,255}));
  connect(booleanToReal.y, fixedDelay.u)
    annotation (Line(points={{-59,0},{-34,0},{-10,0}}, color={0,0,127}));
  connect(fixedDelay.y, realToBoolean.u)
    annotation (Line(points={{13,0},{26,0},{38,0}}, color={0,0,127}));
  connect(realToBoolean.y, y)
    annotation (Line(points={{61,0},{88,0},{120,0}}, color={255,0,255}));
  annotation (Icon(graphics={
        Text(
          extent={{-250,-120},{250,-150}},
          lineColor={0,0,0},
          textString="%delayTime s"),
        Line(points={{-80,-68},{-60,-68},{-60,-24},{-18,-24},{-18,-68},{66,-68}}),
        Line(points={{-80,32},{-4,32},{-4,76},{38,76},{38,32},{66,32}}, color={255,
              0,255})}), Documentation(info="<html>
<p>
A rising edge of the Boolean input u gives a delayed output.
A falling edge of the input is immediately given to the output.
</p>

<p>
Simulation results of a typical example with a delay time of 0.1 s
is shown in the next figure.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/MathBoolean/OnDelay1.png\"
     alt=\"OnDelay1.png\">
<br>
<img src=\"modelica://Modelica/Resources/Images/Blocks/MathBoolean/OnDelay2.png\"
     alt=\"OnDelay2.png\">
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.BooleanNetwork1\">Modelica.Blocks.Examples.BooleanNetwork1</a>.
</p>

</html>"));

end LogicalDelay;
