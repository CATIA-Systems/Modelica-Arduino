within Arduino.Components;
model IC74HC595N4
  Modelica.Electrical.Analog.Interfaces.PositivePin Q0 annotation (Placement(
        transformation(extent={{-210,130},{-190,150}}),
                                                     iconTransformation(extent={{-110,
            130},{-90,150}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin Q1 annotation (Placement(
        transformation(extent={{-210,90},{-190,110}}),   iconTransformation(
          extent={{-110,90},{-90,110}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin Q2 annotation (Placement(
        transformation(extent={{-210,50},{-190,70}}),   iconTransformation(
          extent={{-110,50},{-90,70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin Q3 annotation (Placement(
        transformation(extent={{-210,10},{-190,30}}),  iconTransformation(extent={{-110,10},
            {-90,30}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin Q4 annotation (Placement(
        transformation(extent={{-210,-30},{-190,-10}}),iconTransformation(extent={{-110,
            -30},{-90,-10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin Q5 annotation (Placement(
        transformation(extent={{-210,-70},{-190,-50}}),  iconTransformation(
          extent={{-110,-70},{-90,-50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin Q6 annotation (Placement(
        transformation(extent={{-210,-110},{-190,-90}}), iconTransformation(
          extent={{-110,-110},{-90,-90}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin Q7 annotation (Placement(
        transformation(extent={{-210,-150},{-190,-130}}), iconTransformation(
          extent={{-110,-150},{-90,-130}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin GND annotation (Placement(
        transformation(extent={{-10,-210},{10,-190}}),    iconTransformation(
          extent={{-10,-210},{10,-190}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin V_CC
    "Positive supply voltage" annotation (Placement(transformation(extent={{-10,190},
            {10,210}}),       iconTransformation(extent={{-10,190},{10,210}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin DS annotation (Placement(
        transformation(extent={{190,90},{210,110}}),iconTransformation(extent={{90,90},
            {110,110}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin OE
    "Output enable (active LOW)" annotation (Placement(transformation(extent={{190,50},
            {210,70}}),         iconTransformation(extent={{90,50},{110,70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin ST_CP
    "Storage register clock input" annotation (Placement(transformation(extent={{190,10},
            {210,30}}),             iconTransformation(extent={{90,10},{110,30}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin SH_CP
    "Shift register clock input" annotation (Placement(transformation(extent={{190,-30},
            {210,-10}}),          iconTransformation(extent={{90,-30},{110,-10}})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-170,140})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch1 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-170,100})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch2 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-170,60})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch3 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-170,20})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch4 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-170,-20})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch5 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-170,-60})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch6 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-170,-100})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch7 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-170,-140})));
  ResettableDFlipFlop
             flipFlop0 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,120})));
  DFlipFlop latch0 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,120})));
  Modelica.Blocks.Logical.And and0 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,120})));
  ResettableDFlipFlop
             flipFlop1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,80})));
  DFlipFlop latch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,80})));
  Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,80})));
  ResettableDFlipFlop
             flipFlop2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,40})));
  DFlipFlop latch2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,40})));
  Modelica.Blocks.Logical.And and2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,40})));
  ResettableDFlipFlop
             flipFlop3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  DFlipFlop latch3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,0})));
  Modelica.Blocks.Logical.And and3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,0})));
  ResettableDFlipFlop
             flipFlop4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-40})));
  DFlipFlop latch4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-40})));
  Modelica.Blocks.Logical.And and4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-40})));
  ResettableDFlipFlop
             flipFlop5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-80})));
  DFlipFlop latch5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-80})));
  Modelica.Blocks.Logical.And and5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-80})));
  ResettableDFlipFlop
             flipFlop6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-120})));
  DFlipFlop latch6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-120})));
  Modelica.Blocks.Logical.And and6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-120})));
  ResettableDFlipFlop
             flipFlop7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-160})));
  DFlipFlop latch7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-160})));
  Modelica.Blocks.Logical.And and7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-160})));
  Modelica.Electrical.Analog.Interfaces.PositivePin MR "Master reset"
    annotation (Placement(transformation(extent={{190,-70},{210,-50}}),
        iconTransformation(extent={{90,-70},{110,-50}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressionMR(y=not ((V_CC.v
         - GND.v)*0.6 < MR.v)) annotation (Placement(transformation(
        extent={{30,-10},{-30,10}},
        rotation=0,
        origin={150,150})));
  Modelica.Electrical.Analog.Basic.Resistor resistorMR(R=1e5) annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={170,-60})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressionOE(y=not ((V_CC.v
         - GND.v)*0.6 < OE.v)) annotation (Placement(transformation(
        extent={{30,-10},{-30,10}},
        rotation=180,
        origin={-110,170})));
  Modelica.Electrical.Analog.Basic.Resistor resistorMR1(R=1e5)
                                                              annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={170,60})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressionDS(y=(V_CC.v - GND.v)
        *0.6 < DS.v) annotation (Placement(transformation(
        extent={{30,-10},{-30,10}},
        rotation=0,
        origin={150,130})));
  Modelica.Electrical.Analog.Basic.Resistor resistorMR2(R=1e5)
                                                              annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={170,100})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressionST_CP(y=(V_CC.v -
        GND.v)*0.6 < ST_CP.v) annotation (Placement(transformation(
        extent={{30,-10},{-30,10}},
        rotation=180,
        origin={-110,190})));
  Modelica.Electrical.Analog.Basic.Resistor resistorMR3(R=1e5)
                                                              annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={170,20})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressionSH_CP(y=(V_CC.v -
        GND.v)*0.6 < SH_CP.v) annotation (Placement(transformation(
        extent={{30,-10},{-30,10}},
        rotation=0,
        origin={150,170})));
  Modelica.Electrical.Analog.Basic.Resistor resistorMR4(R=1e5)
                                                              annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={170,-20})));
  Modelica.Electrical.Analog.Interfaces.PositivePin Q7S "Serial data output"
    annotation (Placement(transformation(extent={{190,-110},{210,-90}}),
        iconTransformation(extent={{90,-110},{110,-90}})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch8 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-100})));
