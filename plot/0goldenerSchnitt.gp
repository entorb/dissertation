set terminal postscript eps size 15cm,10cm

# a:b = 1.618
GSb = 5.5 # cm Plothöhe
GSa = GSb * 1.618

GSrandLR = (15.0-GSa)/15.0 / 2
set lmargin at screen GSrandLR
set rmargin at screen 1.0-GSrandLR
GSrandBT = (10.0-GSb)/10.0 / 2
set bmargin at screen GSrandBT
set tmargin at screen 1.0-GSrandBT
