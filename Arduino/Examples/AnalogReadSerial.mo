within Arduino.Examples;
model AnalogReadSerial "An Arduino reading a potentiometer"
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="AnalogReadSerial.ino")
    annotation (Placement(transformation(extent={{-20,-60},{60,40}})));
  Modelica.Electrical.Analog.Basic.Potentiometer potentiometer(rConstant=0.01,
      useRinput=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,0})));
  Modelica.Blocks.Sources.Ramp ramp(duration=1)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-50,10})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{10,-100},{30,-80}})));
equation
  connect(ramp.y, potentiometer.r)
    annotation (Line(points={{-61,10},{-69,10}},       color={0,0,127}));
  connect(potentiometer.contact, arduinoUno.A0) annotation (Line(points={{-70,-10},
          {-20,-10},{-20,-12.5}},                          color={0,0,255}));
  connect(ground.p, arduinoUno.GND)
    annotation (Line(points={{20,-80},{20,-60}}, color={0,0,255}));
  connect(constantVoltage.p, potentiometer.pin_p) annotation (Line(points={{90,10},
          {90,60},{-80,60},{-80,10}},     color={0,0,255}));
  connect(arduinoUno.Vin, potentiometer.pin_p) annotation (Line(points={{20,40},
          {20,60},{-80,60},{-80,10}}, color={0,0,255}));
  connect(constantVoltage.n, arduinoUno.GND) annotation (Line(points={{90,-10},
          {90,-70},{20,-70},{20,-60}}, color={0,0,255}));
  connect(potentiometer.pin_n, arduinoUno.GND) annotation (Line(points={{-80,
          -10},{-80,-70},{20,-70},{20,-60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{6,96},{96,84}},
          lineColor={28,108,200},
          textString="See https://www.arduino.cc/en/Tutorial/AnalogReadSerial 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,80}}, lineColor={28,108,200})}),
    experiment);
end AnalogReadSerial;
