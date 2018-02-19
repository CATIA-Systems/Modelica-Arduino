within Arduino.Examples;
model ControlledDCMotor "An Arduino controlling a motor with a variable load"
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleInterval=1e-3, sketch=
        "ControlledDCMotor.ino")
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=0,
        origin={-60,50})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,-60})));
  Modelica.Blocks.Math.Gain actuator(k=24/5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={52,20})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={10,20})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={90,20})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={238,40})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=20) annotation (Placement(transformation(extent={{180,30},
            {200,50}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={160,10})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=0.2, startTime=0.1)
    annotation (Placement(transformation(extent={{120,60},{140,80}})));
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm(
    VaNominal=24,
    IaNominal=0.87,
    wNominal(displayUnit="rpm") = 1130.9733552923,
    Ra=3.69,
    La=0.231e-3,
    Jr=5.55e-7) annotation (Placement(transformation(extent={{10,-60},{50,-20}})));
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm1(
    VaNominal=24,
    IaNominal=0.87,
    wNominal(displayUnit="rpm") = 1130.9733552923,
    Ra=3.69,
    La=0.231e-3,
    Jr=5.55e-7) annotation (Placement(transformation(extent={{208,-60},{168,-20}})));
  Modelica.Electrical.Analog.Basic.Potentiometer Setpoint(rConstant=0.87)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-220,10})));
  Modelica.Electrical.Analog.Basic.Potentiometer Kd(rConstant=0.01) annotation (
     Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-200,32})));
  Modelica.Electrical.Analog.Basic.Potentiometer Ki(rConstant=0.08) annotation (
     Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-180,50})));
  Modelica.Electrical.Analog.Basic.Potentiometer Kp(rConstant=0.01) annotation (
     Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-160,70})));
  Modelica.Electrical.Analog.Basic.Potentiometer Speed(rConstant=0.01,
      useRinput=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-140,90})));
  Modelica.Blocks.Math.Gain speedToRatio(k=(60/(2*Modelica.Constants.pi))/12400)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-100})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{-170,-80},{-150,-60}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-240,50})));
