within Arduino.Examples;
model Ping "An Arduino controlling an ultra-sonic range finder"
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleRate=1e-6, sketch="Ping.ino")
    annotation (Placement(transformation(extent={{-60,-50},{20,50}})));
  Modelica.Blocks.Sources.Ramp ramp(
    duration=0.2,
    height=0.02,
    offset=0.01) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={90,-6})));
  Components.SEN136B5B ultrasonicRangeFinder
    annotation (Placement(transformation(extent={{38,-22},{70,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-30,-100},{-10,-80}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,0})));
equation
  connect(ultrasonicRangeFinder.distance, ramp.y)
    annotation (Line(points={{73.2,-6},{83.4,-6}},        color={0,0,127}));
  connect(ultrasonicRangeFinder.ground, arduinoUno.GND) annotation (Line(points={{38,-14},
          {38,-60},{-20,-60},{-20,-50}},                 color={0,0,255}));
  connect(ultrasonicRangeFinder.pinSig, arduinoUno.D7) annotation (Line(points={{38,2},{
          20,2},{20,2.5}},                                         color={0,0,
          255}));
  connect(constantVoltage.p, arduinoUno.Vin) annotation (Line(points={{-80,10},
          {-80,60},{-20,60},{-20,50}}, color={0,0,255}));
  connect(ultrasonicRangeFinder.input5V, arduinoUno.Vin) annotation (Line(
        points={{38,-6},{30,-6},{30,60},{-20,60},{-20,50}},   color={0,0,255}));
  connect(ground.p, arduinoUno.GND)
    annotation (Line(points={{-20,-80},{-20,-50}}, color={0,0,255}));
  connect(constantVoltage.n, arduinoUno.GND) annotation (Line(points={{-80,-10},
          {-80,-60},{-20,-60},{-20,-50}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{8,98},{92,84}},
          lineColor={28,108,200},
          textString="See https://www.arduino.cc/en/Tutorial/Ping 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,80}}, lineColor={28,108,200})}),
    experiment(StopTime=0.21));
end Ping;
