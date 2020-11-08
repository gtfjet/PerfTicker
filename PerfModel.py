import subprocess
from datetime import datetime
now = datetime.now()
summary = '''
# Current Status
| Date    | Version | Cost   | Weight | Length  |
|    -    |    -    |    -   |   -    |  -      |
| YYY     | XXX     |  28    | 1.2    |    6.7  |  
'''
ver=subprocess.check_output(['git', 'rev-parse', 'HEAD'])
print(ver[0:10])
summary=summary.replace('XXX',ver[0:10]);
summary=summary.replace('YYY',str(now));
print(summary)
f = open("Home.md", "w")
f.write(summary)
f.close()
