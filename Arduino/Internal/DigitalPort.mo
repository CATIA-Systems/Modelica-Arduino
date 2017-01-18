within Arduino.Internal;
model DigitalPort

  Modelica.Blocks.Interfaces.BooleanInput isInput annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,40})));
  Modelica.Electrical.Analog.Interfaces.Pin pin
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-70})));
  Modelica.Blocks.Interfaces.RealInput pulseWidth
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-40})));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Goff=
       1e-9)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,0})));
  VariableWidthPulse variableWidthPulse(amplitude=5, period=1/480)
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,-40})));
equation
  connect(idealOpeningSwitch.control, isInput) annotation (Line(points={{50,7},{
          50,40},{-120,40}},                   color={255,0,255}));
  connect(pin, idealOpeningSwitch.p)
    annotation (Line(points={{100,0},{60,0}},        color={0,0,255}));
  connect(pulseWidth, variableWidthPulse.width) annotation (Line(points={{-120,
          -40},{-120,-40},{-62,-40}}, color={0,0,127}));
  connect(ground1.p, signalVoltage.n)
    annotation (Line(points={{0,-60},{0,-50}}, color={0,0,255}));
  connect(signalVoltage.p, idealOpeningSwitch.n) annotation (Line(points={{0,
          -30},{0,-30},{0,1.33227e-015},{40,1.33227e-015}}, color={0,0,255}));
  connect(variableWidthPulse.y, signalVoltage.v)
    annotation (Line(points={{-39,-40},{-7,-40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DigitalPort;
