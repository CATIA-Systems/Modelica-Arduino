import markdown2
import os
import sys
import shutil
from datetime import date


# clean up
for path in ['dist']:
    if os.path.exists(path):
        shutil.rmtree(path)

obsolete = []

for root, dirs, files in os.walk('.'):

    if root.endswith('.git'):
        continue

    for f in files:
        if f.endswith('.bak-mo') or f.endswith('.lib'):
            obsolete += [os.path.join(root, f)]

for path in obsolete:
    os.remove(path)

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

if not os.path.exists('dist/Libraries'):
    os.makedirs('dist/Libraries')

with open('README.html', 'w') as html_file:
    html_file.write(html)


ignore = shutil.ignore_patterns('.*', '*.suo', '*.sdf', 'Debug', 'Release')

# copy the code
for folder in ['Arduino', 'Sketches', 'VisualStudio']:
    shutil.copytree(folder, os.path.join('dist', folder), ignore=ignore)

# copy the docs
for f in ['LICENSE', 'README.html']:
    shutil.copyfile(f, os.path.join('dist', f))

# create the archive
build_time = date.today().strftime('%Y%m%d')

os.system(r'"C:\Program Files\7-Zip\7z.exe" a ModelicaArduino-SNAPSHOT+' + build_time + '.zip .\dist\*')
