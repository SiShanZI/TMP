#!/usr/bin/env python

import os
from glob import glob
import numpy as np
import sys
sys.path.append('/home/apple/Wdir/Def/Spinal')
import Xls

Top_dir = '/home/apple/Wdir/Go/Final/Pro'
Sav_dir = '/home/apple/Wdir/Go/Final/Pro'
os.chdir(Top_dir)

div_C = []
WMtr_C = []
Sienax = []

for i in sorted(glob('*')):
    if os.path.isdir(i):
        os.chdir(i)
        for j in sorted(glob('*')):
            if os.path.isdir(j):
                os.chdir(j)
                div_C.append(Xls.div_stack())
                #WMtr_C.append(Xls.WMtr_C())
                #Sienax.append(Xls.Sienax())
                os.chdir('..')


        os.chdir('..')


os.chdir(Sav_dir)
np.savetxt('div_C', np.array(div_C, dtype='float32'))
#np.savetxt('WMtr_C', np.array(WMtr_C, dtype='float32')
#np.savetxt('Sienax', np.array(Sienax, dtype='float32').reshape(Sub, -1))
