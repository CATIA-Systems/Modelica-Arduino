within Arduino.Examples;
model Ping
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleRate=1e-6, sketch="Ping.ino")
    annotation (Placement(transformation(extent={{-80,-40},{-20,40}})));
  Modelica.Blocks.Sources.Ramp ramp(
    duration=0.2,
    height=0.02,
    offset=0.01) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={80,-10})));
  Components.UltrasonicRangeFinder ultrasonicRangeFinder
    annotation (Placement(transformation(extent={{12,-30},{52,10}})));
equation
  connect(ultrasonicRangeFinder.distance, ramp.y)
    annotation (Line(points={{56,-10},{56,-10},{69,-10}}, color={0,0,127}));
  connect(ultrasonicRangeFinder.ground, arduinoUno.GND) annotation (Line(points=
         {{12,-20},{0,-20},{0,-62},{-50,-62},{-50,-40}}, color={0,0,255}));
  connect(ultrasonicRangeFinder.input5V, arduinoUno.V5) annotation (Line(points={{12,-10},
          {0,-10},{0,50},{-44.5625,50},{-44.5625,40.1818}},          color={0,0,
          255}));
  connect(ultrasonicRangeFinder.pinSig, arduinoUno.D7) annotation (Line(points=
          {{12,0},{-2,0},{-10,0},{-10,1.81818},{-19.625,1.81818}}, color={0,0,
          255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{8,98},{92,84}},
          lineColor={28,108,200},
          textString="See https://www.arduino.cc/en/Tutorial/Ping 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,80}}, lineColor={28,108,200})}),
    experiment(StopTime=0.21));
end Ping;
