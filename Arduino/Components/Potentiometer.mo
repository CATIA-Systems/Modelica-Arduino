within Arduino.Components;
model Potentiometer
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;

  parameter Real ratio(min=0, max=100) = 50;
  parameter Real resistance(min=0);


  Modelica.Electrical.Analog.Interfaces.Pin l
    annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-10,90},{10,110}})));
  Modelica.Electrical.Analog.Basic.Resistor R1(R=(1 - ratio/100)*resistance)
                                               annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={3.55271e-015,40})));
  Modelica.Electrical.Analog.Basic.Resistor R2(R=(ratio/100)*resistance)
                                               annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,-40})));
equation
  connect(R1.p, p) annotation (Line(points={{7.21645e-015,60},{7.21645e-015,78},
          {-100,78},{-100,0}},                               color={0,0,255}));
  connect(R2.p, R1.n)
    annotation (Line(points={{3.66374e-015,-20},{3.66374e-015,20},{
          -2.22045e-016,20}},                         color={0,0,255}));
  connect(n, R2.n)
    annotation (Line(points={{100,0},{100,-60},{-3.77476e-015,-60}},
                                                         color={0,0,255}));
  connect(l, R1.n) annotation (Line(points={{0,100},{0,100},{0,20},{-2.22045e-016,
          20}},               color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{-10,0},{10,0}},  color={0,0,255},
          origin={-80,0},
          rotation=180),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={0,0},
          rotation=180),
        Line(points={{-20,-5.5109e-015},{0,0}},
                                     color={0,0,255},
          origin={0,90},
          rotation=90),
        Line(points={{-10,0},{10,0}},  color={0,0,255},
          origin={80,0},
          rotation=180),
        Line(points=DynamicSelect({{0,70},{0,50}}, {{0,70},{70-140*(ratio/100),50}}), color={0,0,255}),
        Line(points=DynamicSelect({{0,50},{0,30}}, {{70-140*(ratio/100),50},{70-140*(ratio/100),30}}), color={0,0,255}),
        Line(points=DynamicSelect({{0,30},{ 10,40}}, {{70-140*(ratio/100),30}, { 10+70-140*(ratio/100),40}}), color={0,0,255}),
        Line(points=DynamicSelect({{0,30},{-10,40}}, {{70-140*(ratio/100),30}, {-10+70-140*(ratio/100),40}}), color={0,0,255}),
        Text(
          extent={{-152,-47},{148,-87}},
          textString="%name",
          lineColor={0,0,255})}),                                                                                                                                                                                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Potentiometer;
