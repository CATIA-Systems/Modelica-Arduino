within Arduino.Examples;
model LEDMatrix "An Arduino connected to a button"
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleInterval=0.01, sketch=
        "TestLEDMatrix.ino")
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=90,
        origin={-20,-10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,86})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-18,86})));
  Components.LEDMatrix8x8 lEDMatrix8x82_1
    annotation (Placement(transformation(extent={{46,-34},{94,14}})));
equation
  connect(lEDMatrix8x82_1.C8, arduinoUno.D2) annotation (Line(points={{56,14},{
          56,38},{2.5,38},{2.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.C7, arduinoUno.D3) annotation (Line(points={{60,14},{
          60,42},{-2.5,42},{-2.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R2, arduinoUno.D4) annotation (Line(points={{64,14},{
          64,46},{-8,46},{-8,30},{-7.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.C1, arduinoUno.D5) annotation (Line(points={{68,14},{
          68,50},{-12.5,50},{-12.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R4, arduinoUno.D6) annotation (Line(points={{72,14},{
          72,54},{-17.5,54},{-17.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.C6, arduinoUno.D7) annotation (Line(points={{76,14},{
          76,58},{-22.5,58},{-22.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.C4, arduinoUno.D8) annotation (Line(points={{80,14},{
          80,64},{-26,64},{-26,30},{-27.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R1, arduinoUno.D9) annotation (Line(points={{84,14},{
          84,70},{-32.5,70},{-32.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R5, arduinoUno.D10) annotation (Line(points={{56,-34},
          {56,-60},{-92,-60},{-92,60},{-37.5,60},{-37.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R7, arduinoUno.D11) annotation (Line(points={{60,-34},
          {60,-64},{-88,-64},{-88,56},{-42.5,56},{-42.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.C2, arduinoUno.D12) annotation (Line(points={{64,-34},
          {64,-68},{-84,-68},{-84,52},{-47.5,52},{-47.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.C3, arduinoUno.D13) annotation (Line(points={{68,-34},
          {68,-72},{-80,-72},{-80,48},{-52.5,48},{-52.5,30}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R8, arduinoUno.A5) annotation (Line(points={{72,-34},
          {72,-76},{7.5,-76},{7.5,-50}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.C5, arduinoUno.A4) annotation (Line(points={{76,-34},
          {76,-80},{2.5,-80},{2.5,-50}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R6, arduinoUno.A3) annotation (Line(points={{80,-34},
          {80,-86},{-2.5,-86},{-2.5,-50}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R3, arduinoUno.A2) annotation (Line(points={{84,-34},
          {84,-90},{-7.5,-90},{-7.5,-50}}, color={0,0,255}));
  connect(constantVoltage.p, arduinoUno.Vin)
    annotation (Line(points={{-28,86},{-70,86},{-70,-10}}, color={0,0,255}));
  connect(arduinoUno.GND, constantVoltage.n) annotation (Line(points={{30,-10},
          {36,-10},{36,86},{-8,86}}, color={0,0,255}));
  connect(ground.p, constantVoltage.n)
    annotation (Line(points={{40,86},{-8,86}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=15, __Dymola_Algorithm="Dassl"));
end LEDMatrix;
