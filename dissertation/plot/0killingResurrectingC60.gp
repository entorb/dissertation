#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "0goldenerSchnitt.gp"

# set terminal postscript size 7.5cm,7cm

# set lmargin 6.75
# set rmargin 1.75
# set tmargin 0.75
# set bmargin 2.5
# set ylabel offset 1.5,0
# set y2label offset 0,0

set key off

load "9LayoutCond.gp" #set ylabel "Conductivity (S/cm)"

set xlabel "Time (min)"

I2Cond=83316.0

xoffset=0 # min
xskala=60 # min

set mxtics 4 # minor ytics

set label 1 "N_2" at first 30, first 3.162E-1 center front
set label 2 "air" at first 95, first 3.162E-2 center front

data="../data/einzelne/killingC60-4+5.dat" ;

set yrange [1E-5:2]

set output "killing+reanimating-C60-1-N2-air" . ".gp" . term
plot \
data using ($1/xskala-xoffset):($4*I2Cond) every 1 t "cond." w lines ls 1 lc rgb "black"
unset output
unset label 1 ; unset label 2

set terminal postscript size 7.25cm,7cm
data="../data/einzelne/killingC60-7.dat" ;
#set label 1 "evacuating"
set lmargin 6.25 # sum=12.5
set rmargin 6.25
set ylabel  offset +0.5
set y2label offset -1
set xtics 100,200
set ytics nomirror
set y2label "Pressure {/URWClassico-Ita P} (Pa)" offset -0.5,0
set y2tics nomirror #
set y2tics 1E-4,1000
#set y2tics add ("1" 1)
set logscale y2
set format y2 "10^{%L}"

set arrow 1 from first 290, first 1.2E-3 rto graph -0.15, graph 0 ls 70 #ls 1 lw 2
set arrow 2 from first 350, second 0.9E-4 rto graph +0.15, graph 0 ls 70 #ls 1 lw 2

set label 2 sLabelA at graph 0.15, graph 0.93 center front
set key t l at first 500, first 1E-3 samplen 0.75 width 1

set output "killing+reanimating-C60-2-evap" . ".gp" . term
plot [75:*] [:] [:] [1E-5:1E5] \
 data using ($1/xskala-xoffset):($4*I2Cond) every 5 t "{/Symbol-Oblique s}" w lines ls 1 lc rgb "black" \
, data using ($1/xskala-xoffset):($7*100) every 5 t "{/URWClassico-Ita P}" w lines axes x1y2 ls 2
unset output

unset arrow 1 ; unset arrow 2

set key t l at first 1000, first 1E-3

data="../data/einzelne/killingC60-12.dat" ;
set lmargin 6.25 # sum=12.5
set rmargin 6.25
set ylabel offset 0.5,0
set y2label "Temperature {/URWClassico-Ita T} (C)" offset -1,0
set y2tics format "%g"
set y2tics autofreq
set xtics 100
unset logscale y2

set arrow 1 from first 880, first 1E-2 rto graph -0.15, graph 0 ls 70 #ls 1 lw 2
set arrow 2 from first 848, first 1E-4 rto graph 0.15, graph 0 ls 70 #ls 1 lw 2

set arrow 3 from first 912, first (2.1E-3*1.1) to first 912, first (0.44*0.9) ls 70
set arrow 4 from graph 0,first 2.1E-3 to first 925,first 2.1E-3 nohead ls 50
set arrow 5 from graph 0,first 0.44  rto graph 1,0 nohead ls 50 front
set label 2 sLabelB

if (color eq "color") set arrow 3 lc rgb "green"
if (color eq "color") set arrow 4 lc rgb "green"
if (color eq "color") set arrow 5 lc rgb "green"

if (color eq "color") set style line  3 lt 1  lc rgb "red"

set my2tics 4 # minor ytics
set output "killing+reanimating-C60-3-heat" . ".gp" . term
plot [775:1250] [:] [:] [20:130]\
 data using ($1/xskala-xoffset):($4*I2Cond) every 2 t "{/Symbol-Oblique s}" w lines ls 1 lc rgb "black" \
,data using ($1/xskala-xoffset):(0.5*$5+0.5*$6) every 2 t "{/URWClassico-Ita T}" w lines axes x1y2 ls 3
unset output

load "footer.gp"
