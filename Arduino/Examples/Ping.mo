within Arduino.Examples;
model Ping
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleRate=1e-6)
    annotation (Placement(transformation(extent={{-80,-40},{0,60}})));
  Internal.CCC1.UltrasonicSensor ultrasonicSensor
    annotation (Placement(transformation(extent={{40,-20},{80,20}})));
equation
  connect(ultrasonicSensor.input5V, arduinoUno.V5) annotation (Line(points={{40,
          -4},{30,-4},{20,-4},{20,80},{-32.75,80},{-32.75,60.2273}}, color={0,0,
          255}));
  connect(ultrasonicSensor.pinSig, arduinoUno.D7) annotation (Line(points={{40,
          1.6},{36,1.6},{36,0},{28,0},{28,12.2727},{0.5,12.2727}}, color={0,0,
          255}));
  connect(ultrasonicSensor.ground, arduinoUno.GND) annotation (Line(points={{40,
          -12},{20,-12},{20,-60},{-40,-60},{-40,-40}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=0.21));
end Ping;
