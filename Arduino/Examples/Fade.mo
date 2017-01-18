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
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-10})));
  Components.LED2 lED2_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-50})));
equation
  connect(sineVoltage.n, arduinoUno.GND) annotation (Line(points={{-80,-50},{
          -80,-50},{-80,-80},{0,-80},{0,-60}},          color={0,0,255}));
  connect(sineVoltage.p, arduinoUno.A0) annotation (Line(points={{-80,-30},{-80,
          -30},{-80,-8.45455},{-39.75,-8.45455}},
                                                color={0,0,255}));
  connect(resistor.p, arduinoUno.D9) annotation (Line(points={{80,0},{80,
          19.3636},{40.5,19.3636}}, color={0,0,255}));
  connect(lED2_1.p, resistor.n)
    annotation (Line(points={{80,-40},{80,-40},{80,-20}}, color={0,0,255}));
  connect(lED2_1.n, arduinoUno.GND) annotation (Line(points={{80,-60},{80,-80},
          {0,-80},{0,-60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,80}})),                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    experiment(StopTime=10));
end Fade;
