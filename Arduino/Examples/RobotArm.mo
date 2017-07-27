within Arduino.Examples;
model RobotArm "Arduino with a 6 degree of freedom robot arm"
  extends Modelica.Icons.Example;

  parameter Modelica.SIunits.Mass mLoad(min=0)=15 "Mass of load";
  parameter Modelica.SIunits.Position rLoad[3]={0.1,0.25,0.1}
    "Distance from last flange to load mass";
  parameter Modelica.SIunits.Acceleration g=9.81 "Gravity acceleration";
  parameter Modelica.SIunits.Time refStartTime=0
    "Start time of reference motion";
  parameter Modelica.SIunits.Time refSwingTime=0.5
    "Additional time after reference motion is in rest before simulation is stopped";

  parameter Real startAngle1(unit="deg") = -60 "Start angle of axis 1"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle2(unit="deg") = 20 "Start angle of axis 2"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle3(unit="deg") = 90 "Start angle of axis 3"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle4(unit="deg") = 0 "Start angle of axis 4"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle5(unit="deg") = -110 "Start angle of axis 5"
    annotation (Dialog(tab="Reference", group="startAngles"));
  parameter Real startAngle6(unit="deg") = 0 "Start angle of axis 6"
    annotation (Dialog(tab="Reference", group="startAngles"));

  parameter Real endAngle1(unit="deg") = 60 "End angle of axis 1"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle2(unit="deg") = -70 "End angle of axis 2"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle3(unit="deg") = -35 "End angle of axis 3"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle4(unit="deg") = 45 "End angle of axis 4"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle5(unit="deg") = 110 "End angle of axis 5"
    annotation (Dialog(tab="Reference", group="endAngles"));
  parameter Real endAngle6(unit="deg") = 45 "End angle of axis 6"
    annotation (Dialog(tab="Reference", group="endAngles"));

  parameter Modelica.SIunits.AngularVelocity refSpeedMax[6]={3,1.5,5,3.1,3.1,
      4.1} "Maximum reference speeds of all joints"
    annotation (Dialog(tab="Reference", group="Limits"));
  parameter Modelica.SIunits.AngularAcceleration refAccMax[6]={15,15,15,60,60,
      60} "Maximum reference accelerations of all joints"
    annotation (Dialog(tab="Reference", group="Limits"));

  parameter Real kp1=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 1"));
  parameter Real ks1=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 1"));
  parameter Modelica.SIunits.Time Ts1=0.05
    "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 1"));
  parameter Real kp2=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 2"));
  parameter Real ks2=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 2"));
  parameter Modelica.SIunits.Time Ts2=0.05
    "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 2"));
  parameter Real kp3=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 3"));
  parameter Real ks3=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 3"));
  parameter Modelica.SIunits.Time Ts3=0.05
    "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 3"));
  parameter Real kp4=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 4"));
  parameter Real ks4=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 4"));
  parameter Modelica.SIunits.Time Ts4=0.05
    "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 4"));
  parameter Real kp5=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 5"));
  parameter Real ks5=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 5"));
  parameter Modelica.SIunits.Time Ts5=0.05
    "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 5"));
  parameter Real kp6=5 "Gain of position controller"
    annotation (Dialog(tab="Controller", group="Axis 6"));
  parameter Real ks6=0.5 "Gain of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 6"));
  parameter Modelica.SIunits.Time Ts6=0.05
    "Time constant of integrator of speed controller"
    annotation (Dialog(tab="Controller", group="Axis 6"));
  Modelica.Mechanics.MultiBody.Examples.Systems.RobotR3.Components.MechanicalStructure
    mechanics(
    mLoad=mLoad,
    rLoad=rLoad,
    g=g) annotation (Placement(transformation(extent={{90,-20},{130,20}})));

  Components.ArduinoUno arduinoUno(sketch="TakeTheSponge.ino")
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=0,
        origin={-40,10})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-120,10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-50,-100},{-30,-80}})));
  Components.Servo baseServo
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  Components.Servo shoulderServo
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  Components.Servo elbowServo
    annotation (Placement(transformation(extent={{40,-20},{60,0}})));
  Components.Servo wristRotServo
    annotation (Placement(transformation(extent={{40,10},{60,30}})));
  Components.Servo wristVerServo
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Components.Servo gipperServo
    annotation (Placement(transformation(extent={{40,70},{60,90}})));
