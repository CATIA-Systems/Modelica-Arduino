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
      //Real digitalPortPulseWidts;

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
    Modelica.Electrical.Analog.Interfaces.Pin D13
      annotation (Placement(transformation(extent={{90,74},{110,94}}),
          iconTransformation(extent={{96,-12},{104,-4}})));
    Modelica.Electrical.Analog.Interfaces.Pin RST
      annotation (Placement(transformation(extent={{-110,62},{-90,82}}),
          iconTransformation(extent={{-108,64},{-100,72}})));
    Modelica.Electrical.Analog.Interfaces.Pin AREF
      annotation (Placement(transformation(extent={{-110,40},{-90,60}}),
          iconTransformation(extent={{-108,46},{-100,54}})));
    Modelica.Electrical.Analog.Interfaces.Pin A0 annotation (Placement(
          transformation(extent={{-110,-46},{-90,-26}}), iconTransformation(
            extent={{-104,-34},{-100,-30}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(
                                                       R=1e9)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-70,-36})));
    DigitalPort digitalPort annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={60,68})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=50)
      annotation (Placement(transformation(extent={{26,-14},{52,6}})));
    Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=5)
      annotation (Placement(transformation(extent={{24,20},{44,40}})));
  equation

    builtInLedOn =evaluate(
      externalArduino,
      time,
      {A0.v,A1.v,A2.v,A3.v,A4.v,A5.v});

    //digitalPortPulseWidts = time * 10;



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
    connect(resistor3.n, A1) annotation (Line(points={{-80,-60},{-90,-60},{-100,-60}},
                              color={0,0,255}));
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
    connect(RST, ground.p) annotation (Line(points={{-100,72},{-50,72},{-50,62},
            {0,62},{0,-142},{16,-142}}, color={0,0,255}));
    connect(AREF, ground.p) annotation (Line(points={{-100,50},{0,50},{0,-142},
            {16,-142}}, color={0,0,255}));
    connect(resistor2.n, A0) annotation (Line(points={{-80,-36},{-100,-36},{-100,-36}},
          color={0,0,255}));
    connect(resistor2.p, ground.p) annotation (Line(points={{-60,-36},{-26,-36},
            {-26,-60},{-26,-142},{16,-142}},      color={0,0,255}));
    connect(realExpression1.y, digitalPort.pulseWidth) annotation (Line(points={{53.3,-4},
            {53.3,-4},{72,-4},{72,62}},        color={0,0,127}));
    connect(digitalPort.pin, D13) annotation (Line(points={{70,74},{86,74},{86,
            84},{100,84}}, color={0,0,255}));
    connect(booleanStep.y, digitalPort.isInput) annotation (Line(points={{45,30},{
            66,30},{66,56},{65.2,56}}, color={255,0,255}));
    connect(AREF, AREF) annotation (Line(points={{-100,50},{-100,50},{0,50},{-100,
            50}}, color={0,0,255}));
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
            textString="Power"),
          Text(
            extent={{74,-4},{94,-14}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="D13"),
          Text(
            extent={{-96,72},{-76,62}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="RST"),
          Text(
            extent={{-94,54},{-74,44}},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={136,172,188},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0},
            textString="AREF")}),                                  Diagram(
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
            -38,-44},{-38,-54},{1.37,-54},{1.37,-25.64}}, color={0,0,255}));
    connect(arduinoUno.Vin, arduinoUno.GND) annotation (Line(points={{8.4,46.72},
            {8.4,54},{56,54},{56,-36},{1.37,-36},{1.37,-25.64}}, color={0,0,255}));
    connect(sineVoltage.p, arduinoUno.A0) annotation (Line(points={{-80,-24},{
            -80,-24},{-80,-1.52},{-36.74,-1.52}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=10));
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

  model DigitalPort
    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.BooleanInput isInput annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={-52,120})));
    Modelica.Electrical.Analog.Interfaces.Pin pin
      annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={28,-20})));
    Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
      annotation (Placement(transformation(extent={{28,-98},{48,-78}})));
    Modelica.Blocks.Interfaces.RealInput pulseWidth
      annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
    VariablePulseVoltage variablePulseVoltage(V=5, period=1/480)
      annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
    Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Goff=
         1e-9)
      annotation (Placement(transformation(extent={{-82,-70},{-62,-50}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e5) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={18,-52})));
  equation
    connect(potentialSensor.phi, y) annotation (Line(points={{49,-88},{50,-88},
            {50,0},{110,0}}, color={0,0,127}));
    connect(variablePulseVoltage.pulseWidth, pulseWidth) annotation (Line(
          points={{-32,-12},{-66,-12},{-66,60},{-120,60}}, color={0,0,127}));
    connect(ground1.p, variablePulseVoltage.n)
      annotation (Line(points={{18,-20},{6,-20},{-10,-20}}, color={0,0,255}));
    connect(idealOpeningSwitch.p, pin)
      annotation (Line(points={{-82,-60},{-100,-60}}, color={0,0,255}));
    connect(idealOpeningSwitch.n, variablePulseVoltage.p) annotation (Line(
          points={{-62,-60},{-46,-60},{-46,-20},{-30,-20}}, color={0,0,255}));
    connect(idealOpeningSwitch.control, isInput) annotation (Line(points={{-72,
            -53},{-62,-53},{-62,120},{-52,120}}, color={255,0,255}));
    connect(resistor1.n, ground1.p)
      annotation (Line(points={{18,-42},{18,-42},{18,-20}}, color={0,0,255}));
    connect(potentialSensor.p, pin) annotation (Line(points={{28,-88},{-34,-88},
            {-100,-88},{-100,-60}}, color={0,0,255}));
    connect(resistor1.p, potentialSensor.p) annotation (Line(points={{18,-62},{
            18,-62},{18,-76},{18,-88},{28,-88}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end DigitalPort;

  model AnalogPort

    Modelica.Electrical.Analog.Interfaces.Pin pin
      annotation (Placement(transformation(extent={{-108,-10},{-88,10}})));
  equation
  pin.i=0;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end AnalogPort;

  model VariablePulseVoltage "Pulse voltage source"
    parameter Modelica.SIunits.Voltage V(start=1) "Amplitude of pulse";
    Real width(
      final min=Modelica.Constants.small,
      final max=100,
      start=50) "Width of pulse in % of period";
    parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small,
        start=1) "Time for one period";
    extends Modelica.Electrical.Analog.Interfaces.VoltageSource(redeclare
        VariableWidthPulse            signalSource(
        amplitude=V,
        period=period,
        width=width));
    Modelica.Blocks.Interfaces.RealInput pulseWidth
      annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  equation
    connect(pulseWidth, signalSource.width) annotation (Line(points={{-120,80},
            {-26,80},{-26,86},{68.2,86}}, color={0,0,127}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={Line(points={{-70,-70},{-40,-70},{-40,70},{0,70},
                {0,-70},{40,-70},{40,70},{80,70}}, color={192,192,192})}),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Line(points={{-80,68},{-80,-80}},
            color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,
            192,192}),Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Polygon(
              points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Line(
              points={{-34,0},{-34,-70}},
              color={192,192,192}),Polygon(
              points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Text(
              extent={{-78,-24},{-35,-36}},
              lineColor={160,160,164},
              textString="offset"),Text(
              extent={{-40,-69},{6,-87}},
              lineColor={160,160,164},
              textString="startTime"),Text(
              extent={{70,-80},{94,-100}},
              lineColor={160,160,164},
              textString="time"),Line(
              points={{-20,0},{-20,-70}},
              color={192,192,192},
              pattern=LinePattern.Dash),Line(
              points={{-80,0},{-20,0},{-20,50},{21,50},{21,0},{41,0},{41,50},{
              79,50}},
              thickness=0.5),Line(
              points={{-20,89},{-20,50}},
              color={192,192,192},
              pattern=LinePattern.Dash),Line(
              points={{21,74},{21,50}},
              color={160,160,164},
              pattern=LinePattern.Dash),Line(
              points={{41,88},{41,50}},
              color={192,192,192},
              pattern=LinePattern.Dash),Line(points={{-20,83},{41,83}}, color={
            192,192,192}),Line(points={{-20,69},{21,69}}, color={192,192,192}),
            Text(
              extent={{-11,97},{35,85}},
              lineColor={160,160,164},
              textString="period"),Text(
              extent={{-18,81},{21,69}},
              lineColor={160,160,164},
              textString="width"),Line(
              points={{-53,50},{-20,50}},
              color={192,192,192},
              pattern=LinePattern.Dash),Line(
              points={{-34,50},{-34,0}},
              color={192,192,192}),Text(
              extent={{-78,34},{-37,20}},
              lineColor={160,160,164},
              textString="V"),Polygon(
              points={{-34,50},{-37,37},{-31,37},{-34,50}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Polygon(
              points={{-34,0},{-37,13},{-31,13},{-34,0},{-34,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Line(
              points={{79,50},{79,0},{90,0}},
              thickness=0.5),Polygon(
              points={{-20,69},{-11,71},{-11,67},{-20,69}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Polygon(
              points={{21,69},{13,71},{13,67},{21,69}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Polygon(
              points={{-20,83},{-11,85},{-11,81},{-20,83}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Polygon(
              points={{41,83},{33,85},{33,81},{41,83}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),Text(
              extent={{-78,103},{-24,89}},
              lineColor={160,160,164},
              textString="v = p.v - n.v")}),
      Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>", info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
  end VariablePulseVoltage;

  block VariableWidthPulse "Generate pulse signal of type Real"
    parameter Real amplitude=1 "Amplitude of pulse";

    parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small,
        start=1) "Time for one period";
    parameter Integer nperiod=-1
      "Number of periods (< 0 means infinite number of periods)";
    parameter Real offset=0 "Offset of output signals";
    parameter Modelica.SIunits.Time startTime=0
      "Output = offset for time < startTime";
    extends Modelica.Blocks.Interfaces.SO;

  protected
    Modelica.SIunits.Time T_start "Start time of current period";
    Integer count "Period count";
  public
    Modelica.Blocks.Interfaces.RealInput width
      annotation (Placement(transformation(extent={{-138,40},{-98,80}})));
  initial algorithm
    count := integer((time - startTime)/period);
    T_start := startTime + count*period;
  equation
      when integer((time - startTime)/period) > pre(count) then
      count = pre(count) + 1;
      T_start = time;
    end when;
    y = offset + (if (time < startTime or nperiod == 0 or (nperiod > 0 and
      count >= nperiod)) then 0 else if time < T_start + (period*width/100) then amplitude
       else 0);
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
          Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
          Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,-70},{-40,-70},{-40,44},{0,44},{0,-70},{40,-70},{40,
                44},{79,44}}),
          Text(
            extent={{-147,-152},{153,-112}},
            lineColor={0,0,0},
            textString="period=%period")}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Polygon(
            points={{-80,90},{-85,68},{-75,68},{-80,90}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
          Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
          Polygon(
            points={{90,-70},{68,-65},{68,-75},{90,-70}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(points={{-34,0},{-34,-70}},  color={95,95,95}),
          Polygon(
            points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-78,-24},{-35,-36}},
            lineColor={0,0,0},
            textString="offset"),
          Text(
            extent={{-30,-72},{16,-81}},
            lineColor={0,0,0},
            textString="startTime"),
          Text(
            extent={{-82,96},{-49,79}},
            lineColor={0,0,0},
            textString="y"),
          Text(
            extent={{66,-80},{87,-90}},
            lineColor={0,0,0},
            textString="time"),
          Line(points={{-10,0},{-10,-70}}, color={95,95,95}),
          Line(
            points={{-80,0},{-10,0},{-10,50},{30,50},{30,0},{50,0},{50,50},{90,
                50}},
            color={0,0,255},
            thickness=0.5),
          Line(points={{-10,88},{-10,50}}, color={95,95,95}),
          Line(points={{30,74},{30,50}}, color={95,95,95}),
          Line(points={{50,88},{50,50}}, color={95,95,95}),
          Line(points={{-10,83},{50,83}}, color={95,95,95}),
          Line(points={{-10,69},{30,69}}, color={95,95,95}),
          Text(
            extent={{-3,93},{39,84}},
            lineColor={0,0,0},
            textString="period"),
          Text(
            extent={{-7,78},{30,69}},
            lineColor={0,0,0},
            textString="width"),
          Line(points={{-43,50},{-10,50}}, color={95,95,95}),
          Line(points={{-34,50},{-34,0}}, color={95,95,95}),
          Text(
            extent={{-77,30},{-37,21}},
            lineColor={0,0,0},
            textString="amplitude"),
          Polygon(
            points={{-34,50},{-37,37},{-31,37},{-34,50}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-34,0},{-37,13},{-31,13},{-34,0},{-34,0}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(
            points={{90,50},{90,0},{100,0}},
            color={0,0,255},
            thickness=0.5),
          Polygon(
            points={{-10,69},{-1,71},{-1,67},{-10,69}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{30,69},{22,71},{22,67},{30,69}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-10,83},{-1,85},{-1,81},{-10,83}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{50,83},{42,85},{42,81},{50,83}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>
The Real output y is a pulse signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Pulse.png\"
     alt=\"Pulse.png\">
</p>
</html>"));
  end VariableWidthPulse;

  model DigitalPortTest
    DigitalPort digitalPort
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=60)
      annotation (Placement(transformation(extent={{-66,-4},{-46,16}})));
    Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=5)
      annotation (Placement(transformation(extent={{-46,54},{-26,74}})));
    DigitalPortbla digitalPortbla
      annotation (Placement(transformation(extent={{-16,-54},{4,-34}})));
  equation
    connect(realExpression.y, digitalPort.pulseWidth)
      annotation (Line(points={{-45,6},{-28,6},{-12,6}}, color={0,0,127}));
    connect(booleanStep.y, digitalPort.isInput) annotation (Line(points={{-25,
            64},{-6,64},{-6,12},{-5.2,12}}, color={255,0,255}));
    connect(digitalPortbla.isInput, digitalPort.isInput) annotation (Line(
          points={{-11.2,-32},{-6,24},{-6,12},{-5.2,12}}, color={255,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=10));
  end DigitalPortTest;

  model DigitalPortbla
    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.BooleanInput isInput annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={-52,120})));
    Modelica.Electrical.Analog.Interfaces.Pin pin
      annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={28,-20})));
    Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
      annotation (Placement(transformation(extent={{28,-98},{48,-78}})));
    Modelica.Electrical.Analog.Sources.PulseVoltage variablePulseVoltage(
      V=5,
      width=50,
      period=1/10)
      annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
    Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Goff=
         1e-9)
      annotation (Placement(transformation(extent={{-82,-70},{-62,-50}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e5) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={18,-52})));
  equation
    connect(potentialSensor.phi, y) annotation (Line(points={{49,-88},{50,-88},
            {50,0},{110,0}}, color={0,0,127}));
    connect(ground1.p, variablePulseVoltage.n)
      annotation (Line(points={{18,-20},{6,-20},{-10,-20}}, color={0,0,255}));
    connect(idealOpeningSwitch.p, pin)
      annotation (Line(points={{-82,-60},{-100,-60}}, color={0,0,255}));
    connect(idealOpeningSwitch.n, variablePulseVoltage.p) annotation (Line(
          points={{-62,-60},{-46,-60},{-46,-20},{-30,-20}}, color={0,0,255}));
    connect(idealOpeningSwitch.control, isInput) annotation (Line(points={{-72,
            -53},{-62,-53},{-62,120},{-52,120}}, color={255,0,255}));
    connect(resistor1.n, ground1.p)
      annotation (Line(points={{18,-42},{18,-42},{18,-20}}, color={0,0,255}));
    connect(potentialSensor.p, pin) annotation (Line(points={{28,-88},{-34,-88},
            {-100,-88},{-100,-60}}, color={0,0,255}));
    connect(resistor1.p, potentialSensor.p) annotation (Line(points={{18,-62},{
            18,-62},{18,-76},{18,-88},{28,-88}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end DigitalPortbla;
  annotation (uses(Modelica(version="3.2.2")));
end Arduino;
