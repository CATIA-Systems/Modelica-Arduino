within Arduino.Internal;
model DelayedPulseTest
              extends Modelica.Icons.Example;

  DelayedPulse delayedPulse(pulseLength=30e-6)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(
    width=50,
    period=100e-6,
    startTime=10e-6)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  DelayedPulse delayedPulse1(pulseLength=5e-6)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
equation
  connect(booleanPulse.y, delayedPulse.u)
    annotation (Line(points={{-39,0},{-39,0},{-22,0}}, color={255,0,255}));
  connect(delayedPulse.y, not1.u)
    annotation (Line(points={{1,0},{18,0}}, color={255,0,255}));
  connect(not1.y, delayedPulse1.u)
    annotation (Line(points={{41,0},{41,0},{58,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,80}})),                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    experiment(StopTime=0.0005));
end DelayedPulseTest;
