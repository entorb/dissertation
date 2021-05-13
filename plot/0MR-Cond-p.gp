#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "9LayoutCond.gp"
#load "0goldenerSchnitt.gp"

fitHigh=0.100
f1(x) = m1*x+b1 ; m1=1.0
fit [*:log(fitHigh)] f1(x) dataP1 using (log($1)):(log($9)) via b1
f2(x) = m2*x+b2 ; m2=1.0
fit [*:log(fitHigh)] f2(x) dataP2 using (log($1)):(log($9)) via b2
f3(x) = m3*x+b3 ; m3=1.0
fit [*:log(fitHigh)] f3(x) dataP3 using (log($1)):(log($9)) via b3
f4(x) = m4*x+b4 ; m4=1.0
fit [*:log(fitHigh)] f4(x) dataP4 using (log($1)):(log($9)) via b4

min2=0.0015
max2=0.65
#m&b
set samples 600

f6(x) = m6*x+b6 ; m6=1.5
min6=0.024 ; max6=max2
fit [log(min6):log(max6)] f6(x) dataP1 using (log($1)):(log($9)) via b6

f7(x) = m7*x+b7 ; m7=2.5
min7=0.07; max7=max6
fit [log(min7):log(max7)] f7(x) dataP3 using (log($1)):(log($9)) via b7
# best fit for 0.1 .. 1.0
# m6=2.5

print m6
print m7

set yrange [1E-8:1E-2]
set lmargin 6.75
set rmargin 0.5

set terminal postscript size 10cm,10cm
set style data linespoints

#set key top left at graph 0, graph 1
set key spacing 1.1 width widthKeyp height 0
set key t l samplen 1.5

set output "MR-Cond-p-all-evap-fits" . ".gp" . term
SlopeLabelXPos=0.8
set label 6 sprintf("%.1f",m6) at 0.8, first 5.0E-3 center font ",16"
set label 7 sprintf("%.1f",m7) at 0.8, first 2.7E-3 center font ",16"
set label 8 sprintf("%.1f",m2) at 0.8, first 2.9E-4 center font ",16"
plot \
 dataP1 u ($1):($9) title materialP1 ls 1 \
,dataP2 u ($1):($9) title materialP2 ls 32 \
,dataP3 u ($1):($9) title materialP3 ls 3 \
,dataP4 u ($1):($9) title materialP4 ls 34 \
,(x<=min6)||(x>=max6)?1/0:exp(f6(log(x))) t "linear fits" w l ls 50 lw 6 lc rgb "black" \
,(x<=min7)||(x>=max7)?1/0:exp(f7(log(x))) notitle w l  ls 50 lw 6 lc rgb "black" \
,(x<=min2)||(x>=max2)?1/0:exp(f2(log(x))) notitle w l  ls 50 lw 6 lc rgb "black"
unset output

print "m6=".sprintf("%.1f",m6)
print "m7=".sprintf("%.1f",m7)
print "m2=".sprintf("%.1f",m2)

set output "MR-Cond-p-all-30-fits" . ".gp" . term

dataP1_30 = "../data/" . datafolderP1 . "/byTemp/Cond_030.dat"
dataP2_30 = "../data/" . datafolderP2 . "/byTemp/Cond_030.dat"
dataP3_30 = "../data/" . datafolderP3 . "/byTemp/Cond_030.dat"
dataP4_30 = "../data/" . datafolderP4 . "/byTemp/Cond_030.dat"

f1(x) = m1*x+b1 ; m1=1.0
fit [*:log(fitHigh)] f1(x) dataP1_30 using (log($1)):(log($4)) via b1
f2(x) = m2*x+b2 ; m2=1.0
fit [*:log(fitHigh)] f2(x) dataP2_30 using (log($1)):(log($4)) via b2
f3(x) = m3*x+b3 ; m3=1.0
fit [*:log(fitHigh)] f3(x) dataP3_30 using (log($1)):(log($4)) via b3
f4(x) = m4*x+b4 ; m4=1.0
fit [*:log(fitHigh)] f4(x) dataP4_30 using (log($1)):(log($4)) via b4

plot \
 dataP1_30 u ($1):($4) title materialP1 ls 1 \
,dataP2_30 u ($1):($4) title materialP2 ls 32 \
,dataP3_30 u ($1):($4) title materialP3 ls 3 \
,dataP4_30 u ($1):($4) title materialP4 ls 34 \
,(x<=min6)||(x>=max6)?1/0:exp(f6(log(x))) t "linear fits" w l ls 50 lw 6 lc rgb "black" \
,(x<=min7)||(x>=max7)?1/0:exp(f7(log(x))) notitle w l  ls 50 lw 6 lc rgb "black" \
,(x<=min2)||(x>=max2)?1/0:exp(f2(log(x))) notitle w l  ls 50 lw 6 lc rgb "black"
unset output

unset label 5; unset label 6; unset label 7; unset label 8

# Multiplot
set terminal postscript eps size 14.85cm,14.85cm # wichtig das quadratisch wegen Goldener Schnitt, sonst unten anpassen

set output "MR-Cond-p-all-EvapVS30" . ".gp" . term
set multiplot

