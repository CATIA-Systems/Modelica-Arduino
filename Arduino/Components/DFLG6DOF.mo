within Arduino.Components;
model DFLG6DOF
  Modelica.Mechanics.MultiBody.Parts.BodyBox baseBodyShape(                r(
        displayUnit="mm") = {0,0.05,0}, animation=false)
                                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-250})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox baseBodyShape2(                r(
        displayUnit="mm") = {0,0.015,0}, animation=false)
                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-180})));
  Modelica.Mechanics.MultiBody.Joints.Revolute baseRevolute(
    n={0,1,0},
    cylinderLength(displayUnit="mm") = 0.01,
    cylinderDiameter(displayUnit="mm") = 0.01,
    useAxisFlange=true,
    phi(start=0)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-220})));
  Modelica.Mechanics.MultiBody.Joints.Revolute shoulderRevolute(
    n={0,0,1},
    cylinderDiameter(displayUnit="mm") = 0.001,
    cylinderLength(displayUnit="mm") = 0.07,
    useAxisFlange=true)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-140})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox baseBodyShape8(                r(
        displayUnit="mm") = {0,0.09,0}, animation=false)
                                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-100})));
  Modelica.Mechanics.MultiBody.Joints.Revolute elbowRevolute(
    cylinderDiameter(displayUnit="mm") = 0.001,
    cylinderLength(displayUnit="mm") = 0.07,
    useAxisFlange=true,
    n={0,0,1})    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-60})));

  Modelica.Mechanics.MultiBody.Parts.BodyBox baseBodyShape4(                r(
        displayUnit="mm") = {0,0.089,0}, animation=false)
                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-20})));
  Modelica.Mechanics.MultiBody.Joints.Revolute wristVerRevolute(
    n={0,0,1},
    cylinderDiameter(displayUnit="mm") = 0.001,
    cylinderLength(displayUnit="mm") = 0.07,
    useAxisFlange=true)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,20})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox baseBodyShape5(                r(
        displayUnit="mm") = {-0.027,0.01,0}, animation=false)
                                             annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,60})));

  Modelica.Mechanics.MultiBody.Joints.Revolute wristRotRevolute(
    n={0,1,0},
    cylinderLength(displayUnit="mm") = 0.05,
    cylinderDiameter(displayUnit="mm") = 0.001,
    useAxisFlange=true)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,100})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox baseBodyShape6(                r(
        displayUnit="mm") = {0,0.022,0}, animation=false)
                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,146})));
  Components.BodyShape bodyShape(
    shapeType=
        "modelica://Arduino/Resources/Shapes/I_Rotative_Base_Main_4Servo__7.wrl",
    angles={-90,0,0},
    color={100,100,100},
    r(displayUnit="mm"))
    annotation (Placement(transformation(extent={{60,-290},{80,-270}})));

  Components.BodyShape bodyShape1(
    angles={-90,0,0},
    color={100,100,100},
    r(displayUnit="mm"),
    shapeType=
        "modelica://Arduino/Resources/Shapes/I_Rotative_Base_Top_4Servo__9.wrl",
    icon=
        "modelica://Arduino/Resources/Shapes/I_Rotative_Base_Top_4Servo__9.png")
    annotation (Placement(transformation(extent={{60,-210},{80,-190}})));

  Components.BodyShape bodyShape2(
    angles={-90,0,0},
    color={100,100,100},
    shapeType="modelica://Arduino/Resources/Shapes/I_Case4Servo__10.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Case4Servo__10.png",
    r(displayUnit="mm") = {0.01,-0.013,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,-160})));
  Components.BodyShape bodyShape3(
    angles={-90,0,0},
    shapeType="modelica://Arduino/Resources/Shapes/I_Servo__8.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Servo__8.png",
    r(displayUnit="mm") = {-0.01,0.01,0.018},
    color={50,50,50})
    annotation (Placement(transformation(extent={{100,-170},{120,-150}})));
  Components.BodyShape bodyShape4(
    shapeType="modelica://Arduino/Resources/Shapes/I_Servo_Horn__12.wrl",
    r(displayUnit="mm") = {0,0,-0.025},
    angles={0,-90,0},
    icon="modelica://Arduino/Resources/Shapes/I_Servo_Horn__12.png",
    color={230,230,230})
    annotation (Placement(transformation(extent={{180,-110},{200,-90}})));
  Components.BodyShape bodyShape5(
    r(displayUnit="mm") = {0,0.045,0},
    angles={90,0,90},
    shapeType="modelica://Arduino/Resources/Shapes/I_U4Servo__15.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_U4Servo__15.png",
    color={100,100,100})
    annotation (Placement(transformation(extent={{60,-110},{80,-90}})));
  Components.BodyShape bodyShape6(
    r(displayUnit="mm") = {0,0.045,0},
    shapeType="modelica://Arduino/Resources/Shapes/I_U4Servo__15.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_U4Servo__15.png",
    color={100,100,100},
    angles={-90,0,90})
    annotation (Placement(transformation(extent={{100,-110},{120,-90}})));
  Components.BodyShape bodyShape7(
    shapeType="modelica://Arduino/Resources/Shapes/I_Servo_Horn__12.wrl",
    r(displayUnit="mm") = {0,0,-0.025},
    angles={0,-90,0},
    icon="modelica://Arduino/Resources/Shapes/I_Servo_Horn__12.png",
    color={230,230,230})
    annotation (Placement(transformation(extent={{140,-110},{160,-90}})));
  Components.BodyShape bodyShape8(
    color={100,100,100},
    shapeType="modelica://Arduino/Resources/Shapes/I_Case4Servo__10.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Case4Servo__10.png",
    r(displayUnit="mm") = {-0.014,0.011,0.001},
    angles={-90,90,0})
    annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
  Components.BodyShape bodyShape9(
    shapeType="modelica://Arduino/Resources/Shapes/I_Servo__8.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Servo__8.png",
    color={50,50,50},
    r(displayUnit="mm") = {-0.01,-0.009,0.018},
    angles={-90,-90,0})
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  Components.BodyShape bodyShape10(
    color={100,100,100},
    shapeType="modelica://Arduino/Resources/Shapes/I_L4Servo__21.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_L4Servo__21.png",
    r(displayUnit="mm") = {-0.016,0.043,0},
    angles={90,90,0})
    annotation (Placement(transformation(extent={{140,-70},{160,-50}})));
  Components.BodyShape bodyShape11(
    shapeType="modelica://Arduino/Resources/Shapes/I_U4Servo__15.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_U4Servo__15.png",
    color={100,100,100},
    r(displayUnit="mm") = {0,0.043,0},
    angles={-90,0,90})
    annotation (Placement(transformation(extent={{180,-70},{200,-50}})));
  Components.BodyShape bodyShape12(
    color={100,100,100},
    shapeType="modelica://Arduino/Resources/Shapes/I_Case4Servo__10.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Case4Servo__10.png",
    r(displayUnit="mm") = {-0.014,-0.011,0},
    angles={-90,90,0})
    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Components.BodyShape bodyShape13(
    shapeType="modelica://Arduino/Resources/Shapes/I_Servo__8.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Servo__8.png",
    color={50,50,50},
    r(displayUnit="mm") = {0.01,0.009,0.017},
    angles={-90,90,0})
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Components.BodyShape bodyShape14(
    color={100,100,100},
    shapeType="modelica://Arduino/Resources/Shapes/I_Case4Servo__10.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Case4Servo__10.png",
    r(displayUnit="mm") = {-0.014,-0.003,0.011},
    angles={0,-90,0})
    annotation (Placement(transformation(extent={{140,50},{160,70}})));
  Components.BodyShape bodyShape15(
    shapeType="modelica://Arduino/Resources/Shapes/I_Servo__8.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Servo__8.png",
    color={50,50,50},
    r(displayUnit="mm") = {-0.037,-0.02,-0.009},
    angles={0,-90,0})
    annotation (Placement(transformation(extent={{180,50},{200,70}})));
  Components.BodyShape bodyShape16(
    shapeType="modelica://Arduino/Resources/Shapes/I_Servo_Horn__12.wrl",
    r(displayUnit="mm") = {0,0,-0.025},
    angles={0,-90,0},
    icon="modelica://Arduino/Resources/Shapes/I_Servo_Horn__12.png",
    color={230,230,230})
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(
    n={0,0,1},
    boxWidth(displayUnit="mm") = 0.01,
    boxHeight(displayUnit="mm") = 0.01,
    animation=false,
    useAxisFlange=true,
    s(start=0.027, displayUnit="mm"))
    annotation (Placement(transformation(extent={{-60,170},{-80,190}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute gripperRevolute(
    useAxisFlange=true,
    n={1,0,0},
    cylinderDiameter(displayUnit="mm") = 0.001,
    cylinderLength(displayUnit="mm") = 0.05) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={0,250})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(
    boxWidth(displayUnit="mm") = 0.01,
    boxHeight(displayUnit="mm") = 0.01,
    animation=false,
    useAxisFlange=true,
    n={0,0,-1},
    s(start=-0.027, displayUnit="mm"))
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={70,180})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r(
        displayUnit="mm") = {0,0.002,0}) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={30,180})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r(
        displayUnit="mm") = {0,0.002,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,180})));
  Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T(
    useSupportR=false,
    useSupportT=true,
    ratio=Modelica.Constants.pi/0.025) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-50,210})));
  Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T1(
    useSupportR=false,
    useSupportT=true,
    ratio=Modelica.Constants.pi/0.025) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,210})));
  Components.BodyShape bodyShape17(
    color={50,50,50},
    r(displayUnit="mm"),
    angles={0,90,90},
    shapeType=
        "modelica://Arduino/Resources/Shapes/I_Gripper_Main_4Servo__29.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Gripper_Main_4Servo__29.png")
    annotation (Placement(transformation(extent={{100,130},{120,150}})));
  Components.BodyShape bodyShape18(
    shapeType="modelica://Arduino/Resources/Shapes/I_Servo__8.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Servo__8.png",
    color={50,50,50},
    r(displayUnit="mm") = {-0.032,0.00975,-0.01},
    angles={-90,0,-90})
    annotation (Placement(transformation(extent={{60,130},{80,150}})));
  Components.BodyShape bodyShape19(
    shapeType=
        "modelica://Arduino/Resources/Shapes/I_Gripper_Left_Arm_4Servo__33.wrl",
    icon=
        "modelica://Arduino/Resources/Shapes/I_Gripper_Left_Arm_4Servo__33.png",
    r(displayUnit="mm"),
    angles={0,90,90},
    color={50,50,50})
    annotation (Placement(transformation(extent={{-100,170},{-120,190}})));

  Components.BodyShape bodyShape20(
    r(displayUnit="mm"),
    shapeType=
        "modelica://Arduino/Resources/Shapes/I_Gripper_Right_Arm_4Servo__34.wrl",
    icon=
        "modelica://Arduino/Resources/Shapes/I_Gripper_Right_Arm_4Servo__34.png",
    angles={0,-90,90},
    color={50,50,50})
    annotation (Placement(transformation(extent={{100,170},{120,190}})));

  Components.BodyShape bodyShape21(
    color={50,50,50},
    shapeType=
        "modelica://Arduino/Resources/Shapes/I_Gripper_Came_4Servo__31.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Gripper_Came_4Servo__31.png",
    angles={0,90,0},
    r(displayUnit="mm") = {0.015,0,0})
    annotation (Placement(transformation(extent={{40,260},{60,280}})));
  Components.BodyShape bodyShape22(
    shapeType=
        "modelica://Arduino/Resources/Shapes/I_Gripper_Foam_4Servo__3.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Gripper_Foam_4Servo__3.png",
    color={150,150,150},
    angles={0,90,0},
    r(displayUnit="mm") = {-0.01,0.013,-0.007})
    annotation (Placement(transformation(extent={{-100,200},{-120,220}})));
  Components.BodyShape bodyShape23(
    shapeType=
        "modelica://Arduino/Resources/Shapes/I_Gripper_Foam_4Servo__3.wrl",
    icon="modelica://Arduino/Resources/Shapes/I_Gripper_Foam_4Servo__3.png",
    color={150,150,150},
    angles={0,90,0},
    r(displayUnit="mm") = {-0.01,0.013,0.009})
    annotation (Placement(transformation(extent={{100,200},{120,220}})));
  Components.Servo baseServo(minAngle=-1.5707963267949, maxAngle=
        1.5707963267949)
    annotation (Placement(transformation(extent={{-120,-230},{-100,-210}})));
  Components.Servo shoulderServo(
    minAngle=-1.5707963267949,
    maxAngle=1.5707963267949,
    startAngle=-0.17453292519943)
    annotation (Placement(transformation(extent={{-120,-140},{-100,-120}})));
  Components.Servo elbowServo(
    minAngle=-1.5707963267949,
    maxAngle=1.5707963267949,
    startAngle=-1.4835298641952)
    annotation (Placement(transformation(extent={{-120,-60},{-100,-40}})));
  Components.Servo wristVerServo(
    minAngle=-1.5707963267949,
    maxAngle=1.5707963267949,
    startAngle=0.87266462599716)
    annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
  Components.Servo wristRotServo(
    minAngle=-1.5707963267949,
    maxAngle=1.5707963267949,
    startAngle=0)
    annotation (Placement(transformation(extent={{-120,90},{-100,110}})));
  Components.Servo gripperServo(
    minAngle=-1.5707963267949,
    maxAngle=1.5707963267949,
    startAngle=-1.5707963267949)
    annotation (Placement(transformation(extent={{-120,240},{-100,260}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin gripperPin "positive pin"
    annotation (Placement(transformation(extent={{-230,244},{-210,264}}),
        iconTransformation(extent={{-209,140},{-190,160}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin wristRotPin "positive pin"
    annotation (Placement(transformation(extent={{-230,94},{-210,114}}),
        iconTransformation(extent={{-210,90},{-190,110}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin wristVerPin "positive pin"
    annotation (Placement(transformation(extent={{-230,50},{-210,70}}),
        iconTransformation(extent={{-210,40},{-190,60}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin elbowPin "positive pin"
    annotation (Placement(transformation(extent={{-230,-10},{-210,10}}),
        iconTransformation(extent={{-210,-10},{-190,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin shoulderPin "positive pin"
    annotation (Placement(transformation(extent={{-230,-70},{-210,-50}}),
        iconTransformation(extent={{-210,-60},{-190,-40}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin basePin "positive pin"
    annotation (Placement(transformation(extent={{-230,-128},{-210,-108}}),
        iconTransformation(extent={{-210,-110},{-190,-90}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin GND1
                                                        "Negative armature pin"
    annotation (Placement(transformation(extent={{-230,-190},{-210,-170}}),
        iconTransformation(extent={{-210,-160},{-190,-140}})));
  inner Modelica.Mechanics.MultiBody.World world(n={0,-1,0})
    annotation (Placement(transformation(extent={{-80,-290},{-60,-270}})));
  Modelica.Mechanics.Rotational.Components.Disc disc1(deltaPhi=-0.78539816339745)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Mechanics.Rotational.Components.Disc disc2(deltaPhi=-1.5707963267949)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Mechanics.Rotational.Components.Disc disc4(deltaPhi=0)
    annotation (Placement(transformation(extent={{-40,-230},{-20,-210}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(n={0,1,0},
      angle=180) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={0,122})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=-1)
    annotation (Placement(transformation(extent={{-50,240},{-30,260}})));
  Modelica.Mechanics.Rotational.Components.Disc disc3(deltaPhi=-1.9198621771938)
    annotation (Placement(transformation(extent={{-84,240},{-64,260}})));
equation
  connect(baseRevolute.frame_a, baseBodyShape.frame_b) annotation (Line(
      points={{0,-230},{0,-240}},
      color={95,95,95},
      thickness=0.5));
  connect(baseBodyShape2.frame_a, baseRevolute.frame_b) annotation (Line(
      points={{0,-190},{0,-210}},
      color={95,95,95},
      thickness=0.5));

  connect(elbowRevolute.frame_a, baseBodyShape8.frame_b) annotation (Line(
      points={{-10,-60},{-20,-60},{-20,-80},{0,-80},{0,-90}},
      color={95,95,95},
      thickness=0.5));
  connect(wristVerRevolute.frame_a, baseBodyShape4.frame_b) annotation (Line(
      points={{-10,20},{-20,20},{-20,0},{0,0},{0,-10}},
      color={95,95,95},
      thickness=0.5));
  connect(baseBodyShape5.frame_a, wristVerRevolute.frame_b) annotation (Line(
      points={{-4.44089e-16,50},{-4.44089e-16,40},{20,40},{20,20},{10,20}},
      color={95,95,95},
      thickness=0.5));

  connect(wristRotRevolute.frame_a, baseBodyShape5.frame_b) annotation (Line(
      points={{0,90},{0,70}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape.frame_a, baseBodyShape.frame_a) annotation (Line(
      points={{60,-280},{0,-280},{0,-260},{-4.44089e-16,-260}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape1.frame_a, baseRevolute.frame_b) annotation (Line(
      points={{60,-200},{5.55112e-16,-200},{5.55112e-16,-210}},
      color={95,95,95},
      thickness=0.5));
  connect(baseBodyShape4.frame_a, elbowRevolute.frame_b) annotation (Line(
      points={{-4.44089e-16,-30},{-4.44089e-16,-40},{20,-40},{20,-60},{10,-60}},
      color={95,95,95},
      thickness=0.5));

  connect(baseBodyShape2.frame_b, shoulderRevolute.frame_a) annotation (Line(
      points={{0,-170},{0,-160},{-20,-160},{-20,-140},{-10,-140}},
      color={95,95,95},
      thickness=0.5));
  connect(baseBodyShape8.frame_a, shoulderRevolute.frame_b) annotation (Line(
      points={{0,-110},{0,-120},{20,-120},{20,-140},{10,-140}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape2.frame_a, shoulderRevolute.frame_a) annotation (Line(
      points={{60,-160},{-20,-160},{-20,-140},{-10,-140}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape3.frame_a, shoulderRevolute.frame_a) annotation (Line(
      points={{100,-160},{90,-160},{90,-140},{50,-140},{50,-160},{-20,-160},{
          -20,-140},{-10,-140}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape5.frame_a, shoulderRevolute.frame_b) annotation (Line(
      points={{60,-100},{50,-100},{50,-120},{20,-120},{20,-140},{10,-140}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape6.frame_a, shoulderRevolute.frame_b) annotation (Line(
      points={{100,-100},{90,-100},{90,-120},{20,-120},{20,-140},{10,-140}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape7.frame_a, shoulderRevolute.frame_b) annotation (Line(
      points={{140,-100},{130,-100},{130,-120},{20,-120},{20,-140},{10,-140}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape11.frame_a, elbowRevolute.frame_b) annotation (Line(
      points={{180,-60},{170,-60},{170,-40},{20,-40},{20,-60},{10,-60}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape10.frame_a, elbowRevolute.frame_b) annotation (Line(
      points={{140,-60},{130,-60},{130,-40},{20,-40},{20,-60},{10,-60}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape9.frame_a, elbowRevolute.frame_b) annotation (Line(
      points={{100,-60},{90,-60},{90,-40},{20,-40},{20,-60},{10,-60}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape8.frame_a, elbowRevolute.frame_b) annotation (Line(
      points={{60,-60},{50,-60},{50,-40},{20,-40},{20,-60},{10,-60}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape15.frame_a, wristVerRevolute.frame_b) annotation (Line(
      points={{180,60},{170,60},{170,40},{20,40},{20,20},{10,20}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape14.frame_a, wristVerRevolute.frame_b) annotation (Line(
      points={{140,60},{130,60},{130,40},{20,40},{20,20},{10,20}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape13.frame_a, wristVerRevolute.frame_b) annotation (Line(
      points={{100,60},{90,60},{90,40},{20,40},{20,20},{10,20}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape12.frame_a, wristVerRevolute.frame_b) annotation (Line(
      points={{60,60},{50,60},{50,40},{20,40},{20,20},{10,20}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape4.frame_a, baseBodyShape8.frame_b) annotation (Line(
      points={{180,-100},{170,-100},{170,-80},{0,-80},{0,-90},{5.55112e-16,-90}},
      color={95,95,95},
      thickness=0.5));

  connect(bodyShape16.frame_a, baseBodyShape4.frame_b) annotation (Line(
      points={{60,0},{0,0},{0,-10},{5.55112e-16,-10}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic1.frame_a,fixedTranslation4. frame_b) annotation (Line(
      points={{60,180},{40,180}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation4.frame_a, gripperRevolute.frame_a) annotation (Line(
      points={{20,180},{-1.77636e-15,180},{-1.77636e-15,240}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic.frame_a,fixedTranslation5. frame_b) annotation (Line(
      points={{-60,180},{-40,180}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation5.frame_a, gripperRevolute.frame_a) annotation (Line(
      points={{-20,180},{-1.77636e-15,180},{-1.77636e-15,240}},
      color={95,95,95},
      thickness=0.5));
  connect(idealGearR2T.flangeT,prismatic. axis)
    annotation (Line(points={{-60,210},{-78,210},{-78,186}},
                                                           color={0,127,0}));
  connect(idealGearR2T.supportT,prismatic. support)
    annotation (Line(points={{-60,200},{-66,200},{-66,186}},
                                                  color={0,127,0}));
  connect(idealGearR2T.flangeR, gripperRevolute.axis) annotation (Line(points={
          {-40,210},{-20,210},{-20,250},{-10,250}}, color={0,0,0}));
  connect(idealGearR2T1.supportT,prismatic1. support)
    annotation (Line(points={{60,200},{66,200},{66,186}}, color={0,127,0}));
  connect(idealGearR2T1.flangeT,prismatic1. axis)
    annotation (Line(points={{60,210},{78,210},{78,186}}, color={0,127,0}));
  connect(idealGearR2T1.flangeR, gripperRevolute.axis) annotation (Line(points=
          {{40,210},{-20,210},{-20,250},{-10,250}}, color={0,0,0}));
  connect(bodyShape19.frame_a, prismatic.frame_b) annotation (Line(
      points={{-100,180},{-80,180}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape20.frame_a, prismatic1.frame_b) annotation (Line(
      points={{100,180},{80,180}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape21.frame_a, gripperRevolute.frame_b) annotation (Line(
      points={{40,270},{1.77636e-15,270},{1.77636e-15,260}},
      color={95,95,95},
      thickness=0.5));
  connect(baseBodyShape6.frame_b, gripperRevolute.frame_a) annotation (Line(
      points={{0,156},{-1.77636e-15,156},{-1.77636e-15,240}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape18.frame_a, gripperRevolute.frame_a) annotation (Line(
      points={{60,140},{50,140},{50,160},{-1.77636e-15,160},{-1.77636e-15,240}},
      color={95,95,95},
      thickness=0.5));

  connect(bodyShape17.frame_a, gripperRevolute.frame_a) annotation (Line(
      points={{100,140},{90,140},{90,160},{-1.77636e-15,160},{-1.77636e-15,240}},
      color={95,95,95},
      thickness=0.5));

  connect(bodyShape22.frame_a, prismatic.frame_b) annotation (Line(
      points={{-100,210},{-90,210},{-90,180},{-80,180}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyShape23.frame_a, prismatic1.frame_b) annotation (Line(
      points={{100,210},{90,210},{90,180},{80,180}},
      color={95,95,95},
      thickness=0.5));
  connect(gripperServo.SIG, gripperPin)
    annotation (Line(points={{-120,254},{-220,254}}, color={0,0,255}));
  connect(wristRotServo.SIG, wristRotPin)
    annotation (Line(points={{-120,104},{-220,104}}, color={0,0,255}));
  connect(wristVerServo.SIG, wristVerPin) annotation (Line(points={{-120,34},{
          -160,34},{-160,60},{-220,60}}, color={0,0,255}));
  connect(elbowServo.SIG, elbowPin) annotation (Line(points={{-120,-46},{-160,
          -46},{-160,0},{-220,0}}, color={0,0,255}));
  connect(shoulderServo.SIG, shoulderPin) annotation (Line(points={{-120,-126},
          {-160,-126},{-160,-60},{-220,-60}}, color={0,0,255}));
  connect(baseServo.SIG, basePin) annotation (Line(points={{-120,-216},{-160,
          -216},{-160,-118},{-220,-118}}, color={0,0,255}));
  connect(gripperServo.GND, GND1) annotation (Line(points={{-120,246},{-140,246},
          {-140,-180},{-220,-180}}, color={0,0,255}));
  connect(wristRotServo.GND, GND1) annotation (Line(points={{-120,96},{-140,96},
          {-140,-180},{-220,-180}}, color={0,0,255}));
  connect(wristVerServo.GND, GND1) annotation (Line(points={{-120,26},{-140,26},
          {-140,-180},{-220,-180}}, color={0,0,255}));
  connect(elbowServo.GND, GND1) annotation (Line(points={{-120,-54},{-140,-54},
          {-140,-180},{-220,-180}}, color={0,0,255}));
  connect(shoulderServo.GND, GND1) annotation (Line(points={{-120,-134},{-140,
          -134},{-140,-180},{-220,-180}}, color={0,0,255}));
  connect(baseServo.GND, GND1) annotation (Line(points={{-120,-224},{-140,-224},
          {-140,-180},{-220,-180}}, color={0,0,255}));
  connect(world.frame_b, baseBodyShape.frame_a) annotation (Line(
      points={{-60,-280},{0,-280},{0,-260},{-5.55112e-16,-260}},
      color={95,95,95},
      thickness=0.5));
  connect(disc2.flange_b, wristVerRevolute.axis) annotation (Line(points={{-60,
          30},{-20,30},{-20,36},{0,36},{0,30}}, color={0,0,0}));
  connect(baseServo.flange, disc4.flange_a) annotation (Line(points={{-100.1,
          -220.1},{-90.05,-220.1},{-90.05,-220},{-40,-220}}, color={0,0,0}));
  connect(disc4.flange_b, baseRevolute.axis)
    annotation (Line(points={{-20,-220},{-10,-220}}, color={0,0,0}));
  connect(wristRotServo.flange, wristRotRevolute.axis) annotation (Line(points=
          {{-100.1,99.9},{-55.05,99.9},{-55.05,100},{-10,100}}, color={0,0,0}));
  connect(fixedRotation.frame_a, wristRotRevolute.frame_b) annotation (Line(
      points={{0,116},{0,110}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation.frame_b, baseBodyShape6.frame_a) annotation (Line(
      points={{0,128},{0,136}},
      color={95,95,95},
      thickness=0.5));
  connect(idealGear.flange_b, gripperRevolute.axis)
    annotation (Line(points={{-30,250},{-10,250}}, color={0,0,0}));
  connect(idealGear.flange_a, disc3.flange_b)
    annotation (Line(points={{-50,250},{-64,250}}, color={0,0,0}));
  connect(disc3.flange_a, gripperServo.flange) annotation (Line(points={{-84,
          250},{-88,250},{-88,249.9},{-100.1,249.9}}, color={0,0,0}));
  connect(disc1.flange_b, elbowRevolute.axis) annotation (Line(points={{-60,-50},
          {-18,-50},{-18,-44},{0,-44},{0,-50}}, color={0,0,0}));
  connect(shoulderServo.flange, shoulderRevolute.axis) annotation (Line(points=
          {{-100.1,-130.1},{-20,-130.1},{-20,-126},{0,-126},{0,-130}}, color={0,
          0,0}));
  connect(disc1.flange_a, elbowServo.flange) annotation (Line(points={{-80,-50},
          {-74,-50},{-74,-50.1},{-100.1,-50.1}}, color={0,0,0}));
  connect(disc2.flange_a, wristVerServo.flange) annotation (Line(points={{-80,
          30},{-76,30},{-76,29.9},{-100.1,29.9}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},{200,
            200}}), graphics={
        Rectangle(
          extent={{-140,200},{200,-200}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-198,150},{-140,150}}, color={28,108,200}),
        Line(points={{-198,100},{-140,100}}, color={28,108,200}),
        Line(points={{-198,50},{-140,50}}, color={28,108,200}),
        Line(points={{-198,0},{-140,0}}, color={28,108,200}),
        Line(points={{-198,-50},{-140,-50}}, color={28,108,200}),
        Line(points={{-198,-100},{-140,-100}}, color={28,108,200}),
        Line(points={{-198,-150},{-140,-150}}, color={28,108,200}),
        Bitmap(extent={{-150,-256},{304,204}}, fileName=
              "modelica://Arduino/Resources/Shapes/RoboticArm_VRML_icon.png"),
        Text(
          extent={{-126,166},{66,134}},
          lineColor={28,108,200},
          textString="gripper",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-130,116},{62,84}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="wristRot"),
        Text(
          extent={{-130,64},{62,32}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="wristVer"),
        Text(
          extent={{-130,14},{62,-18}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="elbow"),
        Text(
          extent={{-130,-36},{62,-68}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="shoulder"),
        Text(
          extent={{-128,-86},{64,-118}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="base"),
        Text(
          extent={{-130,-136},{62,-168}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="ground")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-220,-300},{
            220,300}})),
    experiment(StopTime=25));
end DFLG6DOF;
