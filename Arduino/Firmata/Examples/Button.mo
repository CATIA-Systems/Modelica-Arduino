within Arduino.Firmata.Examples;
model Button
  extends Modelica.Icons.Example;

  Port port annotation (Placement(transformation(extent={{30,-40},{10,-20}})));
  DigitalInput digitalInput(digitalPin=2)
    annotation (Placement(transformation(extent={{50,-40},{70,-20}})));
equation
  connect(port.boardConnector, digitalInput.pinConnector)
    annotation (Line(points={{30,-30},{50,-30}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Bitmap(
            extent={{-100,-56},{10,80}}, fileName=
              "modelica://Arduino/Resources/Images/Button_bb.png")}),
    experiment(StopTime=30));
end Button;
