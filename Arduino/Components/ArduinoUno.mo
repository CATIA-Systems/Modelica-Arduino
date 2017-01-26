within Arduino.Components;
block ArduinoUno

  parameter Real sampleRate = 0.01;

  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{10,-160},{30,-140}})));
  Modelica.Electrical.Analog.Interfaces.Pin GND
    annotation (Placement(transformation(extent={{-10,-190},{10,-170}}),
        iconTransformation(extent={{-10,-190},{10,-170}})));

  Arduino.Internal.ExternalArduino externalArduino=
      Arduino.Internal.ExternalArduino();

  Modelica.Electrical.Analog.Interfaces.Pin A1 annotation (Placement(
        transformation(extent={{-170,-30},{-150,-10}}),iconTransformation(
          extent={{-168,-28},{-150,-10}})));
  Modelica.Electrical.Analog.Interfaces.Pin A2 annotation (Placement(
        transformation(extent={{-170,-60},{-150,-40}}),iconTransformation(
          extent={{-168,-56},{-150,-38}})));
  Modelica.Electrical.Analog.Interfaces.Pin A3 annotation (Placement(
        transformation(extent={{-170,-90},{-150,-70}}),iconTransformation(
          extent={{-168,-88},{-150,-70}})));
  Modelica.Electrical.Analog.Interfaces.Pin A4 annotation (Placement(
        transformation(extent={{-170,-120},{-150,-100}}),
                                                       iconTransformation(
          extent={{-168,-118},{-150,-100}})));
  Modelica.Electrical.Analog.Interfaces.Pin A5 annotation (Placement(
        transformation(extent={{-170,-150},{-150,-130}}),
                                                       iconTransformation(
          extent={{-168,-149},{-148,-130}})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA1(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-20})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA2(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-50})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA4(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-110})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA5(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-140})));
  Modelica.Electrical.Analog.Interfaces.Pin V5 annotation (Placement(
        transformation(extent={{18,250},{38,270}}),  iconTransformation(
          extent={{20,252},{38,270}})));
  Modelica.Electrical.Analog.Interfaces.Pin D1 annotation (Placement(
        transformation(extent={{150,-140},{170,-120}}),
                                                   iconTransformation(extent={{153,
            -139},{171,-121}})));
  Modelica.Electrical.Analog.Interfaces.Pin RESET annotation (Placement(
        transformation(extent={{-170,198},{-150,218}}), iconTransformation(
          extent={{-168,200},{-150,218}})));
  Modelica.Electrical.Analog.Interfaces.Pin AREF
    annotation (Placement(transformation(extent={{-170,158},{-150,178}}),
        iconTransformation(extent={{-168,160},{-150,178}})));
  Modelica.Electrical.Analog.Interfaces.Pin A0 annotation (Placement(
        transformation(extent={{-170,0},{-150,20}}),   iconTransformation(
          extent={{-168,2},{-150,20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA0(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,10})));
  Modelica.Electrical.Analog.Interfaces.Pin D0 annotation (Placement(
        transformation(extent={{150,-170},{170,-150}}),
                                                   iconTransformation(extent={{153,
            -167},{171,-149}})));
  Modelica.Electrical.Analog.Interfaces.Pin D2 annotation (Placement(
        transformation(extent={{150,-110},{170,-90}}),
                                                   iconTransformation(extent={{153,
            -107},{171,-89}})));
  Modelica.Electrical.Analog.Interfaces.Pin D3 annotation (Placement(
        transformation(extent={{150,-80},{170,-60}}),
                                                   iconTransformation(extent={{153,-79},
            {171,-61}})));
  Modelica.Electrical.Analog.Interfaces.Pin D4 annotation (Placement(
        transformation(extent={{150,-50},{170,-30}}),
                                                   iconTransformation(extent={{153,-49},
            {171,-31}})));
  Modelica.Electrical.Analog.Interfaces.Pin D5 annotation (Placement(
        transformation(extent={{150,-20},{170,0}}),iconTransformation(extent={{153,-19},
            {171,-1}})));
  Modelica.Electrical.Analog.Interfaces.Pin D6 annotation (Placement(
        transformation(extent={{150,10},{170,30}}),iconTransformation(extent={{153,11},
            {171,29}})));
  Modelica.Electrical.Analog.Interfaces.Pin D7 annotation (Placement(
        transformation(extent={{150,40},{170,60}}),iconTransformation(extent={{153,41},
            {171,59}})));
  Modelica.Electrical.Analog.Interfaces.Pin D8 annotation (Placement(
        transformation(extent={{150,70},{170,90}}),iconTransformation(extent={{153,72},
            {171,90}})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=pulseWidth[10])
    annotation (Placement(transformation(extent={{60,100},{102,112}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression9(y=portMode[10] ==
        0)
    annotation (Placement(transformation(extent={{60,108},{102,120}})));
  Modelica.Electrical.Analog.Interfaces.Pin D9 annotation (Placement(
        transformation(extent={{150,100},{170,120}}),
                                                   iconTransformation(extent={{153,102},
            {171,120}})));
  Modelica.Blocks.Sources.RealExpression realExpression10(y=pulseWidth[11])
    annotation (Placement(transformation(extent={{60,130},{102,142}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression10(y=portMode[11]
         == 0)
    annotation (Placement(transformation(extent={{60,138},{102,150}})));
  Modelica.Electrical.Analog.Interfaces.Pin D10
                                               annotation (Placement(
        transformation(extent={{150,130},{170,150}}),
                                                   iconTransformation(extent={{153,132},
            {171,150}})));
  Modelica.Blocks.Sources.RealExpression realExpression11(y=pulseWidth[12])
    annotation (Placement(transformation(extent={{60,160},{100,172}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression11(y=portMode[12]
         == 0)
    annotation (Placement(transformation(extent={{60,168},{100,180}})));
  Modelica.Electrical.Analog.Interfaces.Pin D11
                                               annotation (Placement(
        transformation(extent={{150,160},{170,180}}),
                                                   iconTransformation(extent={{153,162},
            {171,180}})));
  Modelica.Electrical.Analog.Interfaces.Pin D12
                                               annotation (Placement(
        transformation(extent={{150,190},{170,210}}),
                                                   iconTransformation(extent={{153,192},
            {171,210}})));
  Modelica.Electrical.Analog.Interfaces.Pin D13
                                               annotation (Placement(
        transformation(extent={{150,220},{170,240}}),
                                                   iconTransformation(extent={{153,222},
            {171,240}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,72})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,70})));

protected
    final constant Integer numAnalogInputs = 6;
    final constant Integer numDigitalPins = 20;
    Integer portMode[numDigitalPins];
    discrete Real pulseWidth[numDigitalPins];

   function evaluate
    input Arduino.Internal.ExternalArduino instance;
    input Modelica.SIunits.Time timeIn;
    input Real analogReference;
    input Real analog[numAnalogInputs];
    input Real digital[numDigitalPins];
    output Integer portMode[numDigitalPins];
    output Real pulseWidth[numDigitalPins];
    external "C" ModelicaArduino_update(instance, timeIn, analogReference, analog, digital, portMode, pulseWidth) annotation (
      Include="#include <ModelicaArduino.h>",
      IncludeDirectory="modelica://Arduino/Resources/Include",
      Library="ModelicaArduino");
   end evaluate;

public
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V=3.3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-16,194})));
  Modelica.Electrical.Analog.Basic.Resistor resistor8(
                                                     R=1e9)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-44,192})));
  Modelica.Electrical.Analog.Interfaces.Pin V33 annotation (Placement(
        transformation(extent={{-40,250},{-20,270}}), iconTransformation(extent=
           {{-38,252},{-20,270}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y=portMode[3] ==
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,-96})));
  Modelica.Electrical.Analog.Basic.Resistor resistorAREF(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,168})));
  Modelica.Electrical.Analog.Basic.Resistor resistorRESET(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,208})));
  Internal.PulseWidthModulationPinDriver digitalPort9
    annotation (Placement(transformation(extent={{120,100},{140,120}})));
  Internal.PulseWidthModulationPinDriver digitalPort10
    annotation (Placement(transformation(extent={{120,130},{140,150}})));
  Internal.PulseWidthModulationPinDriver digitalPort1
    annotation (Placement(transformation(extent={{120,160},{140,180}})));
  Modelica.Electrical.Analog.Basic.Resistor resistorA3(R=1e5) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-80})));
  Internal.DigitalPinDriver digitalPinDriver
    annotation (Placement(transformation(extent={{120,-110},{140,-90}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression14(y=pulseWidth[3] >
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,-104})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression15(y=portMode[5] ==
        0)
    annotation (Placement(transformation(extent={{-20,-6},{20,6}},
        rotation=0,
        origin={80,-36})));
  Internal.DigitalPinDriver digitalPinDriver1
    annotation (Placement(transformation(extent={{120,-50},{140,-30}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression16(y=pulseWidth[5] >
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,-44})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression4(y=portMode[8] ==
        0)
    annotation (Placement(transformation(extent={{-20,-6},{20,6}},
        rotation=0,
        origin={80,54})));
  Internal.DigitalPinDriver digitalPinDriver2
    annotation (Placement(transformation(extent={{120,40},{140,60}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression17(y=pulseWidth[8] >
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,46})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression7(y=portMode[9] ==
        0)
    annotation (Placement(transformation(extent={{-20,-6},{20,6}},
        rotation=0,
        origin={80,84})));
  Internal.DigitalPinDriver digitalPinDriver3
    annotation (Placement(transformation(extent={{120,70},{140,90}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression18(y=pulseWidth[9] >
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,76})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression8(y=portMode[2] ==
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,-126})));
  Internal.DigitalPinDriver digitalPinDriver4
    annotation (Placement(transformation(extent={{120,-140},{140,-120}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression19(y=pulseWidth[2] >
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,-134})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression20(y=portMode[1] ==
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,-156})));
  Internal.DigitalPinDriver digitalPinDriver5
    annotation (Placement(transformation(extent={{120,-170},{140,-150}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression21(y=pulseWidth[1] >
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,-164})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=pulseWidth[7])
    annotation (Placement(transformation(extent={{60,10},{100,22}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y=portMode[7] ==
        0)
    annotation (Placement(transformation(extent={{60,18},{100,30}})));
  Internal.PulseWidthModulationPinDriver digitalPort2
    annotation (Placement(transformation(extent={{120,10},{140,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=pulseWidth[6])
    annotation (Placement(transformation(extent={{60,-20},{100,-8}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression6(y=portMode[6] ==
        0)
    annotation (Placement(transformation(extent={{60,-12},{100,0}})));
  Internal.PulseWidthModulationPinDriver digitalPort3
    annotation (Placement(transformation(extent={{120,-20},{140,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=pulseWidth[4])
    annotation (Placement(transformation(extent={{60,-80},{100,-68}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression5(y=portMode[4] ==
        0)
    annotation (Placement(transformation(extent={{60,-72},{100,-60}})));
  Internal.PulseWidthModulationPinDriver digitalPort4
    annotation (Placement(transformation(extent={{120,-80},{140,-60}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression3(y=portMode[13] ==
        0)
    annotation (Placement(transformation(extent={{-20,-6},{20,6}},
        rotation=0,
        origin={80,204})));
  Internal.DigitalPinDriver digitalPinDriver6
    annotation (Placement(transformation(extent={{120,190},{140,210}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression22(y=pulseWidth[13] >
        0)
    annotation (Placement(transformation(extent={{-20,-6},{20,6}},
        rotation=0,
        origin={80,196})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression23(y=portMode[14] ==
        0)
    annotation (Placement(transformation(extent={{-20,-6},{20,6}},
        rotation=0,
        origin={80,234})));
  Internal.DigitalPinDriver digitalPinDriver7
    annotation (Placement(transformation(extent={{120,220},{140,240}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression24(y=pulseWidth[14] >
        0)
    annotation (Placement(transformation(extent={{-20.5,-6},{20.5,6}},
        rotation=0,
        origin={80.5,226})));
equation

  when sample(0, sampleRate) then
  (portMode, pulseWidth) = evaluate(
    externalArduino,
    time,
    5.0,
    {A0.v,A1.v,A2.v,A3.v,A4.v,A5.v},
    {pre(D0.v),pre(D1.v),pre(D2.v),pre(D3.v),pre(D4.v),pre(D5.v),pre(D6.v),pre(D7.v),pre(D8.v),pre(D9.v),pre(D10.v),pre(D11.v),pre(D12.v),pre(D13.v),0,0,0,0,0,0});
  end when;

  connect(GND, ground.p)
    annotation (Line(points={{0,-180},{0,-180},{0,-140},{20,-140}},
                                                          color={0,0,255}));
  connect(resistorA1.n, A1) annotation (Line(points={{-140,-20},{-150,-20},{-160,
          -20}}, color={0,0,255}));
  connect(resistorA2.n, A2) annotation (Line(points={{-140,-50},{-150,-50},{-160,
          -50}}, color={0,0,255}));
  connect(resistorA4.n, A4)
    annotation (Line(points={{-140,-110},{-160,-110}}, color={0,0,255}));
  connect(resistorA5.n, A5)
    annotation (Line(points={{-140,-140},{-160,-140}}, color={0,0,255}));
  connect(resistorA1.p, ground.p) annotation (Line(points={{-120,-20},{-86,-20},
          {-86,-140},{20,-140}}, color={0,0,255}));
  connect(resistorA2.p, ground.p) annotation (Line(points={{-120,-50},{-86,-50},
          {-86,-140},{20,-140}}, color={0,0,255}));
  connect(resistorA4.p, ground.p) annotation (Line(points={{-120,-110},{-86,-110},
          {-86,-140},{20,-140}}, color={0,0,255}));
  connect(resistorA5.p, ground.p)
    annotation (Line(points={{-120,-140},{20,-140}}, color={0,0,255}));
  connect(resistorA0.n, A0) annotation (Line(points={{-140,10},{-146,10},{-150,10},
          {-160,10}}, color={0,0,255}));
  connect(resistorA0.p, ground.p) annotation (Line(points={{-120,10},{-86,10},{-86,
          -30},{-86,-140},{20,-140}}, color={0,0,255}));
  connect(constantVoltage.n, ground.p)
    annotation (Line(points={{-1.77636e-015,62},{-1.77636e-015,-140},{20,-140}},
                                                         color={0,0,255}));
  connect(resistor1.p, constantVoltage.p) annotation (Line(points={{30,80},{30,104},
          {0,104},{0,82},{1.77636e-015,82}},      color={0,0,255}));
  connect(resistor8.n, ground.p) annotation (Line(points={{-44,182},{-44,182},{-44,
          156},{-44,156},{-32,156},{-32,-140},{20,-140}},   color={0,0,255}));
  connect(resistor8.p, constantVoltage1.p) annotation (Line(points={{-44,202},{-44,
          226},{-16,226},{-16,204}}, color={0,0,255}));
  connect(V33, constantVoltage1.p) annotation (Line(points={{-30,260},{-30,260},
          {-30,226},{-16,226},{-16,204}}, color={0,0,255}));
  connect(constantVoltage1.n, ground.p) annotation (Line(points={{-16,184},{-16,
          184},{-16,156},{-32,156},{-32,-140},{20,-140}}, color={0,0,255}));
  connect(resistor1.n, ground.p) annotation (Line(points={{30,60},{30,60},{30,28},
          {0,28},{0,-140},{20,-140}}, color={0,0,255}));
  connect(V5, constantVoltage.p) annotation (Line(points={{28,260},{28,104},{0,104},
          {0,82},{1.77636e-015,82}}, color={0,0,255}));
  connect(V5, V5) annotation (Line(points={{28,260},{26.5,260},{26.5,260},{28,260}},
        color={0,0,255}));
  connect(AREF, resistorAREF.p)
    annotation (Line(points={{-160,168},{-120,168}}, color={0,0,255}));
  connect(resistorAREF.n, ground.p) annotation (Line(points={{-100,168},{-60,168},
          {-60,-140},{20,-140}}, color={0,0,255}));
  connect(RESET, resistorRESET.p)
    annotation (Line(points={{-160,208},{-120,208}}, color={0,0,255}));
  connect(resistorRESET.n, ground.p) annotation (Line(points={{-100,208},{-60,208},
          {-60,-140},{20,-140}}, color={0,0,255}));
  connect(booleanExpression9.y, digitalPort9.isInput)
    annotation (Line(points={{104.1,114},{118,114}}, color={255,0,255}));
  connect(realExpression9.y, digitalPort9.pulseWidth) annotation (Line(points={{
          104.1,106},{112,106},{118,106}}, color={0,0,127}));
  connect(digitalPort9.pin, D9)
    annotation (Line(points={{140,110},{160,110}}, color={0,0,255}));
  connect(digitalPort10.pin, D10)
    annotation (Line(points={{140,140},{140,140},{160,140}}, color={0,0,255}));
  connect(digitalPort10.pulseWidth, realExpression10.y)
    annotation (Line(points={{118,136},{104.1,136}}, color={0,0,127}));
  connect(digitalPort10.isInput, booleanExpression10.y)
    annotation (Line(points={{118,144},{104.1,144}}, color={255,0,255}));
  connect(digitalPort1.pin, D11)
    annotation (Line(points={{140,170},{140,170},{160,170}}, color={0,0,255}));
  connect(digitalPort1.pulseWidth, realExpression11.y)
    annotation (Line(points={{118,166},{102,166}}, color={0,0,127}));
  connect(digitalPort1.isInput, booleanExpression11.y)
    annotation (Line(points={{118,174},{102,174}}, color={255,0,255}));
  connect(A3, resistorA3.n) annotation (Line(points={{-160,-80},{-140,-80},{-140,
          -80}}, color={0,0,255}));
  connect(resistorA3.p, ground.p) annotation (Line(points={{-120,-80},{-86,-80},
          {-86,-140},{20,-140}}, color={0,0,255}));
  connect(digitalPinDriver.y, D2) annotation (Line(points={{140,-100},{140,-100},
          {160,-100}}, color={0,0,255}));
  connect(booleanExpression2.y, digitalPinDriver.isInput) annotation (Line(
        points={{103.05,-96},{103.05,-96},{118,-96}}, color={255,0,255}));
  connect(booleanExpression14.y, digitalPinDriver.u) annotation (Line(points={{103.05,
          -104},{110.375,-104},{118,-104}}, color={255,0,255}));
  connect(booleanExpression15.y, digitalPinDriver1.isInput) annotation (Line(
        points={{102,-36},{106,-36},{118,-36}}, color={255,0,255}));
  connect(booleanExpression16.y, digitalPinDriver1.u) annotation (Line(points={{
          103.05,-44},{103.05,-44},{118,-44}}, color={255,0,255}));
  connect(digitalPinDriver1.y, D4)
    annotation (Line(points={{140,-40},{160,-40}}, color={0,0,255}));
  connect(booleanExpression4.y, digitalPinDriver2.isInput)
    annotation (Line(points={{102,54},{102,54},{118,54}}, color={255,0,255}));
  connect(booleanExpression17.y, digitalPinDriver2.u) annotation (Line(points={{
          103.05,46},{103.05,46},{118,46}}, color={255,0,255}));
  connect(digitalPinDriver2.y, D7)
    annotation (Line(points={{140,50},{160,50},{160,50}}, color={0,0,255}));
  connect(booleanExpression7.y, digitalPinDriver3.isInput)
    annotation (Line(points={{102,84},{108,84},{118,84}}, color={255,0,255}));
  connect(booleanExpression18.y, digitalPinDriver3.u) annotation (Line(points={{
          103.05,76},{110.375,76},{118,76}}, color={255,0,255}));
  connect(digitalPinDriver3.y, D8)
    annotation (Line(points={{140,80},{150,80},{160,80}}, color={0,0,255}));
  connect(booleanExpression8.y, digitalPinDriver4.isInput) annotation (Line(
        points={{103.05,-126},{108,-126},{118,-126}}, color={255,0,255}));
  connect(booleanExpression19.y, digitalPinDriver4.u) annotation (Line(points={{
          103.05,-134},{110.375,-134},{118,-134}}, color={255,0,255}));
  connect(booleanExpression20.y, digitalPinDriver5.isInput) annotation (Line(
        points={{103.05,-156},{108,-156},{118,-156}}, color={255,0,255}));
  connect(booleanExpression21.y, digitalPinDriver5.u) annotation (Line(points={{
          103.05,-164},{110.375,-164},{118,-164}}, color={255,0,255}));
  connect(digitalPinDriver4.y, D1) annotation (Line(points={{140,-130},{160,-130},
          {160,-130}}, color={0,0,255}));
  connect(digitalPinDriver5.y, D0) annotation (Line(points={{140,-160},{150,-160},
          {160,-160}}, color={0,0,255}));
  connect(booleanExpression1.y, digitalPort2.isInput)
    annotation (Line(points={{102,24},{118,24}}, color={255,0,255}));
  connect(realExpression1.y, digitalPort2.pulseWidth)
    annotation (Line(points={{102,16},{118,16}}, color={0,0,127}));
  connect(digitalPort2.pin, D6)
    annotation (Line(points={{140,20},{160,20},{160,20}}, color={0,0,255}));
  connect(booleanExpression6.y, digitalPort3.isInput)
    annotation (Line(points={{102,-6},{118,-6}}, color={255,0,255}));
  connect(realExpression2.y, digitalPort3.pulseWidth)
    annotation (Line(points={{102,-14},{102,-14},{118,-14}}, color={0,0,127}));
  connect(digitalPort3.pin, D5)
    annotation (Line(points={{140,-10},{160,-10},{160,-10}}, color={0,0,255}));
  connect(booleanExpression5.y, digitalPort4.isInput)
    annotation (Line(points={{102,-66},{118,-66}}, color={255,0,255}));
  connect(realExpression4.y, digitalPort4.pulseWidth)
    annotation (Line(points={{102,-74},{118,-74}}, color={0,0,127}));
  connect(digitalPort4.pin, D3)
    annotation (Line(points={{140,-70},{150,-70},{160,-70}}, color={0,0,255}));
  connect(booleanExpression3.y, digitalPinDriver6.isInput) annotation (Line(
        points={{102,204},{102,204},{118,204}}, color={255,0,255}));
  connect(booleanExpression22.y, digitalPinDriver6.u) annotation (Line(points={{
          102,196},{110.375,196},{118,196}}, color={255,0,255}));
  connect(booleanExpression23.y, digitalPinDriver7.isInput) annotation (Line(
        points={{102,234},{102,234},{118,234}}, color={255,0,255}));
  connect(booleanExpression24.y, digitalPinDriver7.u) annotation (Line(points={{
          103.05,226},{110.375,226},{118,226}}, color={255,0,255}));
  connect(digitalPinDriver7.y, D13)
    annotation (Line(points={{140,230},{160,230},{160,230}}, color={0,0,255}));
  connect(digitalPinDriver6.y, D12)
    annotation (Line(points={{140,200},{150,200},{160,200}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-180},
            {160,260}}),                                        graphics={
          Rectangle(
          extent={{-160,260},{160,-180}},
          lineColor={0,0,0},
          fillColor={98,174,178},
          fillPattern=FillPattern.Solid),
          Rectangle(
          extent={{-18,158},{12,144}},
          lineThickness=0.5,
          fillColor=DynamicSelect({100,100,0}, if pulseWidth[14] > 0 then {255,
              255,0} else {100,100,0}),
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Text(
          extent={{-138,24},{-104,0}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Left,
          textString="A0"),
        Text(
          extent={{-72,12},{72,-12}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          origin={-78,-74},
          rotation=270,
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="ANALOG IN",
          horizontalAlignment=TextAlignment.Right),
        Line(
          points={{-64,-146},{-64,18}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-138,-128},{-104,-152}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Left,
          textString="A5"),
        Text(
          extent={{-138,-6},{-104,-30}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Left,
          textString="A1"),
        Text(
          extent={{-138,-36},{-104,-60}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Left,
          textString="A2"),
        Text(
          extent={{-138,-68},{-104,-92}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Left,
          textString="A3"),
        Text(
          extent={{-138,-98},{-104,-122}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Left,
          textString="A4"),
        Text(
          extent={{98,-116},{138,-144}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="TX→1",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{98,-146},{138,-170}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          fontName="Consolas",
          textString="RX←0",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{-71.5,14.5},{71.5,-14.5}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          origin={65.5,-99.5},
          rotation=270,
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="DIGITAL (PWM~)",
          horizontalAlignment=TextAlignment.Right),
        Line(
          points={{50,-168},{50,242}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{102,-86},{138,-110}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="2",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{102,-58},{138,-82}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Right,
          textString="~3"),
        Text(
          extent={{102,-28},{138,-52}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="4",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{102,2},{138,-22}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Right,
          textString="~5"),
        Text(
          extent={{102,32},{138,8}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Right,
          textString="~6"),
        Text(
          extent={{102,62},{138,38}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Right,
          textString="7"),
        Text(
          extent={{102,94},{138,70}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="8",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{102,124},{138,100}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="~9",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{102,154},{138,130}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="~10",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{102,184},{138,160}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="~11",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{102,214},{138,190}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Right,
          textString="12"),
        Text(
          extent={{102,244},{138,220}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Right,
          textString="13"),
        Text(
          extent={{-20,-140},{16,-164}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="GND"),
        Text(
          extent={{-138,182},{-96,156}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="AREF",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-138,226},{-86,194}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="RESET",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{12,242},{48,218}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="5V"),
        Text(
          extent={{-62,162},{-26,138}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Right,
          textString="L"),
          Rectangle(
          extent={{-18,130},{12,116}},
          lineThickness=0.5,
          fillColor=DynamicSelect({100,100,0}, if pulseWidth[1] > 0 then {255,
              255,0} else {100,100,0}),
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Text(
          extent={{-60,134},{-26,112}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Right,
          textString="RX"),
        Text(
          extent={{-60,108},{-26,84}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Right,
          textString="TX"),
          Rectangle(
          extent={{-18,102},{12,88}},
          lineThickness=0.5,
          fillColor=DynamicSelect({100,100,0}, if pulseWidth[2] > 0 then {255,
              255,0} else {100,100,0}),
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Text(
          extent={{-48,248},{-4,212}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="3.3V")}),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-160,-180},{160,260}})),
    experiment(StopTime=10));
end ArduinoUno;
