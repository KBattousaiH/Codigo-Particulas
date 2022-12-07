#!/usr/bin/env python
"""==============
"""
import os
import opendrift
from opendrift.readers import reader_netCDF_CF_generic
from opendrift.models.oceandrift import OceanDrift
import numpy as np
from opendrift.readers import reader_ROMS_native

# Objeto
o = OceanDrift(loglevel=0)
filename_nc = 'golfo_his_SV.nc';
mosa_native = reader_ROMS_native.Reader(filename_nc)
o.add_reader([mosa_native])
o.set_config('general:coastline_action', 'previous')
o.vertical_advection()
o.set_config('general:use_auto_landmask', False)
# Seeding some particles
time_ini = mosa_native.start_time;

# Define punto de liberacion
lon1 = -73.2;    lat1 = -36.9774;  # E1
lon2 = -73.1778; lat2 = -37.0351;  # E2
lon3 = -73.1944; lat3 = -37.0750;  # E3
lon4 = -73.1667; lat4 = -36.8442;  # E4

#   Agrega el lugar y momento de liberacion de particulas
#
#z1=-37 z2=-37 z3=-24.5 z4=-28
#o.seed_elements(lon1, lat1,number=10000, radius=100,time=time_ini)
#o.seed_elements(lon2, lat2,number=10000, radius=100,time=time_ini)
#o.seed_elements(lon3, lat3,number=10000, radius=100,time=time_ini)
#o.seed_elements(lon4, lat4,number=10000, radius=100,time=time_ini)
o.seed_elements(lon1, lat1,number=10000, z=-37,  radius=100,time=time_ini)
o.seed_elements(lon2, lat2,number=10000, z=-37,  radius=100,time=time_ini)
o.seed_elements(lon3, lat3,number=10000, z=-24.5,radius=100,time=time_ini)
o.seed_elements(lon4, lat4,number=10000, z=-28 ,radius=100,time=time_ini)
#o.set_config('general:coastline_action', 'stranding')  # Se quiedan pegadas a la costa (Oil)

#o.run(steps=25920, time_step=-100, time_step_output=3600, outfile='back_opendrift.nc')
#o.run(steps=25920, time_step=-100, time_step_output=3600, outfile='mosa_opendrift_AS_100000_0-50m.nc')
#  25920 1mes (30 dias)
#  25920*2 = 51840  100seg          se guarda c/1h
#o.run(steps=51840,time_step=100,time_step_output=3600,outfile='OpenDrift_SV_h.nc')
o.run(steps=51840,time_step=100,time_step_output=21600,outfile='OpenDrift_SV_6h_landmask.nc')
#%%
# Print and plot results
# print(o)
o.plot(buffer=.2, fast=True, linecolor = 'z',filename='OpenDrift_SV6h_figlm.png')
#o.plot(filename='OD_sv.png')

