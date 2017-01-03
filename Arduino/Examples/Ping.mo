within Arduino.Examples;
model Ping
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleRate=1e-6)
    annotation (Placement(transformation(extent={{-80,-40},{0,60}})));
  Components.UltrasonicRangeFinder ultrasonicRangeFinder
    annotation (Placement(transformation(extent={{40,-18},{80,22}})));
equation
  connect(ultrasonicRangeFinder.sigPin, arduinoUno.D7) annotation (Line(points=
          {{40,12},{0.5,12},{0.5,12.2727}}, color={0,0,255}));
  connect(ultrasonicRangeFinder.vPin, arduinoUno.V5) annotation (Line(points={{
          40,2},{30,2},{20,2},{20,72},{-32.75,72},{-32.75,60.2273}}, color={0,0,
          255}));
  connect(ultrasonicRangeFinder.gndPin, arduinoUno.GND) annotation (Line(points
        ={{40,-8},{20,-8},{20,-60},{-40,-60},{-40,-40}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment);
end Ping;
