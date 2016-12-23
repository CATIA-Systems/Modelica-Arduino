within Arduino.Examples;
model AnalogReadSerial
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno
    annotation (Placement(transformation(extent={{-40,-60},{40,60}})));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(
    V=3,
    duration=3,
    offset=1,
    startTime=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-74,-50})));
equation
  connect(rampVoltage.p, arduinoUno.A0) annotation (Line(points={{-74,-40},{-74,
          -40},{-74,-8},{-39.75,-8},{-39.75,-7.90909}}, color={0,0,255}));
  connect(rampVoltage.n, arduinoUno.GND) annotation (Line(points={{-74,-60},{
          -74,-90},{0,-90},{0,-60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10));
end AnalogReadSerial;
