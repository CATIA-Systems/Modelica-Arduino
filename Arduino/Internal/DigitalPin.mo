within Arduino.Internal;
model DigitalPin

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
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
    annotation (Placement(transformation(extent={{-12,-10},{-32,10}})));
  Modelica.Blocks.Math.Gain gain(k=5/100)
    annotation (Placement(transformation(extent={{-74,10},{-54,30}})));
equation
  connect(idealOpeningSwitch.control, isInput) annotation (Line(points={{40,7},{
          40,92},{-120,92}},                   color={255,0,255}));
  connect(pin, idealOpeningSwitch.p)
    annotation (Line(points={{100,0},{76,0},{50,0}}, color={0,0,255}));
  connect(signalVoltage.p, idealOpeningSwitch.n)
    annotation (Line(points={{-12,0},{30,0},{30,0}}, color={0,0,255}));
  connect(signalVoltage.n, ground1.p) annotation (Line(points={{-32,0},{-38,0},
          {-38,-18},{-42,-18}}, color={0,0,255}));
  connect(pulseWidth, gain.u) annotation (Line(points={{-120,-40},{-94,-40},{
          -94,20},{-76,20}}, color={0,0,127}));
  connect(gain.y, signalVoltage.v)
    annotation (Line(points={{-53,20},{-22,20},{-22,7}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DigitalPin;
