within Arduino.Internal.CCC1.Old;
model ArduinoForRangeFinderTest
              extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Sources.PulseVoltage pulseVoltage(
    V=5,
    width=5,
    period=100e-6,
    startTime=200e-6) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-60,-30})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(extent={{-40,-2},{-20,18}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=time < 210e-6)
    annotation (Placement(transformation(extent={{-62,30},{-42,50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-20})));
equation
  connect(pulseVoltage.p, idealClosingSwitch.p)
    annotation (Line(points={{-60,-20},{-60,8},{-40,8}}, color={0,0,255}));
  connect(booleanExpression.y, idealClosingSwitch.control)
    annotation (Line(points={{-41,40},{-30,40},{-30,15}}, color={255,0,255}));
  connect(pulseVoltage.n, ground.p)
    annotation (Line(points={{-60,-40},{-60,-60},{-30,-60}},
                                                           color={0,0,255}));
  connect(idealClosingSwitch.n, resistor.p) annotation (Line(points={{-20,8},{
          1.77636e-015,8},{1.77636e-015,-10}}, color={0,0,255}));
  connect(ground.p, resistor.n) annotation (Line(points={{-30,-60},{
          -1.77636e-015,-60},{-1.77636e-015,-30}},
                                     color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,80}})),                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-80,60},{-12,-80}},
          lineColor={28,108,200},
          fillColor={170,255,213},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-78,-66},{-42,-76}},
          lineColor={28,108,200},
          fillColor={170,255,213},
          fillPattern=FillPattern.Solid,
          textString="Arduino board")}),
    experiment(StopTime=0.0005));
end ArduinoForRangeFinderTest;
