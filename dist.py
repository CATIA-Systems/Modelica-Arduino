from pathlib import Path
from subprocess import check_call

import markdown2
import os
import zipfile


archive_name = 'Modelica-Arduino.zip'

# remove the archive
if os.path.exists(archive_name):
    os.remove(archive_name)

generator = 'Visual Studio 17 2022'

root = Path(__file__).parent

# build the ModelicaFirmata library
for platform in ['x64']:

    check_call([
        'cmake',
        '-G', generator,
        '-A', platform,
        '-S', (root / 'Arduino' / 'Resources' / 'Source' / 'Firmata').as_posix(),
        '-B', (root / 'Arduino' / 'Resources' / 'Source' / 'Firmata' / platform).as_posix(),
    ])

    check_call([
        'cmake',
        '--build', (root / 'Arduino' / 'Resources' / 'Source' / 'Firmata' / platform).as_posix(),
        '--config', 'Release'
    ])

dist_files = []

input = [('Arduino', ('.mo', '.order', '.png', '.css', '.h', '.c', '.cpp', '.ino', 'ModelicaFirmata.dll', '.wrl', 'CMakeLists.txt'))]

# collect the distribution files
for folder, suffix in input:
    for root, dirs, files in os.walk(folder):
        for f in files:
            if f.endswith(suffix):
                dist_files += [os.path.join(root, f)]


dist_files += ['Arduino/Resources/Library/win64', 'LICENSE.txt', 'README.html']


html = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="Arduino/Resources/Images/simple.css">
</head>
<body>
"""

with open('README.md', 'r') as md_file:
    html += markdown2.markdown(md_file.read(), extras=['fenced-code-blocks', 'tables'])

html += """</body>
</html>
"""

with open('README.html', 'w') as html_file:
    html_file.write(html)

# create the archive
with zipfile.ZipFile(archive_name, 'w', zipfile.ZIP_DEFLATED) as zipf:
    for name in dist_files:
        zipf.write(filename=name)