equation
  connect(switch.p, Q0)
    annotation (Line(points={{-180,140},{-200,140}},
                                                   color={0,0,255}));
  connect(V_CC, switch.n2) annotation (Line(points={{0,200},{0,154},{-120,154},
          {-120,140},{-160,140}},
                           color={0,0,255}));
  connect(switch3.p, Q3)
    annotation (Line(points={{-180,20},{-200,20}}, color={0,0,255}));
  connect(switch1.p, Q1)
    annotation (Line(points={{-180,100},{-200,100}}, color={0,0,255}));
  connect(switch2.p, Q2)
    annotation (Line(points={{-180,60},{-200,60}},   color={0,0,255}));
  connect(switch4.p, Q4)
    annotation (Line(points={{-180,-20},{-200,-20}},
                                                   color={0,0,255}));
  connect(switch5.p, Q5)
    annotation (Line(points={{-180,-60},{-200,-60}}, color={0,0,255}));
  connect(switch6.p, Q6)
    annotation (Line(points={{-180,-100},{-200,-100}},
                                                     color={0,0,255}));
  connect(switch7.p, Q7)
    annotation (Line(points={{-180,-140},{-200,-140}}, color={0,0,255}));
  connect(switch7.n1, GND) annotation (Line(points={{-160,-144},{-140,-144},{
          -140,-190},{0,-190},{0,-200}},
                                   color={0,0,255}));
  connect(switch6.n1, GND) annotation (Line(points={{-160,-104},{-140,-104},{
          -140,-190},{0,-190},{0,-200}},
                              color={0,0,255}));
  connect(switch5.n1, GND) annotation (Line(points={{-160,-64},{-140,-64},{-140,
          -190},{0,-190},{0,-200}},
                              color={0,0,255}));
  connect(switch4.n1, GND) annotation (Line(points={{-160,-24},{-140,-24},{-140,
          -190},{0,-190},{0,-200}},
                              color={0,0,255}));
  connect(switch3.n1, GND) annotation (Line(points={{-160,16},{-140,16},{-140,
          -190},{0,-190},{0,-200}},
                              color={0,0,255}));
  connect(switch2.n1, GND) annotation (Line(points={{-160,56},{-140,56},{-140,
          -190},{0,-190},{0,-200}},
                              color={0,0,255}));
  connect(switch1.n1, GND) annotation (Line(points={{-160,96},{-140,96},{-140,
          -190},{0,-190},{0,-200}},
                              color={0,0,255}));
  connect(switch.n1, GND) annotation (Line(points={{-160,136},{-140,136},{-140,
          -190},{0,-190},{0,-200}},             color={0,0,255}));
  connect(flipFlop0.Q, latch0.D) annotation (Line(points={{46,109},{46,104},{8,
          104},{8,138},{-4,138},{-4,132}},         color={255,0,255}));
  connect(latch0.Q, and0.u1) annotation (Line(points={{-4,109},{-4,104},{-34,
          104},{-34,120},{-38,120}}, color={255,0,255}));
  connect(and0.y, switch.control) annotation (Line(points={{-61,120},{-170,120},
          {-170,128}},                                      color={255,0,255}));
  connect(flipFlop1.Q, latch1.D) annotation (Line(points={{46,69},{46,64},{8,64},
          {8,98},{-4,98},{-4,92}},            color={255,0,255}));
  connect(latch1.Q, and1.u1) annotation (Line(points={{-4,69},{-4,64},{-34,64},
          {-34,80},{-38,80}}, color={255,0,255}));
  connect(flipFlop1.D, latch0.D) annotation (Line(points={{46,92},{46,104},{8,
          104},{8,138},{-4,138},{-4,132}},         color={255,0,255}));
  connect(latch1.C, latch0.C) annotation (Line(points={{-16,92},{-16,98},{-24,
          98},{-24,138},{-16,138},{-16,132}},  color={255,0,255}));
  connect(flipFlop1.C, flipFlop0.C) annotation (Line(points={{34,92},{34,98},{
          14,98},{14,138},{34,138},{34,132}},color={255,0,255}));
  connect(and1.u2, and0.u2) annotation (Line(points={{-38,88},{-30,88},{-30,128},
          {-38,128}}, color={255,0,255}));
  connect(flipFlop2.Q, latch2.D) annotation (Line(points={{46,29},{46,24},{8,24},
          {8,58},{-4,58},{-4,52}},         color={255,0,255}));
  connect(latch2.Q, and2.u1) annotation (Line(points={{-4,29},{-4,24},{-34,24},
          {-34,40},{-38,40}}, color={255,0,255}));
  connect(flipFlop2.D, latch1.D) annotation (Line(points={{46,52},{46,64},{8,64},
          {8,98},{-4,98},{-4,92}},            color={255,0,255}));
  connect(flipFlop2.C, flipFlop0.C) annotation (Line(points={{34,52},{34,58},{
          14,58},{14,138},{34,138},{34,132}},
                                         color={255,0,255}));
  connect(latch2.C, latch0.C) annotation (Line(points={{-16,52},{-16,58},{-24,
          58},{-24,138},{-16,138},{-16,132}}, color={255,0,255}));
  connect(and2.u2, and0.u2) annotation (Line(points={{-38,48},{-30,48},{-30,128},
          {-38,128}}, color={255,0,255}));
  connect(flipFlop3.Q, latch3.D) annotation (Line(points={{46,-11},{46,-16},{8,
          -16},{8,18},{-4,18},{-4,12}},    color={255,0,255}));
  connect(latch3.Q, and3.u1) annotation (Line(points={{-4,-11},{-4,-16},{-34,
          -16},{-34,0},{-38,0}},
                              color={255,0,255}));
  connect(and3.u2, and0.u2) annotation (Line(points={{-38,8},{-30,8},{-30,128},
          {-38,128}}, color={255,0,255}));
  connect(flipFlop3.D, latch2.D) annotation (Line(points={{46,12},{46,24},{8,24},
          {8,58},{-4,58},{-4,52}},         color={255,0,255}));
  connect(latch3.C, latch0.C) annotation (Line(points={{-16,12},{-16,18},{-24,
          18},{-24,138},{-16,138},{-16,132}}, color={255,0,255}));
  connect(flipFlop3.C, flipFlop0.C) annotation (Line(points={{34,12},{34,18},{
          14,18},{14,138},{34,138},{34,132}},
                                         color={255,0,255}));
  connect(flipFlop4.Q, latch4.D) annotation (Line(points={{46,-51},{46,-56},{8,
          -56},{8,-22},{-4,-22},{-4,-28}},         color={255,0,255}));
  connect(latch4.Q, and4.u1) annotation (Line(points={{-4,-51},{-4,-56},{-34,
          -56},{-34,-40},{-38,-40}}, color={255,0,255}));
  connect(flipFlop4.D, latch3.D) annotation (Line(points={{46,-28},{46,-16},{8,
          -16},{8,18},{-4,18},{-4,12}},    color={255,0,255}));
  connect(flipFlop4.C, flipFlop0.C) annotation (Line(points={{34,-28},{34,-22},
          {14,-22},{14,138},{34,138},{34,132}},
                                             color={255,0,255}));
  connect(latch4.C, latch0.C) annotation (Line(points={{-16,-28},{-16,-22},{-24,
          -22},{-24,138},{-16,138},{-16,132}}, color={255,0,255}));
  connect(and4.u2, and0.u2) annotation (Line(points={{-38,-32},{-30,-32},{-30,
          128},{-38,128}}, color={255,0,255}));
  connect(flipFlop5.Q, latch5.D) annotation (Line(points={{46,-91},{46,-96},{8,
          -96},{8,-62},{-4,-62},{-4,-68}},         color={255,0,255}));
  connect(latch5.Q, and5.u1) annotation (Line(points={{-4,-91},{-4,-96},{-34,
          -96},{-34,-80},{-38,-80}}, color={255,0,255}));
  connect(flipFlop5.D, latch4.D) annotation (Line(points={{46,-68},{46,-56},{8,
          -56},{8,-22},{-4,-22},{-4,-28}},         color={255,0,255}));
  connect(flipFlop5.C, flipFlop0.C) annotation (Line(points={{34,-68},{34,-62},
          {14,-62},{14,138},{34,138},{34,132}},
                                             color={255,0,255}));
  connect(latch5.C, latch0.C) annotation (Line(points={{-16,-68},{-16,-62},{-24,
          -62},{-24,138},{-16,138},{-16,132}}, color={255,0,255}));
  connect(and5.u2, and0.u2) annotation (Line(points={{-38,-72},{-30,-72},{-30,
          128},{-38,128}}, color={255,0,255}));
  connect(flipFlop6.Q, latch6.D) annotation (Line(points={{46,-131},{46,-136},{
          8,-136},{8,-102},{-4,-102},{-4,-108}},    color={255,0,255}));
  connect(latch6.Q, and6.u1) annotation (Line(points={{-4,-131},{-4,-136},{-34,
          -136},{-34,-120},{-38,-120}},     color={255,0,255}));
  connect(flipFlop6.D, latch5.D) annotation (Line(points={{46,-108},{46,-96},{8,
          -96},{8,-62},{-4,-62},{-4,-68}},         color={255,0,255}));
  connect(flipFlop6.C, flipFlop0.C) annotation (Line(points={{34,-108},{34,-102},
          {14,-102},{14,138},{34,138},{34,132}},
                                             color={255,0,255}));
  connect(latch6.C, latch0.C) annotation (Line(points={{-16,-108},{-16,-102},{
          -24,-102},{-24,138},{-16,138},{-16,132}},
                                               color={255,0,255}));
  connect(and6.u2, and0.u2) annotation (Line(points={{-38,-112},{-30,-112},{-30,
          128},{-38,128}}, color={255,0,255}));
  connect(flipFlop7.Q, latch7.D) annotation (Line(points={{46,-171},{46,-176},{
          8,-176},{8,-142},{-4,-142},{-4,-148}},       color={255,0,255}));
  connect(latch7.Q, and7.u1) annotation (Line(points={{-4,-171},{-4,-176},{-34,
          -176},{-34,-160},{-38,-160}},     color={255,0,255}));
  connect(flipFlop7.D, latch6.D) annotation (Line(points={{46,-148},{46,-136},{
          8,-136},{8,-102},{-4,-102},{-4,-108}},    color={255,0,255}));
  connect(flipFlop7.C, flipFlop0.C) annotation (Line(points={{34,-148},{34,-142},
          {14,-142},{14,138},{34,138},{34,132}},
                                               color={255,0,255}));
  connect(latch7.C, latch0.C) annotation (Line(points={{-16,-148},{-16,-142},{
          -24,-142},{-24,138},{-16,138},{-16,132}}, color={255,0,255}));
  connect(and7.u2, and0.u2) annotation (Line(points={{-38,-152},{-30,-152},{-30,
          128},{-38,128}}, color={255,0,255}));
  connect(and7.y, switch7.control) annotation (Line(points={{-61,-160},{-170,
          -160},{-170,-152}},                         color={255,0,255}));
  connect(and6.y, switch6.control) annotation (Line(points={{-61,-120},{-170,
          -120},{-170,-112}},                      color={255,0,255}));
  connect(and5.y, switch5.control) annotation (Line(points={{-61,-80},{-170,-80},
          {-170,-72}},                       color={255,0,255}));
  connect(and4.y, switch4.control) annotation (Line(points={{-61,-40},{-170,-40},
          {-170,-32}},                 color={255,0,255}));
  connect(and3.y, switch3.control) annotation (Line(points={{-61,8.88178e-16},{
          -100,8.88178e-16},{-100,0},{-170,0},{-170,8}},
                                          color={255,0,255}));
  connect(and2.y, switch2.control) annotation (Line(points={{-61,40},{-170,40},
          {-170,48}},                     color={255,0,255}));
  connect(and1.y, switch1.control) annotation (Line(points={{-61,80},{-170,80},
          {-170,88}},                        color={255,0,255}));
  connect(flipFlop1.R, flipFlop0.R) annotation (Line(points={{28,80},{20,80},{
          20,120},{28,120}},
                         color={255,0,255}));
  connect(flipFlop2.R, flipFlop0.R) annotation (Line(points={{28,40},{20,40},{
          20,120},{28,120}},
                         color={255,0,255}));
  connect(flipFlop3.R, flipFlop0.R) annotation (Line(points={{28,0},{20,0},{20,
          120},{28,120}},color={255,0,255}));
  connect(flipFlop4.R, flipFlop0.R) annotation (Line(points={{28,-40},{20,-40},
          {20,120},{28,120}},
                         color={255,0,255}));
  connect(flipFlop5.R, flipFlop0.R) annotation (Line(points={{28,-80},{20,-80},
          {20,120},{28,120}},
                         color={255,0,255}));
  connect(flipFlop6.R, flipFlop0.R) annotation (Line(points={{28,-120},{20,-120},
          {20,120},{28,120}},
                            color={255,0,255}));
  connect(flipFlop7.R, flipFlop0.R) annotation (Line(points={{28,-160},{20,-160},
          {20,120},{28,120}},
                            color={255,0,255}));
  connect(booleanExpressionMR.y, flipFlop0.R)
    annotation (Line(points={{117,150},{20,150},{20,120},{28,120}},
                                                         color={255,0,255}));
  connect(resistorMR.n, MR)
    annotation (Line(points={{180,-60},{200,-60}},   color={0,0,255}));
  connect(resistorMR.p, GND) annotation (Line(points={{160,-60},{140,-60},{140,
          -190},{0,-190},{0,-200}},                       color={0,0,255}));
  connect(booleanExpressionOE.y, and0.u2) annotation (Line(points={{-77,170},{
          -30,170},{-30,128},{-38,128}},
                               color={255,0,255}));
  connect(resistorMR1.n, OE)
    annotation (Line(points={{180,60},{200,60}}, color={0,0,255}));
  connect(booleanExpressionDS.y, flipFlop0.D) annotation (Line(points={{117,130},
          {80,130},{80,140},{46,140},{46,132}},
                                       color={255,0,255}));
  connect(resistorMR2.p, DS)
    annotation (Line(points={{180,100},{200,100}},
                                                 color={0,0,255}));
  connect(resistorMR2.n, GND) annotation (Line(points={{160,100},{140,100},{140,
          -190},{0,-190},{0,-200}},                   color={0,0,255}));
  connect(resistorMR3.p, ST_CP)
    annotation (Line(points={{180,20},{200,20}},   color={0,0,255}));
  connect(resistorMR3.n, GND) annotation (Line(points={{160,20},{140,20},{140,
          -190},{0,-190},{0,-200}},                   color={0,0,255}));
  connect(booleanExpressionST_CP.y, latch0.C)
    annotation (Line(points={{-77,190},{-16,190},{-16,132}},
                                                   color={255,0,255}));
  connect(SH_CP, resistorMR4.p)
    annotation (Line(points={{200,-20},{180,-20}}, color={0,0,255}));
  connect(resistorMR4.n, GND) annotation (Line(points={{160,-20},{140,-20},{140,
          -190},{0,-190},{0,-200}},                   color={0,0,255}));
  connect(booleanExpressionSH_CP.y, flipFlop0.C) annotation (Line(points={{117,170},
          {34,170},{34,132}},               color={255,0,255}));
  connect(switch1.n2, switch.n2) annotation (Line(points={{-160,100},{-120,100},
          {-120,140},{-160,140}},                      color={0,0,255}));
  connect(switch2.n2, switch.n2) annotation (Line(points={{-160,60},{-120,60},{
          -120,140},{-160,140}},                       color={0,0,255}));
  connect(switch3.n2, switch.n2) annotation (Line(points={{-160,20},{-120,20},{
          -120,140},{-160,140}},                      color={0,0,255}));
  connect(switch4.n2, switch.n2) annotation (Line(points={{-160,-20},{-120,-20},
          {-120,140},{-160,140}},                     color={0,0,255}));
  connect(switch5.n2, switch.n2) annotation (Line(points={{-160,-60},{-120,-60},
          {-120,140},{-160,140}},                      color={0,0,255}));
  connect(switch6.n2, switch.n2) annotation (Line(points={{-160,-100},{-120,
          -100},{-120,140},{-160,140}},                color={0,0,255}));
  connect(switch7.n2, switch.n2) annotation (Line(points={{-160,-140},{-120,
          -140},{-120,140},{-160,140}},                      color={0,0,255}));
  connect(resistorMR1.p, GND) annotation (Line(points={{160,60},{140,60},{140,
          -190},{0,-190},{0,-200}}, color={0,0,255}));
  connect(switch8.p, Q7S)
    annotation (Line(points={{180,-100},{200,-100}}, color={0,0,255}));
  connect(switch8.control, latch7.D) annotation (Line(points={{170,-112},{170,
          -176},{8,-176},{8,-142},{-4,-142},{-4,-148}}, color={255,0,255}));
  connect(switch8.n1, GND) annotation (Line(points={{160,-104},{140,-104},{140,
          -190},{0,-190},{0,-200}}, color={0,0,255}));
  connect(switch8.n2, switch.n2) annotation (Line(points={{160,-100},{60,-100},
          {60,154},{-120,154},{-120,140},{-160,140}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-200},
            {100,200}}),       graphics={
        Rectangle(
          extent={{-100,200},{100,-200}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,110},{0,90}},
          textColor={0,0,255},
          textString="Q1",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-80,70},{0,50}},
          textColor={0,0,255},
          textString="Q2",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-80,30},{0,10}},
          textColor={0,0,255},
          textString="Q3",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-80,-10},{0,-30}},
          textColor={0,0,255},
          textString="Q4",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-80,-50},{0,-70}},
          textColor={0,0,255},
          textString="Q5",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-80,-90},{0,-110}},
          textColor={0,0,255},
          textString="Q6",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-80,-130},{0,-150}},
          textColor={0,0,255},
          textString="Q7",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-40,-160},{40,-180}},
          textColor={0,0,255},
          textString="GND"),
        Text(
          extent={{-40,180},{40,160}},
          textColor={0,0,255},
          textString="VCC"),
        Text(
          extent={{-80,150},{0,130}},
          textColor={0,0,255},
          horizontalAlignment=TextAlignment.Left,
          textString="Q0"),
        Text(
          extent={{0,110},{80,90}},
          textColor={0,0,255},
          horizontalAlignment=TextAlignment.Right,
          textString="DS"),
        Text(
          extent={{0,70},{80,50}},
          textColor={0,0,255},
          horizontalAlignment=TextAlignment.Right,
          textString="OE"),
        Text(
          extent={{0,30},{80,10}},
          textColor={0,0,255},
          horizontalAlignment=TextAlignment.Right,
          textString="ST_CP"),
        Text(
          extent={{0,-10},{80,-30}},
          textColor={0,0,255},
          horizontalAlignment=TextAlignment.Right,
          textString="SH_CP"),
        Text(
          extent={{0,-48},{78,-68}},
          textColor={0,0,255},
          horizontalAlignment=TextAlignment.Right,
          textString="MR"),
        Text(
          extent={{0,-90},{78,-110}},
          textColor={0,0,255},
          horizontalAlignment=TextAlignment.Right,
          textString="Q7S")}),   Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-200,-200},{200,200}})));
end IC74HC595N4;
