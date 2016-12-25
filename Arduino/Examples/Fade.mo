within Arduino.Examples;
model Fade
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno
    annotation (Placement(transformation(extent={{-40,-60},{40,60}})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(
    V=2.5,
    offset=2.5,
    freqHz=0.5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-40})));
  Components.LED LED annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={81,-59})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-20})));
equation
  connect(sineVoltage.n, arduinoUno.GND) annotation (Line(points={{-80,-50},
          {-80,-50},{-80,-70},{-80,-74},{0,-74},{0,-60}},
                                                        color={0,0,255}));
  connect(sineVoltage.p, arduinoUno.A0) annotation (Line(points={{-80,-30},
          {-80,-30},{-80,-7.9091},{-39.75,-7.9091}},
                                                color={0,0,255}));
  connect(resistor.n, LED.pin_p) annotation (Line(points={{80,-30},{80,-30},{80,
          -52},{81,-52}}, color={0,0,255}));
  connect(resistor.p, arduinoUno.D9) annotation (Line(points={{80,-10},{80,
          19.3636},{40.5,19.3636}}, color={0,0,255}));
  connect(LED.pin_n, arduinoUno.GND) annotation (Line(points={{81,-66},{80,-66},
          {80,-74},{0,-74},{0,-60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10));
end Fade;
