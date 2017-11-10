within Arduino.Examples;
model Button "An Arduino connected to a button"
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="Button.ino")
    annotation (Placement(transformation(extent={{-60,-60},{20,40}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e4) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-50})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-10})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=25, period=1)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,-10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-30,-100},{-10,-80}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,0})));
equation
  connect(resistor.n, arduinoUno.GND) annotation (Line(points={{40,-60},{40,-70},
          {-20,-70},{-20,-60}},                  color={0,0,255}));
  connect(resistor.p, arduinoUno.D2) annotation (Line(points={{40,-40},{40,
          -32.5},{20,-32.5}},        color={0,0,255}));
  connect(idealClosingSwitch.n, arduinoUno.D2) annotation (Line(points={{40,-20},
          {40,-32.5},{20,-32.5}},        color={0,0,255}));
  connect(booleanPulse.y, idealClosingSwitch.control)
    annotation (Line(points={{59,-10},{47,-10}},
                                               color={255,0,255}));
  connect(ground.p, arduinoUno.GND)
    annotation (Line(points={{-20,-80},{-20,-60}}, color={0,0,255}));
  connect(constantVoltage.n, arduinoUno.GND) annotation (Line(points={{-80,-10},
          {-80,-70},{-20,-70},{-20,-60}}, color={0,0,255}));
  connect(arduinoUno.Vin, idealClosingSwitch.p) annotation (Line(points={{-20,40},
          {-20,60},{40,60},{40,0}},             color={0,0,255}));
  connect(constantVoltage.p, idealClosingSwitch.p) annotation (Line(points={{-80,10},
          {-80,60},{40,60},{40,0}},          color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{6,98},{94,82}},
          lineColor={28,108,200},
          textString="See https://www.arduino.cc/en/Tutorial/Button 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,80}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end Button;
