#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "9LayoutCond.gp"
load "0goldenerSchnitt.gp"

set key width widthKeyPd height 0.5 b r
set yrange [*:1E+1]
# set lmargin 6.75
# set rmargin 0.5

set output "MR-Cond-n-Pd-evap" . ".gp" . term
plot  \
 dataN4 u ($1):($9) title materialN4 w lp ls 24\
,dataN3 u ($1):($9) title materialN3 w lp ls 23
unset output

set key width widthKeyAS
set output "MR-Cond-n-AS-evap" . ".gp" . term
plot  \
 dataN1 u ($1):($9) title materialN1 w lp ls 21\
,dataN2 u ($1):($9) title materialN2 w lp ls 22
unset output

# #4=Cond
dataN3_30 = "../data/" . datafolderN3 . "/byTemp/Cond_030.dat"
dataN4_30 = "../data/" . datafolderN4 . "/byTemp/Cond_030.dat"

fitHigh=0.100
f1(x) = m1*x+b1 ; m1=2.0
fit [*:log(fitHigh)] f1(x) dataN1 using (log($1)):(log($4)) via b1
f2(x) = m2*x+b2 ; m2=1.0
fit [*:log(fitHigh)] f2(x) dataN2 using (log($1)):(log($4)) via b2
f3(x) = m3*x+b3 ; m3=1.0
fit [*:log(fitHigh)] f3(x) dataN3_30 using (log($1)):(log($4)) via b3
f4(x) = m4*x+b4 ; m4=1.0
fit [*:log(fitHigh)] f4(x) dataN4_30 using (log($1)):(log($4)) via b4
f34(x) = 1.0*x+(0.5*b3+0.5*b4)
#

# Paddlewheels
set terminal postscript size 14.85cm,7cm
set output "MR-Cond-n-Pd-evapVS30" . ".gp". term
set samples 300
set key bottom right at graph 0.97,  graph 0.03 opaque width -6 #font ",20"
set yrange [3E-3:10]
set y2range[3E-3:10]
set multiplot layout 1,2 rowsfirst
marL=0.105
plotbreite=0.41
titlepos=0.265

set label 1 "" at graph titlepos, graph 0.92 front center #font ",24"
set obj 10 rect at graph titlepos, graph 0.92 size char 13.2 , char 1.5
set obj 10 fc rgb "white" fillstyle solid 1.0 noborder front #back behind

# plot 1(left)
set label 1 sLabelA . " " . materialN4

set bmargin
set tmargin
set lmargin at screen marL
set rmargin at screen marL+plotbreite
plot \
  dataN4_30 u ($1):($4) title "after annealing" w p ls 4 \
, dataN4 u ($1):($9) title "as deposited" ls 24 \
, exp(f4(log(x))) notitle ls 50

# plot 2(right)
set label 1 sLabelB . " " . materialN3
set lmargin at screen marL+plotbreite
set rmargin at screen marL+plotbreite+plotbreite

unset ylabel
#set ytics mirror ("" 1, "" .1, "" 1E-2, "" 1E-3, "" 1E-4)
set ytics format "" ; set ytics add ('' 0.1, '' 1, '' 10)
set y2tics ; set logscale y2
set format y2 "10^{%L}"
set y2tics add ('0.1' 0.1, "1" 1, "10" 10) # to prevent 10^0 und 10^1

set xtics autofreq # (0.01,0.1,"1" 1 0)
plot [0.00105:]\
  dataN3_30 u ($1):($4) title "after annealing" w p ls 3 \
, dataN3 u ($1):($9) title "as deposited" ls 23 \
, exp(f3(log(x))) notitle ls 50

unset multiplot
unset output

# AirStables
set yrange [1E-6:10] ; set y2range [1E-6:10]
set output "MR-Cond-n-AS-evapVS25" . ".gp". term
set multiplot layout 1,2 rowsfirst

