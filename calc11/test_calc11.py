#!/usr/bin/env python3

import numpy as np
from calc11 import almacalc

nant = 1
ntimes = 1

refx = 0.0
refy = 0.0
refz = 0.0
antx = np.zeros(nant)
anty = np.zeros(nant)
antz = np.zeros(nant)
temp = np.zeros(nant)
pressure = np.zeros(nant)
humidity =  np.zeros(nant)
mjd = np.array([58849.0] * ntimes)
ra  = np.zeros(ntimes)
dec = np.zeros(ntimes)
ssobj = np.zeros(ntimes, dtype=bool)
dx = np.zeros(ntimes)
dy = np.zeros(ntimes)
dut = np.zeros(ntimes)
leapsec = 0.0
axisoff = np.zeros(nant)
sourcename = [''] * ntimes
jpx_de421 = 'data/DE421_little_Endian'

geodelay, drydelay, wetdelay = almacalc(refx, refy, refz, antx, anty,
                                        antz, temp, pressure,
                                        humidity, mjd, ra, dec, ssobj,
                                        dx, dy, dut, leapsec, axisoff,
                                        sourcename, jpx_de421)

print(geodelay)
print(drydelay)
print(wetdelay)
