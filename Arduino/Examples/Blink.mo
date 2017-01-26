within Arduino.Examples;
model Blink
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=0,
        origin={0,0})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{8,94},{92,80}},
          lineColor={28,108,200},
          textString="Use the sketch \"Blink.ino\" for this model.

See https://www.arduino.cc/en/Tutorial/Blink 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,74}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end Blink;
