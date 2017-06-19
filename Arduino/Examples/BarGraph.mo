within Arduino.Examples;
model BarGraph
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="BarGraph.ino")
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=0,
        origin={-10,-10})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220)
    annotation (Placement(transformation(extent={{74,34},{86,46}})));
  Components.LED lED3
    annotation (Placement(transformation(extent={{54,34},{66,46}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(
                                                     R=220)
    annotation (Placement(transformation(extent={{74,24},{86,36}})));
  Components.LED lED1
    annotation (Placement(transformation(extent={{54,24},{66,36}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(
                                                     R=220)
    annotation (Placement(transformation(extent={{74,14},{86,26}})));
  Components.LED lED2
    annotation (Placement(transformation(extent={{54,14},{66,26}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(
                                                     R=220)
    annotation (Placement(transformation(extent={{74,4},{86,16}})));
  Components.LED lED4
    annotation (Placement(transformation(extent={{54,4},{66,16}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(
                                                     R=220)
    annotation (Placement(transformation(extent={{74,-6},{86,6}})));
  Components.LED lED5
    annotation (Placement(transformation(extent={{54,-6},{66,6}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor10(
                                                     R=220)
    annotation (Placement(transformation(extent={{74,-16},{86,-4}})));
  Components.LED lED11
    annotation (Placement(transformation(extent={{54,-16},{66,-4}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor11(
                                                     R=220)
    annotation (Placement(transformation(extent={{74,-26},{86,-14}})));
  Components.LED lED12
    annotation (Placement(transformation(extent={{54,-26},{66,-14}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor12(
                                                     R=220)
    annotation (Placement(transformation(extent={{74,-36},{86,-24}})));
  Components.LED lED13
    annotation (Placement(transformation(extent={{54,-36},{66,-24}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor13(
                                                     R=220)
    annotation (Placement(transformation(extent={{74,-46},{86,-34}})));
  Components.LED lED14
    annotation (Placement(transformation(extent={{54,-46},{66,-34}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor14(
                                                     R=220)
    annotation (Placement(transformation(extent={{74,-56},{86,-44}})));
  Components.LED lED15
    annotation (Placement(transformation(extent={{54,-56},{66,-44}})));
  Modelica.Electrical.Analog.Basic.Potentiometer potentiometer(rConstant=0.01,
      useRinput=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-90,2})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.5,
    freqHz=0.5,
    offset=0.5)
    annotation (Placement(transformation(extent={{-60,6},{-72,18}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-124,-2})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
equation
  connect(lED3.n,resistor. p) annotation (Line(points={{66,40},{74,40}},
                    color={0,0,255}));
  connect(arduinoUno.D2,lED3. p) annotation (Line(points={{30,12.5},{30,12},{36,
          12},{36,40},{54,40}}, color={0,0,255}));
  connect(lED1.n,resistor1. p)
    annotation (Line(points={{66,30},{74,30}}, color={0,0,255}));
  connect(lED2.n,resistor2. p)
    annotation (Line(points={{66,20},{74,20}}, color={0,0,255}));
  connect(lED4.n,resistor3. p)
    annotation (Line(points={{66,10},{74,10}}, color={0,0,255}));
  connect(lED5.n,resistor4. p)
    annotation (Line(points={{66,0},{74,0}}, color={0,0,255}));
  connect(lED11.n,resistor10. p)
    annotation (Line(points={{66,-10},{74,-10}}, color={0,0,255}));
  connect(lED12.n,resistor11. p)
    annotation (Line(points={{66,-20},{74,-20}}, color={0,0,255}));
  connect(lED13.n,resistor12. p)
    annotation (Line(points={{66,-30},{74,-30}}, color={0,0,255}));
  connect(lED14.n,resistor13. p)
    annotation (Line(points={{66,-40},{74,-40}}, color={0,0,255}));
  connect(lED15.n,resistor14. p)
    annotation (Line(points={{66,-50},{74,-50}}, color={0,0,255}));
  connect(arduinoUno.D3,lED1. p) annotation (Line(points={{30,7.5},{38,7.5},{38,
          8},{40,8},{40,30},{54,30}}, color={0,0,255}));
  connect(arduinoUno.D4,lED2. p) annotation (Line(points={{30,2.5},{38,2.5},{38,
          2},{46,2},{46,20},{54,20}}, color={0,0,255}));
  connect(arduinoUno.D5,lED4. p) annotation (Line(points={{30,-2.5},{40,-2.5},{
          40,-2},{50,-2},{50,10},{54,10}}, color={0,0,255}));
  connect(arduinoUno.D6,lED5. p) annotation (Line(points={{30,-7.5},{42,-7.5},{
          42,-8},{54,-8},{54,0}}, color={0,0,255}));
  connect(arduinoUno.D7,lED11. p) annotation (Line(points={{30,-12.5},{40,-12.5},
          {40,-12},{54,-12},{54,-10}}, color={0,0,255}));
  connect(arduinoUno.D8,lED12. p) annotation (Line(points={{30,-17.5},{40,-17.5},
          {40,-18},{50,-18},{50,-20},{54,-20}}, color={0,0,255}));
  connect(arduinoUno.D9,lED13. p) annotation (Line(points={{30,-22.5},{38,-22.5},
          {38,-22},{46,-22},{46,-30},{54,-30}}, color={0,0,255}));
  connect(arduinoUno.D10,lED14. p) annotation (Line(points={{30,-27.5},{40,
          -27.5},{40,-40},{54,-40}},                   color={0,0,255}));
  connect(arduinoUno.D11,lED15. p) annotation (Line(points={{30,-32.5},{36,
          -32.5},{36,-50},{54,-50}},                   color={0,0,255}));
  connect(resistor.n, arduinoUno.GND) annotation (Line(points={{86,40},{92,40},
          {92,-60},{-10,-60}}, color={0,0,255}));
  connect(resistor1.n, arduinoUno.GND) annotation (Line(points={{86,30},{92,30},
          {92,-60},{-10,-60}}, color={0,0,255}));
  connect(resistor2.n, arduinoUno.GND) annotation (Line(points={{86,20},{92,20},
          {92,-60},{-10,-60}}, color={0,0,255}));
  connect(resistor3.n, arduinoUno.GND) annotation (Line(points={{86,10},{92,10},
          {92,-60},{-10,-60}}, color={0,0,255}));
  connect(resistor4.n, arduinoUno.GND) annotation (Line(points={{86,0},{92,0},{
          92,-60},{-10,-60}}, color={0,0,255}));
  connect(resistor10.n, arduinoUno.GND) annotation (Line(points={{86,-10},{92,
          -10},{92,-60},{-10,-60}}, color={0,0,255}));
  connect(resistor11.n, arduinoUno.GND) annotation (Line(points={{86,-20},{92,
          -20},{92,-60},{-10,-60}}, color={0,0,255}));
  connect(resistor12.n, arduinoUno.GND) annotation (Line(points={{86,-30},{92,
          -30},{92,-60},{-10,-60}}, color={0,0,255}));
  connect(resistor13.n, arduinoUno.GND) annotation (Line(points={{86,-40},{92,
          -40},{92,-60},{-10,-60}}, color={0,0,255}));
  connect(resistor14.n, arduinoUno.GND) annotation (Line(points={{86,-50},{92,
          -50},{92,-60},{-10,-60}}, color={0,0,255}));
  connect(sine.y,potentiometer. r) annotation (Line(points={{-72.6,12},{-72.6,
          12},{-79,12}}, color={0,0,127}));
  connect(potentiometer.contact, arduinoUno.A0) annotation (Line(points={{-80,-8},
          {-80,-12},{-50,-12},{-50,-12.5}},               color={0,0,255}));
  connect(potentiometer.pin_n, arduinoUno.GND)
    annotation (Line(points={{-90,-8},{-90,-60},{-10,-60}}, color={0,0,255}));
  connect(ground.p, arduinoUno.GND)
    annotation (Line(points={{-10,-80},{-10,-60}},           color={0,0,255}));
  connect(constantVoltage.n, arduinoUno.GND) annotation (Line(points={{-124,-12},
          {-124,-70},{-10,-70},{-10,-60}},           color={0,0,255}));
  connect(constantVoltage.p, arduinoUno.Vin) annotation (Line(points={{-124,8},
          {-124,72},{-10,72},{-10,40}}, color={0,0,255}));
  connect(potentiometer.pin_p, arduinoUno.Vin) annotation (Line(points={{-90,12},
          {-90,72},{-10,72},{-10,40}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{6,96},{94,82}},
          lineColor={28,108,200},
          textString="See https://www.arduino.cc/en/Tutorial/BarGraph 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,80}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end BarGraph;
