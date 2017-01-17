within Arduino.Internal;
model DigitalPort

  Modelica.Blocks.Interfaces.BooleanInput isInput annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,92})));
  Modelica.Electrical.Analog.Interfaces.Pin pin
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-42,-28})));
  Modelica.Blocks.Interfaces.RealInput pulseWidth
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-40})));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Goff=
       1e-9)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={40,0})));
equation
  connect(variablePulseVoltage.pulseWidth, pulseWidth) annotation (Line(
        points={{2,8},{-120,8},{-120,-40}},              color={0,0,127}));
  connect(ground1.p, variablePulseVoltage.n)
    annotation (Line(points={{-42,-18},{-42,-18},{-42,0},{-40,0},{-40,0},{-20,0},
          {-20,1.33227e-015}},                            color={0,0,255}));
  connect(idealOpeningSwitch.n, variablePulseVoltage.p) annotation (Line(
        points={{30,1.33227e-015},{30,0},{14,0},{14,0},{0,0},{0,-1.33227e-015}},
                                                          color={0,0,255}));
  connect(idealOpeningSwitch.control, isInput) annotation (Line(points={{40,7},{
          40,92},{-120,92}},                   color={255,0,255}));
  connect(pin, idealOpeningSwitch.p)
    annotation (Line(points={{100,0},{76,0},{50,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DigitalPort;
