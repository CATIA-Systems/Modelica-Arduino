import markdown2
import os
import sys


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

