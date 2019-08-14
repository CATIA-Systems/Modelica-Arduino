within ;
package Arduino "Library to simulate sketches on a virtual Arduino Uno and to connect models to real-world circuits using the Firmata protocol"

  extends Modelica.Icons.Package;





  annotation (
  version="0.1.0",
  uses(Modelica(version="3.2.3"), Modelica_DeviceDrivers(version="1.7.0")),
  Icon(graphics={
      Ellipse(
        extent={{-80,38},{4,-38}},
        lineColor={0,135,143},
        lineThickness=0.5),
      Ellipse(
        extent={{4,38},{88,-38}},
        lineColor={0,135,143},
        lineThickness=0.5),
      Line(
        points={{-56,0},{-24,0}},
        color={0,135,143},
        smooth=Smooth.Bezier),
      Line(
        points={{24,0},{68,0}},
        color={0,135,143},
        smooth=Smooth.Bezier),
      Line(
        points={{-20,-4.8986e-016},{12,0}},
        color={0,135,143},
        smooth=Smooth.Bezier,
        origin={46,4},
        rotation=90)}),
  Documentation(info="<html>
<p>For updates and tutorials visit <a href=\"https://github.com/CATIA-Systems/Modelica-Arduino\">https://github.com/CATIA-Systems/Modelica-Arduino</a></p>
</html>"));
end Arduino;
