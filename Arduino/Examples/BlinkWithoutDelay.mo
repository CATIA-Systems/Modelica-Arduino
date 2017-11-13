within Arduino.Examples;
model BlinkWithoutDelay "An Arduino with a blinking LED w/o using delay()"
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="BlinkWithoutDelay.ino")
    annotation (Placement(transformation(extent={{-40,-60},{40,40}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
equation
  connect(constantVoltage.p, arduinoUno.Vin) annotation (Line(points={{-70,10},
          {-70,50},{0,50},{0,40}}, color={0,0,255}));
  connect(constantVoltage.n, ground.p) annotation (Line(points={{-70,-10},{-70,
          -70},{0,-70},{0,-80}}, color={0,0,255}));
  connect(arduinoUno.GND, ground.p)
    annotation (Line(points={{0,-60},{0,-80}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{4,98},{96,82}},
          lineColor={28,108,200},
          textString="See https://www.arduino.cc/en/Tutorial/BlinkWithoutDelay 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,80}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end BlinkWithoutDelay;
