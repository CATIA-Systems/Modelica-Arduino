within Arduino.Examples;
model BarGraph
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno
    annotation (Placement(transformation(extent={{-60,-60},{20,60}})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(
    V=2.5,
    offset=2.5,
    freqHz=0.5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-40})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=220)
    annotation (Placement(transformation(extent={{68,40},{78,50}})));
  Components.LED lED3
    annotation (Placement(transformation(extent={{48,40},{58,50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=220)
    annotation (Placement(transformation(extent={{68,30},{78,40}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=220)
    annotation (Placement(transformation(extent={{68,20},{78,30}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=220)
    annotation (Placement(transformation(extent={{68,10},{78,20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R=220)
    annotation (Placement(transformation(extent={{68,0},{78,10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor5(R=220)
    annotation (Placement(transformation(extent={{68,-10},{78,0}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor6(R=220)
    annotation (Placement(transformation(extent={{68,-20},{78,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor7(R=220)
    annotation (Placement(transformation(extent={{68,-30},{78,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor8(R=220)
    annotation (Placement(transformation(extent={{68,-40},{78,-30}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor9(R=220)
    annotation (Placement(transformation(extent={{68,-50},{78,-40}})));
  Components.LED lED4
    annotation (Placement(transformation(extent={{48,30},{58,40}})));
  Components.LED lED1
    annotation (Placement(transformation(extent={{48,20},{58,30}})));
  Components.LED lED2
    annotation (Placement(transformation(extent={{48,10},{58,20}})));
  Components.LED lED5
    annotation (Placement(transformation(extent={{48,0},{58,10}})));
  Components.LED lED6
    annotation (Placement(transformation(extent={{48,-10},{58,0}})));
  Components.LED lED7
    annotation (Placement(transformation(extent={{48,-20},{58,-10}})));
  Components.LED lED8
    annotation (Placement(transformation(extent={{48,-30},{58,-20}})));
  Components.LED lED9
    annotation (Placement(transformation(extent={{48,-40},{58,-30}})));
  Components.LED lED10
    annotation (Placement(transformation(extent={{48,-50},{58,-40}})));
equation
  connect(sineVoltage.n, arduinoUno.GND) annotation (Line(points={{-80,-50},{
          -80,-50},{-80,-70},{-80,-74},{-20,-74},{-20,-60}},
                                                        color={0,0,255}));
  connect(sineVoltage.p, arduinoUno.A0) annotation (Line(points={{-80,-30},{-80,
          -30},{-80,-7.90909},{-59.75,-7.90909}},
                                                color={0,0,255}));
  connect(arduinoUno.D11, lED3.p) annotation (Line(points={{20.5,35.7273},{
          30.25,35.7273},{30.25,45},{48,45}}, color={0,0,255}));
  connect(resistor9.n, arduinoUno.GND) annotation (Line(points={{78,-45},{84,
          -45},{84,-44},{92,-44},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(resistor8.n, arduinoUno.GND) annotation (Line(points={{78,-35},{86,
          -35},{86,-36},{92,-36},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(resistor7.n, arduinoUno.GND) annotation (Line(points={{78,-25},{86,
          -25},{86,-26},{92,-26},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(resistor6.n, arduinoUno.GND) annotation (Line(points={{78,-15},{86,
          -15},{86,-16},{92,-16},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(resistor5.n, arduinoUno.GND) annotation (Line(points={{78,-5},{86,-5},
          {86,-6},{92,-6},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(resistor4.n, arduinoUno.GND) annotation (Line(points={{78,5},{84,5},{
          84,4},{92,4},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(resistor3.n, arduinoUno.GND) annotation (Line(points={{78,15},{84,15},
          {84,14},{92,14},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(resistor2.n, arduinoUno.GND) annotation (Line(points={{78,25},{86,25},
          {86,24},{92,24},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(resistor1.n, arduinoUno.GND) annotation (Line(points={{78,35},{86,35},
          {86,34},{92,34},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(resistor.n, arduinoUno.GND) annotation (Line(points={{78,45},{86,45},
          {86,44},{92,44},{92,-74},{-20,-74},{-20,-60}}, color={0,0,255}));
  connect(lED3.n, resistor.p) annotation (Line(points={{58,45},{64,45},{64,45},
          {68,45}}, color={0,0,255}));
  connect(lED4.n, resistor1.p) annotation (Line(points={{58,35},{64,35},{64,35},
          {68,35}}, color={0,0,255}));
  connect(lED1.n, resistor2.p) annotation (Line(points={{58,25},{64,25},{64,25},
          {68,25}}, color={0,0,255}));
  connect(lED1.p, arduinoUno.D9) annotation (Line(points={{48,25},{34,25},{34,
          19.3636},{20.5,19.3636}}, color={0,0,255}));
  connect(arduinoUno.D10, lED4.p) annotation (Line(points={{20.5,27.5455},{
          32.25,27.5455},{32.25,35},{48,35}}, color={0,0,255}));
  connect(lED2.n, resistor3.p) annotation (Line(points={{58,15},{64,15},{64,15},
          {68,15}}, color={0,0,255}));
  connect(lED5.n, resistor4.p)
    annotation (Line(points={{58,5},{64,5},{64,5},{68,5}}, color={0,0,255}));
  connect(lED6.n, resistor5.p) annotation (Line(points={{58,-5},{64,-5},{64,-5},
          {68,-5}}, color={0,0,255}));
  connect(lED7.n, resistor6.p) annotation (Line(points={{58,-15},{64,-15},{64,
          -15},{68,-15}}, color={0,0,255}));
  connect(lED8.n, resistor7.p) annotation (Line(points={{58,-25},{64,-25},{64,
          -25},{68,-25}}, color={0,0,255}));
  connect(lED9.n, resistor8.p) annotation (Line(points={{58,-35},{64,-35},{64,
          -35},{68,-35}}, color={0,0,255}));
  connect(lED10.n, resistor9.p) annotation (Line(points={{58,-45},{64,-45},{64,
          -45},{68,-45}}, color={0,0,255}));
  connect(arduinoUno.D8, lED2.p) annotation (Line(points={{20.5,11.1818},{36.25,
          11.1818},{36.25,15},{48,15}}, color={0,0,255}));
  connect(arduinoUno.D7, lED5.p) annotation (Line(points={{20.5,2.72727},{38.25,
          2.72727},{38.25,5},{48,5}}, color={0,0,255}));
  connect(arduinoUno.D6, lED6.p) annotation (Line(points={{20.5,-5.45455},{
          34.25,-5.45455},{34.25,-5},{48,-5}}, color={0,0,255}));
  connect(arduinoUno.D5, lED7.p) annotation (Line(points={{20.5,-13.6364},{
          34.25,-13.6364},{34.25,-15},{48,-15}}, color={0,0,255}));
  connect(arduinoUno.D4, lED8.p) annotation (Line(points={{20.5,-21.8182},{
          34.25,-21.8182},{34.25,-25},{48,-25}}, color={0,0,255}));
  connect(arduinoUno.D3, lED9.p) annotation (Line(points={{20.5,-30},{34,-30},{
          34,-35},{48,-35}}, color={0,0,255}));
  connect(arduinoUno.D2, lED10.p) annotation (Line(points={{20.5,-37.6364},{
          32.25,-37.6364},{32.25,-45},{48,-45}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10));
end BarGraph;
