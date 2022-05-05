within Arduino.Components;
model PiezoSpeaker "Piezo speaker that records its output to a WAV file"

  parameter Modelica.Units.SI.Period sampleInterval=1e-4 "Sample interval";
  parameter String filename = "speaker.wav";
  parameter Modelica.Units.SI.Voltage vRef = 5 "Reference voltage";
  Arduino.Internal.WavRecorder wavRecorder=
    Arduino.Internal.WavRecorder(filename);

  Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e3) annotation (
      Placement(transformation(extent={{-10,10},{10,-10}}, rotation=270)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive electrical pin"
    annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Negative electrical pin"
    annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));

protected
   function sampleMe
    input Arduino.Internal.WavRecorder wavRecorder;
    input Modelica.Units.SI.Time timeIn;
    input Real value;
    external "C" WavRecorder_sample(wavRecorder, timeIn, value) annotation (
      Include = "#include \"WavRecorder.c\"",
      IncludeDirectory="modelica://Arduino/Resources/Include");
   end sampleMe;

equation

  when sample(0, sampleInterval) then
    sampleMe(wavRecorder, time, (p.v - n.v) / vRef);
  end when;

  connect(resistor.p, p) annotation (Line(points={{1.77636e-15,10},{0,10},{0,40},
          {-100,40}}, color={0,0,255}));
  connect(resistor.n, n)
    annotation (Line(points={{0,-10},{0,-40},{-100,-40}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-40,60},{0,-60}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,60},{40,100},{40,-100},{0,-60},{0,60}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-100,40},{-40,40}}, color={0,0,255}),
        Line(points={{-100,-40},{-40,-40}}, color={0,0,255}),
        Line(points={{-30,40},{-10,40}}, color={0,0,255}),
        Line(points={{-20,50},{-20,30}}, color={0,0,255}),
        Line(points={{-30,-40},{-10,-40}},
                                       color={0,0,255})}),       Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PiezoSpeaker;
