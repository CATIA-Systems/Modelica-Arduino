import markdown2
import os
import zipfile


archive_name = 'Modelica-Arduino.zip'

# remove the build directory
if os.path.exists(archive_name):
    os.remove(archive_name)

dist_files = []

input = [('Arduino', ('.mo', '.order', '.png', '.css', '.h')),
         ('Libraries', ('.cpp', '.h')),
         ('Sketches', '.ino'),
         ('VisualStudio', ('.cpp', '.h', '.vcxproj', '.vcxproj.filters', '.sln'))]

# collect the distribution files
for folder, suffix in input:
    for root, dirs, files in os.walk(folder):
        for f in files:
            if f.endswith(suffix):
                dist_files += [os.path.join(root, f)]


dist_files += ['Arduino/Resources/Library/win32', 'Libraries', 'LICENSE', 'README.html']


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
