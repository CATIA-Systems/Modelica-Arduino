within Arduino.Components;
model Servo
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-76,28})));
  Modelica.Blocks.Math.Mean mean(f=20)
    annotation (Placement(transformation(extent={{-56,18},{-36,38}})));
  Modelica.Blocks.Math.Gain gain(k=20)
    annotation (Placement(transformation(extent={{-22,18},{-2,38}})));
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm
    annotation (Placement(transformation(extent={{4,-82},{24,-62}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=180,
        origin={14,-42})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=1/1)
    annotation (Placement(transformation(extent={{38,-82},{58,-62}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={92,28})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={16,16})));
  Modelica.Blocks.Math.Gain gain1(k=1/(2*Modelica.Constants.pi))
    annotation (Placement(transformation(extent={{68,48},{48,68}})));
  Modelica.Blocks.Math.Gain gain2(k=100)
    annotation (Placement(transformation(extent={{-52,-24},{-32,-4}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=5)
    annotation (Placement(transformation(extent={{-16,-24},{4,-4}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin GND "Negative armature pin"
    annotation (Placement(transformation(extent={{-112,-70},{-92,-50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin SIG "positive pin"
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1
                    "Flange of right shaft"
    annotation (Placement(transformation(extent={{92,-10},{112,10}})));
equation
  connect(voltageSensor.v,mean. u)
    annotation (Line(points={{-66,28},{-58,28}}, color={0,0,127}));
  connect(gain.u, mean.y)
    annotation (Line(points={{-24,28},{-35,28}}, color={0,0,127}));
  connect(dcpm.pin_ap, signalVoltage1.p) annotation (Line(points={{20,-62},{22,
          -62},{22,-54},{24,-54},{24,-42}}, color={0,0,255}));
  connect(idealGear.flange_a, dcpm.flange)
    annotation (Line(points={{38,-72},{24,-72}}, color={0,0,0}));
  connect(angleSensor.flange, idealGear.flange_b)
    annotation (Line(points={{92,18},{92,-72},{58,-72}}, color={0,0,0}));
  connect(gain.y, feedback.u1)
    annotation (Line(points={{-1,28},{16,28},{16,24}}, color={0,0,127}));
  connect(angleSensor.phi, gain1.u)
    annotation (Line(points={{92,39},{92,58},{70,58}}, color={0,0,127}));
  connect(gain2.y, limiter.u)
    annotation (Line(points={{-31,-14},{-18,-14}}, color={0,0,127}));
  connect(limiter.y, signalVoltage1.v)
    annotation (Line(points={{5,-14},{14,-14},{14,-35}}, color={0,0,127}));
  connect(gain2.u, feedback.y) annotation (Line(points={{-54,-14},{-60,-14},{
          -60,4},{16,4},{16,7}}, color={0,0,127}));
  connect(feedback.u2, gain1.y) annotation (Line(points={{24,16},{34,16},{34,58},
          {47,58}}, color={0,0,127}));
  connect(dcpm.pin_an, GND) annotation (Line(points={{8,-62},{-4,-62},{-4,-60},
          {-102,-60}}, color={0,0,255}));
  connect(voltageSensor.n, GND)
    annotation (Line(points={{-76,18},{-76,-60},{-102,-60}}, color={0,0,255}));
  connect(signalVoltage1.n, GND) annotation (Line(points={{4,-42},{-4,-42},{-4,
          -60},{-102,-60}}, color={0,0,255}));
  connect(voltageSensor.p, SIG)
    annotation (Line(points={{-76,38},{-76,60},{-100,60}}, color={0,0,255}));
  connect(idealGear.flange_b, flange_b1) annotation (Line(points={{58,-72},{92,
          -72},{92,0},{102,0}}, color={0,0,0}));
  connect(flange_b1, angleSensor.flange)
    annotation (Line(points={{102,0},{92,0},{92,18}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Servo;
