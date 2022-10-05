from pathlib import Path
import pytest
import numpy as np
from scipy.io import wavfile

from tests.utils import validate_result


def pymola_available():
    try:
        import pymola
        return True
    except:
        return False


@pytest.mark.skipif(not pymola_available(), reason="Pymola was not found")
def test_examples(workdir, package):

    from pymola import Dymola

    examples = [
        'Arduino.Examples.AnalogReadSerial',
        'Arduino.Examples.BarGraph',
        'Arduino.Examples.Blink',
        'Arduino.Examples.BlinkWithoutDelay',
        'Arduino.Examples.Button',
        'Arduino.Examples.ControlledDCMotor',
        'Arduino.Examples.Fade',
        'Arduino.Examples.Ping',
        'Arduino.Examples.RobotArm',
        'Arduino.Examples.ShiftOutHelloWorld',
        'Arduino.Examples.Sweep',
        'Arduino.Examples.ToneMelody',
        'Arduino.Firmata.Examples.Blink',
        'Arduino.Firmata.Examples.Fade',
        'Arduino.Firmata.Examples.AnalogInput',
        'Arduino.Firmata.Examples.Button',
        'Arduino.Firmata.Examples.Sweep',
    ]

    with Dymola(showWindow=True) as dymola:

        dymola.openModel(path=package, changeDirectory=False)

        dymola.cd(workdir)

        for model in examples:

            result = dymola.simulate(model)

            assert validate_result(
                result=result,
                workdir=workdir,
                model=model
            )
