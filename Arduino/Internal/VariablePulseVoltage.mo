within Arduino.Internal;
model VariablePulseVoltage "Pulse voltage source"
  parameter Modelica.SIunits.Voltage V(start=1) "Amplitude of pulse";
  Real width(
    final min=Modelica.Constants.small,
    final max=100,
    start=50) "Width of pulse in % of period";
  parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small,
      start=1) "Time for one period";
  extends Modelica.Electrical.Analog.Interfaces.VoltageSource(redeclare
      VariableWidthPulse            signalSource(
      amplitude=V,
      period=period,
      width=width));
  Modelica.Blocks.Interfaces.RealInput pulseWidth
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
equation
  connect(pulseWidth, signalSource.width) annotation (Line(points={{-120,80},
          {-26,80},{-26,86},{68.2,86}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Line(points={{-70,-70},{-40,-70},{-40,70},{0,70},
              {0,-70},{40,-70},{40,70},{80,70}}, color={192,192,192})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
          color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
          192,192}),Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Polygon(
            points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Line(
            points={{-34,0},{-34,-70}},
            color={192,192,192}),Polygon(
            points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Text(
            extent={{-78,-24},{-35,-36}},
            lineColor={160,160,164},
            textString="offset"),Text(
            extent={{-40,-69},{6,-87}},
            lineColor={160,160,164},
            textString="startTime"),Text(
            extent={{70,-80},{94,-100}},
            lineColor={160,160,164},
            textString="time"),Line(
            points={{-20,0},{-20,-70}},
            color={192,192,192},
            pattern=LinePattern.Dash),Line(
            points={{-80,0},{-20,0},{-20,50},{21,50},{21,0},{41,0},{41,50},{
            79,50}},
            thickness=0.5),Line(
            points={{-20,89},{-20,50}},
            color={192,192,192},
            pattern=LinePattern.Dash),Line(
            points={{21,74},{21,50}},
            color={160,160,164},
            pattern=LinePattern.Dash),Line(
            points={{41,88},{41,50}},
            color={192,192,192},
            pattern=LinePattern.Dash),Line(points={{-20,83},{41,83}}, color={
          192,192,192}),Line(points={{-20,69},{21,69}}, color={192,192,192}),
          Text(
            extent={{-11,97},{35,85}},
            lineColor={160,160,164},
            textString="period"),Text(
            extent={{-18,81},{21,69}},
            lineColor={160,160,164},
            textString="width"),Line(
            points={{-53,50},{-20,50}},
            color={192,192,192},
            pattern=LinePattern.Dash),Line(
            points={{-34,50},{-34,0}},
            color={192,192,192}),Text(
            extent={{-78,34},{-37,20}},
            lineColor={160,160,164},
            textString="V"),Polygon(
            points={{-34,50},{-37,37},{-31,37},{-34,50}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Polygon(
            points={{-34,0},{-37,13},{-31,13},{-34,0},{-34,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Line(
            points={{79,50},{79,0},{90,0}},
            thickness=0.5),Polygon(
            points={{-20,69},{-11,71},{-11,67},{-20,69}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Polygon(
            points={{21,69},{13,71},{13,67},{21,69}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Polygon(
            points={{-20,83},{-11,85},{-11,81},{-20,83}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Polygon(
            points={{41,83},{33,85},{33,81},{41,83}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Text(
            extent={{-78,103},{-24,89}},
            lineColor={160,160,164},
            textString="v = p.v - n.v")}),
    Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",
        info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
end VariablePulseVoltage;
