within Arduino.Components;
block ArduinoUno

  parameter String sketch;
  parameter Real sampleRate = 0.01;

  Modelica.Electrical.Analog.Interfaces.Pin GND
    annotation (Placement(transformation(extent={{-16,-216},{4,-196}}),
        iconTransformation(extent={{-4,-204},{4,-196}})));

  Arduino.Internal.ExternalArduino externalArduino=
      Arduino.Internal.ExternalArduino();

  Modelica.Electrical.Analog.Interfaces.Pin A1 annotation (Placement(
        transformation(extent={{-170,-30},{-150,-10}}),iconTransformation(
          extent={{-164,-34},{-156,-26}})));
  Modelica.Electrical.Analog.Interfaces.Pin A2 annotation (Placement(
        transformation(extent={{-176,-66},{-156,-46}}),iconTransformation(
          extent={{-164,-54},{-156,-46}})));
  Modelica.Electrical.Analog.Interfaces.Pin A3 annotation (Placement(
        transformation(extent={{-176,-86},{-156,-66}}),iconTransformation(
          extent={{-164,-74},{-156,-66}})));
  Modelica.Electrical.Analog.Interfaces.Pin A4 annotation (Placement(
        transformation(extent={{-176,-106},{-156,-86}}),
                                                       iconTransformation(
          extent={{-164,-94},{-156,-86}})));
  Modelica.Electrical.Analog.Interfaces.Pin A5 annotation (Placement(
        transformation(extent={{-170,-150},{-150,-130}}),
                                                       iconTransformation(
          extent={{-164,-114},{-156,-106}})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA1(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-80,-20})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA2(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-80,-50})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA4(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-80,-110})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA5(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-80,-140})));
  Modelica.Electrical.Analog.Interfaces.Pin D1 annotation (Placement(
        transformation(extent={{150,-160},{170,-140}}),
                                                   iconTransformation(extent={{156,106},
            {164,114}})));
  Modelica.Electrical.Analog.Interfaces.Pin RESET annotation (Placement(
        transformation(extent={{-170,130},{-150,150}}), iconTransformation(
          extent={{-164,106},{-156,114}})));
  Modelica.Electrical.Analog.Interfaces.Pin AREF
    annotation (Placement(transformation(extent={{-176,74},{-156,94}}),
        iconTransformation(extent={{-164,86},{-156,94}})));
  Modelica.Electrical.Analog.Interfaces.Pin A0 annotation (Placement(
        transformation(extent={{-170,0},{-150,20}}),   iconTransformation(
          extent={{-164,-14},{-156,-6}})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA0(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-80,10})));
  Modelica.Electrical.Analog.Interfaces.Pin D0 annotation (Placement(
        transformation(extent={{150,-190},{170,-170}}),
                                                   iconTransformation(extent={{156,126},
            {164,134}})));
  Modelica.Electrical.Analog.Interfaces.Pin D2 annotation (Placement(
        transformation(extent={{150,-130},{170,-110}}),
                                                   iconTransformation(extent={{156,86},
            {164,94}})));
  Modelica.Electrical.Analog.Interfaces.Pin D3 annotation (Placement(
        transformation(extent={{150,-100},{170,-80}}),
                                                   iconTransformation(extent={{156,66},
            {164,74}})));
  Modelica.Electrical.Analog.Interfaces.Pin D4 annotation (Placement(
        transformation(extent={{150,-70},{170,-50}}),
                                                   iconTransformation(extent={{156,46},
            {164,54}})));
  Modelica.Electrical.Analog.Interfaces.Pin D5 annotation (Placement(
        transformation(extent={{150,-40},{170,-20}}),
                                                   iconTransformation(extent={{156,26},
            {164,34}})));
  Modelica.Electrical.Analog.Interfaces.Pin D6 annotation (Placement(
        transformation(extent={{150,-10},{170,10}}),
                                                   iconTransformation(extent={{156,6},
            {164,14}})));
  Modelica.Electrical.Analog.Interfaces.Pin D7 annotation (Placement(
        transformation(extent={{150,20},{170,40}}),iconTransformation(extent={{156,-14},
            {164,-6}})));
  Modelica.Electrical.Analog.Interfaces.Pin D8 annotation (Placement(
        transformation(extent={{150,50},{170,70}}),iconTransformation(extent={{156,-34},
            {164,-26}})));
  Modelica.Electrical.Analog.Interfaces.Pin D9 annotation (Placement(
        transformation(extent={{150,80},{170,100}}),
                                                   iconTransformation(extent={{156,-54},
            {164,-46}})));
  Modelica.Electrical.Analog.Interfaces.Pin D10
                                               annotation (Placement(
        transformation(extent={{150,110},{170,130}}),
                                                   iconTransformation(extent={{156,-74},
            {164,-66}})));
  Modelica.Electrical.Analog.Interfaces.Pin D11
                                               annotation (Placement(
        transformation(extent={{150,140},{170,160}}),
                                                   iconTransformation(extent={{156,-94},
            {164,-86}})));
  Modelica.Electrical.Analog.Interfaces.Pin D12
                                               annotation (Placement(
        transformation(extent={{150,170},{170,190}}),
                                                   iconTransformation(extent={{156,
            -114},{164,-106}})));
  Modelica.Electrical.Analog.Interfaces.Pin D13
                                               annotation (Placement(
        transformation(extent={{150,220},{170,240}}),
                                                   iconTransformation(extent={{156,
            -134},{164,-126}})));

