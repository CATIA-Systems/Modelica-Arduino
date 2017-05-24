within Arduino.Examples;
model BarGraph
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="BarGraph.ino")
    annotation (Placement(transformation(extent={{-50,-60},{30,60}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220)
    annotation (Placement(transformation(extent={{70,40},{80,50}})));
  Components.LED lED3
    annotation (Placement(transformation(extent={{50,40},{60,50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=220)
    annotation (Placement(transformation(extent={{70,30},{80,40}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=220)
    annotation (Placement(transformation(extent={{70,20},{80,30}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=220)
    annotation (Placement(transformation(extent={{70,10},{80,20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R=220)
    annotation (Placement(transformation(extent={{70,0},{80,10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor5(R=220)
    annotation (Placement(transformation(extent={{70,-10},{80,0}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor6(R=220)
    annotation (Placement(transformation(extent={{70,-20},{80,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor7(R=220)
    annotation (Placement(transformation(extent={{70,-30},{80,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor8(R=220)
    annotation (Placement(transformation(extent={{70,-40},{80,-30}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor9(R=220)
    annotation (Placement(transformation(extent={{70,-50},{80,-40}})));
  Components.LED lED4
    annotation (Placement(transformation(extent={{50,30},{60,40}})));
  Components.LED lED1
    annotation (Placement(transformation(extent={{50,20},{60,30}})));
  Components.LED lED2
    annotation (Placement(transformation(extent={{50,10},{60,20}})));
  Components.LED lED5
    annotation (Placement(transformation(extent={{50,0},{60,10}})));
  Components.LED lED6
    annotation (Placement(transformation(extent={{50,-10},{60,0}})));
  Components.LED lED7
    annotation (Placement(transformation(extent={{50,-20},{60,-10}})));
  Components.LED lED8
    annotation (Placement(transformation(extent={{50,-30},{60,-20}})));
  Components.LED lED9
    annotation (Placement(transformation(extent={{50,-40},{60,-30}})));
  Components.LED lED10
    annotation (Placement(transformation(extent={{50,-50},{60,-40}})));
  Modelica.Electrical.Analog.Basic.Potentiometer potentiometer(rConstant=0.01,
      useRinput=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-90,2})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.5,
    freqHz=0.5,
    offset=0.5)
    annotation (Placement(transformation(extent={{-60,6},{-72,18}})));
equation
  connect(arduinoUno.D11, lED3.p) annotation (Line(points={{30.5,35.7273},{
          40.25,35.7273},{40.25,45},{50,45}}, color={0,0,255}));
  connect(resistor9.n, arduinoUno.GND) annotation (Line(points={{80,-45},{90,
          -45},{90,-44},{90,-74},{-10,-74},{-10,-60}},          color={0,0,255}));
  connect(resistor8.n, arduinoUno.GND) annotation (Line(points={{80,-35},{90,
          -35},{90,-36},{90,-74},{-10,-74},{-10,-60}},          color={0,0,255}));
  connect(resistor7.n, arduinoUno.GND) annotation (Line(points={{80,-25},{90,
          -25},{90,-26},{90,-74},{-10,-74},{-10,-60}},          color={0,0,255}));
  connect(resistor6.n, arduinoUno.GND) annotation (Line(points={{80,-15},{90,
          -15},{90,-16},{90,-74},{-10,-74},{-10,-60}},          color={0,0,255}));
  connect(resistor5.n, arduinoUno.GND) annotation (Line(points={{80,-5},{90,-5},
          {90,-6},{90,-74},{-10,-74},{-10,-60}},         color={0,0,255}));
  connect(resistor4.n, arduinoUno.GND) annotation (Line(points={{80,5},{90,5},{
          90,4},{90,-74},{-10,-74},{-10,-60}},        color={0,0,255}));
  connect(resistor3.n, arduinoUno.GND) annotation (Line(points={{80,15},{90,15},
          {90,14},{90,-74},{-10,-74},{-10,-60}},         color={0,0,255}));
  connect(resistor2.n, arduinoUno.GND) annotation (Line(points={{80,25},{90,25},
          {90,24},{90,-74},{-10,-74},{-10,-60}},         color={0,0,255}));
  connect(resistor1.n, arduinoUno.GND) annotation (Line(points={{80,35},{90,35},
          {90,34},{90,-74},{-10,-74},{-10,-60}},         color={0,0,255}));
  connect(resistor.n, arduinoUno.GND) annotation (Line(points={{80,45},{90,45},
          {90,44},{90,-74},{-10,-74},{-10,-60}},         color={0,0,255}));
  connect(lED3.n, resistor.p) annotation (Line(points={{60,45},{66,45},{70,45}},
                    color={0,0,255}));
  connect(lED4.n, resistor1.p) annotation (Line(points={{60,35},{66,35},{70,35}},
                    color={0,0,255}));
  connect(lED1.n, resistor2.p) annotation (Line(points={{60,25},{66,25},{70,25}},
                    color={0,0,255}));
  connect(lED1.p, arduinoUno.D9) annotation (Line(points={{50,25},{44,25},{44,
          19.3636},{30.5,19.3636}}, color={0,0,255}));
  connect(arduinoUno.D10, lED4.p) annotation (Line(points={{30.5,27.5455},{
          42.25,27.5455},{42.25,35},{50,35}}, color={0,0,255}));
  connect(lED2.n, resistor3.p) annotation (Line(points={{60,15},{66,15},{70,15}},
                    color={0,0,255}));
  connect(lED5.n, resistor4.p)
    annotation (Line(points={{60,5},{66,5},{70,5}},        color={0,0,255}));
  connect(lED6.n, resistor5.p) annotation (Line(points={{60,-5},{66,-5},{70,-5}},
                    color={0,0,255}));
  connect(lED7.n, resistor6.p) annotation (Line(points={{60,-15},{66,-15},{70,
          -15}},          color={0,0,255}));
  connect(lED8.n, resistor7.p) annotation (Line(points={{60,-25},{66,-25},{70,
          -25}},          color={0,0,255}));
  connect(lED9.n, resistor8.p) annotation (Line(points={{60,-35},{66,-35},{70,
          -35}},          color={0,0,255}));
  connect(lED10.n, resistor9.p) annotation (Line(points={{60,-45},{66,-45},{70,
          -45}},          color={0,0,255}));
  connect(arduinoUno.D8, lED2.p) annotation (Line(points={{30.5,11.1818},{46.25,
          11.1818},{46.25,15},{50,15}}, color={0,0,255}));
  connect(arduinoUno.D7, lED5.p) annotation (Line(points={{30.5,2.72727},{48.25,
          2.72727},{48.25,5},{50,5}}, color={0,0,255}));
  connect(arduinoUno.D6, lED6.p) annotation (Line(points={{30.5,-5.45455},{
          44.25,-5.45455},{44.25,-5},{50,-5}}, color={0,0,255}));
  connect(arduinoUno.D5, lED7.p) annotation (Line(points={{30.5,-13.6364},{
          44.25,-13.6364},{44.25,-15},{50,-15}}, color={0,0,255}));
  connect(arduinoUno.D4, lED8.p) annotation (Line(points={{30.5,-21.8182},{
          44.25,-21.8182},{44.25,-25},{50,-25}}, color={0,0,255}));
  connect(arduinoUno.D3, lED9.p) annotation (Line(points={{30.5,-30},{44,-30},{
          44,-35},{50,-35}}, color={0,0,255}));
  connect(arduinoUno.D2, lED10.p) annotation (Line(points={{30.5,-37.6364},{
          42.25,-37.6364},{42.25,-45},{50,-45}}, color={0,0,255}));
  connect(potentiometer.pin_p, arduinoUno.V5) annotation (Line(points={{-90,12},
          {-90,12},{-90,84},{-2.75,84},{-2.75,60.2727}}, color={0,0,255}));
  connect(potentiometer.pin_n, arduinoUno.GND) annotation (Line(points={{-90,-8},
          {-90,-74},{-10,-74},{-10,-60}}, color={0,0,255}));
  connect(sine.y, potentiometer.r) annotation (Line(points={{-72.6,12},{-72.6,
          12},{-79,12}}, color={0,0,127}));
  connect(potentiometer.contact, arduinoUno.A0) annotation (Line(points={{-80,
          -8},{-72,-8},{-72,-7.90909},{-49.75,-7.90909}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),                                  graphics={Text(
          extent={{6,96},{94,78}},
          lineColor={28,108,200},
          textString="Use the sketch \"BarGraph.ino\" for this model.

See https://www.arduino.cc/en/Tutorial/BarGraph 
for a description of the sketch and the circuit."), Rectangle(extent={{0,100},{
              100,74}}, lineColor={28,108,200})}),
    experiment(StopTime=10));
end BarGraph;
