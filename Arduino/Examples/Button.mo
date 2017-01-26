within Arduino.Examples;
model Button
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno
    annotation (Placement(transformation(extent={{-72,-60},{8,40}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e4) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-76})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=25, period=1)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={74,0})));
equation
  connect(resistor.n, arduinoUno.GND) annotation (Line(points={{40,-86},{40,-86},
          {40,-94},{6,-94},{-32,-94},{-32,-60}}, color={0,0,255}));
  connect(resistor.p, arduinoUno.D2) annotation (Line(points={{40,-66},{40,
          -41.3636},{8.5,-41.3636}}, color={0,0,255}));
  connect(idealClosingSwitch.n, arduinoUno.D2) annotation (Line(points={{40,-10},
          {40,-41.3636},{8.5,-41.3636}}, color={0,0,255}));
  connect(idealClosingSwitch.p, arduinoUno.V5) annotation (Line(points={{40,10},
          {40,60},{-24.75,60},{-24.75,40.2273}}, color={0,0,255}));
  connect(booleanPulse.y, idealClosingSwitch.control)
    annotation (Line(points={{63,0},{47,0}},   color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{8,94},{92,80}},
          lineColor={28,108,200},
          textString="Use the sketch \"Button.ino\" for this model.

See https://www.arduino.cc/en/Tutorial/Button 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,74}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end Button;