equation
  connect(voltageSensor.p, arduinoUno.D3)
    annotation (Line(points={{10,30},{10,42},{-14,42},{-14,32.5},{-20,32.5}}, color={0,0,255}));
  connect(actuator.u, voltageSensor.v) annotation (Line(points={{40,20},{40,20},
          {20,20}},                                                                          color={0,0,127}));
  connect(ground.p, resistor.n) annotation (Line(points={{228,40},{224,40},{220,
          40},{200,40}},                                                              color={0,0,255}));
  connect(idealClosingSwitch.p, resistor.p) annotation (Line(points={{160,20},{
          160,40},{180,40}},                                                                      color={0,0,255}));
  connect(dcpm.pin_an, arduinoUno.GND) annotation (Line(points={{18,-20},{-60,
          -20},{-60,0}},                                                                                  color={0,0,255}));
  connect(signalVoltage1.n, dcpm.pin_an)
    annotation (Line(points={{90,10},{90,10},{90,4},{90,0},{18,0},{18,-20}},   color={0,0,255}));
  connect(voltageSensor.n, dcpm.pin_an) annotation (Line(points={{10,10},{10,0},
          {18,0},{18,-20}},                                                                           color={0,0,255}));
  connect(dcpm1.pin_ap, idealClosingSwitch.n) annotation (Line(points={{176,-20},
          {176,-12},{160,-12},{160,0}},                                                                        color={0,0,255}));
  connect(dcpm.flange, speedSensor.flange) annotation (Line(points={{50,-40},{
          100,-40},{100,-50}},                                                                  color={0,0,0}));
  connect(actuator.y, signalVoltage1.v) annotation (Line(points={{63,20},{70,20},
          {83,20}},                                                                        color={0,0,127}));
  connect(dcpm1.flange, speedSensor.flange) annotation (Line(points={{168,-40},
          {100,-40},{100,-50}},                                                                    color={0,0,0}));
  connect(Setpoint.contact, arduinoUno.A4) annotation (Line(points={{-210,0},{
          -126,0},{-126,27.5},{-100,27.5}},          color={0,0,255}));
  connect(Setpoint.pin_n, arduinoUno.GND) annotation (Line(points={{-220,0},{
          -220,-20},{-60,-20},{-60,0}}, color={0,0,255}));
  connect(Kd.pin_n, arduinoUno.GND) annotation (Line(points={{-200,22},{-200,
          -20},{-60,-20},{-60,0}}, color={0,0,255}));
  connect(Kd.contact, arduinoUno.A3) annotation (Line(points={{-190,22},{-186,
          22},{-186,32.5},{-100,32.5}},                              color={0,0,
          255}));
  connect(Ki.contact, arduinoUno.A2) annotation (Line(points={{-170,40},{-130,
          40},{-130,37.5},{-100,37.5}},          color={0,0,255}));
  connect(Ki.pin_n, arduinoUno.GND) annotation (Line(points={{-180,40},{-180,
          -20},{-60,-20},{-60,0}}, color={0,0,255}));
  connect(Kp.pin_n, arduinoUno.GND) annotation (Line(points={{-160,60},{-160,
          -20},{-60,-20},{-60,0}}, color={0,0,255}));
  connect(Kp.contact, arduinoUno.A1) annotation (Line(points={{-150,60},{-126,
          60},{-126,42.5},{-100,42.5}},                    color={0,0,255}));
  connect(speedToRatio.y, Speed.r) annotation (Line(points={{-61,-100},{-108,
          -100},{-108,100},{-129,100}}, color={0,0,127}));
  connect(Speed.pin_n, arduinoUno.GND) annotation (Line(points={{-140,80},{-140,
          -20},{-60,-20},{-60,0}}, color={0,0,255}));
  connect(Speed.contact, arduinoUno.A0) annotation (Line(points={{-130,80},{
          -118,80},{-118,47.5},{-100,47.5}},          color={0,0,255}));
  connect(dcpm.pin_ap, signalVoltage1.p) annotation (Line(points={{42,-20},{88,
          -20},{130,-20},{130,40},{90,40},{90,30}}, color={0,0,255}));
  connect(speedToRatio.u, speedSensor.w) annotation (Line(points={{-38,-100},{
          100,-100},{100,-71}},            color={0,0,127}));
  connect(dcpm1.pin_an, resistor.n) annotation (Line(points={{200,-20},{202,-20},
          {202,-12},{220,-12},{220,40},{200,40}}, color={0,0,255}));
  connect(idealClosingSwitch.control, booleanPulse.y) annotation (Line(points={{153,10},
          {150,10},{150,70},{141,70}},          color={255,0,255}));
  connect(ground1.p, arduinoUno.GND) annotation (Line(points={{-160,-60},{-160,
          -20},{-60,-20},{-60,0}}, color={0,0,255}));
  connect(constantVoltage.n, arduinoUno.GND) annotation (Line(points={{-240,40},
          {-240,-20},{-60,-20},{-60,0}}, color={0,0,255}));
  connect(constantVoltage.p, arduinoUno.Vin) annotation (Line(points={{-240,60},
          {-240,120},{-60,120},{-60,100}}, color={0,0,255}));
  connect(Speed.pin_p, arduinoUno.Vin) annotation (Line(points={{-140,100},{
          -140,120},{-60,120},{-60,100}}, color={0,0,255}));
  connect(Kp.pin_p, arduinoUno.Vin) annotation (Line(points={{-160,80},{-160,
          120},{-60,120},{-60,100}}, color={0,0,255}));
  connect(Ki.pin_p, arduinoUno.Vin) annotation (Line(points={{-180,60},{-180,
          120},{-60,120},{-60,100}}, color={0,0,255}));
  connect(Kd.pin_p, arduinoUno.Vin) annotation (Line(points={{-200,42},{-200,
          120},{-60,120},{-60,100}}, color={0,0,255}));
  connect(Setpoint.pin_p, arduinoUno.Vin) annotation (Line(points={{-220,20},{
          -220,120},{-60,120},{-60,100}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-260,-140},{260,
            140}},
        initialScale=0.1), graphics={Rectangle(
          extent={{-10,54},{110,-8}},
          radius=5,
          fillColor={235,235,225},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None), Text(
          extent={{30,52},{72,40}},
          pattern=LinePattern.None,
          fillColor={235,235,225},
          fillPattern=FillPattern.Solid,
          textString="Actuator",
          lineColor={0,0,0}),
        Text(
          extent={{106,136},{254,104}},
          lineColor={28,108,200},
          textString="The sketch uses the Arduino PID Library from 
https://github.com/br3ttb/Arduino-PID-Library/.
See README.html for more information on how 
to use external libraries."),
        Rectangle(extent={{100,140},{260,100}},lineColor={28,108,200})}),
    experiment(StopTime=0.5, __Dymola_NumberOfIntervals=10000));
end ControlledDCMotor;
