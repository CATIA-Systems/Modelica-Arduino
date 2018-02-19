within Arduino.Examples;
model RobotArm
  "A 6 degree of freedom robot arm controlled by an Arduino"
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sketch="RobotArmGrabSponge.ino")
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=0,
        origin={-30,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-100,10})));
  Components.DFLG6DOF robotArmWithServos
    annotation (Placement(transformation(extent={{60,-20},{100,20}})));
equation
  connect(constantVoltage.p, arduinoUno.Vin) annotation (Line(points={{-100,20},
          {-100,60},{-30,60},{-30,50}},
                                   color={0,0,255}));
  connect(arduinoUno.GND, ground.p)
    annotation (Line(points={{-30,-50},{-30,-70}},
                                               color={0,0,255}));
  connect(constantVoltage.n, ground.p) annotation (Line(points={{-100,0},{-100,-60},
          {-30,-60},{-30,-70}},          color={0,0,255}));
  connect(robotArmWithServos.GND1, ground.p) annotation (Line(points={{60,-15},
          {44,-15},{44,-60},{-30,-60},{-30,-70}},color={0,0,255}));
  connect(robotArmWithServos.basePin, arduinoUno.D3) annotation (Line(points={{60,-10},
          {40,-10},{40,-17.5},{10,-17.5}},      color={0,0,255}));
  connect(robotArmWithServos.shoulderPin, arduinoUno.D5) annotation (Line(
        points={{60,-5},{36,-5},{36,-7.5},{10,-7.5}}, color={0,0,255}));
  connect(robotArmWithServos.elbowPin, arduinoUno.D6) annotation (Line(points={{
          60,0},{32,0},{32,-2.5},{10,-2.5}}, color={0,0,255}));
  connect(robotArmWithServos.wristVerPin, arduinoUno.D9) annotation (Line(
        points={{60,5},{32,5},{32,12.5},{10,12.5}}, color={0,0,255}));
  connect(robotArmWithServos.wristRotPin, arduinoUno.D10) annotation (Line(
        points={{60,10},{36,10},{36,17.5},{10,17.5}}, color={0,0,255}));
  connect(robotArmWithServos.gripperPin, arduinoUno.D11) annotation (Line(
        points={{60.05,15},{40,15},{40,22.5},{10,22.5}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{
            120,100}})),
    experiment(StopTime=20));
end RobotArm;
