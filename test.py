from dymola.dymola_interface import DymolaInterface
from dymola.dymola_exception import DymolaException
import os
import unittest
import zipfile
import shutil


class ExamplesTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):

        cls.project_dir, _ = os.path.split(__file__)

        temp_dir = os.path.join(cls.project_dir, 'Temp')

        # clean up
        if os.path.isdir(temp_dir):
            shutil.rmtree(temp_dir)

        # extract the distribution file
        with zipfile.ZipFile("Modelica-Arduino.zip", "r") as zip_ref:
            zip_ref.extractall("Temp")

        package_file = os.path.join(temp_dir, 'Arduino', 'package.mo')

        print("Starting Dymola")
        cls.dymola = DymolaInterface(showwindow=False)

        cmd = 'openModel("{}")'.format(package_file)

        print("Loading Arduino library")
        cls.dymola.ExecuteCommand(cmd)

        print("Setting Compiler")
        cls.dymola.ExecuteCommand('SetDymolaCompiler("vs", {"CCompiler=MSVC","MSVCDir=C:/Program Files (x86)/Microsoft Visual Studio 14.0/Vc"});')

    @classmethod
    def tearDownClass(cls):
        print("Closing Dymola")
        cls.dymola.close()

    def test_examples(self):

        examples = [
            ('Arduino.Examples.AnalogReadSerial', 1, ['arduinoUno.A0.v']),
            ('Arduino.Examples.BarGraph', 10, ['arduinoUno.A0.v', 'arduinoUno.D2.v', 'arduinoUno.D3.v', 'arduinoUno.D4.v', 'arduinoUno.D5.v', 'arduinoUno.D6.v', 'arduinoUno.D7.v', 'arduinoUno.D8.v', 'arduinoUno.D9.v', 'arduinoUno.D10.v', 'arduinoUno.D11.v']),
            ('Arduino.Examples.Blink', 10, ['arduinoUno.D13.v']),
            ('Arduino.Examples.BlinkWithoutDelay', 10, ['arduinoUno.D13.v']),
            ('Arduino.Examples.Button', 10, ['arduinoUno.D2.v', 'arduinoUno.D13.v']),
            ('Arduino.Examples.Fade', 10, ['arduinoUno.A0.v', 'arduinoUno.D9.v']),
            ('Arduino.Examples.Ping', 0.21, ['arduinoUno.D7.v']),
            ('Arduino.Examples.Sweep', 1, ['arduinoUno.D9.v']),
            ('Arduino.Examples.RobotArm', 15, ['baseServo.flange.phi']),
            ('Arduino.Firmata.Examples.Blink', 10, ['digitalOutput.value']),
            ('Arduino.Firmata.Examples.Fade', 10, ['pwmOutput.pinConnector']),
            ('Arduino.Firmata.Examples.AnalogInput', 10, ['analogInput.y']),
            ('Arduino.Firmata.Examples.Button', 10, ['digitalInput.y']),
            ('Arduino.Firmata.Examples.Sweep', 10, ['servo.u']),
        ]

        for model, stop_time, signals in examples:

            print("Simulating %s" % model)
            success = self.dymola.simulateModel(model, stopTime=stop_time)

            self.assertTrue(success, "Simulation failed")

            self.dymola.plot(signals)
            self.dymola.ExportPlotAsImage(model + ".png")


if __name__ == '__main__':
    unittest.main()
