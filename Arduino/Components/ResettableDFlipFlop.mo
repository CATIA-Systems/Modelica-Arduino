within Arduino.Components;
model ResettableDFlipFlop
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
  Modelica.Blocks.Interfaces.BooleanInput R "Reset" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
equation

  when {edge(C), edge(R)} then
    if R then
      Q = false;
    else
      Q = pre(D);
    end if;
  end when;

    annotation (Line(points={{-120,60},{110,60}}, color={255,0,255}),
              Icon(coordinateSystem(preserveAspectRatio=false), graphics={
      Text(
        extent={{-90,-40},{-50,-80}},
          textString="C",
          textColor={0,0,0}),
      Text(
        extent={{50,80},{90,40}},
        textString="Q"),
      Text(
        extent={{-90,80},{-50,40}},
          textString="D",
          textColor={0,0,0}),
      Text(
        extent={{-20,-50},{20,-90}},
          textColor={0,0,0},
          textString="R")}),                                     Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ResettableDFlipFlop;
