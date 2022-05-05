within Arduino.Examples;
model ToneMelody "Play a Melody using the tone() function"
              extends Modelica.Icons.Example;

  Components.PiezoSpeaker piezoSpeaker(sampleInterval=1/sampleFrequency,
      filename="melody.wav")
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Components.ArduinoUno arduinoUno(sampleInterval=1/sampleFrequency,
                                                                  sketch="Melody.ino")
    annotation (Placement(transformation(extent={{-40,-50},{40,50}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
  parameter Modelica.Units.SI.Frequency sampleFrequency=44100 "Sample frequency";
equation
  connect(constantVoltage.p,arduinoUno. Vin) annotation (Line(points={{-60,10},{
          -60,60},{0,60},{0,50}},      color={0,0,255}));
  connect(ground.p,arduinoUno. GND)
    annotation (Line(points={{0,-80},{0,-50}},     color={0,0,255}));
  connect(constantVoltage.n,arduinoUno. GND) annotation (Line(points={{-60,-10},
          {-60,-60},{0,-60},{0,-50}},     color={0,0,255}));
  connect(piezoSpeaker.n, arduinoUno.GND) annotation (Line(points={{60,-4},{52,
          -4},{52,-60},{0,-60},{0,-50}}, color={0,0,255}));
  connect(piezoSpeaker.p, arduinoUno.D8) annotation (Line(points={{60,4},{52,4},
          {52,7.5},{40,7.5}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{8,98},{92,84}},
          lineColor={28,108,200},
          textString="See https://docs.arduino.cc/built-in-examples/digital/toneMelody 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,80}}, lineColor={28,108,200})}),
    experiment(StopTime=2.5));
end ToneMelody;
