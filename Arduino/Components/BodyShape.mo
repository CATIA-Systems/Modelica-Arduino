within Arduino.Components;
model BodyShape
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape(
    shapeType=shapeType, r=fixedRotation.frame_b.r_0,
    R=fixedRotation.frame_b.R,
    color=color,
    specularCoefficient=0.1)
    annotation (Placement(transformation(extent={{-10,-12},{10,8}})));

  parameter Modelica.Mechanics.MultiBody.Types.ShapeType shapeType="modelica://Arduino/Resources/Shapes/I_Rotative_Base_Main_4Servo__7.wrl"
    "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring, <external shape>)";
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r=r,
      animation=false)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
    "Coordinate system fixed to the component with one cut-force and cut-torque"
    annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  parameter Modelica.SIunits.Position r[3]={0,0,0}
    "Vector from frame_a to frame_b resolved in frame_a";
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
    n={1,0,0},
    angle=-90,
    rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence,
    angles=angles,
    animation=false)
    annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));

  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angles[3]={0,0,0}
    "Rotation angles around the axes defined in 'sequence'";
  parameter Real color[3]={255,255,255} "Color of shape";

  parameter String icon="modelica://Arduino/Resources/Shapes/I_Rotative_Base_Main_4Servo__7.png";

equation
  connect(fixedTranslation.frame_a, frame_a) annotation (Line(
      points={{-80,0},{-100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation.frame_a, fixedTranslation.frame_b) annotation (Line(
      points={{-46,0},{-60,0}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor=color,
          fillPattern=FillPattern.Solid), Bitmap(extent={{-100,-100},{100,100}},
            fileName=icon)}),                               Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end BodyShape;
