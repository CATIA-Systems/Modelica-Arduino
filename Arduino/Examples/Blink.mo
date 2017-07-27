within Arduino.Examples;
model Blink
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="Blink.ino")
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=0,
        origin={0,-10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,0})));
equation
  connect(constantVoltage.p, arduinoUno.Vin) annotation (Line(points={{-70,10},
          {-70,50},{0,50},{0,40}}, color={0,0,255}));
  connect(arduinoUno.GND, ground.p)
    annotation (Line(points={{0,-60},{0,-80}}, color={0,0,255}));
  connect(constantVoltage.n, ground.p) annotation (Line(points={{-70,-10},{-70,
          -70},{0,-70},{0,-80}},         color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{6,96},{94,82}},
          lineColor={28,108,200},
          textString="See https://www.arduino.cc/en/Tutorial/Blink 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,80}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end Blink;
