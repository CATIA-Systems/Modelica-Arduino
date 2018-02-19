within Arduino.Internal;
block VariableBooleanPulse "Generate pulse signal of type Boolean"
  extends Modelica.Blocks.Interfaces.partialBooleanSource;

  parameter Modelica.SIunits.Time startTime=0 "Time instant of first pulse";

  parameter Modelica.SIunits.Time sampleInterval(fixed=true) = 1e-2;

public
  Modelica.Blocks.Interfaces.BooleanInput pwm(start=false) annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.IntegerInput period(start=2000, fixed=true)
    "Pulse time in microseconds"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.IntegerInput width(start=100, fixed=true) "Pulse width in microseconds"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));

protected
  discrete Modelica.SIunits.Time nextTimeEvent(start=0, fixed=true) "Next time event instant";

equation

  when {time >= pre(nextTimeEvent),initial()} then

    if pwm then

      if width == 0 then
        nextTimeEvent = time + period * 1e-6;
      elseif mod(time * 1e6, period) < width then
        nextTimeEvent = time + (width) * 1e-6;
      else
        nextTimeEvent = time + (period-width) * 1e-6;
      end if;

    else
      nextTimeEvent = time + sampleInterval;
    end if;

    //nextTimeEvent = time + 100 * 1e-6;
    //Modelica.Utilities.Streams.print(String(pre(time)) + " -> " + String(time));
    //nextTimeEvent = time + 100 * 1e-6;
    y = mod(time * 1e6 + 1, period) < width;
  end when;

  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-150,-140},{150,-110}},
          lineColor={0,0,0},
          textString="%period"), Line(points={{-80,-70},{-40,-70},{-40,44},{0,
              44},{0,-70},{40,-70},{40,44},{79,44}})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Text(
          extent={{-60,-74},{-19,-82}},
          lineColor={0,0,0},
          textString="startTime"),
        Line(
          points={{-78,-70},{-40,-70},{-40,20},{20,20},{20,-70},{50,-70},{50,
              20},{100,20}},
          color={0,0,255},
          thickness=0.5),
        Line(points={{-40,61},{-40,21}}, color={95,95,95}),
        Line(points={{20,44},{20,20}}, color={95,95,95}),
        Line(points={{50,58},{50,20}}, color={95,95,95}),
        Line(points={{-40,53},{50,53}}, color={95,95,95}),
        Line(points={{-40,35},{20,35}}, color={95,95,95}),
        Text(
          extent={{-30,65},{16,55}},
          lineColor={0,0,0},
          textString="period"),
        Text(
          extent={{-33,47},{14,37}},
          lineColor={0,0,0},
          textString="width"),
        Line(points={{-70,20},{-41,20}}, color={95,95,95}),
        Polygon(
          points={{-40,35},{-31,37},{-31,33},{-40,35}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,35},{12,37},{12,33},{20,35}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,53},{-31,55},{-31,51},{-40,53}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{50,53},{42,55},{42,51},{50,53}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-95,26},{-66,17}},
          lineColor={0,0,0},
          textString="true"),
        Text(
          extent={{-96,-60},{-75,-69}},
          lineColor={0,0,0},
          textString="false")}),
      Documentation(info="<html>
<p>
The Boolean output y is a pulse signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Pulse.png\"
     alt=\"Pulse.png\">
</p>
</html>"));
end VariableBooleanPulse;
