from dymola.dymola_interface import DymolaInterface
from dymola.dymola_exception import DymolaException
import os
import unittest


class ExamplesTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):

        cls.project_dir, _ = os.path.split(__file__)
        package_file = os.path.join(cls.project_dir, 'Arduino', 'package.mo')

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

            sketch_file = os.path.join(self.project_dir, 'VisualStudio', 'Arduino', 'Sketch.cpp')

            print("Writing %s" % sketch_file)
            with open(sketch_file, 'w') as f:
                code = '''#include "Sketch.h"
#include "Arduino.h"
#include "SoftSerial.h"

SoftSerial Serial;

// include your sketch here
#include "%s.ino"
''' % name
                f.write(code)

            print("Building static library")
            command = os.path.join(self.project_dir, 'build_sketch')
            os.system(command)

            print("Simulating " + name)
            success = self.dymola.simulateModel('Arduino.Examples.' + name, stopTime=stop_time)

            self.assertTrue(success, "Simulation failed")

            self.dymola.plot(signals)
            self.dymola.ExportPlotAsImage(name + ".png")


if __name__ == '__main__':
    unittest.main()
