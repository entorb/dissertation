#!/usr/bin/gnuplot
term  = "eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "9LayoutCond.gp"
load "0goldenerSchnitt.gp"
set ylabel offset 0.0,0.0

fitHigh=0.05
f1(x) = m1*x+b1 ; m1=1.0
fit [*:log(fitHigh)] f1(x) dataP5 using (log($1)):(log($9)) via b1 #,m1
f2(x) = m2*x+b2 ; m2=2.5
fit [*:log(fitHigh)] f2(x) dataP5 using (log($1)):(log($4)) via b2 #,m2
#f3(x) = m3*x+b3 ; m3=3.0
#fit [*:log(fitHigh)] f3(x) dataP5 using (log($1)):(log($4)) via b3,m3

SlopeLabelXPos=0.003
set label 1 sprintf("%.1f",m1) at SlopeLabelXPos, exp(f1(log(SlopeLabelXPos)))*0.7 center font ",16"
set label 2 sprintf("%.1f",m2) at SlopeLabelXPos, exp(f2(log(SlopeLabelXPos)))*2 center font ",16"

set style data linespoints
dataHans = '../data/andereLeute/P5+F4-Hans.dat'
dataKen = '../data/andereLeute/P5+F4-Ken.dat'

set key title "Pentacene : F4-TCNQ"
set key title " "
set label 99 "Pentacene : F_4-TCNQ" center front at first 1.13 , first .67E-2 font ",18"
# set key noopaque # workaround for gnuplot bug
#set key t l at first 0.01 , first 6E-5 width 0 height -1 invert
set key l t at first 0.3 , first 1E-2  width (widthKeyP5-2) height 0.1 font ",18" spacing 1.1
set output "MR-Cond-P5" . ".gp" . term

# if (color eq "color") set style line 21 lt 1 linecolor rgb "red"
# if (color eq "color") set style line 22 lt 1 linecolor rgb "blue"
# if (color eq "color") set style line 23 lt 1 linecolor rgb "dark-magenta"
# if (color eq "color") set style line 24 lt 1 linecolor rgb "dark-green"

if (color eq "color") set style line 5 lt 1 linecolor rgb "red"
if (color eq "sw") set style line 5 lt 1
set style line  5 lw 4 ps 2.5 pointtype  6 #= kreis

plot  \
 dataP5 u ($1):($9) title "as deposited" ls 25 \
,dataP5 u ($1):($4) title "after annealing" ls 5 \
,dataHans u 1:3 t "by Kleemann et al." ls 4 \
,dataKen u 1:3 t "by Harada et al." ls 2 \
,(x<=0.003)||(x>=fitHigh)?1/0:exp(f1(log(x))) notitle w l ls 50\
,(x<=0.003)||(x>=fitHigh)?1/0:exp(f2(log(x))) notitle w l ls 50
unset output

print sprintf ("m1=%.1f",m1)
print sprintf ("m2=%.1f",m2)
# print sprintf ("m3=%.1f",m3)

load "footer.gp"
