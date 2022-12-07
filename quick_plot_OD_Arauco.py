import opendrift

import numpy as np

o = opendrift.open("OpenDrift_CV_6h_landmask.nc")
#o = opendrift.open("OpenDrift_CV_6h_landmask.nc", elements=np.arange(0,40000,100))
#o = opendrift.open("OpenDrift_SV_6h_landmask.nc", elements=np.arange(0,40000,100))

o.plot(filename="archivo_CV.png",linecolor="z",fast = True) #, corners=[-74.5,-73.0,-43.0,-41.0])

o.animation(filename="archivo_CV.mp4",linecolor="z",fast = True)
