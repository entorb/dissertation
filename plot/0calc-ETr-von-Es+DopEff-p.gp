#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

dn1='../mathematica/export/EtrVonEs+DopEff-n1_C60+OH-DMBI.dat'
dn2='../mathematica/export/EtrVonEs+DopEff-n2_C60+AOB.dat'
dn3='../mathematica/export/EtrVonEs+DopEff-n3_C60+W2hpp4.dat'
dn4='../mathematica/export/EtrVonEs+DopEff-n4_C60+Cr2hpp4.dat'

dp1='../mathematica/export/EtrVonEs+DopEff-p1_MeO+F6-TCNNQ.dat'
dp2='../mathematica/export/EtrVonEs+DopEff-p2_MeO+C60F36.dat'
dp3='../mathematica/export/EtrVonEs+DopEff-p3_BF-DPB+F6-TCNNQ.dat'
dp4='../mathematica/export/EtrVonEs+DopEff-p4_BF-DPB+C60F36.dat'

set style data linespoints
# Größe hier nur 2.0 statt 3.0
set style line  1 lw 4 ps 2.0 pointtype  6 # kreis
set style line  2 lw 4 ps 2.0 pointtype 12 # quadrat gedreht
set style line  3 lw 4 ps 2.0 pointtype  8 # dreieck oben
set style line  4 lw 4 ps 2.0/1.1 pointtype 4 # quadrat gerade
set style fill transparent solid 1.0 border

set ylabel axisLabelEtr offset 0,0
set mytics  4 # minor ytics
set my2tics 4
set label 2 "" left font ",20"
set label 2 at first 0.0014, first -35
set obj 3 rect at first 0.006, first -35 size char 14, char 1.2
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder  back # front behind

set key invert
set key off

set terminal postscript eps size 15.0cm,15.0cm # wichtig das quadratisch wegen Goldener Schnitt, sonst unten anpassen

marL=0.105
marT=0.04
plotX=(1.0-marL-0.005)/2
plotY=plotX/1.618 # Goldener Schnitt a:b = 1.618

# set key b l at 0.001,0 invert width -4.5 samplen 2

# p-doping

set output "calc-ETr-von-Es+DopEff-p-200" . ".gp" . term
set multiplot

set ytics  200
set y2tics 200
set yrange  [0:700]
set y2range [0:700]

set label 2 "" left font ",20"
set label 2 at first 0.0014, first 55
set obj 3 rect at first 0.006, first 55 size char 14, char 1.2
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder  back # front behind

# (b)

set lmargin at screen marL + 1*plotX
set rmargin at screen marL + 2*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-plotY

unset xlabel; set xtics format ""
unset ylabel; set ytics format ""
unset x2label; set x2tics format ""
unset y2label; set y2tics format ""

# set label 2 "" at first 0.0012, first -30

set key off
d=dp2
mat=materialP2
set label 2 sLabelB . " " . mat
plot\
 d u 1:3:4 title "allowed range" with filledcurve above lc rgb "gray60" \
,d u 1:4 t "{/Symbol-Oblique h}_{dop}=100%" ls 1 \
,d u 1:5 t "{/Symbol-Oblique h}_{dop}=10%"  ls 2 \
,d u 1:6 t "{/Symbol-Oblique h}_{dop}=1%"   ls 3 \
,d u 1:3 t "{/Symbol-Oblique h}_{dop,LL}"   ls 50 w lines

# (c)

set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT-1*plotY
set bmargin at screen 1.0-marT-2*plotY

unset xlabel; set xtics format ""
unset ylabel; set ytics format ""
unset x2label; set x2tics format ""
unset y2label; set y2tics format ""

set ylabel axisLabelEtr offset 0,5
set xlabel axisLabelMR  offset 15,0

set xtics format "%g"
set ytics format "%g"

# set label 2 "" at first 0.0012, first -370

d=dp3
mat=materialP3
set label 2 sLabelC . " " . mat
plot\
 d u 1:3:4 title "allowed range" with filledcurve above lc rgb "gray60" \
,d u 1:4 t "{/Symbol-Oblique h}_{dop}=100%" ls 1 \
,d u 1:5 t "{/Symbol-Oblique h}_{dop}=10%"  ls 2 \
,d u 1:6 t "{/Symbol-Oblique h}_{dop}=1%"   ls 3 \
,d u 1:3 t "{/Symbol-Oblique h}_{dop,LL}"   ls 50 w lines

# (d)

set lmargin at screen marL + 1*plotX
set rmargin at screen marL + 2*plotX
set tmargin at screen 1.0-marT-1*plotY
set bmargin at screen 1.0-marT-2*plotY

unset xlabel; set xtics format ""
unset ylabel; set ytics format ""
unset x2label; set x2tics format ""
unset y2label; set y2tics format ""
set xtics format "%g"
set xtics add ("" 0.001)
#set y2tics format "%g"

# set label 2 "" at first 0.0012, first -370

d=dp4
mat=materialP4
set label 2 sLabelD . " " . mat
plot\
 d u 1:3:4 title "allowed range" with filledcurve above lc rgb "gray60" \
,d u 1:4 t "{/Symbol-Oblique h}_{dop}=100%" ls 1 \
,d u 1:5 t "{/Symbol-Oblique h}_{dop}=10%"  ls 2 \
,d u 1:6 t "{/Symbol-Oblique h}_{dop}=1%"   ls 3 \
,d u 1:3 t "{/Symbol-Oblique h}_{dop,LL}"   ls 50 w lines

# (a) als letztes wegen key

set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-1*plotY

unset xlabel; set xtics format ""
unset ylabel; set ytics format ""
unset x2label; set x2tics format ""
unset y2label; set y2tics format ""

set ytics format "%g"
set key on width -4.5 samplen 1.25
set key l t at screen marL + 0.95*plotX, screen 1.0-marT-1.1*plotY

# set label 2 "" at first 0.0012, first -30

d=dp1
mat=materialP1
set label 2 sLabelA . " " . mat
plot\
 d u 1:3:4 title "allowed range" with filledcurve above lc rgb "gray60" \
,d u 1:4 t "{/Symbol-Oblique h}_{dop}=100%" ls 1 \
,d u 1:5 t "{/Symbol-Oblique h}_{dop}=10%"  ls 2 \
,d u 1:6 t "{/Symbol-Oblique h}_{dop}=1%"   ls 3 \
,d u 1:3 t "{/Symbol-Oblique h}_{dop,LL}"   ls 50 w lines

unset multiplot
unset output

load "footer.gp"

