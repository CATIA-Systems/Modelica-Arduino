within Arduino.Internal;
model PinDriver

  Modelica.Electrical.Analog.Interfaces.Pin y
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Goff=
       1e-9)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={70,0})));
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch idealCommutingSwitch
    annotation (Placement(transformation(extent={{40,10},{20,-10}})));
  VariableBooleanPulse variableBooleanPulse(sampleInterval=sampleInterval)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Blocks.Interfaces.IntegerInput pulseWidth
    "Pulse width in milliseconds"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.IntegerInput pulsePeriod
    "Pulse time in milliseconds"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Electrical.Analog.Interfaces.Pin ground
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin v_in
    "Positive pin (potential p.v > n.v for positive voltage drop v)"
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  parameter Modelica.SIunits.Time sampleInterval=1e-2;
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=portMode == 2)
    annotation (Placement(transformation(extent={{-70,-24},{-50,-4}})));
  Modelica.Blocks.Interfaces.IntegerInput portMode "Port mode"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y=portMode == 0)
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
equation
  connect(y, idealOpeningSwitch.p)
    annotation (Line(points={{100,0},{80,0}}, color={0,0,255}));
  connect(idealCommutingSwitch.p, idealOpeningSwitch.n)
    annotation (Line(points={{40,0},{60,0}}, color={0,0,255}));
  connect(variableBooleanPulse.width, pulseWidth) annotation (Line(points={{-42,-26},
          {-80,-26},{-80,-60},{-120,-60}},      color={255,127,0}));
  connect(variableBooleanPulse.period, pulsePeriod) annotation (Line(points={{-42,-20},
          {-80,-20},{-80,0},{-120,0}},          color={255,127,0}));
  connect(idealCommutingSwitch.n2, v_in)
    annotation (Line(points={{20,0},{0,0},{0,60},{100,60}}, color={0,0,255}));
  connect(ground, idealCommutingSwitch.n1) annotation (Line(points={{100,-60},{
          0,-60},{0,-5},{20,-5}}, color={0,0,255}));
  connect(variableBooleanPulse.y, idealCommutingSwitch.control)
    annotation (Line(points={{-19,-20},{30,-20},{30,-8}}, color={255,0,255}));
  connect(booleanExpression.y, variableBooleanPulse.pwm)
    annotation (Line(points={{-49,-14},{-42,-14}}, color={255,0,255}));
  connect(booleanExpression1.y, idealOpeningSwitch.control)
    annotation (Line(points={{61,30},{70,30},{70,7}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                         Rectangle(
          extent={{-100,100},{100,-100}},
          fillColor={210,210,210},
          lineThickness=5.0,
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised)}),                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PinDriver;
