#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

load "00header.gp"

# einzelne
FIT_LIMIT = 1e-10 # wichtig fuer guten Fit!

set xlabel "Time {/URWClassico-Ita t} (min)"
set xtics 15
set ylabel "Normalized Conductivity {/Symbol-Oblique s}/{/Symbol-Oblique s}_0" #textcolor ls 1
set ytics 0.05 nomirror format "%.2f" # textcolor ls 1
set y2tics 0.1 nomirror format "%.1f" # textcolor ls 2
set xrange [0:60]
set y2range [24.9:25.1]

set key width 0.25

f(x) = 1 + a - a * exp (- (x/tau))

d068="../data/n4_C60+Cr2hpp4/longtimecond/0.0115_01.0_068.dat" # zunehmend
d078="../data/n4_C60+Cr2hpp4/longtimecond/0.3453_23.9_078.dat" # abnehmend

set output "MR-LongTimeCond-n-Pd-low-high-fit".".gp".term
set terminal postscript size 14.85cm,7cm
set multiplot layout 1,2 rowsfirst

marL=0.11
marR=1.0-marL
plotbreite=0.31
titelpos=0.35

# Plot (a)
set ylabel offset 1,0
set label 1 sLabelA." {/URWClassico-Ita C}=0.012 MR" at graph titelpos, graph 0.90 center front #font ",24"
set obj 3 rect at graph titelpos, graph 0.90 size char 10, char 1.5
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder front #back behind

set lmargin at screen marL
set rmargin at screen marL+plotbreite

set key bottom right samplen 1.5 invert

unset y2label

#Sample 068
data = d068
# start values
a = 0.14
tau = 2400.0/60
firstI=4.1261e-06
lastI=4.5856e-06
firstT=2167.0

fit f(x) data u (($1-firstT)/60):($2/firstI) via tau,a
set mxtics 3
set yrange[0.95:1.15]

plot \
 data u (($1-firstT)/60):(0.5*$3+0.5*$4) axis x1y2 title "{/URWClassico-Ita T}" with l ls 1 lw 1 \
, f(x) t "fit" w l ls 50 \
,data u (($1-firstT)/60):($2/firstI) every 20 t "{/Symbol-Oblique s}/{/Symbol-Oblique s}_0" with p ls 5 ps 2 lw 1

# Plot (b)

set label 1 sLabelB." {/URWClassico-Ita C}=0.345 MR"
set lmargin at screen marR-plotbreite
set rmargin at screen marR

set y2label axisLabelTinC offset -1.25,0
unset ylabel

#Sample 078
data = d078
# start values
a = -0.1
tau = 3000.0/60
firstI=7.5767e-05
lastI=6.9295e-05
firstT=2381.6

#set key bottom left at graph 0, graph 0

fit f(x) data u (($1-firstT)/60):($2/firstI) via tau,a
set yrange[0.85:1.05]
replot

unset multiplot
unset output

unset obj 3

set mxtics

# Plot der Fitparameter Pd und AS

load "00header.gp" # reset default values
load "00_vs_doping-header.gp"

set label 1  at graph 0.075, graph 0.05 center front

unset y2label; unset y2tics
set xtics autofreq
set ytics autofreq mirror format "%g"

dn1 = "../data/longtimecond/n1_C60+OH-DMBI.dat"
dn2 = "../data/longtimecond/n2_C60+AOB.dat"
dn3 = "../data/longtimecond/n3_C60+W2hpp4.dat"
dn4 = "../data/longtimecond/n4_C60+Cr2hpp4.dat"

set key r t at first 0.002, first 1.9 noinvert width widthKeyPd height 0.2

set terminal postscript size 14.85cm,7cm
marL=0.12
marR=1.0-0.01
plotbreite=0.385
titelpos=0.07

# PaddleWheels
set output "MR-LongTimeCond-n-Pd-fitparameter" . ".gp" . term
set multiplot layout 1,2 rowsfirst
# Plot (a): relative change a
set key off
set label 1 sLabelA

set lmargin at screen marL
set rmargin at screen marL+plotbreite

set xzeroaxis ls -1 lw 1

set yrange[*:*]
set mytics 4

set ylabel axisLabelLTConda offset 0,0
set ytics 20 format "%+g%%"
set ytics add ('0' 0)
plot \
  dn4 u 1:($5*100) title materialN4 w lp ls 4 \
, dn3 u 1:($5*100) title materialN3 w lp ls 3

# Plot (b): tau
set label 1 sLabelB
set lmargin at screen marR-plotbreite
set rmargin at screen marR
set key on
set yrange[0:2] ; set ytics 0.5
set mytics 5
set ytics format "%.1f"
set ylabel axisLabelLTCondtau
set ylabel offset 1,0
plot \
  dn4 u 1:($6/3600) title materialN4 w lp ls 4 \
, dn3 u 1:($6/3600) title materialN3 w lp ls 3

unset multiplot
unset output

# AirStables

marL=0.135
marR=1.0-0.01
plotbreite=0.38
titelpos=0.07

set key width widthKeyAS
set key off
set output "MR-LongTimeCond-n-AS-fitparameter" . ".gp" . term
set multiplot layout 1,2 rowsfirst
# Plot (a): relative change a
set label 1 sLabelA

set lmargin at screen marL
set rmargin at screen marL+plotbreite

set xzeroaxis ls -1 lw 1

set yrange[*:450] ;
set ytics 100 format "%+g%%"
set ytics add ('0' 0)
set mytics 4

set ylabel axisLabelLTConda offset 0,0
plot \
  dn2 u 1:($5*100) title materialN2 w lp ls 2 \
, dn1 u 1:($5*100) title materialN1 w lp ls 1

# Plot (b): tau
set label 1 sLabelB
set lmargin at screen marR-plotbreite
set rmargin at screen marR

set key on r t at first 0.002, first 2.15

set yrange[0:2.25] ; set ytics 0.5
set mytics 5
set ytics format "%.1f"
set ylabel axisLabelLTCondtau offset 1,0
plot \
  dn2 u 1:($6/3600) title materialN2 w lp ls 2 \
, dn1 u 1:($6/3600) title materialN1 w lp ls 1
unset multiplot
unset output

load "footer.gp"