equation

  connect(ground.p,arduinoUno. GND)
    annotation (Line(points={{-40,-80},{-40,-40}},
                                               color={0,0,255}));
  connect(constantVoltage.n,arduinoUno. GND) annotation (Line(points={{-120,0},{
          -120,-60},{-40,-60},{-40,-40}},
                                     color={0,0,255}));
  connect(constantVoltage.p,arduinoUno. Vin)
    annotation (Line(points={{-120,20},{-120,70},{-40,70},{-40,60}},
                                                            color={0,0,255}));
  connect(baseServo.SIG, arduinoUno.D11) annotation (Line(points={{40,-66},{8,
          -66},{8,32.5},{0,32.5}},                 color={0,0,255}));
  connect(shoulderServo.SIG, arduinoUno.D10) annotation (Line(points={{40,-36},
          {6,-36},{6,27.5},{0,27.5}},                      color={0,0,255}));
  connect(wristRotServo.SIG, arduinoUno.D6) annotation (Line(points={{40,24},{
          40,24},{28,24},{28,24},{18,24},{18,7.5},{0,7.5}},       color={0,0,
          255}));
  connect(arduinoUno.D5, wristVerServo.SIG) annotation (Line(points={{0,2.5},{2,
          2.5},{2,2},{12,2},{12,54},{40,54}},                      color={0,0,
          255}));
  connect(gipperServo.SIG, arduinoUno.D3) annotation (Line(points={{40,84},{10,
          84},{10,-6},{10,-7.5},{6,-7.5},{0,-7.5}},               color={0,0,
          255}));
  connect(shoulderServo.flange1, mechanics.axis2) annotation (Line(points={{59.9,
          -40.1},{74,-40.1},{74,-12},{80,-12},{80,-11},{89,-11}},
                                                         color={0,0,0}));
  connect(mechanics.axis3, elbowServo.flange1) annotation (Line(points={{89,-5},
          {68,-5},{68,-10},{59.9,-10},{59.9,-10.1}},        color={0,0,0}));
  connect(wristRotServo.flange1, mechanics.axis4) annotation (Line(points={{59.9,
          19.9},{68,19.9},{68,1},{89,1}},            color={0,0,0}));
  connect(mechanics.axis5, wristVerServo.flange1) annotation (Line(points={{89,7},{
          74,7},{74,49.9},{59.9,49.9}},               color={0,0,0}));
  connect(mechanics.axis6, gipperServo.flange1) annotation (Line(points={{89,13},
          {80,13},{80,79.9},{59.9,79.9}},               color={0,0,0}));
  connect(baseServo.flange1, mechanics.axis1) annotation (Line(points={{59.9,
          -70.1},{80,-70.1},{80,-17},{89,-17}},
                                         color={0,0,0}));
  connect(elbowServo.SIG, arduinoUno.D9) annotation (Line(points={{40,-6},{4,-6},
          {4,22},{2,22},{2,22.5},{0,22.5}},
                               color={0,0,255}));
  connect(baseServo.GND, arduinoUno.GND) annotation (Line(points={{40,-74},{26,-74},
          {26,-60},{-40,-60},{-40,-40}}, color={0,0,255}));
  connect(shoulderServo.GND, arduinoUno.GND) annotation (Line(points={{40,-44},{
          26,-44},{26,-60},{-40,-60},{-40,-40}}, color={0,0,255}));
  connect(elbowServo.GND, arduinoUno.GND) annotation (Line(points={{40,-14},{26,
          -14},{26,-60},{-40,-60},{-40,-40}}, color={0,0,255}));
  connect(wristRotServo.GND, arduinoUno.GND) annotation (Line(points={{40,16},{30,
          16},{30,16},{26,16},{26,-60},{-40,-60},{-40,-40}}, color={0,0,255}));
  connect(wristVerServo.GND, arduinoUno.GND) annotation (Line(points={{40,46},{26,
          46},{26,24},{26,24},{26,-60},{-40,-60},{-40,-40}}, color={0,0,255}));
  connect(gipperServo.GND, arduinoUno.GND) annotation (Line(points={{40,76},{26,
          76},{26,-60},{-40,-60},{-40,-40}}, color={0,0,255}));
  annotation (
    experiment(StopTime=15),
    __Dymola_Commands(
      file="modelica://Modelica/Resources/Scripts/Dymola/Mechanics/MultiBody/Examples/Systems/Run.mos"
        "Simulate",
      file="modelica://Modelica/Resources/Scripts/Dymola/Mechanics/MultiBody/Examples/Systems/fullRobotPlot.mos"
        "Plot result of axis 3 + animate"),
    Documentation(info="<html>
<p>
This is a detailed model of the robot. For animation CAD data
is used. Translate and simulate with the default settings
(default simulation time = 3 s). Use command script \"modelica://Modelica/Resources/Scripts/Dymola/Mechanics/MultiBody/Examples/Systems/fullRobotPlot.mos\"
to plot variables.
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Systems/r3_fullRobot.png\" ALT=\"model Examples.Loops.Systems.RobotR3.fullRobot\">
</p>
</html>"),
    Diagram(coordinateSystem(extent={{-140,-100},{140,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end RobotArm;
