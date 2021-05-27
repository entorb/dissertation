#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

# set lmargin 5.3
# set rmargin 0.5
# set ylabel offset 1.5,0

set key t l height 0.5 spacing 1.1

set ylabel "Roughness {/URWClassico-Ita R}_{rms} (nm)"

set ytics 4
set mytics 4 # minor ytics

dataCr  = "../data/afm/stats-CrPd.dat"
dataW   = "../data/afm/stats-WPd.dat"
dataCr5 = "../data/afm/stats-CrPd-5um.dat"
dataW5  = "../data/afm/stats-WPd-5um.dat"

dataAOB5   = "../data/afm/stats-AOB-5um.dat"
dataDMBI5  = "../data/afm/stats-DMBI-5um.dat"

set key width widthKeyPd

set output "MR-AFM-Pd" . ".gp" . term
plot \
   dataCr u 1:3 t materialN4 w lp ls 4\
 , dataW  u 1:3 t materialN3 w lp ls 3
unset output
# , dataCr5 u 1:3 t "C60:CrPd 5um" w p ls 2\
# , dataW5  u 1:3 t "C60:WPd 5um" w p ls 1

set key width widthKeyAS

set output "MR-AFM-AS" . ".gp" . term
plot \
 dataDMBI5  u 1:3 t materialN1 w lp ls 1\
,dataAOB5   u 1:3 t materialN2 w lp ls 2
unset output

load "footer.gp"
