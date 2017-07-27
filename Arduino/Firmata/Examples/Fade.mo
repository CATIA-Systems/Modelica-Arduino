within Arduino.Firmata.Examples;
model Fade
  extends Modelica.Icons.Example;

  Port port annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  PWMOutput pwmOutput(digitalPin=9)
    annotation (Placement(transformation(extent={{-52,-20},{-32,0}})));
  Modelica.Blocks.Sources.Trapezoid trapezoid(
    rising=1,
    width=0,
    falling=1,
    period=2)
    annotation (Placement(transformation(extent={{-90,-20},{-70,0}})));
equation
  connect(pwmOutput.pinConnector, port.boardConnector)
    annotation (Line(points={{-32,-10},{-20,-10}}, color={0,0,0}));
  connect(trapezoid.y, pwmOutput.u)
    annotation (Line(points={{-69,-10},{-54,-10}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Bitmap(
            extent={{2,-64},{96,76}}, fileName=
              "modelica://Arduino/Resources/Images/Fade_bb.png")}),
    experiment(StopTime=30));
end Fade;