protected
    final constant Integer numAnalogInputs = 6;
    final constant Integer numDigitalPins = 20;
    Integer portMode[numDigitalPins];
    Integer pulsePeriod[numDigitalPins]; // = fill(2000, numDigitalPins) "Pulse period in microseconds";
    discrete Real pulseWidth[numDigitalPins];

   function evaluate
    input Arduino.Internal.ExternalArduino instance;
    input Modelica.SIunits.Time timeIn;
    input Real analogReference;
    input Real analog[numAnalogInputs];
    input Real digital[numDigitalPins];
    output Integer portMode[numDigitalPins];
    output Real pulseWidth[numDigitalPins];
    output Integer pulsePeriod[numDigitalPins];
    external "C" ModelicaArduino_update(instance, timeIn, analogReference, analog, digital, portMode, pulseWidth, pulsePeriod) annotation (
      Include="#include <ModelicaArduino.h>",
      IncludeDirectory="modelica://Arduino/Resources/Include",
      Library="ModelicaArduino");
   end evaluate;

public
  Modelica.Electrical.Analog.Basic.Resistor resistorAREF(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,110})));
  Modelica.Electrical.Analog.Basic.Resistor resistorRESET(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,140})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA3(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-80,-80})));
  Modelica.Electrical.Analog.Interfaces.Pin Vin "5V power supply" annotation (
      Placement(transformation(extent={{-10,190},{10,210}}),iconTransformation(
          extent={{-4,196},{4,204}})));

  Internal.PinDriver pinDriver[14];

