import pytest


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
        ('Arduino.Examples.AnalogReadSerial', 1, ['arduinoUno.A0.v']),
        ('Arduino.Examples.BarGraph', 10, ['arduinoUno.A0.v', 'arduinoUno.D2.v', 'arduinoUno.D3.v', 'arduinoUno.D4.v', 'arduinoUno.D5.v', 'arduinoUno.D6.v', 'arduinoUno.D7.v', 'arduinoUno.D8.v', 'arduinoUno.D9.v', 'arduinoUno.D10.v', 'arduinoUno.D11.v']),
        ('Arduino.Examples.Blink', 10, ['arduinoUno.D13.v']),
        ('Arduino.Examples.BlinkWithoutDelay', 10, ['arduinoUno.D13.v']),
        ('Arduino.Examples.Button', 10, ['arduinoUno.D2.v', 'arduinoUno.D13.v']),
        ('Arduino.Examples.ControlledDCMotor', 0.5, ['speedSensor.w']),
        ('Arduino.Examples.Fade', 10, ['arduinoUno.A0.v', 'arduinoUno.D9.v']),
        ('Arduino.Examples.Ping', 0.21, ['arduinoUno.D7.v']),
        ('Arduino.Examples.RobotArm', 15, ['robotArmWithServos.baseServo.flange.phi']),
        ('Arduino.Examples.ShiftOutHelloWorld', 10, ['LED0.v', 'LED1.v', 'LED2.v', 'LED3.v']),
        ('Arduino.Examples.Sweep', 1, ['arduinoUno.D9.v']),
        ('Arduino.Examples.ToneMelody', 2.5, []),
        ('Arduino.Firmata.Examples.Blink', 10, ['digitalOutput.value']),
        ('Arduino.Firmata.Examples.Fade', 10, ['pwmOutput.pinConnector']),
        ('Arduino.Firmata.Examples.AnalogInput', 10, ['analogInput.y']),
        ('Arduino.Firmata.Examples.Button', 10, ['digitalInput.y']),
        ('Arduino.Firmata.Examples.Sweep', 10, ['servo.u']),
    ]

    with Dymola(showWindow=True) as dymola:

        dymola.openModel(path=package, changeDirectory=False)

        dymola.cd(workdir)

        for model, stop_time, signals in examples:
            dymola.simulate(model)
