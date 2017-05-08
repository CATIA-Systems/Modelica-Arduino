import markdown2
import os
import zipfile


archive_name = 'Modelica-Arduino.zip'

# remove the build directory
if os.path.exists(archive_name):
    os.remove(archive_name)

dist_files = []

input = [('Arduino', ('.mo', '.order', '.png', '.css', '.h')),
         ('Sketches', '.ino'),
         ('VisualStudio', ('.cpp', '.h', '.vcxproj', '.vcxproj.filters', '.sln'))]

for folder, suffix in input:
    for root, dirs, files in os.walk(folder):
        for f in files:
            if f.endswith(suffix):
                dist_files += [os.path.join(root, f)]

# for root, dirs, files in os.walk('Arduino'):
#     for f in files:
#         if f.endswith(('.mo', '.order', '.png', '.css', '.h')):
#             dist_files += [os.path.join(root, f)]
#
# for root, dirs, files in os.walk('Sketches'):
#     for f in files:
#         if f.endswith('.ino'):
#             dist_files += [os.path.join(root, f)]
#
# for root, dirs, files in os.walk('VisualStudio'):
#     for f in files:
#         if f.endswith(('.cpp', '.h', '.vcxproj', '.vcxproj.filters', '.sln')):
#             dist_files += [os.path.join(root, f)]

dist_files += ['Libraries', 'build_sketch.bat', 'LICENSE', 'README.html']

# obsolete = []
#
# for root, dirs, files in os.walk('.'):
#
#     if root.endswith('.git'):
#         continue
#
#     for f in files:
#         if f.endswith(('.bak-mo', '.lib')):
#             obsolete += [os.path.join(root, f)]
#
# for path in obsolete:
#     os.remove(path)

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
