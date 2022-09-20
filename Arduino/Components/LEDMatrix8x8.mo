within Arduino.Components;
model LEDMatrix8x8
  Modelica.Electrical.Analog.Interfaces.Pin R1
    annotation (Placement(transformation(extent={{130,230},{150,250}})));
  Modelica.Electrical.Analog.Interfaces.Pin R2
    annotation (Placement(transformation(extent={{-70,230},{-50,250}})));
  Modelica.Electrical.Analog.Interfaces.Pin R3
    annotation (Placement(transformation(extent={{130,-250},{150,-230}})));
  Modelica.Electrical.Analog.Interfaces.Pin R4
    annotation (Placement(transformation(extent={{10,230},{30,250}})));
  Modelica.Electrical.Analog.Interfaces.Pin R5
    annotation (Placement(transformation(extent={{-150,-250},{-130,-230}})));
  Modelica.Electrical.Analog.Interfaces.Pin R6
    annotation (Placement(transformation(extent={{90,-250},{110,-230}})));
  Modelica.Electrical.Analog.Interfaces.Pin R7
    annotation (Placement(transformation(extent={{-110,-250},{-90,-230}})));
  Modelica.Electrical.Analog.Interfaces.Pin R8
    annotation (Placement(transformation(extent={{10,-250},{30,-230}})));
  Modelica.Electrical.Analog.Interfaces.Pin C1
    annotation (Placement(transformation(extent={{-30,230},{-10,250}})));
  Modelica.Electrical.Analog.Interfaces.Pin C2
    annotation (Placement(transformation(extent={{-70,-250},{-50,-230}})));
  Modelica.Electrical.Analog.Interfaces.Pin C3
    annotation (Placement(transformation(extent={{-30,-250},{-10,-230}})));
  Modelica.Electrical.Analog.Interfaces.Pin C4
    annotation (Placement(transformation(extent={{90,230},{110,250}})));
  Modelica.Electrical.Analog.Interfaces.Pin C5
    annotation (Placement(transformation(extent={{50,-250},{70,-230}})));
  Modelica.Electrical.Analog.Interfaces.Pin C6
    annotation (Placement(transformation(extent={{50,230},{70,250}})));
  Modelica.Electrical.Analog.Interfaces.Pin C7
    annotation (Placement(transformation(extent={{-110,230},{-90,250}})));
  Modelica.Electrical.Analog.Interfaces.Pin C8
    annotation (Placement(transformation(extent={{-150,230},{-130,250}})));
  LED led11 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,140})));
  LED led12 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,140})));
  LED led13 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,140})));
  LED led14 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,140})));
  LED led15 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,140})));
  LED led16 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,140})));
  LED led17 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,140})));
  LED led18 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,140})));
  LED led21 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,100})));
  LED led22 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,100})));
  LED led23 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,100})));
  LED led24 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,100})));
  LED led25 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,100})));
  LED led26 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,100})));
  LED led27 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,100})));
  LED led28 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,100})));
  LED led31 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,60})));
  LED led32 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,60})));
  LED led33 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,60})));
  LED led34 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,60})));
  LED led35 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,60})));
  LED led36 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,60})));
  LED led37 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,60})));
  LED led38 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,60})));
  LED led41 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,20})));
  LED led42 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,20})));
  LED led43 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,20})));
  LED led44 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,20})));
  LED led45 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,20})));
  LED led46 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,20})));
  LED led47 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,20})));
  LED led48 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,20})));
  LED led51 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,-20})));
  LED led52 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,-20})));
  LED led53 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,-20})));
  LED led54 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,-20})));
  LED led55 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,-20})));
  LED led56 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,-20})));
  LED led57 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,-20})));
  LED led58 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,-20})));
  LED led61 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,-60})));
  LED led62 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,-60})));
  LED led63 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,-60})));
  LED led64 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,-60})));
  LED led65 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,-60})));
  LED led66 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,-60})));
  LED led67 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,-60})));
  LED led68 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,-60})));
  LED led71 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,-100})));
  LED led72 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,-100})));
  LED led73 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,-100})));
  LED led74 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,-100})));
  LED led75 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,-100})));
  LED led76 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,-100})));
  LED led77 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,-100})));
  LED led78 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,-100})));
  LED led81 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,-140})));
  LED led82 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,-140})));
  LED led83 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,-140})));
  LED led84 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,-140})));
  LED led85 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,-140})));
  LED led86 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,-140})));
  LED led87 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={100,-140})));
  LED led88 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,-140})));
