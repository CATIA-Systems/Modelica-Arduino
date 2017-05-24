within Arduino.Examples;
model Fade
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="Fade.ino")
    annotation (Placement(transformation(extent={{-40,-60},{40,60}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-10})));
  Components.LED lED2_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-50})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.5,
    freqHz=0.5,
    offset=0.5)
    annotation (Placement(transformation(extent={{-58,6},{-70,18}})));
  Modelica.Electrical.Analog.Basic.Potentiometer potentiometer(rConstant=0.01,
      useRinput=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-88,2})));
equation
  connect(resistor.p, arduinoUno.D9) annotation (Line(points={{80,0},{80,
          19.3636},{40.5,19.3636}}, color={0,0,255}));
  connect(lED2_1.p, resistor.n)
    annotation (Line(points={{80,-40},{80,-40},{80,-20}}, color={0,0,255}));
  connect(lED2_1.n, arduinoUno.GND) annotation (Line(points={{80,-60},{80,-80},
          {0,-80},{0,-60}}, color={0,0,255}));
  connect(sine.y, potentiometer.r)
    annotation (Line(points={{-70.6,12},{-74,12},{-77,12}}, color={0,0,127}));
  connect(arduinoUno.A0, potentiometer.contact) annotation (Line(points={{
          -39.75,-7.90909},{-58.875,-7.90909},{-58.875,-8},{-78,-8}}, color={0,
          0,255}));
  connect(potentiometer.pin_p, arduinoUno.V5) annotation (Line(points={{-88,12},
          {-88,12},{-88,70},{7.25,70},{7.25,60.2727}}, color={0,0,255}));
  connect(potentiometer.pin_n, arduinoUno.GND) annotation (Line(points={{-88,-8},
          {-88,-80},{0,-80},{0,-60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,80}})),                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{8,94},{92,80}},
          lineColor={28,108,200},
          textString="Use the sketch \"Fade.ino\" for this model.

See https://www.arduino.cc/en/Tutorial/Fade 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,74}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end Fade;
