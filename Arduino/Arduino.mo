within ;
package Arduino
  package Components

    block ArduinoUno

      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{10,-160},{30,-140}})));
      Modelica.Electrical.Analog.Interfaces.Pin GND
        annotation (Placement(transformation(extent={{-10,-190},{10,-170}}),
            iconTransformation(extent={{-10,-190},{10,-170}})));

      Arduino.Internal.ExternalArduino externalArduino=Arduino.Internal.ExternalArduino();

    protected
        Integer portMode[15];
        Real pulseWidth[15];

       function evaluate
        input Arduino.Internal.ExternalArduino instance;
        input Modelica.SIunits.Time timeIn;
        input Real analog[6];
        output Integer portMode[15];
        output Real pulseWidth[15];
        external "C" ModelicaArduino_update(instance, timeIn, analog, portMode, pulseWidth) annotation (
          Include="#include <ModelicaArduino.h>",
          IncludeDirectory="modelica://Arduino/Resources/C-Sources",
          Library="ModelicaArduino");
       end evaluate;

      Modelica.Electrical.Analog.Interfaces.Pin A1 annotation (Placement(
            transformation(extent={{-170,-70},{-150,-50}}),iconTransformation(
              extent={{-168,-26},{-150,-8}})));
      Modelica.Electrical.Analog.Interfaces.Pin A2 annotation (Placement(
            transformation(extent={{-170,-90},{-150,-70}}),iconTransformation(
              extent={{-168,-56},{-150,-38}})));
      Modelica.Electrical.Analog.Interfaces.Pin A3 annotation (Placement(
            transformation(extent={{-170,-88},{-150,-68}}),iconTransformation(
              extent={{-168,-86},{-150,-68}})));
      Modelica.Electrical.Analog.Interfaces.Pin A4 annotation (Placement(
            transformation(extent={{-170,-118},{-150,-98}}),
                                                           iconTransformation(
              extent={{-168,-116},{-150,-98}})));
      Modelica.Electrical.Analog.Interfaces.Pin A5 annotation (Placement(
            transformation(extent={{-170,-150},{-150,-130}}),
                                                           iconTransformation(
              extent={{-168,-147},{-148,-128}})));
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
            transformation(extent={{-10,250},{10,270}}), iconTransformation(
              extent={{-8,252},{10,270}})));
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
      Internal.DigitalPort digitalPort2 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={120,-100})));
      Modelica.Blocks.Sources.RealExpression realExpression2(y=pulseWidth[3])
        annotation (Placement(transformation(extent={{62,-110},{92,-98}})));
      Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y=portMode[3] ==
            0)
        annotation (Placement(transformation(extent={{62,-102},{92,-90}})));
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
      Modelica.Electrical.Analog.Basic.Resistor resistor1(
                                                         R=1e9)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-28,70})));
    equation

      when sample(0, 0.001) then
      (portMode, pulseWidth) = evaluate(
        externalArduino,
        time,
        {A0.v,A1.v,A2.v,A3.v,A4.v,A5.v});
      end when;

      //digitalPortPulseWidts[1] = time * 10;

      connect(GND, ground.p)
        annotation (Line(points={{0,-180},{0,-180},{0,-140},{20,-140}},
                                                              color={0,0,255}));
      connect(resistor3.n, A1) annotation (Line(points={{-140,-60},{-150,-60},{-160,
              -60}},            color={0,0,255}));
      connect(resistor4.n, A2) annotation (Line(points={{-140,-80},{-150,-80},{-160,
              -80}}, color={0,0,255}));
      connect(resistor5.n, A3) annotation (Line(points={{-140,-100},{-150,-100},{-150,
              -78},{-160,-78}},
                           color={0,0,255}));
      connect(resistor6.n, A4) annotation (Line(points={{-140,-120},{-160,-120},{-160,
              -108}},                 color={0,0,255}));
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
      connect(digitalPort1.isInput, booleanExpression1.y) annotation (Line(points=
             {{108,-126},{108,-126},{93.5,-126}}, color={255,0,255}));
      connect(digitalPort0.pin, D0) annotation (Line(points={{130,-160},{146,-160},
              {160,-160}}, color={0,0,255}));
      connect(digitalPort0.pulseWidth, realExpression0.y) annotation (Line(points=
             {{108,-164},{108,-164},{93.5,-164}}, color={0,0,127}));
      connect(digitalPort0.isInput, booleanExpression0.y) annotation (Line(points=
             {{108,-156},{108,-156},{93.5,-156}}, color={255,0,255}));
      connect(digitalPort2.pin, D2) annotation (Line(points={{130,-100},{146,-100},
              {160,-100}}, color={0,0,255}));
      connect(digitalPort2.pulseWidth, realExpression2.y) annotation (Line(points=
             {{108,-104},{108,-104},{93.5,-104}}, color={0,0,127}));
      connect(digitalPort2.isInput, booleanExpression2.y) annotation (Line(points=
             {{108,-96},{108,-96},{93.5,-96}}, color={255,0,255}));
      connect(digitalPort3.pin, D3) annotation (Line(points={{130,-70},{146,-70},{
              160,-70}}, color={0,0,255}));
      connect(digitalPort3.pulseWidth, realExpression3.y) annotation (Line(points=
             {{108,-74},{108,-74},{93.5,-74}}, color={0,0,127}));
      connect(digitalPort3.isInput, booleanExpression3.y) annotation (Line(points=
             {{108,-66},{108,-66},{93.5,-66}}, color={255,0,255}));
      connect(digitalPort4.pin, D4) annotation (Line(points={{130,-40},{146,-40},{
              160,-40}}, color={0,0,255}));
      connect(digitalPort4.pulseWidth, realExpression4.y) annotation (Line(points=
             {{108,-44},{108,-44},{93.5,-44}}, color={0,0,127}));
      connect(digitalPort4.isInput, booleanExpression4.y) annotation (Line(points=
             {{108,-36},{108,-36},{93.5,-36}}, color={255,0,255}));
      connect(digitalPort5.pin, D5) annotation (Line(points={{130,-10},{146,-10},{
              160,-10}}, color={0,0,255}));
      connect(digitalPort5.pulseWidth, realExpression5.y) annotation (Line(points=
             {{108,-14},{108,-14},{93.5,-14}}, color={0,0,127}));
      connect(digitalPort5.isInput, booleanExpression5.y) annotation (Line(points=
             {{108,-6},{108,-6},{93.5,-6}}, color={255,0,255}));
      connect(digitalPort6.pin, D6)
        annotation (Line(points={{130,20},{146,20},{160,20}}, color={0,0,255}));
      connect(digitalPort6.pulseWidth, realExpression6.y)
        annotation (Line(points={{108,16},{108,16},{93.5,16}}, color={0,0,127}));
      connect(digitalPort6.isInput, booleanExpression6.y) annotation (Line(points=
             {{108,24},{108,24},{93.5,24}}, color={255,0,255}));
      connect(digitalPort7.pin, D7)
        annotation (Line(points={{130,50},{146,50},{160,50}}, color={0,0,255}));
      connect(digitalPort7.pulseWidth, realExpression7.y)
        annotation (Line(points={{108,46},{108,46},{93.5,46}}, color={0,0,127}));
      connect(digitalPort7.isInput, booleanExpression7.y) annotation (Line(points=
             {{108,54},{108,54},{93.5,54}}, color={255,0,255}));
      connect(digitalPort8.pin, D8)
        annotation (Line(points={{130,80},{146,80},{160,80}}, color={0,0,255}));
      connect(digitalPort8.pulseWidth, realExpression8.y)
        annotation (Line(points={{108,76},{108,76},{93.5,76}}, color={0,0,127}));
      connect(digitalPort8.isInput, booleanExpression8.y) annotation (Line(points=
             {{108,84},{108,84},{93.5,84}}, color={255,0,255}));
      connect(digitalPort9.pin, D9) annotation (Line(points={{130,110},{146,110},{
              160,110}}, color={0,0,255}));
      connect(digitalPort9.pulseWidth, realExpression9.y) annotation (Line(points=
             {{108,106},{108,106},{93.5,106}}, color={0,0,127}));
      connect(digitalPort9.isInput, booleanExpression9.y) annotation (Line(points=
             {{108,114},{108,114},{93.5,114}}, color={255,0,255}));
      connect(digitalPort10.pin, D10) annotation (Line(points={{130,140},{146,140},
              {160,140}}, color={0,0,255}));
      connect(digitalPort10.pulseWidth, realExpression10.y) annotation (Line(
            points={{108,136},{108,136},{93.5,136}}, color={0,0,127}));
      connect(digitalPort10.isInput, booleanExpression10.y) annotation (Line(
            points={{108,144},{108,144},{93.5,144}}, color={255,0,255}));
      connect(digitalPort11.pin, D11) annotation (Line(points={{130,170},{146,170},
              {160,170}}, color={0,0,255}));
      connect(digitalPort11.pulseWidth, realExpression11.y) annotation (Line(
            points={{108,166},{108,166},{93.5,166}}, color={0,0,127}));
      connect(digitalPort11.isInput, booleanExpression11.y) annotation (Line(
            points={{108,174},{108,174},{93.5,174}}, color={255,0,255}));
      connect(digitalPort12.pin, D12) annotation (Line(points={{130,200},{146,200},
              {160,200}}, color={0,0,255}));
      connect(digitalPort12.pulseWidth, realExpression12.y) annotation (Line(
            points={{108,196},{108,196},{93.5,196}}, color={0,0,127}));
      connect(digitalPort12.isInput, booleanExpression12.y) annotation (Line(
            points={{108,204},{108,204},{93.5,204}}, color={255,0,255}));
      connect(digitalPort13.pin, D13) annotation (Line(points={{130,230},{146,230},
              {160,230}}, color={0,0,255}));
      connect(digitalPort13.pulseWidth, realExpression13.y) annotation (Line(
            points={{108,226},{108,226},{93.5,226}}, color={0,0,127}));
      connect(digitalPort13.isInput, booleanExpression13.y) annotation (Line(
            points={{108,234},{108,234},{93.5,234}}, color={255,0,255}));
      connect(V5, constantVoltage.p) annotation (Line(points={{0,260},{0,260},{0,82},
              {1.77636e-015,82}}, color={0,0,255}));
      connect(constantVoltage.n, ground.p)
        annotation (Line(points={{0,62},{0,-140},{20,-140}}, color={0,0,255}));
      connect(resistor1.n, ground.p) annotation (Line(points={{-28,60},{-28,60},{-28,
              56},{-28,56},{-28,36},{0,36},{0,-140},{20,-140}}, color={0,0,255}));
      connect(resistor1.p, constantVoltage.p) annotation (Line(points={{-28,80},{-28,
              104},{0,104},{0,82},{1.77636e-015,82}}, color={0,0,255}));
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
              fillColor={100,100,0},
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
              fontName="Courier",
              textStyle={TextStyle.Bold},
              textString="A0",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{-71.5,14.5},{71.5,-14.5}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              origin={-76.5,-79.5},
              rotation=270,
              fontName="Courier",
              textStyle={TextStyle.Bold},
              textString="ANALOG IN"),
            Text(
              extent={{-20,12},{0,2}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              textString="LED"),
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
              fontName="Courier",
              textStyle={TextStyle.Bold},
              textString="A5",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{-138,-8},{-104,-32}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Courier",
              textStyle={TextStyle.Bold},
              textString="A1",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{-138,-38},{-104,-62}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Courier",
              textStyle={TextStyle.Bold},
              textString="A2",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{-138,-66},{-104,-90}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Courier",
              textStyle={TextStyle.Bold},
              textString="A3",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{-138,-96},{-104,-120}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Courier",
              textStyle={TextStyle.Bold},
              textString="A4",
              horizontalAlignment=TextAlignment.Left),
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
              origin={65.5,-93.5},
              rotation=270,
              fontName="Consolas",
              textStyle={TextStyle.Bold},
              textString="DIGITAL (PWM~)"),
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
              textString="13",
              horizontalAlignment=TextAlignment.Right),
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
              extent={{-136,184},{-94,154}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Consolas",
              textStyle={TextStyle.Bold},
              textString="AREF"),
            Text(
              extent={{-138,222},{-102,198}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Consolas",
              textStyle={TextStyle.Bold},
              textString="RESET"),
            Text(
              extent={{-36,240},{-2,216}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Courier",
              textStyle={TextStyle.Bold},
              textString="5V"),
            Text(
              extent={{-60,160},{-26,136}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Courier",
              textStyle={TextStyle.Bold},
              horizontalAlignment=TextAlignment.Right,
              textString="L"),
              Rectangle(
              extent={{-18,130},{12,116}},
              lineThickness=0.5,
              fillColor={100,100,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None,
              lineColor={0,0,0}),
            Text(
              extent={{-60,134},{-26,110}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Courier",
              textStyle={TextStyle.Bold},
              horizontalAlignment=TextAlignment.Right,
              textString="RX"),
            Text(
              extent={{-60,106},{-26,82}},
              pattern=LinePattern.None,
              lineThickness=0.5,
              fillColor={136,172,188},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              fontName="Courier",
              textStyle={TextStyle.Bold},
              horizontalAlignment=TextAlignment.Right,
              textString="TX"),
              Rectangle(
              extent={{-18,102},{12,88}},
              lineThickness=0.5,
              fillColor={100,100,0},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None,
              lineColor={0,0,0})}),                                  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-160,-180},{160,260}})));
    end ArduinoUno;

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

  end Components;

  package Examples
    extends Modelica.Icons.ExamplesPackage;
    model Example
                  extends Modelica.Icons.Example;

      Components.ArduinoUno arduinoUno
        annotation (Placement(transformation(extent={{-38,-32},{40,64}})));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(
        V=2.5,
        offset=2.5,
        freqHz=0.5)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,-34})));
      Components.LED lED
        annotation (Placement(transformation(extent={{70,-4},{80,6}})));
      Components.LED lED1
        annotation (Placement(transformation(extent={{70,-10},{80,0}})));
      Components.LED lED2
        annotation (Placement(transformation(extent={{70,-16},{80,-6}})));
      Components.LED lED3
        annotation (Placement(transformation(extent={{70,-22},{80,-12}})));
      Components.LED lED4
        annotation (Placement(transformation(extent={{70,-28},{80,-18}})));
      Components.LED lED5
        annotation (Placement(transformation(extent={{70,2},{80,12}})));
      Components.LED lED6
        annotation (Placement(transformation(extent={{70,8},{80,18}})));
      Components.LED lED7
        annotation (Placement(transformation(extent={{70,14},{80,24}})));
      Components.LED lED8
        annotation (Placement(transformation(extent={{70,20},{80,30}})));
      Components.LED lED9
        annotation (Placement(transformation(extent={{70,26},{80,36}})));
      Components.LED lED10
        annotation (Placement(transformation(extent={{70,32},{80,42}})));
      Components.LED lED11
        annotation (Placement(transformation(extent={{70,38},{80,48}})));
      Components.LED lED12
        annotation (Placement(transformation(extent={{70,44},{80,54}})));
      Components.LED lED13
        annotation (Placement(transformation(extent={{70,50},{80,60}})));
    equation
      connect(sineVoltage.n, arduinoUno.GND) annotation (Line(points={{-80,-44},{-38,
              -44},{-38,-54},{1,-54},{1,-32}},              color={0,0,255}));
      connect(sineVoltage.p, arduinoUno.A0) annotation (Line(points={{-80,-24},
              {-80,-24},{-80,9.67273},{-37.7563,9.67273}},
                                                    color={0,0,255}));
      connect(arduinoUno.D5, lED5.pin_p) annotation (Line(points={{40.4875,5.09091},
              {55.2437,5.09091},{55.2437,7},{70,7}}, color={0,0,255}));
      connect(arduinoUno.D6, lED6.pin_p) annotation (Line(points={{40.4875,
              11.6364},{55.2437,11.6364},{55.2437,13},{70,13}},
                                                       color={0,0,255}));
      connect(arduinoUno.D7, lED7.pin_p) annotation (Line(points={{40.4875,
              18.1818},{55.2437,18.1818},{55.2437,19},{70,19}},
                                                       color={0,0,255}));
      connect(arduinoUno.D8, lED8.pin_p) annotation (Line(points={{40.4875,
              24.9455},{55.2437,24.9455},{55.2437,25},{70,25}},
                                                       color={0,0,255}));
      connect(arduinoUno.D9, lED9.pin_p) annotation (Line(points={{40.4875,31.4909},
              {55.2437,31.4909},{55.2437,31},{70,31}}, color={0,0,255}));
      connect(arduinoUno.D10, lED10.pin_p) annotation (Line(points={{40.4875,
              38.0364},{55.2437,38.0364},{55.2437,37},{70,37}},
                                                       color={0,0,255}));
      connect(arduinoUno.D11, lED11.pin_p) annotation (Line(points={{40.4875,
              44.5818},{55.2437,44.5818},{55.2437,43},{70,43}},
                                                       color={0,0,255}));
      connect(arduinoUno.D12, lED12.pin_p) annotation (Line(points={{40.4875,
              51.1273},{55.2437,51.1273},{55.2437,49},{70,49}},
                                                       color={0,0,255}));
      connect(arduinoUno.D13, lED13.pin_p) annotation (Line(points={{40.4875,
              57.6727},{55.2437,57.6727},{55.2437,55},{70,55}},
                                                       color={0,0,255}));
      connect(lED11.pin_n, lED10.pin_n)
        annotation (Line(points={{80,43},{80,37}}, color={0,0,255}));
      connect(lED12.pin_n, lED11.pin_n)
        annotation (Line(points={{80,49},{80,43}}, color={0,0,255}));
      connect(lED13.pin_n, lED12.pin_n)
        annotation (Line(points={{80,55},{80,49}}, color={0,0,255}));
      connect(lED10.pin_n, lED9.pin_n)
        annotation (Line(points={{80,37},{80,31}}, color={0,0,255}));
      connect(lED9.pin_n, lED8.pin_n)
        annotation (Line(points={{80,31},{80,25},{80,25}}, color={0,0,255}));
      connect(lED8.pin_n, lED7.pin_n)
        annotation (Line(points={{80,25},{80,19}}, color={0,0,255}));
      connect(lED7.pin_n, lED6.pin_n)
        annotation (Line(points={{80,19},{80,13}}, color={0,0,255}));
      connect(lED6.pin_n, lED5.pin_n)
        annotation (Line(points={{80,13},{80,7}}, color={0,0,255}));
      connect(lED5.pin_n, lED.pin_n)
        annotation (Line(points={{80,7},{80,1}}, color={0,0,255}));
      connect(lED.pin_n, lED1.pin_n)
        annotation (Line(points={{80,1},{80,-5}}, color={0,0,255}));
      connect(lED1.pin_n, lED2.pin_n)
        annotation (Line(points={{80,-5},{80,-11}}, color={0,0,255}));
      connect(lED2.pin_n, lED3.pin_n)
        annotation (Line(points={{80,-11},{80,-17}}, color={0,0,255}));
      connect(lED3.pin_n, lED4.pin_n)
        annotation (Line(points={{80,-17},{80,-23}}, color={0,0,255}));
      connect(lED4.pin_n, arduinoUno.GND) annotation (Line(points={{80,-23},{80,-46},
              {1,-46},{1,-32}}, color={0,0,255}));
      connect(lED4.pin_p, arduinoUno.D0) annotation (Line(points={{70,-23},{56,-23},
              {56,-27.2},{40.4875,-27.2}}, color={0,0,255}));
      connect(lED3.pin_p, arduinoUno.D1) annotation (Line(points={{70,-17},{56,-17},
              {56,-21.0909},{40.4875,-21.0909}}, color={0,0,255}));
      connect(lED2.pin_p, arduinoUno.D2) annotation (Line(points={{70,-11},{56,-11},
              {56,-14.1091},{40.4875,-14.1091}}, color={0,0,255}));
      connect(lED1.pin_p, arduinoUno.D3) annotation (Line(points={{70,-5},{56,-5},
              {56,-8},{40.4875,-8}}, color={0,0,255}));
      connect(lED.pin_p, arduinoUno.D4) annotation (Line(points={{70,1},{56,1},{56,
              -1.45455},{40.4875,-1.45455}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(StopTime=10));
    end Example;
  end Examples;
  extends Modelica.Icons.Package;

  package Internal
    extends Modelica.Icons.InternalPackage;
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
</html>",   info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
</html>"));
    end VariablePulseVoltage;

    model DigitalPort

      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-110})));
      Modelica.Blocks.Interfaces.BooleanInput isInput annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,40})));
      Modelica.Electrical.Analog.Interfaces.Pin pin
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Basic.Ground ground1 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={30,0})));
      Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-78})));
      Modelica.Blocks.Interfaces.RealInput pulseWidth
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,-40})));
      Internal.VariablePulseVoltage variablePulseVoltage(V=5, period=1/480)
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={0,30})));
      Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch(Goff=
           1e-9)
        annotation (Placement(transformation(extent={{-10,10},{10,-10}},
            rotation=180,
            origin={40,60})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e5) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,-30})));
    equation
      connect(potentialSensor.phi, y) annotation (Line(points={{-2.22045e-015,-89},
              {0,-89},{0,-110}},
                               color={0,0,127}));
      connect(variablePulseVoltage.pulseWidth, pulseWidth) annotation (Line(
            points={{-8,42},{-120,42},{-120,-40}},           color={0,0,127}));
      connect(ground1.p, variablePulseVoltage.n)
        annotation (Line(points={{20,0},{14,0},{0,0},{0,20}}, color={0,0,255}));
      connect(idealOpeningSwitch.p, pin)
        annotation (Line(points={{50,60},{100,60},{100,0}},
                                                        color={0,0,255}));
      connect(idealOpeningSwitch.n, variablePulseVoltage.p) annotation (Line(
            points={{30,60},{30,60},{1.77636e-015,60},{1.77636e-015,40}},
                                                              color={0,0,255}));
      connect(idealOpeningSwitch.control, isInput) annotation (Line(points={{40,67},
              {40,92},{40,40},{-120,40}},          color={255,0,255}));
      connect(resistor1.n, ground1.p)
        annotation (Line(points={{6.66134e-016,-20},{0,-20},{0,6.66134e-016},{20,6.66134e-016}},
                                                              color={0,0,255}));
      connect(potentialSensor.p, pin) annotation (Line(points={{1.77636e-015,-68},
              {1.77636e-015,-52},{100,-52},{100,0}},
                                      color={0,0,255}));
      connect(resistor1.p, potentialSensor.p) annotation (Line(points={{-6.66134e-016,
              -40},{-6.66134e-016,-68},{1.77636e-015,-68}},
                                                   color={0,0,255}));
      connect(pin, pin)
        annotation (Line(points={{100,0},{100,26},{100,0}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end DigitalPort;

    model DigitalPortTest

      Internal.DigitalPort digitalPort
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

    model AnalogPort

      Modelica.Electrical.Analog.Interfaces.Pin pin
        annotation (Placement(transformation(extent={{-108,-10},{-88,10}})));
    equation
    pin.i=0;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end AnalogPort;
  end Internal;
  annotation (uses(Modelica(version="3.2.2")), Icon(graphics={
        Ellipse(
          extent={{-80,38},{4,-34}},
          lineColor={0,135,143},
          lineThickness=0.5),
        Ellipse(
          extent={{4,38},{88,-34}},
          lineColor={0,135,143},
          lineThickness=0.5),
        Line(
          points={{-56,4},{-24,4}},
          color={0,135,143},
          smooth=Smooth.Bezier),
        Line(
          points={{28,2},{68,2}},
          color={0,135,143},
          smooth=Smooth.Bezier),
        Line(
          points={{-20,-4.8986e-016},{12,0}},
          color={0,135,143},
          smooth=Smooth.Bezier,
          origin={46,4},
          rotation=90)}));
end Arduino;
