within Arduino.Examples;
model AnalogReadSerial
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="AnalogReadSerial.ino")
    annotation (Placement(transformation(extent={{-10,-72},{70,48}})));
  Modelica.Electrical.Analog.Basic.Potentiometer potentiometer(rConstant=0.01,
      useRinput=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,-10})));
  Modelica.Blocks.Sources.Ramp ramp(duration=1)
                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-40,0})));
equation
  connect(potentiometer.pin_p, arduinoUno.V5) annotation (Line(points={{-80,0},
          {-80,60},{37.25,60},{37.25,48.2727}}, color={0,0,255}));
  connect(potentiometer.pin_n, arduinoUno.GND) annotation (Line(points={{-80,
          -20},{-80,-88},{30,-88},{30,-72}}, color={0,0,255}));
  connect(ramp.y, potentiometer.r)
    annotation (Line(points={{-51,0},{-51,0},{-69,0}}, color={0,0,127}));
  connect(potentiometer.contact, arduinoUno.A0) annotation (Line(points={{-70,
          -20},{-40,-20},{-40,-19.9091},{-9.75,-19.9091}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{4,96},{96,78}},
          lineColor={28,108,200},
          textString="Use the sketch \"AnalogReadSerial.ino\" for this model.

See https://www.arduino.cc/en/Tutorial/AnalogReadSerial 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,74}}, lineColor={28,108,200})}),
    experiment);
end AnalogReadSerial;
