within Arduino.Firmata.Examples;
model Sweep
  extends Modelica.Icons.Example;

  Port port annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Servo servo(digitalPin=9)
    annotation (Placement(transformation(extent={{-52,0},{-32,20}})));
  Modelica.Blocks.Sources.Sine sine(
    startTime=5,
    offset=0.5,
    amplitude=0.5,
    freqHz=0.5)
    annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
equation
  connect(servo.pinConnector, port.boardConnector)
    annotation (Line(points={{-32,10},{-20,10}}, color={0,0,0}));
  connect(sine.y, servo.u)
    annotation (Line(points={{-69,10},{-54,10}},
                                               color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Bitmap(
            extent={{8,-52},{98,86}}, fileName=
              "modelica://Arduino/Resources/Images/Servo_bb.png")}),
    experiment(StopTime=30));
end Sweep;
