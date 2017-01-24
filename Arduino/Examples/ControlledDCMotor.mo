within Arduino.Examples;
model ControlledDCMotor
              extends Modelica.Icons.Example;

  Components.ArduinoUno arduinoUno(sampleRate=1e-3)
    annotation (Placement(transformation(extent={{-40,-50},{40,50}},
        rotation=0,
        origin={-120,50})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-60})));
  Modelica.Blocks.Math.Gain to_rpm(k=60/(2*Modelica.Constants.pi))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,-90})));
  Modelica.Blocks.Math.Gain rpm_to_volt(k=5/12400)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,-90})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-120,-90})));
  Modelica.Blocks.Math.Gain actuator(k=24/5)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={2,20})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,20})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={40,20})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={170,32})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=20) annotation (Placement(transformation(extent={{110,12},{150,52}})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={110,10})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=0.2, startTime=0.1)
    annotation (Placement(transformation(extent={{60,80},{80,100}})));
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm(
    VaNominal=24,
    IaNominal=0.87,
    wNominal(displayUnit="rpm") = 1130.9733552923,
    Ra=3.69,
    La=0.231e-3,
    Jr=5.55e-7) annotation (Placement(transformation(extent={{-40,-60},{0,-20}})));
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm1(
    VaNominal=24,
    IaNominal=0.87,
    wNominal(displayUnit="rpm") = 1130.9733552923,
    Ra=3.69,
    La=0.231e-3,
    Jr=5.55e-7) annotation (Placement(transformation(extent={{150,-60},{110,-20}})));
  Components.Potentiometer Kp(resistance=1000, ratio=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-210,70})));
  Components.Potentiometer Setpoint(resistance=1000, ratio=87) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-270,10})));
  Components.Potentiometer Ki(resistance=1000, ratio=8)  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-230,50})));
  Components.Potentiometer Kd(resistance=1000, ratio=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-250,30})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{40,-30},{20,-10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.01) annotation (Placement(transformation(extent={{-20,-140},{-40,-120}})));
