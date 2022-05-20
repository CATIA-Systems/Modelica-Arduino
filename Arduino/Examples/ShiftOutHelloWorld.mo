within Arduino.Examples;
model ShiftOutHelloWorld
  "An Arduino controlling 8 LED using a shift register"
              extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Basic.Resistor resistor0(R=220)
    annotation (Placement(transformation(extent={{-64,64},{-76,76}})));
  Components.LED LED0
    annotation (Placement(transformation(extent={{-84,64},{-96,76}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,-50})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
  Components.IC74HC595N4 sN74HC595N4_1
    annotation (Placement(transformation(extent={{-20,-20},{0,20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=220)
    annotation (Placement(transformation(extent={{-64,44},{-76,56}})));
  Components.LED LED1
    annotation (Placement(transformation(extent={{-84,44},{-96,56}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=220)
    annotation (Placement(transformation(extent={{-64,24},{-76,36}})));
  Components.LED LED2
    annotation (Placement(transformation(extent={{-84,24},{-96,36}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=220)
    annotation (Placement(transformation(extent={{-64,4},{-76,16}})));
  Components.LED LED3
    annotation (Placement(transformation(extent={{-84,4},{-96,16}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R=220)
    annotation (Placement(transformation(extent={{-64,-16},{-76,-4}})));
  Components.LED LED4
    annotation (Placement(transformation(extent={{-84,-16},{-96,-4}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor5(R=220)
    annotation (Placement(transformation(extent={{-64,-36},{-76,-24}})));
  Components.LED LED5
    annotation (Placement(transformation(extent={{-84,-36},{-96,-24}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor6(R=220)
    annotation (Placement(transformation(extent={{-64,-56},{-76,-44}})));
  Components.LED LED6
    annotation (Placement(transformation(extent={{-84,-56},{-96,-44}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor7(R=220)
    annotation (Placement(transformation(extent={{-64,-76},{-76,-64}})));
  Components.LED LED7
    annotation (Placement(transformation(extent={{-84,-76},{-96,-64}})));
  Components.ArduinoUno arduinoUno(sketch="ShftOut11.ino")
    annotation (Placement(transformation(extent={{40,-50},{-40,50}},
        rotation=0,
        origin={70,10})));
equation
  connect(LED0.p, resistor0.n)
    annotation (Line(points={{-84,70},{-76,70}},   color={0,0,255}));
  connect(resistor0.p, sN74HC595N4_1.Q0) annotation (Line(points={{-64,70},{-42,
          70},{-42,14},{-20,14}},
                            color={0,0,255}));
  connect(LED0.n, sN74HC595N4_1.GND) annotation (Line(points={{-96,70},{-104,70},
          {-104,-80},{-10,-80},{-10,-20}},           color={0,0,255}));
  connect(LED1.p, resistor1.n)
    annotation (Line(points={{-84,50},{-76,50}},   color={0,0,255}));
  connect(LED2.p, resistor2.n)
    annotation (Line(points={{-84,30},{-76,30}},   color={0,0,255}));
  connect(LED3.p, resistor3.n)
    annotation (Line(points={{-84,10},{-76,10}},   color={0,0,255}));
  connect(LED4.p, resistor4.n)
    annotation (Line(points={{-84,-10},{-76,-10}},   color={0,0,255}));
  connect(LED5.p, resistor5.n)
    annotation (Line(points={{-84,-30},{-76,-30}},   color={0,0,255}));
  connect(LED6.p, resistor6.n)
    annotation (Line(points={{-84,-50},{-76,-50}},   color={0,0,255}));
  connect(LED7.p, resistor7.n)
    annotation (Line(points={{-84,-70},{-76,-70}},   color={0,0,255}));
  connect(LED1.n, sN74HC595N4_1.GND) annotation (Line(points={{-96,50},{-104,50},
          {-104,-80},{-10,-80},{-10,-20}},           color={0,0,255}));
  connect(LED2.n, sN74HC595N4_1.GND) annotation (Line(points={{-96,30},{-104,30},
          {-104,-80},{-10,-80},{-10,-20}},           color={0,0,255}));
  connect(LED3.n, sN74HC595N4_1.GND) annotation (Line(points={{-96,10},{-104,10},
          {-104,-80},{-10,-80},{-10,-20}},           color={0,0,255}));
  connect(LED4.n, sN74HC595N4_1.GND) annotation (Line(points={{-96,-10},{-104,
          -10},{-104,-80},{-10,-80},{-10,-20}},      color={0,0,255}));
  connect(LED5.n, sN74HC595N4_1.GND) annotation (Line(points={{-96,-30},{-104,
          -30},{-104,-80},{-10,-80},{-10,-20}},      color={0,0,255}));
  connect(LED6.n, sN74HC595N4_1.GND) annotation (Line(points={{-96,-50},{-104,
          -50},{-104,-80},{-10,-80},{-10,-20}},      color={0,0,255}));
  connect(LED7.n, sN74HC595N4_1.GND) annotation (Line(points={{-96,-70},{-104,
          -70},{-104,-80},{-10,-80},{-10,-20}},      color={0,0,255}));
  connect(resistor7.p, sN74HC595N4_1.Q7) annotation (Line(points={{-64,-70},{
          -42,-70},{-42,-14},{-20,-14}},
                                      color={0,0,255}));
  connect(resistor6.p, sN74HC595N4_1.Q6) annotation (Line(points={{-64,-50},{
          -46,-50},{-46,-10},{-20,-10}},
                                      color={0,0,255}));
  connect(resistor5.p, sN74HC595N4_1.Q5) annotation (Line(points={{-64,-30},{
          -50,-30},{-50,-6},{-20,-6}},
                                    color={0,0,255}));
  connect(resistor4.p, sN74HC595N4_1.Q4) annotation (Line(points={{-64,-10},{
          -54,-10},{-54,-2},{-20,-2}},
                                  color={0,0,255}));
  connect(resistor3.p, sN74HC595N4_1.Q3) annotation (Line(points={{-64,10},{-54,
          10},{-54,2},{-20,2}},    color={0,0,255}));
  connect(sN74HC595N4_1.Q2, resistor2.p) annotation (Line(points={{-20,6},{-50,
          6},{-50,30},{-64,30}},    color={0,0,255}));
  connect(sN74HC595N4_1.Q1, resistor1.p) annotation (Line(points={{-20,10},{-46,
          10},{-46,50},{-64,50}},   color={0,0,255}));
  connect(constantVoltage.n, ground.p) annotation (Line(points={{10,-60},{10,
          -80}},              color={0,0,255}));
  connect(ground.p, sN74HC595N4_1.GND) annotation (Line(points={{10,-80},{-10,
          -80},{-10,-20}},      color={0,0,255}));
  connect(sN74HC595N4_1.OE, sN74HC595N4_1.GND) annotation (Line(points={{0,6},{4,
          6},{4,-24},{-10,-24},{-10,-20}},                color={0,0,255}));
  connect(arduinoUno.GND, ground.p)
    annotation (Line(points={{70,-40},{70,-80},{10,-80}},   color={0,0,255}));
  connect(constantVoltage.p, arduinoUno.Vin) annotation (Line(points={{10,-40},
          {10,70},{70,70},{70,60}},  color={0,0,255}));
  connect(sN74HC595N4_1.V_CC, arduinoUno.Vin) annotation (Line(points={{-10,20},
          {-10,70},{70,70},{70,60}},          color={0,0,255}));
  connect(sN74HC595N4_1.DS, arduinoUno.D11) annotation (Line(points={{0,10},{20,
          10},{20,32.5},{30,32.5}}, color={0,0,255}));
  connect(sN74HC595N4_1.SH_CP, arduinoUno.D12) annotation (Line(points={{0,-2},{
          16,-2},{16,37.5},{30,37.5}},   color={0,0,255}));
  connect(sN74HC595N4_1.ST_CP, arduinoUno.D8) annotation (Line(points={{0,2},{
          24,2},{24,17.5},{30,17.5}},   color={0,0,255}));
  connect(sN74HC595N4_1.MR, arduinoUno.Vin) annotation (Line(points={{0,-6},{10,
          -6},{10,70},{70,70},{70,60}},        color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,
            100}}), graphics={Text(
          extent={{26,96},{114,82}},
          lineColor={28,108,200},
          textString="See https://docs.arduino.cc/tutorials/communication/guide-to-shift-out 
for a description of the sketch and the circuit."), Rectangle(extent={{20,100},{
              120,80}}, lineColor={28,108,200})}),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end ShiftOutHelloWorld;
