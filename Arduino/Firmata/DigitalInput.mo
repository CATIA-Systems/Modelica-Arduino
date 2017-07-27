within Arduino.Firmata;
model DigitalInput

  parameter Integer digitalPin(min=0, max=13) "Digital pin";
  parameter Boolean initValue = false "Initial values";

  Internal.PinConnector pinConnector
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-116,-16},{-84,16}})));
  Modelica.Blocks.Interfaces.BooleanOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  y = Firmata.Internal.readDigitalPin(
    digitalPin,
    initValue,
    pinConnector,
    integer(time));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Polygon(
          points={{-100,0},{-20,80},{100,80},{100,-80},{-20,-80},{-100,0}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                          Line(points={{-48,-16},{6,-16},{6,28},{48,28},{48,-16},
              {76,-16}},      color={255,0,255}),
                                 Text(
          extent={{-20,-38},{90,-72}},
          lineColor={0,0,0},
          textString="D%digitalPin")}),   Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end DigitalInput;
