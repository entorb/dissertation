#!/usr/bin/gnuplot
term = "eps"
color="sw"
color="color"

load "00header.gp"

#load "00_vs_T-header.gp"
set xlabel axisLabelTrez
set xtics nomirror
set xtics 0.1 format "%.1f"
set x2label axisLabelTinC
xmin = 1000.0/3.4-c0C # T in C

#outside
set key left top at graph 1,graph 1 font ",18" spacing 0.7 width -1.5
set key title "{/URWClassico-Ita C} (MR)"
set title offset 0,-1

load "9LayoutCond.gp"

set terminal postscript eps size 14.85cm,13cm
set rmargin 0 ; set bmargin 0 ; set tmargin 0; set lmargin 0;

# title
set label 2 "" at graph 0.5, graph 5.4/6 center font ",20"
set obj 3 rect at graph 0.5, graph 5.4/6 size char 17, char 1.2
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder back  #back behind front

xMR=0.088
set arrow 1 from first (1000/(47+c0C)), graph .10 rto 0 , graph 0.85 front ls 70
set label 1 "{/URWClassico-Ita C}" at xMR,graph .11 font ",18" center tc ls 71

set yrange[1E-8:8E-2]
set ytics add ("" 0.1)

marL=0.105
marR=0.13
plotspacingX=0.33
plotX=0.28
plotY=0.34
marT=0.075
marB=0.075
keyX=0.1

# add leakage Current converted to Cond for 30nm Seebeck sample
dLeak = "../data/leakCurrents/120122-0014.dat"
ItoCond(x)= 0.01 * (x/10) * 5.0/20.0  / (30.0*1E-9)
# gemessen @ 10V
# umgerechnet auf Seebeck ProbenGeo von 30nm dicke
# x=I in A
if (color eq "color") set style line 20 lt 1 linecolor rgb "red" lw 2
if (color eq "sw") set style line 20 lt 4 lw 3

# (a)

set lmargin at screen marL
set rmargin at screen marL + plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-plotY

set arrow 1 from graph xMR, first 4E-6 to graph xMR , graph 0.85
set label 1 at graph xMR,first 2E-6
xmax = 1000.0/3.1-c0C

set x2tics ("25" 1000./(c0C+25) , "35" 1000./(c0C+35) , "45" 1000./(c0C+45)  )

datafolder = "../data/p1_MeO+F6-TCNNQ/byDoping"
material = materialP1
set label 2 sLabelA . " " . material

set output "T-Cond-p.gp" . term
set multiplot

load "1T-Cond-p1.gp"
set ylabel ""

# (b)

datafolder = "../data/p2_MeO+C60F36/byDoping"
material = materialP2
set label 2 sLabelB . " " . material

set lmargin at screen 1.0-marR-plotX
set rmargin at screen 1.0-marR
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-plotY

set arrow 1 from graph xMR, first 6E-7 to graph xMR , graph 0.68
set label 1 at graph xMR, first 3E-7

#xmax = 1000.0/3.1-c0C

load "1T-Cond-p2.gp"

# (c)
xmax = 1000.0/2.8-c0C

set x2tics (\
  "30" 1000./(c0C+30) \
, "50" 1000./(c0C+50) \
, "70" 1000./(c0C+70) \
)
# , "30" 1000./(c0C+30) \
# , "40" 1000./(c0C+40) \
# , "60" 1000./(c0C+60) \
# , "70" 1000./(c0C+70) \
# , "80" 1000./(c0C+80) \

set lmargin at screen marL
set rmargin at screen marL + plotX
set tmargin at screen marB + plotY
set bmargin at screen marB

set arrow 1 from graph xMR, first 2E-6 to graph xMR , graph 0.84
set label 1 at graph xMR,first 1E-6

datafolder = "../data/p3_BF-DPB+F6-TCNNQ/byDoping"
material = materialP3

set label 2 sLabelC . " " . material

set ylabel axisLabelCond
load "1T-Cond-p3.gp"

# (d)
set lmargin at screen 1.0-marR-plotX
set rmargin at screen 1.0-marR
set tmargin at screen marB + plotY
set bmargin at screen marB

set arrow 1 from graph xMR, graph .23 to graph xMR , first 5E-5
set label 1 at graph xMR,first 1E-4

datafolder = "../data/p4_BF-DPB+C60F36/byDoping"
material = materialP4
set label 2 sLabelD . " " . material

set ylabel ""
load "1T-Cond-p4.gp"

unset multiplot
unset output

load "footer.gp"
