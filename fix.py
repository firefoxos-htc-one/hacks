from lxml import etree
import subprocess

B2G_PATH = '../B2G/'

xml = etree.parse('m7ul.xml')


for project in xml.findall('project'):
    if project.get('revision') != None and not project.get('remote') == 'b2g':
        continue
    path = project.get('path')
    process = subprocess.Popen(['/usr/bin/git', 'rev-parse', 'HEAD'], cwd=B2G_PATH + path, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    commit = process.communicate()[0]
    project.set('revision', commit.strip())
print etree.tostring(xml)