marL=0.105
marT=0.02
plotX=(1.0-marL-0.008)/2
plotY=plotX*1.618 # Goldener Schnitt a:b = 1.618

set label 2 "" font ",20"
set label 2 at first 0.0015, first 6E-3 left
set obj 3 rect at graph 1.0/3, first 6E-3 size char 2, char 1.2
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder  back # front behind

# (a)
set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-1*plotY
set label 2 sLabelA . " as prepared" # at graph 1.0/4, first 6E-3

set xlabel offset 14,0.5
# set key title "as-prepared"
set key off

min1=0.020  ; max1=0.65
min2=0.0015  ; max2=0.30
min3=0.060  ; max3=max1

f1(x) = m1*x+b1 ; m1=1.5
fit [(log(min1)):log(max1)] f1(x) dataP1_30 using (log($1)):(log($4)) via b1
f2(x) = m2*x+b2 ; m2=1.0
fit [(log(min2)):log(max2)] f2(x) dataP2_30 using (log($1)):(log($4)) via b2
f3(x) = m3*x+b3 ; m3=2.5
fit [(log(min3)):log(max3)] f3(x) dataP3_30 using (log($1)):(log($4)) via b3

set label 11 sprintf("%.1f",m1) at 0.8,  first 5.0E-3 center font ",16"
set label 12 sprintf("%.1f",m2) at 0.8,  first 3.7E-4 center font ",16"
set label 13 sprintf("%.1f",m3) at 0.8,  first 2.7E-3 center font ",16"

plot \
 dataP1 u ($1):($9) title materialP1 ls 1 \
,dataP2 u ($1):($9) title materialP2 ls 32 \
,dataP3 u ($1):($9) title materialP3 ls 3 \
,dataP4 u ($1):($9) title materialP4 ls 34 \
,(x<=min1)||(x>=max1)?1/0:exp(f1(log(x))) t "linear fits" w l ls 50 lw 6 lc rgb "black" \
,(x<=min2)||(x>=max1)?1/0:exp(f2(log(x))) notitle w l  ls 50 lw 6 lc rgb "black" \
,(x<=min3)||(x>=max1)?1/0:exp(f3(log(x))) notitle w l  ls 50 lw 6 lc rgb "black"

# (b)
set lmargin at screen marL + 1*plotX
set rmargin at screen marL + 2*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-plotY
set label 2 sLabelB . " after annealing" # at graph 1.0/4, first 1E-7
unset ylabel
set ytics format ""
set xtics add ("" 0.001)
unset xlabel
set key off
# set key t l at graph 0, graph 0.94
set key l t at graph -0.33, first 2E-7

# set key title "after annealing"
dataP1_30 = "../data/" . datafolderP1 . "/byTemp/Cond_030.dat"
dataP2_30 = "../data/" . datafolderP2 . "/byTemp/Cond_030.dat"
dataP3_30 = "../data/" . datafolderP3 . "/byTemp/Cond_030.dat"
dataP4_30 = "../data/" . datafolderP4 . "/byTemp/Cond_030.dat"

min1=0.010  ; max1=0.65
min2=0.003  ; max2=0.30
min3=0.030  ; max3=max1
min4=0.010  ; max4=0.15

f1(x) = m1*x+b1 ; m1=1.5
fit [(log(min1)):log(max1)] f1(x) dataP1_30 using (log($1)):(log($4)) via b1
f2(x) = m2*x+b2 ; m2=1.0
fit [(log(min2)):log(max2)] f2(x) dataP2_30 using (log($1)):(log($4)) via b2
f3(x) = m3*x+b3 ; m3=2.5
fit [(log(min3)):log(max3)] f3(x) dataP3_30 using (log($1)):(log($4)) via b3
f4(x) = m4*x+b4 ; m4=2.5
fit [(log(min4)):log(max4)] f4(x) dataP4_30 using (log($1)):(log($4)) via b4

# set label 11 sprintf("%.1f",m1) at 0.8,  first 5.0E-3 center font ",16"
# set label 12 sprintf("%.1f",m2) at 0.8,  first 4.0E-4 center font ",16"
# set label 13 sprintf("%.1f",m3) at 0.8,  first 2.7E-3 center font ",16"
set label 14 sprintf("%.1f",m4) at 0.18,  first 1.4E-5 center font ",16"

plot \
 dataP1_30 u ($1):($4) title materialP1 ls 1 \
,dataP2_30 u ($1):($4) title materialP2 ls 32 \
,dataP3_30 u ($1):($4) title materialP3 ls 3 \
,dataP4_30 u ($1):($4) title materialP4 ls 34 \
,(x<=min1)||(x>=max1)?1/0:exp(f1(log(x))) t "linear fits" w l ls 50 lw 6 lc rgb "black" \
,(x<=min2)||(x>=max1)?1/0:exp(f2(log(x))) notitle w l  ls 50 lw 6 lc rgb "black" \
,(x<=min3)||(x>=max1)?1/0:exp(f3(log(x))) notitle w l  ls 50 lw 6 lc rgb "black" \
,(x<=min4)||(x>=max4)?1/0:exp(f4(log(x))) notitle w l  ls 50 lw 6 lc rgb "black"

unset multiplot
unset output

load "footer.gp"

