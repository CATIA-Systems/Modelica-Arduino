within ;
package Arduino
  block ArduinoUno

    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
    Modelica.Electrical.Analog.Interfaces.Pin GND
      annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
    Modelica.Electrical.Analog.Interfaces.Pin Pin0
      annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
    Modelica.Electrical.Analog.Sources.PulseVoltage pulseVoltage(
      V=5,
      width=50,
      period=0.5) annotation (Placement(transformation(extent={{-8,10},{12,30}})));

     Arduino.ExternalArduino externalArduino = Arduino.ExternalArduino();

    Modelica.Electrical.Analog.Interfaces.Pin Pin1
      annotation (Placement(transformation(extent={{-110,70},{-90,90}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e9)
      annotation (Placement(transformation(extent={{-10,42},{10,62}})));
    Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage
      annotation (Placement(transformation(extent={{-10,70},{10,90}})));

  //protected
      Real builtInLedOn;

      function evaluate
      input Arduino.ExternalArduino instance;
      input Modelica.SIunits.Time timeIn;
      output Real ledIsOn;
      external "C" ModelicaArduino_update(instance, timeIn, ledIsOn) annotation (
        Include="#include <ModelicaArduino.c>",
        IncludeDirectory="modelica://Arduino/Resources/C-Sources");
      end evaluate;

  equation

    builtInLedOn = evaluate(externalArduino, time);

    connect(GND, ground.p)
      annotation (Line(points={{-100,-40},{0,-40},{0,-80}}, color={0,0,255}));
    connect(pulseVoltage.p, Pin0)
      annotation (Line(points={{-8,20},{-32,20},{-54,20},{-100,20}},
                                                   color={0,0,255}));
    connect(pulseVoltage.n, ground.p) annotation (Line(points={{12,20},{38,20},{38,
            -80},{0,-80}},                   color={0,0,255}));
    connect(constantVoltage.p, Pin1)
      annotation (Line(points={{-10,80},{-100,80},{-100,80}}, color={0,0,255}));
    connect(resistor.p, constantVoltage.p)
      annotation (Line(points={{-10,52},{-10,52},{-10,80}}, color={0,0,255}));
    connect(resistor.n, constantVoltage.n)
      annotation (Line(points={{10,52},{10,52},{10,80}}, color={0,0,255}));
    connect(constantVoltage.n, ground.p) annotation (Line(points={{10,80},{38,80},
            {38,-80},{0,-80}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None),
            Rectangle(
            extent={{-20,60},{0,40}},
            lineThickness=0.5,
            fillColor=DynamicSelect({0,200,100}, if builtInLedOn > 0 then {0,0, 255} else {0,0,100}),
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0})}),                                  Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end ArduinoUno;

  model Example

    ArduinoUno arduino
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    LED lED annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-60,0})));
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=5000)
      annotation (Placement(transformation(extent={{-54,0},{-34,20}})));
  equation
    connect(arduino.Pin0, arduino.Pin0)
      annotation (Line(points={{-10,2},{-10,2}}, color={0,0,255}));
    connect(arduino.Pin0, resistor.n) annotation (Line(points={{-10,2},{-22,2},
            {-22,10},{-34,10}},
                           color={0,0,255}));
    connect(lED.pin_p, resistor.p)
      annotation (Line(points={{-60,10},{-57,10},{-54,10}}, color={0,0,255}));
    connect(lED.pin_n, arduino.GND) annotation (Line(points={{-60,-10},{-34,-10},{
            -34,-4},{-10,-4}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Example;

  model LED

    Modelica.Electrical.Analog.Semiconductors.Diode diode
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
      annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  equation
    connect(diode.p, pin_p)
      annotation (Line(points={{-10,0},{-100,0}},          color={0,0,255}));
    connect(diode.n, pin_n)
      annotation (Line(points={{10,0},{100,0},{100,0}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Line(
            points={{-100,0},{100,0}},
            color={0,0,255},
            thickness=0.5), Ellipse(
            extent={{-40,40},{40,-40}},
            fillColor=DynamicSelect({100,0,0}, if diode.i > 0 then {255,0,0} else {100,0,0}),
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None)}), Diagram(coordinateSystem(
            preserveAspectRatio=false)));
  end LED;

  class ExternalArduino "External object of Arduino"
    extends ExternalObject;

    function constructor "Open Arduino"
        output ExternalArduino externalArduino;
    external"C" externalArduino =
          ModelicaArduino_open() annotation (
      Include="#include <ModelicaArduino.c>",
      IncludeDirectory="modelica://Arduino/Resources/C-Sources");

    end constructor;

    function destructor "Close Arduino"
      input ExternalArduino externalArduino;
    external"C" ModelicaArduino_close(externalArduino) annotation (
    Include="#include <ModelicaArduino.c>",
    IncludeDirectory="modelica://Arduino/Resources/C-Sources");
    end destructor;

  end ExternalArduino;
  annotation (uses(Modelica(version="3.2.2")));
end Arduino;
