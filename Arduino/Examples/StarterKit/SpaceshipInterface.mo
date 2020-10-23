within Arduino.Examples.StarterKit;
model SpaceshipInterface
  Arduino.Components.ArduinoUno arduinoUno(sketch="Project2.ino")
    annotation (Placement(transformation(extent={{-56,22},{-24,62}})));
  Arduino.Components.LED lED
    annotation (Placement(transformation(extent={{16,52},{36,72}})));
  Arduino.Components.LED lED1
    annotation (Placement(transformation(extent={{16,36},{36,56}})));
  Arduino.Components.LED lED2
    annotation (Placement(transformation(extent={{16,20},{36,40}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100)
    annotation (Placement(transformation(extent={{66,52},{46,72}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=100)
    annotation (Placement(transformation(extent={{66,36},{46,56}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=100)
    annotation (Placement(transformation(extent={{66,20},{46,40}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=25,
                                                    period=1)
    annotation (Placement(transformation(extent={{48,0},{28,-20}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-86,-10})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-68,36})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-50,-52},{-30,-32}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=10000)
    annotation (Placement(transformation(extent={{-54,-42},{-74,-22}})));
equation
  connect(lED2.n,resistor2. n)
    annotation (Line(points={{36,30},{46,30}}, color={0,0,255}));
  connect(lED1.n,resistor1. n)
    annotation (Line(points={{36,46},{46,46}}, color={0,0,255}));
  connect(lED.n,resistor. n)
    annotation (Line(points={{36,62},{46,62}}, color={0,0,255}));
  connect(idealClosingSwitch.control,booleanPulse. y)
    annotation (Line(points={{-74,-10},{27,-10}},  color={255,0,255}));
  connect(ground.p,arduinoUno. GND)
    annotation (Line(points={{-40,-32},{-40,22}}, color={0,0,255}));
  connect(constantVoltage.p,arduinoUno. Vin) annotation (Line(points={{-68,46},
          {-68,68},{-40,68},{-40,62}}, color={0,0,255}));
  connect(resistor1.p,arduinoUno. GND) annotation (Line(points={{66,46},{74,46},
          {74,10},{-40,10},{-40,22}}, color={0,0,255}));
  connect(arduinoUno.D3,lED2. p) annotation (Line(points={{-24,35},{-4,35},{-4,
          30},{16,30}}, color={0,0,255}));
  connect(arduinoUno.D4,lED1. p) annotation (Line(points={{-24,37},{-4,37},{-4,
          46},{16,46}}, color={0,0,255}));
  connect(arduinoUno.D5,lED. p) annotation (Line(points={{-24,39},{-8,39},{-8,
          62},{16,62}}, color={0,0,255}));
  connect(constantVoltage.n, arduinoUno.GND) annotation (Line(points={{-68,26},
          {-68,10},{-40,10},{-40,22}}, color={0,0,255}));
  connect(idealClosingSwitch.p, arduinoUno.Vin) annotation (Line(points={{-86,
          0},{-86,68},{-40,68},{-40,62}}, color={0,0,255}));
  connect(ground.p, resistor3.p)
    annotation (Line(points={{-40,-32},{-54,-32}}, color={0,0,255}));
  connect(idealClosingSwitch.n, resistor3.n) annotation (Line(points={{-86,
          -20},{-86,-32},{-74,-32}}, color={0,0,255}));
  connect(arduinoUno.D2, idealClosingSwitch.n) annotation (Line(points={{-24,
          33},{-20,33},{-20,-20},{-86,-20}}, color={0,0,255}));
  connect(resistor2.p, arduinoUno.GND) annotation (Line(points={{66,30},{66,
          16},{-40,16},{-40,22}}, color={0,0,255}));
  connect(resistor.p, arduinoUno.GND) annotation (Line(points={{66,62},{76,62},
          {76,6},{-40,6},{-40,22}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SpaceshipInterface;