equation

  // wire the digital pin drivers
  for i in 1:14 loop
    pinDriver[i].isInput = portMode[i] == 0;
    pinDriver[i].pulsePeriod = pulsePeriod[i];
    //pinDriver[i].pulseWidth = if pulseWidth[i] > 0 then pulsePeriod[i] else 0;
    pinDriver[i].pulseWidth = integer(pulseWidth[i]); //integer((pulseWidth[i] / 100) * pulsePeriod[i]);
    connect(pinDriver[i].v_in, Vin);
    connect(pinDriver[i].ground, GND);
  end for;

  when sample(0, sampleRate) then
  (portMode, pulseWidth, pulsePeriod) = evaluate(
    externalArduino,
    time,
    5.0,
    {A0.v,A1.v,A2.v,A3.v,A4.v,A5.v},
    {pre(D0.v),pre(D1.v),pre(D2.v),pre(D3.v),pre(D4.v),pre(D5.v),pre(D6.v),pre(D7.v),pre(D8.v),pre(D9.v),pre(D10.v),pre(D11.v),pre(D12.v),pre(D13.v),0,0,0,0,0,0});
  end when;

  connect(resistorA1.n, A1) annotation (Line(points={{-90,-20},{-160,-20}},
                 color={0,0,255}));
  connect(resistorA2.n, A2) annotation (Line(points={{-90,-50},{-128,-50},{-128,
          -56},{-166,-56}},
                 color={0,0,255}));
  connect(resistorA4.n, A4)
    annotation (Line(points={{-90,-110},{-128,-110},{-128,-96},{-166,-96}},
                                                       color={0,0,255}));
  connect(resistorA5.n, A5)
    annotation (Line(points={{-90,-140},{-160,-140}},  color={0,0,255}));
  connect(resistorA0.n, A0) annotation (Line(points={{-90,10},{-160,10}},
                      color={0,0,255}));
  connect(AREF, resistorAREF.p)
    annotation (Line(points={{-166,84},{-128,84},{-128,110},{-90,110}},
                                                     color={0,0,255}));
  connect(RESET, resistorRESET.p)
    annotation (Line(points={{-160,140},{-90,140}},  color={0,0,255}));
  connect(A3, resistorA3.n) annotation (Line(points={{-166,-76},{-128,-76},{
          -128,-80},{-90,-80}},
                 color={0,0,255}));

  // connect the digital pins
  connect(pinDriver[1].y, D0);
  connect(pinDriver[2].y, D1);
  connect(pinDriver[3].y, D2);
  connect(pinDriver[4].y, D3);
  connect(pinDriver[5].y, D4);
  connect(pinDriver[6].y, D5);
  connect(pinDriver[7].y, D6);
  connect(pinDriver[8].y, D7);
  connect(pinDriver[9].y, D8);
  connect(pinDriver[10].y, D9);
  connect(pinDriver[11].y, D10);
  connect(pinDriver[12].y, D11);
  connect(pinDriver[13].y, D12);
  connect(pinDriver[14].y, D13);

  connect(resistorA0.p, GND) annotation (Line(points={{-70,10},{-6,10},{-6,-206}},
                      color={0,0,255}));
  connect(resistorA1.p, GND) annotation (Line(points={{-70,-20},{-6,-20},{-6,
          -206}},     color={0,0,255}));
  connect(resistorA2.p, GND) annotation (Line(points={{-70,-50},{-6,-50},{-6,
          -206}},     color={0,0,255}));
  connect(resistorA3.p, GND) annotation (Line(points={{-70,-80},{-6,-80},{-6,
          -206}},                             color={0,0,255}));
  connect(resistorA4.p, GND) annotation (Line(points={{-70,-110},{-6,-110},{-6,
          -206}},                               color={0,0,255}));
  connect(resistorA5.p, GND) annotation (Line(points={{-70,-140},{-6,-140},{-6,
          -206}},                               color={0,0,255}));
  connect(resistorAREF.n, GND) annotation (Line(points={{-70,110},{-6,110},{-6,
          -206}},                                             color={0,0,255}));
  connect(resistorRESET.n, GND) annotation (Line(points={{-70,140},{-6,140},{-6,
          -206}},                                               color={0,0,255}));
  annotation (preInstantiate=Arduino.Internal.buildSketch(Modelica.Utilities.Files.loadResource(
        "modelica://Arduino/"), sketch), Icon(coordinateSystem(preserveAspectRatio=true, extent={{-160,
            -200},{160,200}}),
                         graphics={
                                  Rectangle(extent={{-130,168},{130,-170}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Rectangle(
          extent={{16,100},{26,82}},
          lineThickness=0.5,
          fillColor=DynamicSelect({100,100,0}, if D13.v > 2.5 then {255,
              255,0} else {100,100,0}),
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Text(
          extent={{-126,118},{-6,102}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="RESET"),
        Text(
          extent={{32,138},{126,122}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D0 / RX"),
        Text(
          extent={{32,118},{126,102}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D1 / TX"),
        Text(
          extent={{66,98},{126,82}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D2"),
        Text(
          extent={{32,78},{126,62}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D3 PWM"),
        Text(
          extent={{66,58},{126,42}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D4"),
        Text(
          extent={{66,38},{126,22}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D5 PWM"),
        Text(
          extent={{66,18},{126,2}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D6 PWM"),
        Text(
          extent={{6,-102},{126,-118}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D12/MISO"),
        Text(
          extent={{6,-82},{126,-98}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D11 PWM/MOSI"),
        Text(
          extent={{6,-62},{126,-78}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D10 PWM/SS"),
        Text(
          extent={{66,-22},{126,-38}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D8"),
        Text(
          extent={{66,-2},{126,-18}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D7"),
        Text(
          extent={{66,-42},{126,-58}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D9 PWM"),
        Text(
          extent={{6,-122},{126,-138}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString="D13/SCK"),
        Text(
          extent={{-23,8},{23,-8}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          origin={0,-143},
          rotation=90,
          textString="GND"),
        Text(
          extent={{-126,98},{-6,82}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="AREF"),
        Text(
          extent={{-126,-2},{-6,-18}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="A0"),
        Text(
          extent={{-126,-22},{-6,-38}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="A1"),
        Text(
          extent={{-126,-62},{-6,-78}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="A3"),
        Text(
          extent={{-126,-42},{-6,-58}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="A2"),
        Text(
          extent={{-126,-102},{-6,-118}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="A5/SCL"),
        Text(
          extent={{-126,-82},{-6,-98}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="A4/SDA"),
        Line(points={{130,130},{160,130}},
                                         color={0,0,255}),
        Line(points={{130,110},{160,110}},
                                         color={0,0,255}),
        Line(points={{130,90},{160,90}}, color={0,0,255}),
        Line(points={{130,70},{160,70}}, color={0,0,255}),
        Line(points={{130,10},{160,10}}, color={0,0,255}),
        Line(points={{130,-10},{160,-10}},
                                         color={0,0,255}),
        Line(points={{130,50},{160,50}}, color={0,0,255}),
        Line(points={{130,30},{160,30}}, color={0,0,255}),
        Line(points={{130,-110},{160,-110}},
                                         color={0,0,255}),
        Line(points={{130,-130},{160,-130}},
                                         color={0,0,255}),
        Line(points={{130,-90},{160,-90}},
                                         color={0,0,255}),
        Line(points={{130,-70},{160,-70}},
                                         color={0,0,255}),
        Line(points={{130,-50},{160,-50}},
                                         color={0,0,255}),
        Line(points={{130,-30},{160,-30}},
                                         color={0,0,255}),
        Line(points={{0,-200},{0,-170}}, color={0,0,255}),
        Line(points={{-160,110},{-130,110}},
                                         color={0,0,255}),
        Line(points={{-160,90},{-130,90}},
                                         color={0,0,255}),
        Line(points={{-160,-90},{-130,-90}},
                                         color={0,0,255}),
        Line(points={{-160,-70},{-130,-70}},
                                         color={0,0,255}),
        Line(points={{-160,-50},{-130,-50}},
                                         color={0,0,255}),
        Line(points={{-160,-30},{-130,-30}},
                                         color={0,0,255}),
        Line(points={{-160,-10},{-130,-10}},
                                         color={0,0,255}),
        Line(points={{-160,-110},{-130,-110}},
                                         color={0,0,255}),
        Text(
          extent={{-60,26},{60,0}},
          lineColor={28,108,200},
          textString="Arduino",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{-60,0},{60,-26}},
          lineColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="Uno"),
        Text(
          extent={{-9,8},{9,-8}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          origin={22,113},
          rotation=270,
          textString="L"),
        Text(
          extent={{-23,8},{23,-8}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          origin={0,141},
          rotation=90,
          textString="Vin"),
        Line(points={{0,168},{0,200}},   color={0,0,255})}),     Diagram(
        coordinateSystem(preserveAspectRatio=true, extent={{-160,-200},{160,200}})),
    experiment(StopTime=10));
end ArduinoUno;
