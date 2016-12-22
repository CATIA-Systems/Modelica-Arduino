within Arduino.Internal;
model DigitalPort

  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-110})));
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
        rotation=90,
        origin={30,0})));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-78})));
  Modelica.Blocks.Interfaces.RealInput pulseWidth
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-40})));
  Internal.VariablePulseVoltage variablePulseVoltage(V=5, period=1/480)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={0,30})));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Goff=
       1e-9)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={40,60})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-30})));
equation
  connect(potentialSensor.phi, y) annotation (Line(points={{-2.22045e-015,-89},
          {0,-89},{0,-110}},
                           color={0,0,127}));
  connect(variablePulseVoltage.pulseWidth, pulseWidth) annotation (Line(
        points={{-8,42},{-120,42},{-120,-40}},           color={0,0,127}));
  connect(ground1.p, variablePulseVoltage.n)
    annotation (Line(points={{20,0},{14,0},{0,0},{0,20}}, color={0,0,255}));
  connect(idealOpeningSwitch.p, pin)
    annotation (Line(points={{50,60},{100,60},{100,0}},
                                                    color={0,0,255}));
  connect(idealOpeningSwitch.n, variablePulseVoltage.p) annotation (Line(
        points={{30,60},{30,60},{1.77636e-015,60},{1.77636e-015,40}},
                                                          color={0,0,255}));
  connect(idealOpeningSwitch.control, isInput) annotation (Line(points={{40,67},
          {40,92},{40,40},{-120,40}},          color={255,0,255}));
  connect(resistor1.n, ground1.p)
    annotation (Line(points={{6.66134e-016,-20},{0,-20},{0,6.66134e-016},{20,6.66134e-016}},
                                                          color={0,0,255}));
  connect(potentialSensor.p, pin) annotation (Line(points={{1.77636e-015,-68},
          {1.77636e-015,-52},{100,-52},{100,0}},
                                  color={0,0,255}));
  connect(resistor1.p, potentialSensor.p) annotation (Line(points={{-6.66134e-016,
          -40},{-6.66134e-016,-68},{1.77636e-015,-68}},
                                               color={0,0,255}));
  connect(pin, pin)
    annotation (Line(points={{100,0},{100,26},{100,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DigitalPort;
