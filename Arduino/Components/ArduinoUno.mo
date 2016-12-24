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
        transformation(extent={{-170,-70},{-150,-50}}),iconTransformation(
          extent={{-168,-26},{-150,-8}})));
  Modelica.Electrical.Analog.Interfaces.Pin A2 annotation (Placement(
        transformation(extent={{-170,-90},{-150,-70}}),iconTransformation(
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
  Modelica.Electrical.Analog.Basic.Resistor resistor3(
                                                     R=1e9)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-60})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(
                                                     R=1e9)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-80})));
  Modelica.Electrical.Analog.Basic.Resistor resistor5(
                                                     R=1e9)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-100})));
  Modelica.Electrical.Analog.Basic.Resistor resistor6(
                                                     R=1e9)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-120})));
  Modelica.Electrical.Analog.Basic.Resistor resistor7(
                                                     R=1e9)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-140})));
  Modelica.Electrical.Analog.Interfaces.Pin V5 annotation (Placement(
        transformation(extent={{18,250},{38,270}}),  iconTransformation(
          extent={{20,252},{38,270}})));
  Modelica.Electrical.Analog.Interfaces.Pin D1 annotation (Placement(
        transformation(extent={{150,-140},{170,-120}}),
                                                   iconTransformation(extent={{153,
            -139},{171,-121}})));
  Modelica.Electrical.Analog.Interfaces.Pin RST
    annotation (Placement(transformation(extent={{-170,198},{-150,218}}),
        iconTransformation(extent={{-168,200},{-150,218}})));
  Modelica.Electrical.Analog.Interfaces.Pin AREF
    annotation (Placement(transformation(extent={{-170,158},{-150,178}}),
        iconTransformation(extent={{-168,160},{-150,178}})));
  Modelica.Electrical.Analog.Interfaces.Pin A0 annotation (Placement(
        transformation(extent={{-170,-46},{-150,-26}}),iconTransformation(
          extent={{-168,2},{-150,20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(
                                                     R=1e9)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-36})));
  Internal.DigitalPort digitalPort1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,-130})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=pulseWidth[2])
    annotation (Placement(transformation(extent={{62,-140},{92,-128}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y=portMode[2] ==
        0)
    annotation (Placement(transformation(extent={{62,-132},{92,-120}})));
  Internal.DigitalPort digitalPort0 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,-160})));
  Modelica.Blocks.Sources.RealExpression realExpression0(y=pulseWidth[1])
    annotation (Placement(transformation(extent={{62,-170},{92,-158}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression0(y=portMode[1] ==
        0)
    annotation (Placement(transformation(extent={{62,-162},{92,-150}})));
  Modelica.Electrical.Analog.Interfaces.Pin D0 annotation (Placement(
        transformation(extent={{150,-170},{170,-150}}),
                                                   iconTransformation(extent={{153,
            -167},{171,-149}})));
  Modelica.Electrical.Analog.Interfaces.Pin D2 annotation (Placement(
        transformation(extent={{150,-110},{170,-90}}),
                                                   iconTransformation(extent={{153,
            -107},{171,-89}})));
  Internal.DigitalPort digitalPort3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,-70})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=pulseWidth[4])
    annotation (Placement(transformation(extent={{62,-80},{92,-68}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression3(y=portMode[4] ==
        0)
    annotation (Placement(transformation(extent={{62,-72},{92,-60}})));
  Modelica.Electrical.Analog.Interfaces.Pin D3 annotation (Placement(
        transformation(extent={{150,-80},{170,-60}}),
                                                   iconTransformation(extent={{153,-79},
            {171,-61}})));
  Internal.DigitalPort digitalPort4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,-40})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=pulseWidth[5])
    annotation (Placement(transformation(extent={{62,-50},{92,-38}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression4(y=portMode[5] ==
        0)
    annotation (Placement(transformation(extent={{62,-42},{92,-30}})));
  Modelica.Electrical.Analog.Interfaces.Pin D4 annotation (Placement(
        transformation(extent={{150,-50},{170,-30}}),
                                                   iconTransformation(extent={{153,-49},
            {171,-31}})));
  Internal.DigitalPort digitalPort5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,-10})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=pulseWidth[6])
    annotation (Placement(transformation(extent={{62,-20},{92,-8}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression5(y=portMode[6] ==
        0)
    annotation (Placement(transformation(extent={{62,-12},{92,0}})));
  Modelica.Electrical.Analog.Interfaces.Pin D5 annotation (Placement(
        transformation(extent={{150,-20},{170,0}}),iconTransformation(extent={{153,-19},
            {171,-1}})));
  Internal.DigitalPort digitalPort6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,20})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=pulseWidth[7])
    annotation (Placement(transformation(extent={{62,10},{92,22}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression6(y=portMode[7] ==
        0)
    annotation (Placement(transformation(extent={{62,18},{92,30}})));
  Modelica.Electrical.Analog.Interfaces.Pin D6 annotation (Placement(
        transformation(extent={{150,10},{170,30}}),iconTransformation(extent={{153,11},
            {171,29}})));
  Internal.DigitalPort digitalPort7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,50})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=pulseWidth[8])
    annotation (Placement(transformation(extent={{62,40},{92,52}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression7(y=portMode[8] ==
        0)
    annotation (Placement(transformation(extent={{62,48},{92,60}})));
  Modelica.Electrical.Analog.Interfaces.Pin D7 annotation (Placement(
        transformation(extent={{150,40},{170,60}}),iconTransformation(extent={{153,41},
            {171,59}})));
  Internal.DigitalPort digitalPort8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,80})));
  Modelica.Blocks.Sources.RealExpression realExpression8(y=pulseWidth[9])
    annotation (Placement(transformation(extent={{62,70},{92,82}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression8(y=portMode[9] ==
        0)
    annotation (Placement(transformation(extent={{62,78},{92,90}})));
  Modelica.Electrical.Analog.Interfaces.Pin D8 annotation (Placement(
        transformation(extent={{150,70},{170,90}}),iconTransformation(extent={{153,72},
            {171,90}})));
  Internal.DigitalPort digitalPort9 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,110})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=pulseWidth[10])
    annotation (Placement(transformation(extent={{62,100},{92,112}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression9(y=portMode[10] ==
        0)
    annotation (Placement(transformation(extent={{62,108},{92,120}})));
  Modelica.Electrical.Analog.Interfaces.Pin D9 annotation (Placement(
        transformation(extent={{150,100},{170,120}}),
                                                   iconTransformation(extent={{153,102},
            {171,120}})));
  Internal.DigitalPort digitalPort10 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,140})));
  Modelica.Blocks.Sources.RealExpression realExpression10(y=pulseWidth[11])
    annotation (Placement(transformation(extent={{62,130},{92,142}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression10(y=portMode[11]
         == 0)
    annotation (Placement(transformation(extent={{62,138},{92,150}})));
  Modelica.Electrical.Analog.Interfaces.Pin D10
                                               annotation (Placement(
        transformation(extent={{150,130},{170,150}}),
                                                   iconTransformation(extent={{153,132},
            {171,150}})));
  Internal.DigitalPort digitalPort11 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,170})));
  Modelica.Blocks.Sources.RealExpression realExpression11(y=pulseWidth[12])
    annotation (Placement(transformation(extent={{62,160},{92,172}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression11(y=portMode[12]
         == 0)
    annotation (Placement(transformation(extent={{62,168},{92,180}})));
  Modelica.Electrical.Analog.Interfaces.Pin D11
                                               annotation (Placement(
        transformation(extent={{150,160},{170,180}}),
                                                   iconTransformation(extent={{153,162},
            {171,180}})));
  Internal.DigitalPort digitalPort12 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,200})));
  Modelica.Blocks.Sources.RealExpression realExpression12(y=pulseWidth[13])
    annotation (Placement(transformation(extent={{62,190},{92,202}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression12(y=portMode[13]
         == 0)
    annotation (Placement(transformation(extent={{62,198},{92,210}})));
  Modelica.Electrical.Analog.Interfaces.Pin D12
                                               annotation (Placement(
        transformation(extent={{150,190},{170,210}}),
                                                   iconTransformation(extent={{153,192},
            {171,210}})));
  Internal.DigitalPort digitalPort13 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,230})));
  Modelica.Blocks.Sources.RealExpression realExpression13(y=pulseWidth[14])
    annotation (Placement(transformation(extent={{62,220},{92,232}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression13(y=portMode[14]
         == 0)
    annotation (Placement(transformation(extent={{62,228},{92,240}})));
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

//protected
    Integer portMode[15];
    Real pulseWidth[15];

   function evaluate
    input Arduino.Internal.ExternalArduino instance;
    input Modelica.SIunits.Time timeIn;
    input Real analog[6];
    input Real digital[15];
    output Integer portMode[15];
    output Real pulseWidth[15];
    external "C" ModelicaArduino_update(instance, timeIn, analog, digital, portMode, pulseWidth) annotation (
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
  Modelica.Electrical.Analog.Basic.Resistor resistor9(
                                                     R=1e9)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={34,-118})));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch
    annotation (Placement(transformation(extent={{12,-104},{32,-84}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y=portMode[3] ==
        0)
    annotation (Placement(transformation(extent={{-24.5,-13.5},{24.5,13.5}},
        rotation=270,
        origin={26.5,-43.5})));
equation

  when sample(0, sampleRate) then
  (portMode, pulseWidth) = evaluate(
    externalArduino,
    time,
    {A0.v,A1.v,A2.v,A3.v,A4.v,A5.v},
    {0,0,pre(D2.v),0,0,0,0,0,0,0,0,0,0,0,0});
  end when;

  //digitalPortPulseWidts[1] = time * 10;

  connect(GND, ground.p)
    annotation (Line(points={{0,-180},{0,-180},{0,-140},{20,-140}},
                                                          color={0,0,255}));
  connect(resistor3.n, A1) annotation (Line(points={{-140,-60},{-150,-60},{-160,
          -60}},            color={0,0,255}));
  connect(resistor4.n, A2) annotation (Line(points={{-140,-80},{-150,-80},{-160,
          -80}}, color={0,0,255}));
  connect(resistor5.n, A3) annotation (Line(points={{-140,-100},{-160,-100},{-160,
          -80}},       color={0,0,255}));
  connect(resistor6.n, A4) annotation (Line(points={{-140,-120},{-150,-120},{-150,
          -110},{-160,-110}},     color={0,0,255}));
  connect(resistor7.n, A5) annotation (Line(points={{-140,-140},{-160,-140}},
                       color={0,0,255}));
  connect(resistor3.p, ground.p) annotation (Line(points={{-120,-60},{-86,-60},
          {-86,-140},{20,-140}}, color={0,0,255}));
  connect(resistor4.p, ground.p) annotation (Line(points={{-120,-80},{-86,-80},
          {-86,-140},{20,-140}}, color={0,0,255}));
  connect(resistor5.p, ground.p) annotation (Line(points={{-120,-100},{-86,-100},
          {-86,-140},{20,-140}},       color={0,0,255}));
  connect(resistor6.p, ground.p) annotation (Line(points={{-120,-120},{-86,-120},
          {-86,-140},{20,-140}},       color={0,0,255}));
  connect(resistor7.p, ground.p) annotation (Line(points={{-120,-140},{20,-140}},
                                       color={0,0,255}));
  connect(RST, ground.p) annotation (Line(points={{-160,208},{-60,208},{-60,-86},
          {-60,-86},{-60,-140},{20,-140}},
                                      color={0,0,255}));
  connect(AREF, ground.p) annotation (Line(points={{-160,168},{-60,168},{-60,-140},
          {20,-140}}, color={0,0,255}));
  connect(resistor2.n, A0) annotation (Line(points={{-140,-36},{-160,-36}},
        color={0,0,255}));
  connect(resistor2.p, ground.p) annotation (Line(points={{-120,-36},{-86,-36},
          {-86,-60},{-86,-140},{20,-140}},      color={0,0,255}));
  connect(digitalPort1.pin, D1) annotation (Line(points={{130,-130},{146,-130},
          {160,-130}}, color={0,0,255}));
  connect(digitalPort1.pulseWidth, realExpression1.y) annotation (Line(points=
         {{108,-134},{108,-134},{93.5,-134}}, color={0,0,127}));
  connect(digitalPort1.isInput, booleanExpression1.y) annotation (Line(points={{108,
          -120.8},{108,-126},{93.5,-126}},    color={255,0,255}));
  connect(digitalPort0.pin, D0) annotation (Line(points={{130,-160},{146,-160},
          {160,-160}}, color={0,0,255}));
  connect(digitalPort0.pulseWidth, realExpression0.y) annotation (Line(points=
         {{108,-164},{108,-164},{93.5,-164}}, color={0,0,127}));
  connect(digitalPort0.isInput, booleanExpression0.y) annotation (Line(points={{108,
          -150.8},{108,-156},{93.5,-156}},    color={255,0,255}));
  connect(digitalPort3.pin, D3) annotation (Line(points={{130,-70},{146,-70},{
          160,-70}}, color={0,0,255}));
  connect(digitalPort3.pulseWidth, realExpression3.y) annotation (Line(points=
         {{108,-74},{108,-74},{93.5,-74}}, color={0,0,127}));
  connect(digitalPort3.isInput, booleanExpression3.y) annotation (Line(points={{108,
          -60.8},{108,-66},{93.5,-66}},    color={255,0,255}));
  connect(digitalPort4.pin, D4) annotation (Line(points={{130,-40},{146,-40},{
          160,-40}}, color={0,0,255}));
  connect(digitalPort4.pulseWidth, realExpression4.y) annotation (Line(points=
         {{108,-44},{108,-44},{93.5,-44}}, color={0,0,127}));
  connect(digitalPort4.isInput, booleanExpression4.y) annotation (Line(points={{108,
          -30.8},{108,-36},{93.5,-36}},    color={255,0,255}));
  connect(digitalPort5.pin, D5) annotation (Line(points={{130,-10},{146,-10},{
          160,-10}}, color={0,0,255}));
  connect(digitalPort5.pulseWidth, realExpression5.y) annotation (Line(points=
         {{108,-14},{108,-14},{93.5,-14}}, color={0,0,127}));
  connect(digitalPort5.isInput, booleanExpression5.y) annotation (Line(points={{108,
          -0.8},{108,-6},{93.5,-6}},    color={255,0,255}));
  connect(digitalPort6.pin, D6)
    annotation (Line(points={{130,20},{146,20},{160,20}}, color={0,0,255}));
  connect(digitalPort6.pulseWidth, realExpression6.y)
    annotation (Line(points={{108,16},{108,16},{93.5,16}}, color={0,0,127}));
  connect(digitalPort6.isInput, booleanExpression6.y) annotation (Line(points={{108,
          29.2},{108,24},{93.5,24}},    color={255,0,255}));
  connect(digitalPort7.pin, D7)
    annotation (Line(points={{130,50},{146,50},{160,50}}, color={0,0,255}));
  connect(digitalPort7.pulseWidth, realExpression7.y)
    annotation (Line(points={{108,46},{108,46},{93.5,46}}, color={0,0,127}));
  connect(digitalPort7.isInput, booleanExpression7.y) annotation (Line(points={{108,
          59.2},{108,54},{93.5,54}},    color={255,0,255}));
  connect(digitalPort8.pin, D8)
    annotation (Line(points={{130,80},{146,80},{160,80}}, color={0,0,255}));
  connect(digitalPort8.pulseWidth, realExpression8.y)
    annotation (Line(points={{108,76},{108,76},{93.5,76}}, color={0,0,127}));
  connect(digitalPort8.isInput, booleanExpression8.y) annotation (Line(points={{108,
          89.2},{108,84},{93.5,84}},    color={255,0,255}));
  connect(digitalPort9.pin, D9) annotation (Line(points={{130,110},{146,110},{
          160,110}}, color={0,0,255}));
  connect(digitalPort9.pulseWidth, realExpression9.y) annotation (Line(points=
         {{108,106},{108,106},{93.5,106}}, color={0,0,127}));
  connect(digitalPort9.isInput, booleanExpression9.y) annotation (Line(points={{108,
          119.2},{108,114},{93.5,114}},    color={255,0,255}));
  connect(digitalPort10.pin, D10) annotation (Line(points={{130,140},{146,140},
          {160,140}}, color={0,0,255}));
  connect(digitalPort10.pulseWidth, realExpression10.y) annotation (Line(
        points={{108,136},{108,136},{93.5,136}}, color={0,0,127}));
  connect(digitalPort10.isInput, booleanExpression10.y) annotation (Line(
        points={{108,149.2},{108,144},{93.5,144}},
                                                 color={255,0,255}));
  connect(digitalPort11.pin, D11) annotation (Line(points={{130,170},{146,170},
          {160,170}}, color={0,0,255}));
  connect(digitalPort11.pulseWidth, realExpression11.y) annotation (Line(
        points={{108,166},{108,166},{93.5,166}}, color={0,0,127}));
  connect(digitalPort11.isInput, booleanExpression11.y) annotation (Line(
        points={{108,179.2},{108,174},{93.5,174}},
                                                 color={255,0,255}));
  connect(digitalPort12.pin, D12) annotation (Line(points={{130,200},{146,200},
          {160,200}}, color={0,0,255}));
  connect(digitalPort12.pulseWidth, realExpression12.y) annotation (Line(
        points={{108,196},{108,196},{93.5,196}}, color={0,0,127}));
  connect(digitalPort12.isInput, booleanExpression12.y) annotation (Line(
        points={{108,209.2},{108,204},{93.5,204}},
                                                 color={255,0,255}));
  connect(digitalPort13.pin, D13) annotation (Line(points={{130,230},{146,230},
          {160,230}}, color={0,0,255}));
  connect(digitalPort13.pulseWidth, realExpression13.y) annotation (Line(
        points={{108,226},{108,226},{93.5,226}}, color={0,0,127}));
  connect(digitalPort13.isInput, booleanExpression13.y) annotation (Line(
        points={{108,239.2},{108,234},{93.5,234}},
                                                 color={255,0,255}));
  connect(constantVoltage.n, ground.p)
    annotation (Line(points={{-1.77636e-015,62},{-1.77636e-015,-140},{20,-140}},
                                                         color={0,0,255}));
  connect(resistor1.p, constantVoltage.p) annotation (Line(points={{30,80},{30,104},
          {0,104},{0,82},{1.77636e-015,82}},      color={0,0,255}));
  connect(resistor8.n, ground.p) annotation (Line(points={{-44,182},{-44,182},{-44,
          156},{-44,156},{-32,156},{-32,-140},{20,-140}},   color={0,0,255}));
  connect(resistor8.p, constantVoltage1.p) annotation (Line(points={{-44,202},{-44,
          226},{-16,226},{-16,204}}, color={0,0,255}));
  connect(V33, constantVoltage1.p) annotation (Line(points={{-30,260},{-20,260},
          {-20,226},{-16,226},{-16,204}}, color={0,0,255}));
  connect(constantVoltage1.n, ground.p) annotation (Line(points={{-16,184},{-16,
          184},{-16,156},{-32,156},{-32,-140},{20,-140}}, color={0,0,255}));
  connect(resistor1.n, ground.p) annotation (Line(points={{30,60},{30,60},{30,28},
          {0,28},{0,-140},{20,-140}}, color={0,0,255}));
  connect(V5, constantVoltage.p) annotation (Line(points={{28,260},{28,104},{0,104},
          {0,82},{1.77636e-015,82}}, color={0,0,255}));
  connect(V5, V5) annotation (Line(points={{28,260},{26.5,260},{26.5,260},{28,260}},
        color={0,0,255}));
  connect(resistor9.p, D2) annotation (Line(points={{44,-118},{44,-100},{160,-100}},
        color={0,0,255}));
  connect(resistor9.n, ground.p) annotation (Line(points={{24,-118},{0,-118},{0,
          -140},{20,-140}}, color={0,0,255}));
  connect(resistor9.p, idealOpeningSwitch.n) annotation (Line(points={{44,-118},
          {44,-110},{44,-94},{32,-94}}, color={0,0,255}));
  connect(idealOpeningSwitch.p, constantVoltage.p) annotation (Line(points={{12,
          -94},{12,18},{44,18},{44,118},{28,118},{28,104},{0,104},{0,82},{1.77636e-015,
          82}}, color={0,0,255}));
  connect(booleanExpression2.y, idealOpeningSwitch.control) annotation (Line(
        points={{26.5,-70.45},{26.5,-79.225},{22,-79.225},{22,-87}}, color={255,
          0,255}));
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
          extent={{-138,20},{-104,-4}},
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
          extent={{-138,-126},{-104,-150}},
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
          extent={{-138,-8},{-104,-32}},
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
          extent={{-138,-38},{-104,-62}},
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
          extent={{-138,-66},{-104,-90}},
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
          extent={{-138,-96},{-104,-120}},
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
          extent={{102,-60},{138,-84}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="3",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{102,-30},{138,-54}},
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
          extent={{102,0},{138,-24}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="5",
          horizontalAlignment=TextAlignment.Right),
        Text(
          extent={{102,32},{138,8}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="6",
          horizontalAlignment=TextAlignment.Right),
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
          extent={{12,242},{46,218}},
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
          extent={{-50,246},{-8,212}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={136,172,188},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          fontName="Consolas",
          textStyle={TextStyle.Bold},
          textString="3.3V")}),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-160,-180},{160,260}})));
end ArduinoUno;
