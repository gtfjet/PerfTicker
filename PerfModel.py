import subprocess
from datetime import datetime
now = datetime.now()
ver = subprocess.check_output(['git', 'rev-parse', 'HEAD'])
dat = '| YYY | XXX |  28  |  1.2  |  2.675  |'
dat = dat.replace('XXX',ver[0:7]);
dat = dat.replace('YYY',str(now));
print(dat)
f = open("status", "w")
f.write(dat)
f.close()
