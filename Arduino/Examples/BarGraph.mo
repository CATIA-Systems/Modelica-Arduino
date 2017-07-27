within Arduino.Examples;
model BarGraph
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="BarGraph.ino")
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=0,
        origin={10,-10})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220)
    annotation (Placement(transformation(extent={{94,34},{106,46}})));
  Components.LED lED3
    annotation (Placement(transformation(extent={{74,34},{86,46}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(
                                                     R=220)
    annotation (Placement(transformation(extent={{94,24},{106,36}})));
  Components.LED lED1
    annotation (Placement(transformation(extent={{74,24},{86,36}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(
                                                     R=220)
    annotation (Placement(transformation(extent={{94,14},{106,26}})));
  Components.LED lED2
    annotation (Placement(transformation(extent={{74,14},{86,26}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(
                                                     R=220)
    annotation (Placement(transformation(extent={{94,4},{106,16}})));
  Components.LED lED4
    annotation (Placement(transformation(extent={{74,4},{86,16}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(
                                                     R=220)
    annotation (Placement(transformation(extent={{94,-6},{106,6}})));
  Components.LED lED5
    annotation (Placement(transformation(extent={{74,-6},{86,6}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor10(
                                                     R=220)
    annotation (Placement(transformation(extent={{94,-16},{106,-4}})));
  Components.LED lED11
    annotation (Placement(transformation(extent={{74,-16},{86,-4}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor11(
                                                     R=220)
    annotation (Placement(transformation(extent={{94,-26},{106,-14}})));
  Components.LED lED12
    annotation (Placement(transformation(extent={{74,-26},{86,-14}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor12(
                                                     R=220)
    annotation (Placement(transformation(extent={{94,-36},{106,-24}})));
  Components.LED lED13
    annotation (Placement(transformation(extent={{74,-36},{86,-24}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor13(
                                                     R=220)
    annotation (Placement(transformation(extent={{94,-46},{106,-34}})));
  Components.LED lED14
    annotation (Placement(transformation(extent={{74,-46},{86,-34}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor14(
                                                     R=220)
    annotation (Placement(transformation(extent={{94,-56},{106,-44}})));
  Components.LED lED15
    annotation (Placement(transformation(extent={{74,-56},{86,-44}})));
  Modelica.Electrical.Analog.Basic.Potentiometer potentiometer(rConstant=0.01,
      useRinput=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-70,2})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.5,
    freqHz=0.5,
    offset=0.5)
    annotation (Placement(transformation(extent={{-40,6},{-52,18}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-100,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
equation
  connect(lED3.n,resistor. p) annotation (Line(points={{86,40},{94,40}},
                    color={0,0,255}));
  connect(lED1.n,resistor1. p)
    annotation (Line(points={{86,30},{94,30}}, color={0,0,255}));
  connect(lED2.n,resistor2. p)
    annotation (Line(points={{86,20},{94,20}}, color={0,0,255}));
  connect(lED4.n,resistor3. p)
    annotation (Line(points={{86,10},{94,10}}, color={0,0,255}));
  connect(lED5.n,resistor4. p)
    annotation (Line(points={{86,0},{94,0}}, color={0,0,255}));
  connect(lED11.n,resistor10. p)
    annotation (Line(points={{86,-10},{94,-10}}, color={0,0,255}));
  connect(lED12.n,resistor11. p)
    annotation (Line(points={{86,-20},{94,-20}}, color={0,0,255}));
  connect(lED13.n,resistor12. p)
    annotation (Line(points={{86,-30},{94,-30}}, color={0,0,255}));
  connect(lED14.n,resistor13. p)
    annotation (Line(points={{86,-40},{94,-40}}, color={0,0,255}));
  connect(lED15.n,resistor14. p)
    annotation (Line(points={{86,-50},{94,-50}}, color={0,0,255}));
  connect(resistor.n, arduinoUno.GND) annotation (Line(points={{106,40},{112,40},
          {112,-60},{10,-60}}, color={0,0,255}));
  connect(resistor1.n, arduinoUno.GND) annotation (Line(points={{106,30},{112,30},
          {112,-60},{10,-60}}, color={0,0,255}));
  connect(resistor2.n, arduinoUno.GND) annotation (Line(points={{106,20},{112,20},
          {112,-60},{10,-60}}, color={0,0,255}));
  connect(resistor3.n, arduinoUno.GND) annotation (Line(points={{106,10},{112,10},
          {112,-60},{10,-60}}, color={0,0,255}));
  connect(resistor4.n, arduinoUno.GND) annotation (Line(points={{106,0},{112,0},
          {112,-60},{10,-60}},color={0,0,255}));
  connect(resistor10.n, arduinoUno.GND) annotation (Line(points={{106,-10},{112,
          -10},{112,-60},{10,-60}}, color={0,0,255}));
  connect(resistor11.n, arduinoUno.GND) annotation (Line(points={{106,-20},{112,
          -20},{112,-60},{10,-60}}, color={0,0,255}));
  connect(resistor12.n, arduinoUno.GND) annotation (Line(points={{106,-30},{112,
          -30},{112,-60},{10,-60}}, color={0,0,255}));
  connect(resistor13.n, arduinoUno.GND) annotation (Line(points={{106,-40},{112,
          -40},{112,-60},{10,-60}}, color={0,0,255}));
  connect(resistor14.n, arduinoUno.GND) annotation (Line(points={{106,-50},{112,
          -50},{112,-60},{10,-60}}, color={0,0,255}));
  connect(sine.y,potentiometer. r) annotation (Line(points={{-52.6,12},{-59,12}},
                         color={0,0,127}));
  connect(potentiometer.contact, arduinoUno.A0) annotation (Line(points={{-60,-8},
          {-60,-12},{-30,-12},{-30,-12.5}},               color={0,0,255}));
  connect(potentiometer.pin_n, arduinoUno.GND)
    annotation (Line(points={{-70,-8},{-70,-60},{10,-60}},  color={0,0,255}));
  connect(ground.p, arduinoUno.GND)
    annotation (Line(points={{10,-80},{10,-60}},             color={0,0,255}));
  connect(constantVoltage.n, arduinoUno.GND) annotation (Line(points={{-100,-10},
          {-100,-70},{10,-70},{10,-60}},             color={0,0,255}));
  connect(constantVoltage.p, arduinoUno.Vin) annotation (Line(points={{-100,10},
          {-100,72},{10,72},{10,40}},   color={0,0,255}));
  connect(potentiometer.pin_p, arduinoUno.Vin) annotation (Line(points={{-70,12},
          {-70,72},{10,72},{10,40}},   color={0,0,255}));
  connect(lED15.p, arduinoUno.D2) annotation (Line(points={{74,-50},{56,-50},{56,
          -32.5},{50,-32.5}},    color={0,0,255}));
  connect(lED14.p, arduinoUno.D3) annotation (Line(points={{74,-40},{60,-40},{60,
          -27.5},{50,-27.5}},    color={0,0,255}));
  connect(lED13.p, arduinoUno.D4) annotation (Line(points={{74,-30},{64,-30},{64,
          -22.5},{50,-22.5}},    color={0,0,255}));
  connect(lED12.p, arduinoUno.D5) annotation (Line(points={{74,-20},{66,-20},{66,
          -17.5},{50,-17.5}},    color={0,0,255}));
  connect(lED11.p, arduinoUno.D6) annotation (Line(points={{74,-10},{66,-10},{66,
          -12.5},{50,-12.5}},    color={0,0,255}));
  connect(lED5.p, arduinoUno.D7) annotation (Line(points={{74,0},{64,0},{64,-7.5},
          {50,-7.5}},       color={0,0,255}));
  connect(arduinoUno.D8, lED4.p) annotation (Line(points={{50,-2.5},{56,-2.5},{56,
          -2},{60,-2},{60,10},{74,10}},    color={0,0,255}));
  connect(arduinoUno.D9, lED2.p) annotation (Line(points={{50,2.5},{54,2.5},{54,
          2},{58,2},{58,20},{74,20}}, color={0,0,255}));
  connect(arduinoUno.D10, lED1.p) annotation (Line(points={{50,7.5},{54,7.5},{54,
          8},{56,8},{56,30},{74,30}},    color={0,0,255}));
  connect(arduinoUno.D11, lED3.p) annotation (Line(points={{50,12.5},{52,12.5},{
          52,12},{54,12},{54,40},{74,40}},  color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}})),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}}),
                    graphics={Text(
          extent={{26,96},{114,82}},
          lineColor={28,108,200},
          textString="See https://www.arduino.cc/en/Tutorial/BarGraph 
for a description of the sketch and the circuit."), Rectangle(extent={{20,100},{
              120,80}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end BarGraph;
