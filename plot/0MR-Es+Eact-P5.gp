#!/usr/bin/gnuplot
term  = "eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

sEact="{/URWClassico-Ita E}_{act,{/Symbol s}}"
sEs="{/URWClassico-Ita E}_{S}"
Temp=40

set style data linespoints
dataKen = '../data/andereLeute/P5+F4-Ken.dat'

material = materialP5
unset label 2
#set lmargin 5.5 ; set rmargin 0.5 ; set tmargin 0.5
set key t r # at graph 1 , graph 1
set key samplen 0 spacing 1.1 width (widthKeyP5-2)
# set key title "Pentacene : F4-TCNQ"
set key title " "
set key noopaque # workaround for gnuplot bug
set label 99 "Pentacene : F_4-TCNQ" center front at first 0.23 , first 377 font ",18"
set ytics format '%g' 100
set mytics 4
set ylabel axisLabelE offset 0,0
set xlabel axisLabelMR offset 0,0.5
unset y2tics
set output "MR-Es+Eact-P5" . ".gp" . term

if (color eq "color") set style line 5 lt 1 linecolor rgb "red"
if (color eq "sw") set style line 5 lt 1
set style line  5 lw 4 ps 2.5 pointtype  6 #= kreis

plot [:][0:*]\
  dataP5 u ($1):($6) title sEact ls 25 \
, dataP5 u ($1):($7*(c0C+int(Temp))/1000) title sEs ls 5 \
, dataKen u 1:5 t sEs." by Harada et al." ls 2
unset output
#pt 7
#pt 6 ps 2.5

load "footer.gp"
