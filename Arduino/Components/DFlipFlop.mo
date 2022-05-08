within Arduino.Components;
model DFlipFlop
                 extends Modelica.Blocks.Icons.PartialBooleanBlock;
  Modelica.Blocks.Interfaces.BooleanInput D "Data"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.BooleanInput C "Clock" annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}}), iconTransformation(
          extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.BooleanOutput Q annotation (Placement(
        transformation(extent={{100,50},{120,70}}), iconTransformation(extent={{
            100,50},{120,70}})));
equation
  when edge(C) then
    Q = pre(D);
  end when;
    annotation (Line(points={{-120,60},{110,60}}, color={255,0,255}),
              Icon(coordinateSystem(preserveAspectRatio=false), graphics={
      Text(
        extent={{-76,-30},{-36,-90}},
          textString="C",
          textColor={0,0,0}),
      Text(
        extent={{44,88},{84,28}},
        textString="Q"),
      Text(
        extent={{-78,90},{-38,30}},
          textString="D",
          textColor={0,0,0})}),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DFlipFlop;
