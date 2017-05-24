within Arduino.Examples;
model BlinkWithoutDelay
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="BlinkWithoutDelay.ino")
    annotation (Placement(transformation(extent={{-40,-60},{40,40}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{2,96},{96,78}},
          lineColor={28,108,200},
          textString="Use the sketch \"BlinkWithoutDelay.ino\" for this model.

See https://www.arduino.cc/en/Tutorial/BlinkWithoutDelay 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,74}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end BlinkWithoutDelay;
