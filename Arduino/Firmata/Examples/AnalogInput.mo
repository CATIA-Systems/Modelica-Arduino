within Arduino.Firmata.Examples;
model AnalogInput "Read a connected potentiometer"
  import Arduino.Firmata;
  extends Modelica.Icons.Example;

  Firmata.Port port
    annotation (Placement(transformation(extent={{30,-40},{10,-20}})));
  Firmata.AnalogInput analogInput(analogInputPin=0)
    annotation (Placement(transformation(extent={{50,-40},{70,-20}})));
equation
  connect(port.boardConnector, analogInput.pinConnector)
    annotation (Line(points={{30,-30},{50,-30}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Bitmap(
            extent={{-100,-56},{8,86}}, fileName=
              "modelica://Arduino/Resources/Images/AnalogRead_bb.png")}),
    experiment(StopTime=30));
end AnalogInput;
