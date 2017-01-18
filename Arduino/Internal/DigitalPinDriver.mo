within Arduino.Internal;
model DigitalPinDriver

  Modelica.Blocks.Interfaces.BooleanInput isInput annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,40})));
  Modelica.Electrical.Analog.Interfaces.Pin y
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Goff=
       1e-9)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,0})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(extent={{-40,30},{-60,10}})));
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch idealCommutingSwitch
    annotation (Placement(transformation(extent={{10,10},{-10,-10}})));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-70,-30})));
  Modelica.Blocks.Interfaces.BooleanInput u
    "true => p--n2 connected, false => p--n1 connected"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
equation
  connect(idealOpeningSwitch.control, isInput) annotation (Line(points={{50,7},{
          50,40},{-120,40}},                   color={255,0,255}));
  connect(y, idealOpeningSwitch.p)
    annotation (Line(points={{100,0},{60,0}}, color={0,0,255}));
  connect(constantVoltage.p, idealCommutingSwitch.n2) annotation (Line(points={
          {-40,20},{-30,20},{-30,0},{-10,0}}, color={0,0,255}));
  connect(idealCommutingSwitch.control, u)
    annotation (Line(points={{0,-8},{0,-40},{-120,-40}}, color={255,0,255}));
  connect(idealCommutingSwitch.p, idealOpeningSwitch.n)
    annotation (Line(points={{10,0},{40,0}}, color={0,0,255}));
  connect(ground2.p, constantVoltage.n)
    annotation (Line(points={{-70,-20},{-70,20},{-60,20}}, color={0,0,255}));
  connect(idealCommutingSwitch.n1, constantVoltage.n) annotation (Line(points={
          {-10,-5},{-40,-5},{-40,-4},{-70,-4},{-70,20},{-60,20}}, color={0,0,
          255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                         Rectangle(
          extent={{-100,100},{100,-100}},
          fillColor={210,210,210},
          lineThickness=5.0,
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised),
        Line(points={{-90,-70},{72,-70}}, color={255,0,255}),
        Polygon(
          points={{90,-70},{68,-62},{68,-78},{90,-70}},
          lineColor={255,0,255},
          fillColor={255,0,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-80,88},{-88,66},{-72,66},{-80,88}},
          lineColor={255,0,255},
          fillColor={255,0,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,66},{-80,-82}}, color={255,0,255}),
        Line(points={{-80,-70},{-8,-70},{-8,30},{70,30}}, color={0,0,0})}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DigitalPinDriver;
