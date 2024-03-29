import os
import pytest
from tests.utils import validate_result


def om_available():

    try:
        import OMPython
    except:
        return False

    return 'OPENMODELICAHOME' in os.environ


@pytest.mark.skipif(not om_available(), reason="OpenModelica was not found")
def test_run_examples(workdir, package):

    from OMPython import OMCSessionZMQ
    from pymola import Dsres

    omc = OMCSessionZMQ()

    assert omc.sendExpression(f'cd("{workdir.as_posix()}")') == workdir.as_posix()

    assert omc.sendExpression(f'loadFile("{package.as_posix()}")')

    for model, sketch in [
        ('AnalogReadSerial', 'AnalogReadSerial.ino'),
        ('BarGraph', 'BarGraph.ino'),
        ('Blink', 'Blink.ino'),
        ('BlinkWithoutDelay', 'BlinkWithoutDelay.ino'),
        ('Button', 'Button.ino'),
        ('ControlledDCMotor', 'ControlledDCMotor.ino'),
        ('Fade', 'Fade.ino'),
        ('Ping', 'Ping.ino'),
        #('RobotArm', 'RobotArmGrabSponge.ino'),
        ('ShiftOutHelloWorld', 'ShftOut11.ino'),
        ('Sweep', 'Sweep.ino'),
        ('ToneMelody', 'Melody.ino'),
    ]:
        assert omc.sendExpression(f'Arduino.Internal.buildSketchOM("{sketch}")')

        info = omc.sendExpression(f'simulate(Arduino.Examples.{model})')

        assert validate_result(
            result=Dsres(info['resultFile']),
            workdir=workdir,
            model=f'Arduino.Examples.{model}'
        )

    for model in ['Blink', 'Fade', 'AnalogInput', 'Button', 'Sweep']:
        info = omc.sendExpression(f'simulate(Arduino.Firmata.Examples.{model})')
        assert info['resultFile']
