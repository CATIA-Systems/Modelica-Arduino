within ;
package Arduino
  block ArduinoUno

    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{6,-162},{26,-142}})));
    Modelica.Electrical.Analog.Interfaces.Pin GND
      annotation (Placement(transformation(extent={{-10,-190},{10,-170}}),
          iconTransformation(extent={{-2,-102},{4,-96}})));

     Arduino.ExternalArduino externalArduino = Arduino.ExternalArduino();

    Modelica.Electrical.Analog.Interfaces.Pin Vin annotation (Placement(
          transformation(extent={{10,90},{30,110}}), iconTransformation(extent=
              {{18,100},{22,104}})));

  //protected
      Real builtInLedOn;

      function evaluate
      input Arduino.ExternalArduino instance;
      input Modelica.SIunits.Time timeIn;
      input Real analogInput[:];
      output Real ledIsOn;
      external "C" ModelicaArduino_update(instance, timeIn, analogInput, ledIsOn) annotation (
        Include="#include <ModelicaArduino.h>",
        IncludeDirectory="modelica://Arduino/Resources/C-Sources",
        Library="ModelicaArduino");
      end evaluate;

    Modelica.Electrical.Analog.Interfaces.Pin D0
      annotation (Placement(transformation(extent={{90,-70},{110,-50}}),
          iconTransformation(extent={{96,-64},{104,-56}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(
                                                       R=1e9)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={60,-32})));
    Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={60,-58})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=builtInLedOn)
      annotation (Placement(transformation(extent={{18,-84},{38,-64}})));
    Modelica.Electrical.Analog.Interfaces.Pin A0 annotation (Placement(
          transformation(extent={{-110,-50},{-90,-30}}), iconTransformation(
            extent={{-104,-34},{-100,-30}})));
    Modelica.Electrical.Analog.Interfaces.Pin A1 annotation (Placement(
          transformation(extent={{-110,-70},{-90,-50}}), iconTransformation(
            extent={{-104,-44},{-100,-40}})));
    Modelica.Electrical.Analog.Interfaces.Pin A2 annotation (Placement(
          transformation(extent={{-110,-90},{-90,-70}}), iconTransformation(
            extent={{-104,-54},{-100,-50}})));
    Modelica.Electrical.Analog.Interfaces.Pin A3 annotation (Placement(
          transformation(extent={{-110,-110},{-90,-90}}),iconTransformation(
            extent={{-104,-64},{-100,-60}})));
    Modelica.Electrical.Analog.Interfaces.Pin A4 annotation (Placement(
          transformation(extent={{-110,-130},{-90,-110}}),
                                                         iconTransformation(
            extent={{-104,-74},{-100,-70}})));
    Modelica.Electrical.Analog.Interfaces.Pin A5 annotation (Placement(
          transformation(extent={{-110,-150},{-90,-130}}),
                                                         iconTransformation(
            extent={{-104,-85},{-100,-81}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(
                                                       R=1e9)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-70,-40})));
    Modelica.Electrical.Analog.Basic.Resistor resistor3(
                                                       R=1e9)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-70,-60})));
    Modelica.Electrical.Analog.Basic.Resistor resistor4(
                                                       R=1e9)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-70,-80})));
    Modelica.Electrical.Analog.Basic.Resistor resistor5(
                                                       R=1e9)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-70,-100})));
    Modelica.Electrical.Analog.Basic.Resistor resistor6(
                                                       R=1e9)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-70,-120})));
    Modelica.Electrical.Analog.Basic.Resistor resistor7(
                                                       R=1e9)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-70,-140})));
    Modelica.Electrical.Analog.Interfaces.Pin V5 annotation (Placement(
          transformation(extent={{-30,90},{-10,110}}), iconTransformation(
            extent={{-22,100},{-18,104}})));
  equation

    builtInLedOn = evaluate(externalArduino, time, {A0.v, A1.v, A2.v, A3.v, A4.v, A5.v});

    connect(GND, ground.p)
      annotation (Line(points={{0,-180},{0,-180},{0,-142},{16,-142}},
                                                            color={0,0,255}));
    connect(realExpression.y, signalVoltage.v)
      annotation (Line(points={{39,-74},{60,-74},{60,-65}}, color={0,0,127}));
    connect(signalVoltage.n, ground.p)
      annotation (Line(points={{50,-58},{16,-58},{16,-142}},
                                                          color={0,0,255}));
    connect(signalVoltage.p, D0)
      annotation (Line(points={{70,-58},{100,-58},{100,-60}}, color={0,0,255}));
    connect(resistor1.n, signalVoltage.n)
      annotation (Line(points={{50,-32},{50,-32},{50,-58}}, color={0,0,255}));
    connect(resistor1.p, signalVoltage.p)
      annotation (Line(points={{70,-32},{70,-45},{70,-58}}, color={0,0,255}));
    connect(resistor2.n, A0)
      annotation (Line(points={{-80,-40},{-100,-40}}, color={0,0,255}));
    connect(resistor2.p, ground.p) annotation (Line(points={{-60,-40},{-26,-40},
            {-26,-142},{16,-142}}, color={0,0,255}));
    connect(resistor3.n, A1) annotation (Line(points={{-80,-60},{-90,-60},{-90,
            -60},{-100,-60}}, color={0,0,255}));
    connect(resistor4.n, A2) annotation (Line(points={{-80,-80},{-90,-80},{-100,
            -80}}, color={0,0,255}));
    connect(resistor5.n, A3) annotation (Line(points={{-80,-100},{-100,-100},{
            -100,-100}}, color={0,0,255}));
    connect(resistor6.n, A4) annotation (Line(points={{-80,-120},{-90,-120},{
            -90,-120},{-100,-120}}, color={0,0,255}));
    connect(resistor7.n, A5) annotation (Line(points={{-80,-140},{-100,-140},{
            -100,-140}}, color={0,0,255}));
    connect(resistor3.p, ground.p) annotation (Line(points={{-60,-60},{-26,-60},
            {-26,-142},{16,-142}}, color={0,0,255}));
    connect(resistor4.p, ground.p) annotation (Line(points={{-60,-80},{-26,-80},
            {-26,-142},{16,-142}}, color={0,0,255}));
    connect(resistor5.p, ground.p) annotation (Line(points={{-60,-100},{-26,
            -100},{-26,-142},{16,-142}}, color={0,0,255}));
    connect(resistor6.p, ground.p) annotation (Line(points={{-60,-120},{-26,
            -120},{-26,-142},{16,-142}}, color={0,0,255}));
    connect(resistor7.p, ground.p) annotation (Line(points={{-60,-140},{-26,
            -140},{-26,-142},{16,-142}}, color={0,0,255}));
    connect(Vin, V5) annotation (Line(points={{20,100},{20,100},{20,72},{-4,72},
            {-20,72},{-20,100},{-20,100}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),                                  graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
            Rectangle(
            extent={{-20,38},{0,18}},
            lineThickness=0.5,
            fillColor=DynamicSelect({0,200,100}, if builtInLedOn > 0 then {0,0, 255} else {0,0,100}),
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{74,-54},{94,-64}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            textString="D0",
            lineColor={0,0,0}),
          Text(
            extent={{-94,-26},{-74,-36}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="A0"),
          Text(
            extent={{-23.5,5.5},{23.5,-5.5}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="Analog Input",
            origin={-61.5,-67.5},
            rotation=90),
          Text(
            extent={{-20,12},{0,2}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="LED"),
          Text(
            extent={{-10,-82},{10,-92}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="GND"),
          Text(
            extent={{-23.5,5.5},{23.5,-5.5}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            origin={48.5,-1.5},
            rotation=90,
            textString="Digital Input/Output"),
          Text(
            extent={{10,94},{30,84}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="Vin"),
          Text(
            extent={{-30,94},{-10,84}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="5V"),
          Text(
            extent={{-10,68},{10,58}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="Power")}),                                 Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}})));
  end ArduinoUno;

  model Example

    ArduinoUno arduinoUno
      annotation (Placement(transformation(extent={{-36,-26},{38,46}})));
    Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=5, freqHz=5)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-80,-34})));
  equation
    connect(sineVoltage.n, arduinoUno.GND) annotation (Line(points={{-80,-44},{
            -80,-44},{-80,-48},{1.37,-48},{1.37,-25.64}}, color={0,0,255}));
    connect(sineVoltage.p, arduinoUno.A0) annotation (Line(points={{-80,-24},{
            -80,-24},{-80,-18},{-62,-18},{-62,-1.52},{-36.74,-1.52}}, color={0,
            0,255}));
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
      Include="#include <ModelicaArduino.h>",
      IncludeDirectory="modelica://Arduino/Resources/C-Sources",
      Library="ModelicaArduino");
    end constructor;

    function destructor "Close Arduino"
      input ExternalArduino externalArduino;
    external"C" ModelicaArduino_close(externalArduino) annotation (
    Include="#include <ModelicaArduino.h>",
    IncludeDirectory="modelica://Arduino/Resources/C-Sources",
    Library="ModelicaArduino");
    end destructor;

  end ExternalArduino;
  annotation (uses(Modelica(version="3.2.2")));
end Arduino;