equation
  connect(rpm_to_volt.u, to_rpm.y) annotation (Line(points={{-58,-90},{-41,-90}}, color={0,0,127}));
  connect(signalVoltage.v, rpm_to_volt.y) annotation (Line(points={{-113,-90},{-81,-90}}, color={0,0,127}));
  connect(arduinoUno.A0, signalVoltage.p)
    annotation (Line(points={{-159.75,43.4091},{-180,43.4091},{-180,-112},{-120,
          -112},{-120,-100}},                                                                       color={0,0,255}));
  connect(speedSensor.w, to_rpm.u) annotation (Line(points={{50,-71},{50,-90},{-18,-90}}, color={0,0,127}));
  connect(voltageSensor.p, arduinoUno.D3)
    annotation (Line(points={{-40,30},{-40,40},{-60,40},{-60,25},{-79.5,25}}, color={0,0,255}));
  connect(actuator.u, voltageSensor.v) annotation (Line(points={{-10,20},{-10,20},{-30,20}}, color={0,0,127}));
  connect(ground.p, resistor.n) annotation (Line(points={{160,32},{155,32},{150,32}}, color={0,0,255}));
  connect(idealClosingSwitch.p, resistor.p) annotation (Line(points={{110,20},{110,20},{110,32}}, color={0,0,255}));
  connect(booleanPulse.y, idealClosingSwitch.control)
    annotation (Line(points={{81,90},{81,90},{90,90},{90,10},{103,10}}, color={255,0,255}));
  connect(dcpm.pin_an, arduinoUno.GND) annotation (Line(points={{-32,-20},{-32,-20},{-120,-20},{-120,0}}, color={0,0,255}));
  connect(signalVoltage1.n, dcpm.pin_an)
    annotation (Line(points={{40,10},{40,10},{40,4},{40,0},{-32,0},{-32,-20}}, color={0,0,255}));
  connect(voltageSensor.n, dcpm.pin_an) annotation (Line(points={{-40,10},{-40,0},{-32,0},{-32,-20}}, color={0,0,255}));
  connect(dcpm1.pin_ap, idealClosingSwitch.n) annotation (Line(points={{118,-20},{118,-12},{110,-12},{110,0}}, color={0,0,255}));
  connect(resistor.n, dcpm1.pin_an) annotation (Line(points={{150,32},{150,-12},{142,-12},{142,-20}}, color={0,0,255}));
  connect(signalVoltage.n, arduinoUno.GND) annotation (Line(points={{-120,-80},{-120,0}}, color={0,0,255}));
  connect(Kp.n, arduinoUno.GND) annotation (Line(points={{-210,60},{-210,-20},{
          -120,-20},{-120,0}}, color={0,0,255}));
  connect(Kp.l, arduinoUno.A1) annotation (Line(points={{-200,70},{-188,70},{
          -188,36.5909},{-159.75,36.5909}}, color={0,0,255}));
  connect(Setpoint.p, arduinoUno.V5) annotation (Line(points={{-270,20},{-270,
          20},{-270,116},{-112.75,116},{-112.75,100.227}}, color={0,0,255}));
  connect(Setpoint.n, arduinoUno.GND) annotation (Line(points={{-270,0},{-270,
          -20},{-120,-20},{-120,0}}, color={0,0,255}));
  connect(Setpoint.l, arduinoUno.A4) annotation (Line(points={{-260,10},{-194,
          10},{-194,16.1364},{-159.75,16.1364}}, color={0,0,255}));
  connect(Ki.n, arduinoUno.GND) annotation (Line(points={{-230,40},{-230,-20},{
          -120,-20},{-120,0}}, color={0,0,255}));
  connect(Ki.p, arduinoUno.V5) annotation (Line(points={{-230,60},{-230,116},{
          -112.75,116},{-112.75,100.227}}, color={0,0,255}));
  connect(Kd.n, arduinoUno.GND) annotation (Line(points={{-250,20},{-250,-20},{
          -120,-20},{-120,0}}, color={0,0,255}));
  connect(Kd.p, arduinoUno.V5) annotation (Line(points={{-250,40},{-250,116},{
          -112.75,116},{-112.75,100.227}}, color={0,0,255}));
  connect(Kp.p, arduinoUno.V5) annotation (Line(points={{-210,80},{-210,116},{
          -112.75,116},{-112.75,100.227}}, color={0,0,255}));
  connect(Ki.l, arduinoUno.A2) annotation (Line(points={{-220,50},{-194,50},{
          -194,30.2273},{-159.75,30.2273}}, color={0,0,255}));
  connect(Kd.l, arduinoUno.A3) annotation (Line(points={{-240,30},{-240,30},{
          -200,30},{-200,22.9545},{-159.75,22.9545}}, color={0,0,255}));
  connect(dcpm.flange, speedSensor.flange) annotation (Line(points={{0,-40},{50,-40},{50,-50}}, color={0,0,0}));
  connect(actuator.y, signalVoltage1.v) annotation (Line(points={{13,20},{20,20},{33,20}}, color={0,0,127}));
  connect(dcpm1.flange, speedSensor.flange) annotation (Line(points={{110,-40},{50,-40},{50,-50}}, color={0,0,0}));
  connect(signalVoltage1.p, currentSensor.p)
    annotation (Line(points={{40,30},{40,40},{60,40},{60,-20},{40,-20}}, color={0,0,255}));
  connect(currentSensor.n, dcpm.pin_ap) annotation (Line(points={{20,-20},{-8,-20}}, color={0,0,255}));
  connect(firstOrder.u, currentSensor.i) annotation (Line(points={{-18,-130},{8,-130},{30,-130},{30,-30}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-280,-160},{180,120}},
        initialScale=0.1), graphics={Rectangle(
          extent={{-60,54},{60,-8}},
          radius=5,
          fillColor={235,235,225},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None), Text(
          extent={{-20,52},{22,40}},
          pattern=LinePattern.None,
          fillColor={235,235,225},
          fillPattern=FillPattern.Solid,
          textString="Actuator",
          lineColor={0,0,0})}),
    experiment(StopTime=0.5, __Dymola_NumberOfIntervals=10000));
end ControlledDCMotor;