titlepos = 0.05
# plot 1(left)
load "9LayoutCond.gp"
set ytics; unset y2tics
set format y "10^{%L}"
set ytics add ('0.1' 0.1, '1' 1, '10' 10)
set label 1 sLabelA . " " . materialN2 at graph titlepos, graph 0.92 front left #font ",24"
set lmargin at screen marL
set rmargin at screen marL+plotbreite
set label 12 sprintf("%.1f",m2) at 0.0018, 1.5E-3 center font ",16"
plot \
  dataN2 u ($1):($4) title "after annealing" w p ls 2 \
, dataN2 u ($1):($9) title "as deposited" ls 22 \
, (x<=0.002)?1/0: exp(f2(log(x))) notitle ls 50
unset label 12

# plot 2(right)
#set yrange [5E-3:10]
set label 1 sLabelB . " " . materialN1
set lmargin at screen marL+plotbreite
set rmargin at screen marL+plotbreite+plotbreite
set ytics format "" ; set ytics add ('' 0.1, '' 1, '' 10)
set y2tics ; set logscale y2
set format y2 "10^{%L}"
set y2tics add ('0.1' 0.1, "1" 1, "10" 10) # to prevent 10^0 und 10^1
set xtics autofreq # (0.01,0.1,"1" 1 0)
unset ylabel
set label 11 sprintf("%.1f",m1) at 0.0035, 1.5E-3 center font ",16"
plot [0.00105:]\
  dataN1 u ($1):($4) title "after annealing" w p ls 1 \
, dataN1 u ($1):($9) title "as deposited" ls 21 \
, (x<=0.004)?1/0: exp(f1(log(x))) notitle ls 50
unset label 11
unset multiplot
unset output

unset label 1; unset obj 10
unset y2tics;

load "00header.gp"
load "00_vs_doping-header.gp"
load "9LayoutCond.gp"
load "0goldenerSchnitt.gp"

set output "MR-Cond-n-PdvsAS" . ".gp" . term
set key b r width widthKeyAS noinvert
set yrange [1E-3:1E+1]

set label 11 sprintf("%.1f",m1) at 0.0035, 1.5E-3 center font ",16"
set label 12 sprintf("%.1f",m2) at 0.0018, 1.5E-3 center font ",16"
set label 13 sprintf("%.1f",m3) at 0.0014, 2.9E-2 center font ",16"
set label 14 sprintf("%.1f",m4) at 0.0014, 9E-2 center font ",16"

plot  \
dataN4_30 u ($1):($4) title materialN4 w lp ls 4\
,dataN3_30 u ($1):($4) title materialN3 w lp ls 3\
,dataN1 u ($1):($4) title materialN1 w lp ls 1\
,dataN2 u ($1):($4) title materialN2 w lp ls 2\
,(x>=fitHigh)?1/0:exp(f1(log(x))) notitle ls 50\
,exp(f2(log(x))) notitle ls 50\
,(x>=fitHigh)?1/0:exp(f3(log(x))) notitle ls 50\
,(x>=fitHigh)?1/0:exp(f4(log(x))) notitle ls 50
unset output
#, (x>=fitHigh)?1/0:

unset label 11;unset label 12;unset label 13;unset label 14

set output "MR-Cond-n-DMBIs" . ".gp" . term
#set yrange [*:*]
set yrange [1E-3:1E+2]
set ytics add ('100' 100)

fitHigh=0.4
f5(x) = m5*x+b5 ; m5=2.0
fit [*:log(fitHigh)] f5(x) dataN1b using (log($1)):(log($4)) via b5

# set lmargin 6.75
# set rmargin 0.5

set label 15 sprintf("%.1f",m5) at 0.006, 3E-3 center font ",16"

set key width -9 t l at graph -0.02, graph 1.02 samplen 0 invert
plot  \
 dataN1 u ($1):($9) title materialN1. " as deposited" ls 21 \
,dataN1 u ($1):($4) title materialN1. " after annealing" ls 1 \
,dataN1b u ($1):($9) title materialN1b. " as deposited"  ls 25 \
,dataN1b u ($1):($4) title materialN1b. " after annealing"  ls 5 \
, (x<=0.006)||(x>=0.6)?1/0: exp(f5(log(x))) notitle ls 50
unset output

unset label 15

load "footer.gp"