equation
  connect(R1, led11.p) annotation (Line(points={{140,240},{140,160},{-140,160},{
          -140,150}}, color={0,0,255}));
  connect(R2, led21.p) annotation (Line(points={{-60,240},{-60,200},{180,200},{180,
          120},{-140,120},{-140,110}}, color={0,0,255}));
  connect(R3, R3)
    annotation (Line(points={{140,-240},{140,-240}}, color={0,0,255}));
  connect(R3,led31. p) annotation (Line(points={{140,-240},{140,-220},{200,-220},
          {200,80},{-140,80},{-140,70}}, color={0,0,255}));
  connect(R4,led41. p) annotation (Line(points={{20,240},{20,190},{210,190},{210,
          40},{-140,40},{-140,30}}, color={0,0,255}));
  connect(R5,led58. p) annotation (Line(points={{-140,-240},{-140,-200},{-200,-200},
          {-200,0},{140,0},{140,-10}}, color={0,0,255}));
  connect(R6,led61. p) annotation (Line(points={{100,-240},{100,-200},{190,-200},
          {190,-40},{-140,-40},{-140,-50}}, color={0,0,255}));
  connect(R7,led78. p) annotation (Line(points={{-100,-240},{-100,-180},{-180,-180},
          {-180,-80},{140,-80},{140,-90}}, color={0,0,255}));
  connect(C1,led81. n) annotation (Line(points={{-20,240},{-20,220},{-120,220},{
          -120,-150},{-140,-150}}, color={0,0,255}));
  connect(C2, led12.n) annotation (Line(points={{-60,-240},{-60,-180},{-80,-180},
          {-80,130},{-100,130}}, color={0,0,255}));
  connect(C3, led13.n) annotation (Line(points={{-20,-240},{-20,-180},{-40,-180},
          {-40,130},{-60,130}}, color={0,0,255}));
  connect(C4,led84. n) annotation (Line(points={{100,240},{100,220},{0,220},{0,-150},
          {-20,-150}}, color={0,0,255}));
  connect(C5, led15.n) annotation (Line(points={{60,-240},{60,-160},{40,-160},{40,
          130},{20,130}}, color={0,0,255}));
  connect(C6,led86. n) annotation (Line(points={{60,240},{60,170},{80,170},{80,-150},
          {60,-150}}, color={0,0,255}));
  connect(C7,led87. n) annotation (Line(points={{-100,240},{-100,180},{120,180},
          {120,-150},{100,-150}}, color={0,0,255}));
  connect(C8,led88. n) annotation (Line(points={{-140,240},{-140,210},{160,210},
          {160,-150},{140,-150}}, color={0,0,255}));
  connect(led12.p, led11.p) annotation (Line(points={{-100,150},{-100,160},{-140,
          160},{-140,150}}, color={0,0,255}));
  connect(led13.p, led11.p) annotation (Line(points={{-60,150},{-60,160},{-140,160},
          {-140,150}}, color={0,0,255}));
  connect(led14.p, led11.p) annotation (Line(points={{-20,150},{-20,160},{-140,160},
          {-140,150}}, color={0,0,255}));
  connect(led15.p, led11.p) annotation (Line(points={{20,150},{20,160},{-140,160},
          {-140,150}}, color={0,0,255}));
  connect(led16.p, led11.p) annotation (Line(points={{60,150},{60,160},{-140,160},
          {-140,150}}, color={0,0,255}));
  connect(led17.p, led11.p) annotation (Line(points={{100,150},{100,160},{-140,160},
          {-140,150}}, color={0,0,255}));
  connect(led18.p, led11.p) annotation (Line(points={{140,150},{140,160},{-140,160},
          {-140,150}}, color={0,0,255}));
  connect(led22.p, led21.p) annotation (Line(points={{-100,110},{-100,120},{-140,
          120},{-140,110}}, color={0,0,255}));
  connect(led23.p, led21.p) annotation (Line(points={{-60,110},{-60,120},{-140,120},
          {-140,110}}, color={0,0,255}));
  connect(led24.p, led21.p) annotation (Line(points={{-20,110},{-20,120},{-140,120},
          {-140,110}}, color={0,0,255}));
  connect(led25.p, led21.p) annotation (Line(points={{20,110},{20,120},{-140,120},
          {-140,110}}, color={0,0,255}));
  connect(led26.p, led21.p) annotation (Line(points={{60,110},{60,120},{-140,120},
          {-140,110}}, color={0,0,255}));
  connect(led27.p, led21.p) annotation (Line(points={{100,110},{100,120},{-140,120},
          {-140,110}}, color={0,0,255}));
  connect(led28.p, led21.p) annotation (Line(points={{140,110},{140,120},{-140,120},
          {-140,110}}, color={0,0,255}));
  connect(led32.p,led31. p) annotation (Line(points={{-100,70},{-100,80},{-140,80},
          {-140,70}}, color={0,0,255}));
  connect(led33.p,led31. p) annotation (Line(points={{-60,70},{-60,80},{-140,80},
          {-140,70}}, color={0,0,255}));
  connect(led34.p,led31. p) annotation (Line(points={{-20,70},{-20,80},{-140,80},
          {-140,70}}, color={0,0,255}));
  connect(led35.p,led31. p) annotation (Line(points={{20,70},{20,80},{-140,80},{
          -140,70}}, color={0,0,255}));
  connect(led36.p,led31. p) annotation (Line(points={{60,70},{60,80},{-140,80},{
          -140,70}}, color={0,0,255}));
  connect(led37.p,led31. p) annotation (Line(points={{100,70},{100,80},{-140,80},
          {-140,70}}, color={0,0,255}));
  connect(led38.p,led31. p) annotation (Line(points={{140,70},{140,80},{-140,80},
          {-140,70}}, color={0,0,255}));
  connect(led42.p,led41. p) annotation (Line(points={{-100,30},{-100,40},{-140,40},
          {-140,30}}, color={0,0,255}));
  connect(led43.p,led41. p) annotation (Line(points={{-60,30},{-60,40},{-140,40},
          {-140,30}}, color={0,0,255}));
  connect(led44.p,led41. p) annotation (Line(points={{-20,30},{-20,40},{-140,40},
          {-140,30}}, color={0,0,255}));
  connect(led45.p,led41. p) annotation (Line(points={{20,30},{20,40},{-140,40},{
          -140,30}}, color={0,0,255}));
  connect(led46.p,led41. p) annotation (Line(points={{60,30},{60,40},{-140,40},{
          -140,30}}, color={0,0,255}));
  connect(led47.p,led41. p) annotation (Line(points={{100,30},{100,40},{-140,40},
          {-140,30}}, color={0,0,255}));
  connect(led48.p,led41. p) annotation (Line(points={{140,30},{140,40},{-140,40},
          {-140,30}}, color={0,0,255}));
  connect(led51.p,led58. p) annotation (Line(points={{-140,-10},{-140,0},{140,0},
          {140,-10}}, color={0,0,255}));
  connect(led52.p,led58. p) annotation (Line(points={{-100,-10},{-100,0},{140,0},
          {140,-10}}, color={0,0,255}));
  connect(led53.p,led58. p) annotation (Line(points={{-60,-10},{-60,0},{140,0},{
          140,-10}}, color={0,0,255}));
  connect(led54.p,led58. p) annotation (Line(points={{-20,-10},{-20,0},{140,0},{
          140,-10}}, color={0,0,255}));
  connect(led55.p,led58. p) annotation (Line(points={{20,-10},{20,0},{140,0},{140,
          -10}}, color={0,0,255}));
  connect(led56.p,led58. p) annotation (Line(points={{60,-10},{60,0},{140,0},{140,
          -10}}, color={0,0,255}));
  connect(led57.p,led58. p) annotation (Line(points={{100,-10},{100,0},{140,0},{
          140,-10}}, color={0,0,255}));
  connect(led62.p,led61. p) annotation (Line(points={{-100,-50},{-100,-40},{-140,
          -40},{-140,-50}}, color={0,0,255}));
  connect(led63.p,led61. p) annotation (Line(points={{-60,-50},{-60,-40},{-140,-40},
          {-140,-50}}, color={0,0,255}));
  connect(led64.p,led61. p) annotation (Line(points={{-20,-50},{-20,-40},{-140,-40},
          {-140,-50}}, color={0,0,255}));
  connect(led65.p,led61. p) annotation (Line(points={{20,-50},{20,-40},{-140,-40},
          {-140,-50}}, color={0,0,255}));
  connect(led66.p,led61. p) annotation (Line(points={{60,-50},{60,-40},{-140,-40},
          {-140,-50}}, color={0,0,255}));
  connect(led67.p,led61. p) annotation (Line(points={{100,-50},{100,-40},{-140,-40},
          {-140,-50}}, color={0,0,255}));
  connect(led68.p,led61. p) annotation (Line(points={{140,-50},{140,-40},{-140,-40},
          {-140,-50}}, color={0,0,255}));
  connect(led71.p,led78. p) annotation (Line(points={{-140,-90},{-140,-80},{140,
          -80},{140,-90}}, color={0,0,255}));
  connect(led72.p,led78. p) annotation (Line(points={{-100,-90},{-100,-80},{140,
          -80},{140,-90}}, color={0,0,255}));
  connect(led73.p,led78. p) annotation (Line(points={{-60,-90},{-60,-80},{140,-80},
          {140,-90}}, color={0,0,255}));
  connect(led74.p,led78. p) annotation (Line(points={{-20,-90},{-20,-80},{140,-80},
          {140,-90}}, color={0,0,255}));
  connect(led75.p,led78. p) annotation (Line(points={{20,-90},{20,-80},{140,-80},
          {140,-90}}, color={0,0,255}));
  connect(led76.p,led78. p) annotation (Line(points={{60,-90},{60,-80},{140,-80},
          {140,-90}}, color={0,0,255}));
  connect(led77.p,led78. p) annotation (Line(points={{100,-90},{100,-80},{140,-80},
          {140,-90}}, color={0,0,255}));
  connect(led71.n,led81. n) annotation (Line(points={{-140,-110},{-120,-110},{-120,
          -150},{-140,-150}}, color={0,0,255}));
  connect(led61.n,led81. n) annotation (Line(points={{-140,-70},{-120,-70},{-120,
          -150},{-140,-150}}, color={0,0,255}));
  connect(led51.n,led81. n) annotation (Line(points={{-140,-30},{-120,-30},{-120,
          -150},{-140,-150}}, color={0,0,255}));
  connect(led41.n,led81. n) annotation (Line(points={{-140,10},{-120,10},{-120,-150},
          {-140,-150}}, color={0,0,255}));
  connect(led31.n,led81. n) annotation (Line(points={{-140,50},{-120,50},{-120,-150},
          {-140,-150}}, color={0,0,255}));
  connect(led21.n,led81. n) annotation (Line(points={{-140,90},{-120,90},{-120,-150},
          {-140,-150}}, color={0,0,255}));
  connect(led11.n,led81. n) annotation (Line(points={{-140,130},{-120,130},{-120,
          -150},{-140,-150}}, color={0,0,255}));
  connect(led22.n, led12.n) annotation (Line(points={{-100,90},{-80,90},{-80,130},
          {-100,130}}, color={0,0,255}));
  connect(led32.n, led12.n) annotation (Line(points={{-100,50},{-80,50},{-80,130},
          {-100,130}}, color={0,0,255}));
  connect(led42.n, led12.n) annotation (Line(points={{-100,10},{-80,10},{-80,130},
          {-100,130}}, color={0,0,255}));
  connect(led52.n, led12.n) annotation (Line(points={{-100,-30},{-80,-30},{-80,130},
          {-100,130}}, color={0,0,255}));
  connect(led62.n, led12.n) annotation (Line(points={{-100,-70},{-80,-70},{-80,130},
          {-100,130}}, color={0,0,255}));
  connect(led72.n, led12.n) annotation (Line(points={{-100,-110},{-80,-110},{-80,
          130},{-100,130}}, color={0,0,255}));
  connect(led82.n, led12.n) annotation (Line(points={{-100,-150},{-80,-150},{-80,
          130},{-100,130}}, color={0,0,255}));
  connect(led83.n, led13.n) annotation (Line(points={{-60,-150},{-40,-150},{-40,
          130},{-60,130}}, color={0,0,255}));
  connect(led85.n, led15.n) annotation (Line(points={{20,-150},{40,-150},{40,130},
          {20,130}}, color={0,0,255}));
  connect(led73.n, led13.n) annotation (Line(points={{-60,-110},{-40,-110},{-40,
          130},{-60,130}}, color={0,0,255}));
  connect(led74.n,led84. n) annotation (Line(points={{-20,-110},{0,-110},{0,-150},
          {-20,-150}}, color={0,0,255}));
  connect(led75.n, led15.n) annotation (Line(points={{20,-110},{40,-110},{40,130},
          {20,130}}, color={0,0,255}));
  connect(led76.n,led86. n) annotation (Line(points={{60,-110},{80,-110},{80,-150},
          {60,-150}}, color={0,0,255}));
  connect(led77.n,led87. n) annotation (Line(points={{100,-110},{120,-110},{120,
          -150},{100,-150}}, color={0,0,255}));
  connect(led78.n,led88. n) annotation (Line(points={{140,-110},{160,-110},{160,
          -150},{140,-150}}, color={0,0,255}));
  connect(led63.n, led13.n) annotation (Line(points={{-60,-70},{-40,-70},{-40,130},
          {-60,130}}, color={0,0,255}));
  connect(led64.n,led84. n) annotation (Line(points={{-20,-70},{0,-70},{0,-150},
          {-20,-150}}, color={0,0,255}));
  connect(led65.n, led15.n) annotation (Line(points={{20,-70},{40,-70},{40,130},
          {20,130}}, color={0,0,255}));
  connect(led66.n,led86. n) annotation (Line(points={{60,-70},{80,-70},{80,-150},
          {60,-150}}, color={0,0,255}));
  connect(led67.n,led87. n) annotation (Line(points={{100,-70},{120,-70},{120,-150},
          {100,-150}}, color={0,0,255}));
  connect(led68.n,led88. n) annotation (Line(points={{140,-70},{160,-70},{160,-150},
          {140,-150}}, color={0,0,255}));
  connect(led53.n, led13.n) annotation (Line(points={{-60,-30},{-40,-30},{-40,130},
          {-60,130}}, color={0,0,255}));
  connect(led54.n,led84. n) annotation (Line(points={{-20,-30},{0,-30},{0,-150},
          {-20,-150}}, color={0,0,255}));
  connect(led55.n, led15.n) annotation (Line(points={{20,-30},{40,-30},{40,130},
          {20,130}}, color={0,0,255}));
  connect(led56.n,led86. n) annotation (Line(points={{60,-30},{80,-30},{80,-150},
          {60,-150}}, color={0,0,255}));
  connect(led57.n,led87. n) annotation (Line(points={{100,-30},{120,-30},{120,-150},
          {100,-150}}, color={0,0,255}));
  connect(led58.n,led88. n) annotation (Line(points={{140,-30},{160,-30},{160,-150},
          {140,-150}}, color={0,0,255}));
  connect(led43.n, led13.n) annotation (Line(points={{-60,10},{-40,10},{-40,130},
          {-60,130}}, color={0,0,255}));
  connect(led44.n,led84. n) annotation (Line(points={{-20,10},{0,10},{0,-150},{-20,
          -150}}, color={0,0,255}));
  connect(led45.n, led15.n) annotation (Line(points={{20,10},{40,10},{40,130},{20,
          130}}, color={0,0,255}));
  connect(led46.n,led86. n) annotation (Line(points={{60,10},{80,10},{80,-150},{
          60,-150}}, color={0,0,255}));
  connect(led47.n,led87. n) annotation (Line(points={{100,10},{120,10},{120,-150},
          {100,-150}}, color={0,0,255}));
  connect(led48.n,led88. n) annotation (Line(points={{140,10},{160,10},{160,-150},
          {140,-150}}, color={0,0,255}));
  connect(led33.n, led13.n) annotation (Line(points={{-60,50},{-40,50},{-40,130},
          {-60,130}}, color={0,0,255}));
  connect(led34.n,led84. n) annotation (Line(points={{-20,50},{0,50},{0,-150},{-20,
          -150}}, color={0,0,255}));
  connect(led35.n, led15.n) annotation (Line(points={{20,50},{40,50},{40,130},{20,
          130}}, color={0,0,255}));
  connect(led36.n,led86. n) annotation (Line(points={{60,50},{80,50},{80,-150},{
          60,-150}}, color={0,0,255}));
  connect(led37.n,led87. n) annotation (Line(points={{100,50},{120,50},{120,-150},
          {100,-150}}, color={0,0,255}));
  connect(led38.n,led88. n) annotation (Line(points={{140,50},{160,50},{160,-150},
          {140,-150}}, color={0,0,255}));
  connect(led23.n, led13.n) annotation (Line(points={{-60,90},{-40,90},{-40,130},
          {-60,130}}, color={0,0,255}));
  connect(led24.n,led84. n) annotation (Line(points={{-20,90},{0,90},{0,-150},{-20,
          -150}}, color={0,0,255}));
  connect(led25.n, led15.n) annotation (Line(points={{20,90},{40,90},{40,130},{20,
          130}}, color={0,0,255}));
  connect(led26.n,led86. n) annotation (Line(points={{60,90},{80,90},{80,-150},{
          60,-150}}, color={0,0,255}));
  connect(led27.n,led87. n) annotation (Line(points={{100,90},{120,90},{120,-150},
          {100,-150}}, color={0,0,255}));
  connect(led28.n,led88. n) annotation (Line(points={{140,90},{160,90},{160,-150},
          {140,-150}}, color={0,0,255}));
  connect(led14.n,led84. n) annotation (Line(points={{-20,130},{0,130},{0,-150},
          {-20,-150}}, color={0,0,255}));
  connect(led16.n,led86. n) annotation (Line(points={{60,130},{80,130},{80,-150},
          {60,-150}}, color={0,0,255}));
  connect(led17.n,led87. n) annotation (Line(points={{100,130},{120,130},{120,-150},
          {100,-150}}, color={0,0,255}));
  connect(led18.n,led88. n) annotation (Line(points={{140,130},{160,130},{160,-150},
          {140,-150}}, color={0,0,255}));
  connect(R8,led81. p) annotation (Line(points={{20,-240},{20,-180},{180,-180},{
          180,-120},{-140,-120},{-140,-130}}, color={0,0,255}));
  connect(led82.p,led81. p) annotation (Line(points={{-100,-130},{-100,-120},{-140,
          -120},{-140,-130}}, color={0,0,255}));
  connect(led83.p,led81. p) annotation (Line(points={{-60,-130},{-60,-120},{-140,
          -120},{-140,-130}}, color={0,0,255}));
  connect(led84.p,led81. p) annotation (Line(points={{-20,-130},{-20,-120},{-140,
          -120},{-140,-130}}, color={0,0,255}));
  connect(led85.p,led81. p) annotation (Line(points={{20,-130},{20,-120},{-140,-120},
          {-140,-130}}, color={0,0,255}));
  connect(led86.p,led81. p) annotation (Line(points={{60,-130},{60,-120},{-140,-120},
          {-140,-130}}, color={0,0,255}));
  connect(led87.p,led81. p) annotation (Line(points={{100,-130},{100,-120},{-140,
          -120},{-140,-130}}, color={0,0,255}));
  connect(led88.p,led81. p) annotation (Line(points={{140,-130},{140,-120},{-140,
          -120},{-140,-130}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-240,-240},
            {240,240}}), graphics={
        Rectangle(
          extent={{-240,240},{240,-240}},
          fillColor={100,100,100},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
                                          Ellipse(
          extent={{-230,230},{-190,190}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led11.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-170,230},{-130,190}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led12.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-110,230},{-70,190}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led13.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-50,230},{-10,190}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led14.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{10,230},{50,190}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led15.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{70,230},{110,190}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led16.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{130,230},{170,190}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led17.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{190,230},{230,190}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led18.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-230,170},{-190,130}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led21.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-170,170},{-130,130}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led22.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-110,170},{-70,130}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led23.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-50,170},{-10,130}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led24.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{10,170},{50,130}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led25.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{70,170},{110,130}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led26.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{130,170},{170,130}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led27.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{190,170},{230,130}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led28.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-230,110},{-190,70}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led31.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-170,110},{-130,70}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led32.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-110,110},{-70,70}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led33.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-50,110},{-10,70}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led34.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{10,110},{50,70}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led35.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{70,110},{110,70}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led36.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{130,110},{170,70}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led37.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{190,110},{230,70}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led38.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-230,50},{-190,10}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led41.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-170,50},{-130,10}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led42.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-110,50},{-70,10}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led43.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-50,50},{-10,10}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led44.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{10,50},{50,10}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led45.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{70,50},{110,10}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led46.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{130,50},{170,10}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led47.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{190,50},{230,10}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led48.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-230,-10},{-190,-50}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led51.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-170,-10},{-130,-50}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led52.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-110,-10},{-70,-50}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led53.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-50,-10},{-10,-50}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led54.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{10,-10},{50,-50}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led55.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{70,-10},{110,-50}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led56.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{130,-10},{170,-50}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led57.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{190,-10},{230,-50}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led58.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-230,-70},{-190,-110}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led61.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-170,-70},{-130,-110}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led62.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-110,-70},{-70,-110}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led63.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-50,-70},{-10,-110}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led64.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{10,-70},{50,-110}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led65.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{70,-70},{110,-110}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led66.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{130,-70},{170,-110}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led67.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{190,-70},{230,-110}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led68.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-230,-130},{-190,-170}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led71.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-170,-130},{-130,-170}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led72.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-110,-130},{-70,-170}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led73.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-50,-130},{-10,-170}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led74.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{10,-130},{50,-170}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led75.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{70,-130},{110,-170}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led76.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{130,-130},{170,-170}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led77.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{190,-130},{230,-170}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led78.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-230,-190},{-190,-230}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led81.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-170,-190},{-130,-230}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led82.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-110,-190},{-70,-230}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led83.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{-50,-190},{-10,-230}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led84.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{10,-190},{50,-230}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led85.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{70,-190},{110,-230}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led86.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{130,-190},{170,-230}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led87.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid),
                                          Ellipse(
          extent={{190,-190},{230,-230}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor=DynamicSelect({240,240,240}, if led88.mean.y > 1e-4 then {255,40,40} else {240,240,240}),
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-240,-240},{240,240}})));
end LEDMatrix8x8;
