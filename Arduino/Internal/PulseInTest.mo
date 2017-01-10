within Arduino.Internal;
model PulseInTest
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleRate=1e-6)
    annotation (Placement(transformation(extent={{-80,-40},{0,60}})));
  Modelica.Electrical.Analog.Sources.PulseVoltage pulseVoltage(
    V=5,
    period=100e-6,
    startTime=0.1,
    width=60) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-50})));
equation
  connect(pulseVoltage.p, arduinoUno.D2) annotation (Line(points={{50,-40},{50,
          -21.3636},{0.5,-21.3636}}, color={0,0,255}));
  connect(pulseVoltage.n, arduinoUno.GND) annotation (Line(points={{50,-60},{50,
          -74},{-40,-74},{-40,-40}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=0.21));
end PulseInTest;
