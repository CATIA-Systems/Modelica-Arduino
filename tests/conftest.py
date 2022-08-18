import pytest
from os import makedirs
from pathlib import Path
from shutil import rmtree


@pytest.fixture
def package():
    yield Path(__file__).parent.parent / 'Arduino' / 'package.mo'


@pytest.fixture
def workdir():
    path = Path(__file__).parent / 'work'
    rmtree(path, ignore_errors=True)
    makedirs(path)
    yield path
