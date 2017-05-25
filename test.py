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
        res = cls.dymola.ExecuteCommand(cmd)

    @classmethod
    def tearDownClass(cls):
        print("Closing Dymola")
        cls.dymola.close()

    def test_examples(self):

        examples = [
            ('AnalogReadSerial', 1, ['arduinoUno.A0.v']),
            ('BarGraph', 10, ['arduinoUno.A0.v', 'arduinoUno.D2.v', 'arduinoUno.D3.v', 'arduinoUno.D4.v', 'arduinoUno.D5.v', 'arduinoUno.D6.v', 'arduinoUno.D7.v', 'arduinoUno.D8.v', 'arduinoUno.D9.v', 'arduinoUno.D10.v', 'arduinoUno.D11.v']),
            ('Blink', 10, ['arduinoUno.D13.v']),
            ('BlinkWithoutDelay', 10, ['arduinoUno.D13.v']),
            ('Button', 10, ['arduinoUno.D2.v', 'arduinoUno.D13.v']),
            ('Fade', 10, ['arduinoUno.A0.v', 'arduinoUno.D9.v']),
            ('Ping', 0.21, ['arduinoUno.D7.v']),
        ]

        for name, stop_time, signals in examples:

            model = 'Arduino.Examples.' + name

            print("Simulating %s" % model)
            success = self.dymola.simulateModel(model, stopTime=stop_time)

            self.assertTrue(success, "Simulation failed")

            self.dymola.plot(signals)
            self.dymola.ExportPlotAsImage(name + ".png")


if __name__ == '__main__':
    unittest.main()
