within Arduino.Examples;
model Fade "An Arduino dimming an LED"
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="Fade.ino")
    annotation (Placement(transformation(extent={{-40,-40},{40,60}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-10})));
  Components.LED LED annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-40})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.5,
    f=0.5,
    offset=0.5)
    annotation (Placement(transformation(extent={{-54,14},{-66,26}})));
  Modelica.Electrical.Analog.Basic.Potentiometer potentiometer(rConstant=0.01,
      useRinput=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-88,10})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
equation
  connect(resistor.p, arduinoUno.D9) annotation (Line(points={{60,0},{60,22.5},
          {40,22.5}},               color={0,0,255}));
  connect(LED.p, resistor.n)
    annotation (Line(points={{60,-30},{60,-20}}, color={0,0,255}));
  connect(LED.n, arduinoUno.GND) annotation (Line(points={{60,-50},{60,-70},{0,
          -70},{0,-40}}, color={0,0,255}));
  connect(arduinoUno.A0, potentiometer.contact) annotation (Line(points={{-40,7.5},
          {-58.875,7.5},{-58.875,0},{-78,0}},                         color={0,
          0,255}));
  connect(potentiometer.pin_n, arduinoUno.GND) annotation (Line(points={{-88,0},
          {-88,-70},{0,-70},{0,-40}}, color={0,0,255}));
  connect(constantVoltage.p, arduinoUno.Vin)
    annotation (Line(points={{90,20},{90,70},{0,70},{0,60}}, color={0,0,255}));
  connect(constantVoltage.n, arduinoUno.GND) annotation (Line(points={{90,0},{
          90,-70},{0,-70},{0,-40}}, color={0,0,255}));
  connect(ground.p, arduinoUno.GND)
    annotation (Line(points={{0,-80},{0,-40}}, color={0,0,255}));
  connect(potentiometer.pin_p, arduinoUno.Vin) annotation (Line(points={{-88,20},
          {-88,70},{0,70},{0,60}}, color={0,0,255}));
  connect(sine.y, potentiometer.r)
    annotation (Line(points={{-66.6,20},{-76,20}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,80}})),                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{6,98},{94,82}},
          lineColor={28,108,200},
          textString="See https://www.arduino.cc/en/Tutorial/Fade 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,80}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end Fade;
