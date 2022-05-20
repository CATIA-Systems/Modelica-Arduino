import pytest
from os import makedirs
from pathlib import Path
from shutil import rmtree
from pymola import Dymola


@pytest.fixture(scope='session')
def dymola():

    testsdir = Path(__file__).parent
    workdir = testsdir / 'work'

    with Dymola(showWindow=True) as dymola:

        dymola.openModel(path=testsdir.parent / 'Arduino' / 'package.mo', changeDirectory=False)

        if workdir.exists():
            rmtree(workdir)

        makedirs(workdir)

        dymola.cd(workdir)

        yield dymola
