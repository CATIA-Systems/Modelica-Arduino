within Arduino.Firmata.Examples;
model Blink
  extends Modelica.Icons.Example;

  Port port annotation (Placement(transformation(extent={{-24,0},{-4,20}})));
  DigitalOutput digitalOutput(digitalPin=13)
    annotation (Placement(transformation(extent={{-54,0},{-34,20}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=1, startTime=5)
    annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
equation
  connect(booleanPulse.y, digitalOutput.value)
    annotation (Line(points={{-69,10},{-56,10}},
                                               color={255,0,255}));
  connect(digitalOutput.pinConnector, port.boardConnector)
    annotation (Line(points={{-34,10},{-24,10}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Bitmap(
            extent={{2,-58},{92,40}}, fileName=
              "modelica://Arduino/Resources/Images/Blink_bb.png")}),
    experiment(StopTime=30));
end Blink;
