within Arduino.Examples;
model ControlledDCMotor
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleRate=1e-3)
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=0,
        origin={-70,50})));
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
    annotation (Placement(transformation(extent={{110,80},{130,100}})));
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
  Modelica.Electrical.Analog.Basic.Potentiometer Kd(rConstant=0.01) annotation
    (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-200,30})));
  Modelica.Electrical.Analog.Basic.Potentiometer Ki(rConstant=0.08) annotation
    (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-180,50})));
  Modelica.Electrical.Analog.Basic.Potentiometer Kp(rConstant=0.01) annotation
    (Placement(transformation(
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
        origin={-70,-100})));
equation
  connect(voltageSensor.p, arduinoUno.D3)
    annotation (Line(points={{10,30},{10,40},{-10,40},{-10,25},{-29.5,25}},   color={0,0,255}));
  connect(actuator.u, voltageSensor.v) annotation (Line(points={{40,20},{40,20},
          {20,20}},                                                                          color={0,0,127}));
  connect(ground.p, resistor.n) annotation (Line(points={{228,40},{224,40},{220,
          40},{200,40}},                                                              color={0,0,255}));
  connect(idealClosingSwitch.p, resistor.p) annotation (Line(points={{160,20},{
          160,40},{180,40}},                                                                      color={0,0,255}));
  connect(booleanPulse.y, idealClosingSwitch.control)
    annotation (Line(points={{131,90},{131,90},{140,90},{140,10},{153,10}},
                                                                        color={255,0,255}));
  connect(dcpm.pin_an, arduinoUno.GND) annotation (Line(points={{18,-20},{18,
          -20},{-70,-20},{-70,0}},                                                                        color={0,0,255}));
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
          -126,0},{-126,16.1364},{-109.75,16.1364}}, color={0,0,255}));
  connect(Setpoint.pin_p, arduinoUno.V5) annotation (Line(points={{-220,20},{
          -220,116},{-62.75,116},{-62.75,100.227}}, color={0,0,255}));
  connect(Setpoint.pin_n, arduinoUno.GND) annotation (Line(points={{-220,0},{
          -220,-20},{-70,-20},{-70,0}}, color={0,0,255}));
  connect(Kd.pin_p, arduinoUno.V5) annotation (Line(points={{-200,40},{-200,116},
          {-62.75,116},{-62.75,100.227}}, color={0,0,255}));
  connect(Kd.pin_n, arduinoUno.GND) annotation (Line(points={{-200,20},{-200,
          -20},{-70,-20},{-70,0}}, color={0,0,255}));
  connect(Kd.contact, arduinoUno.A3) annotation (Line(points={{-190,20},{-130,
          20},{-130,22},{-120,22},{-120,22.9545},{-109.75,22.9545}}, color={0,0,
          255}));
  connect(Ki.contact, arduinoUno.A2) annotation (Line(points={{-170,40},{-130,
          40},{-130,30.2273},{-109.75,30.2273}}, color={0,0,255}));
  connect(Ki.pin_n, arduinoUno.GND) annotation (Line(points={{-180,40},{-180,
          -20},{-70,-20},{-70,0}}, color={0,0,255}));
  connect(Ki.pin_p, arduinoUno.V5) annotation (Line(points={{-180,60},{-180,116},
          {-62.75,116},{-62.75,100.227}}, color={0,0,255}));
  connect(Kp.pin_n, arduinoUno.GND) annotation (Line(points={{-160,60},{-160,
          -20},{-70,-20},{-70,0}}, color={0,0,255}));
  connect(Kp.pin_p, arduinoUno.V5) annotation (Line(points={{-160,80},{-160,116},
          {-62.75,116},{-62.75,100.227}}, color={0,0,255}));
  connect(Kp.contact, arduinoUno.A1) annotation (Line(points={{-150,60},{-150,
          60},{-126,60},{-126,36.5909},{-109.75,36.5909}}, color={0,0,255}));
  connect(speedToRatio.y, Speed.r) annotation (Line(points={{-81,-100},{-122,
          -100},{-122,100},{-129,100}}, color={0,0,127}));
  connect(Speed.pin_p, arduinoUno.V5) annotation (Line(points={{-140,100},{-140,
          116},{-62.75,116},{-62.75,100.227}}, color={0,0,255}));
  connect(Speed.pin_n, arduinoUno.GND) annotation (Line(points={{-140,80},{-140,
          -20},{-70,-20},{-70,0}}, color={0,0,255}));
  connect(Speed.contact, arduinoUno.A0) annotation (Line(points={{-130,80},{
          -118,80},{-118,43.4091},{-109.75,43.4091}}, color={0,0,255}));
  connect(dcpm.pin_ap, signalVoltage1.p) annotation (Line(points={{42,-20},{88,
          -20},{130,-20},{130,40},{90,40},{90,30}}, color={0,0,255}));
  connect(speedToRatio.u, speedSensor.w) annotation (Line(points={{-58,-100},{
          -58,-100},{100,-100},{100,-71}}, color={0,0,127}));
  connect(dcpm1.pin_an, resistor.n) annotation (Line(points={{200,-20},{202,-20},
          {202,-12},{220,-12},{220,40},{200,40}}, color={0,0,255}));
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
          lineColor={0,0,0})}),
    experiment(StopTime=0.5, __Dymola_NumberOfIntervals=10000));
end ControlledDCMotor;
