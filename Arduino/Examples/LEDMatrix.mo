within Arduino.Examples;
model LEDMatrix "An Arduino connected to a button"
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleInterval=0.01, sketch="LEDMatrix.ino")
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=90,
        origin={-20,-6})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,90})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-18,90})));
  Components.LEDMatrix8x8 lEDMatrix8x82_1
    annotation (Placement(transformation(extent={{46,-30},{94,18}})));
equation
  connect(lEDMatrix8x82_1.R8, arduinoUno.A5) annotation (Line(points={{72,-30},
          {72,-80},{7.5,-80},{7.5,-46}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.C5, arduinoUno.A4) annotation (Line(points={{76,-30},
          {76,-86},{2.5,-86},{2.5,-46}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R6, arduinoUno.A3) annotation (Line(points={{80,-30},
          {80,-92},{-2.5,-92},{-2.5,-46}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R3, arduinoUno.A2) annotation (Line(points={{84,-30},
          {84,-98},{-7.5,-98},{-7.5,-46}}, color={0,0,255}));
  connect(constantVoltage.p, arduinoUno.Vin)
    annotation (Line(points={{-28,90},{-70,90},{-70,-6}},  color={0,0,255}));
  connect(arduinoUno.GND, constantVoltage.n) annotation (Line(points={{30,-6},{
          36,-6},{36,90},{-8,90}},   color={0,0,255}));
  connect(ground.p, constantVoltage.n)
    annotation (Line(points={{40,90},{-8,90}}, color={0,0,255}));
  connect(arduinoUno.D2, lEDMatrix8x82_1.C8) annotation (Line(points={{2.5,34},
          {2,34},{2,40},{56,40},{56,18}}, color={0,0,255}));
  connect(arduinoUno.D3, lEDMatrix8x82_1.C7) annotation (Line(points={{-2.5,34},
          {-2,34},{-2,44},{60,44},{60,18}}, color={0,0,255}));
  connect(arduinoUno.D4, lEDMatrix8x82_1.R2) annotation (Line(points={{-7.5,34},
          {-6,34},{-6,48},{64,48},{64,18}}, color={0,0,255}));
  connect(arduinoUno.D5, lEDMatrix8x82_1.C1) annotation (Line(points={{-12.5,34},
          {-12,34},{-12,52},{68,52},{68,18}}, color={0,0,255}));
  connect(arduinoUno.D6, lEDMatrix8x82_1.R4) annotation (Line(points={{-17.5,34},
          {-16,34},{-16,56},{72,56},{72,18}}, color={0,0,255}));
  connect(arduinoUno.D7, lEDMatrix8x82_1.C6) annotation (Line(points={{-22.5,34},
          {-24,34},{-24,60},{76,60},{76,18}}, color={0,0,255}));
  connect(arduinoUno.D8, lEDMatrix8x82_1.C4) annotation (Line(points={{-27.5,34},
          {-27.5,64},{80,64},{80,18}}, color={0,0,255}));
  connect(arduinoUno.D9, lEDMatrix8x82_1.R1) annotation (Line(points={{-32.5,34},
          {-32,34},{-32,68},{84,68},{84,18}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.R5, arduinoUno.D10) annotation (Line(points={{56,-30},
          {56,-56},{-96,-56},{-96,70},{-36,70},{-36,34},{-37.5,34}}, color={0,0,
          255}));
  connect(lEDMatrix8x82_1.R7, arduinoUno.D11) annotation (Line(points={{60,-30},
          {60,-62},{-90,-62},{-90,64},{-42,64},{-42,50},{-42.5,50},{-42.5,34}},
                                                              color={0,0,255}));
  connect(lEDMatrix8x82_1.C2, arduinoUno.D12) annotation (Line(points={{64,-30},
          {64,-68},{-84,-68},{-84,58},{-47.5,58},{-47.5,34}}, color={0,0,255}));
  connect(lEDMatrix8x82_1.C3, arduinoUno.D13) annotation (Line(points={{68,-30},
          {68,-74},{-78,-74},{-78,52},{-52.5,52},{-52.5,34}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=5, __Dymola_Algorithm="Dassl"));
end LEDMatrix;
