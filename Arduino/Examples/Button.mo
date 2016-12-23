within Arduino.Examples;
model Button
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno
    annotation (Placement(transformation(extent={{-72,-40},{8,60}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e4) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-56})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,20})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=25, period=1)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={74,20})));
equation
  connect(resistor.n, arduinoUno.GND) annotation (Line(points={{40,-66},{40,-66},
          {40,-74},{6,-74},{-32,-74},{-32,-40}}, color={0,0,255}));
  connect(resistor.p, arduinoUno.D2) annotation (Line(points={{40,-46},{40,
          -21.3636},{8.5,-21.3636}}, color={0,0,255}));
  connect(idealClosingSwitch.n, arduinoUno.D2) annotation (Line(points={{40,10},
          {40,-21.3636},{8.5,-21.3636}}, color={0,0,255}));
  connect(idealClosingSwitch.p, arduinoUno.V5) annotation (Line(points={{40,30},
          {40,80},{-24.75,80},{-24.75,60.2273}}, color={0,0,255}));
  connect(booleanPulse.y, idealClosingSwitch.control)
    annotation (Line(points={{63,20},{47,20}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10));
end Button;
