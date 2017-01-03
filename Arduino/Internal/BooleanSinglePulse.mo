within Arduino.Internal;
block BooleanSinglePulse "Generate a single pulse of type Boolean"
  Modelica.SIunits.Time startTime=0 "Time instant of step start";
  parameter Boolean startValue=false "Output before startTime";
  parameter Modelica.SIunits.Time pulseLength=5e-6 "Length of the pulse";

  extends Modelica.Blocks.Interfaces.partialBooleanSource;
  Modelica.Blocks.Interfaces.BooleanInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation

//  when edge(u) then
//    startTime = time;
//  end when;

  if edge(u) then
    startTime = time;
  else
    startTime = startTime;
  end if;

  y = if time >= startTime and time <= startTime + pulseLength then not startValue else startValue;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Line(
          visible=not startValue,
          points={{-80,-70},{0,-70},{0,50},{80,50}}),
        Line(
          visible=startValue,
          points={{-80,50},{0,50},{0,-70},{68,-70}}),
        Text(
          extent={{-150,-140},{150,-110}},
          lineColor={0,0,0},
          textString="%startTime")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={Line(
            points={{-80,-70},{0,-70},{0,50},{80,50}},
            color={0,0,255},
            thickness=0.5),Text(
            extent={{-15,-74},{20,-82}},
            lineColor={0,0,0},
            textString="startTime"),Polygon(
            points={{2,50},{-80,50},{2,50}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),Text(
            extent={{-66,62},{-22,48}},
            lineColor={0,0,0},
            textString="not startValue"),Text(
            extent={{-68,-58},{-36,-72}},
            lineColor={0,0,0},
            textString="startValue")}),
    Documentation(info="<html>
<p>
The Boolean output y is a step signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/BooleanStep.png\"
     alt=\"BooleanStep.png\">
</p>
</html>"));
end BooleanSinglePulse;
