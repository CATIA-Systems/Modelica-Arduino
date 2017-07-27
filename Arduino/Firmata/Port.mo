within Arduino.Firmata;
model Port

  Internal.BoardConnector boardConnector
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-116,-16},{-84,16}})));
   parameter String port "Serial port (empty = auto)";
   parameter Modelica.SIunits.Time sampleInterval(displayUnit="ms", min=0.001, max=0.1) = 0.001 "Sample interval";
   Firmata.Internal.ExternalFirmata externalFirmata=
      Firmata.Internal.ExternalFirmata(
      port,
      false,
      integer(sampleInterval*1000),
      baudRate,
      false,
      Firmata.Internal.ModelicaFunctions());
   Integer numSentMessages;
   Integer numReceivedMessages;

protected
  constant Integer baudRate = 57600;

  Integer boardId(start = -1);

public
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime
    synchronizeRealtime
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  when initial() then
    boardId = Firmata.Internal.getBoardId(externalFirmata);
  end when;

  when sample(0, sampleInterval) then
    Firmata.Internal.updateBoard(boardId);
    numSentMessages = Arduino.Firmata.Internal.numSentMessages(boardId);
    numReceivedMessages = Arduino.Firmata.Internal.numReceivedMessages(boardId);
  end when;

  boardConnector = boardId;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(extent={{40,40},{100,-40}}, lineColor={34,34,34},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{60,-10},{80,-20}},
          fillColor={34,34,34},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-100,6},{-40,-6}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          fillColor={34,34,34},
          extent={{-60,-60},{40,60}},
          radius=7,
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{60,20},{80,10}},
          fillColor={34,34,34},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Text(
          extent={{-54,-16},{32,18}},
          lineColor={255,255,255},
          textString="%port")}),          Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end Port;
