import os
from pathlib import Path
import pytest


def om_available():

    try:
        import OMPython
    except:
        return False

    return 'OPENMODELICAHOME' in os.environ


@pytest.mark.skipif(not om_available(), reason="OpenModelica was not found")
def test_run_examples(workdir, package):

    from OMPython import OMCSessionZMQ

    omc = OMCSessionZMQ()

    assert omc.sendExpression(f'cd("{workdir.as_posix()}")') == workdir.as_posix()

    assert omc.sendExpression(f'loadFile("{package.as_posix()}")')

    for model, sketch in [
        ('AnalogReadSerial', 'AnalogReadSerial.ino'),
        ('BarGraph', 'BarGraph.ino'),
        ('Blink', 'Blink.ino'),
        ('BlinkWithoutDelay', 'BlinkWithoutDelay.ino'),
        ('Button', 'Button.ino'),
        ('Fade', 'Fade.ino'),
        ('Ping', 'Ping.ino'),
        ('Sweep', 'Sweep.ino'),
        ('ControlledDCMotor', 'ControlledDCMotor.ino'),
        # ('RobotArm', 'RobotArmGrabSponge.ino'),
        ('ToneMelody', 'Melody.ino'),
        ('ShiftOutHelloWorld', 'ShftOut11.ino'),
    ]:
        assert omc.sendExpression(f'Arduino.Internal.buildSketchOM("{sketch}")')
        info = omc.sendExpression(f'simulate(Arduino.Examples.{model})')
        assert info['resultFile']

    for model in ['Blink', 'Fade', 'AnalogInput', 'Button', 'Sweep']:
        info = omc.sendExpression(f'simulate(Arduino.Firmata.Examples.{model})')
        assert info['resultFile']
