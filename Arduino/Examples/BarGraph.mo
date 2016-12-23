within Arduino.Examples;
model BarGraph
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno
    annotation (Placement(transformation(extent={{-40,-60},{40,60}})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(
    V=2.5,
    offset=2.5,
    freqHz=0.5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-40})));
  Components.LED lED
    annotation (Placement(transformation(extent={{70,-24},{80,-14}})));
  Components.LED lED1
    annotation (Placement(transformation(extent={{70,-30},{80,-20}})));
  Components.LED lED2
    annotation (Placement(transformation(extent={{70,-36},{80,-26}})));
  Components.LED lED5
    annotation (Placement(transformation(extent={{70,-18},{80,-8}})));
  Components.LED lED6
    annotation (Placement(transformation(extent={{70,-12},{80,-2}})));
  Components.LED lED7
    annotation (Placement(transformation(extent={{70,-6},{80,4}})));
  Components.LED lED8
    annotation (Placement(transformation(extent={{70,0},{80,10}})));
  Components.LED lED9
    annotation (Placement(transformation(extent={{70,6},{80,16}})));
  Components.LED lED10
    annotation (Placement(transformation(extent={{70,12},{80,22}})));
  Components.LED lED11
    annotation (Placement(transformation(extent={{70,18},{80,28}})));
equation
  connect(sineVoltage.n, arduinoUno.GND) annotation (Line(points={{-80,-50},
          {-80,-50},{-80,-70},{-80,-74},{0,-74},{0,-60}},
                                                        color={0,0,255}));
  connect(sineVoltage.p, arduinoUno.A0) annotation (Line(points={{-80,-30},
          {-80,-30},{-80,-7.9091},{-39.75,-7.9091}},
                                                color={0,0,255}));
  connect(arduinoUno.D5, lED5.pin_p) annotation (Line(points={{40.5,-13.6364},{
          55.2437,-13.6364},{55.2437,-13},{70,-13}},
                                                 color={0,0,255}));
  connect(arduinoUno.D6, lED6.pin_p) annotation (Line(points={{40.5,
          -5.45455},{55.2437,-5.45455},{55.2437,-7},{70,-7}},
                                                   color={0,0,255}));
  connect(arduinoUno.D7, lED7.pin_p) annotation (Line(points={{40.5,2.72727},
          {55.2437,2.72727},{55.2437,-1},{70,-1}}, color={0,0,255}));
  connect(arduinoUno.D8, lED8.pin_p) annotation (Line(points={{40.5,11.1818},{
          49.2437,11.1818},{49.2437,5},{70,5}},    color={0,0,255}));
  connect(arduinoUno.D9, lED9.pin_p) annotation (Line(points={{40.5,19.3636},{
          51.2437,19.3636},{51.2437,11},{70,11}},  color={0,0,255}));
  connect(arduinoUno.D10, lED10.pin_p) annotation (Line(points={{40.5,27.5455},
          {53.2437,27.5455},{53.2437,17},{70,17}}, color={0,0,255}));
  connect(arduinoUno.D11, lED11.pin_p) annotation (Line(points={{40.5,35.7273},
          {55.2437,35.7273},{55.2437,23},{70,23}}, color={0,0,255}));
  connect(lED11.pin_n, lED10.pin_n)
    annotation (Line(points={{80,23},{80,23},{80,17}},
                                               color={0,0,255}));
  connect(lED10.pin_n, lED9.pin_n)
    annotation (Line(points={{80,17},{80,11}}, color={0,0,255}));
  connect(lED9.pin_n, lED8.pin_n)
    annotation (Line(points={{80,11},{80,5}},          color={0,0,255}));
  connect(lED8.pin_n, lED7.pin_n)
    annotation (Line(points={{80,5},{80,-1}},  color={0,0,255}));
  connect(lED7.pin_n, lED6.pin_n)
    annotation (Line(points={{80,-1},{80,-7}}, color={0,0,255}));
  connect(lED6.pin_n, lED5.pin_n)
    annotation (Line(points={{80,-7},{80,-13}},
                                              color={0,0,255}));
  connect(lED5.pin_n, lED.pin_n)
    annotation (Line(points={{80,-13},{80,-19}},
                                             color={0,0,255}));
  connect(lED.pin_n, lED1.pin_n)
    annotation (Line(points={{80,-19},{80,-25}},
                                              color={0,0,255}));
  connect(lED1.pin_n, lED2.pin_n)
    annotation (Line(points={{80,-25},{80,-31}},color={0,0,255}));
  connect(lED2.pin_p, arduinoUno.D2) annotation (Line(points={{70,-31},{58,-31},
          {58,-37.6364},{40.5,-37.6364}},    color={0,0,255}));
  connect(lED1.pin_p, arduinoUno.D3) annotation (Line(points={{70,-25},{56,
          -25},{56,-30},{40.5,-30}},
                                 color={0,0,255}));
  connect(lED.pin_p, arduinoUno.D4) annotation (Line(points={{70,-19},{56,-19},
          {56,-21.8182},{40.5,-21.8182}},color={0,0,255}));
  connect(lED2.pin_n, arduinoUno.GND) annotation (Line(points={{80,-31},{80,-74},
          {0,-74},{0,-60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10));
end BarGraph;
