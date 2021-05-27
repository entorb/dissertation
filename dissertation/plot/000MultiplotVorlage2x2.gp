#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

outtype="png-trans"
outtype="png-solid"
outtype="pdf"

if (color eq "sw")    set terminal postscript monochrome
if (color eq "color") set terminal postscript color
set terminal postscript eps enhanced clip dashed size 15cm,15cm font ",22pt"
#fontfile add "uopr8a.pfa" fontfile add "uopri8a.pfa" fontfile add "uopb8a.pfa" font "URWClassico-Reg,22pt" # 10x7 # fontsize 14 = default

set encoding utf8
set border back

set style data points
set style function lines

set style increment user
# LineWitdh + Symbols
set style line  1 lw 4 ps 3 pointtype  8 #= dreieck oben
set style line  2 lw 4 ps 3 pointtype 10 #= dreieck unten

if (color eq "sw") set style line  1 lt 1 # voll
if (color eq "sw") set style line  2 lt 5 # Strich-Punkt
if (color eq "color") set style line  1 lt 1 linecolor rgb "red"
if (color eq "color") set style line  2 lt 1 linecolor rgb "blue"

# grid
set style line 40 lt 1 lw 2 linecolor rgb "grey70"
set grid ls 40

set ytics  .4
set y2tics .4
set yrange  [-1.2:+1.4]
set y2range [-1.2:+1.4]
set mytics  4 # minor ytics
set my2tics 4
set samples 300

# text will be inserted later on
set label 2 "" left front font ",20" at graph 0.05, graph 0.90

# important that plot area is a square, 15x15cm in this case
marL=0.12
marT=0.04
plotX=(1.0-marL-0.005)/2
plotY=plotX/1.618 # Golden Ratio = a:b = 1.618

set key box height 0.1 width -2 reverse noinvert Left opaque samplen 1 font ",18"
set key t l at screen marL + 0.85*plotX, screen 1.0-marT-1.25*plotY
set key off

set output "plot" . ".gp" . term
set multiplot

# (a)
set label 2 "(a) n=1"
set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-1*plotY

unset xlabel; set xtics format ""
unset ylabel; set ytics format ""
unset x2label; set x2tics format ""
unset y2label; set y2tics format ""

set ytics format "%g" # y Tics on

set key on
plot sin(x) t "sin(n x)", cos(x) t "cos(n x)"

# (b)
set label 2 "(b) n=2"

set lmargin at screen marL + 1*plotX
set rmargin at screen marL + 2*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-plotY

unset xlabel; set xtics format ""
unset ylabel; set ytics format ""
unset x2label; set x2tics format ""
unset y2label; set y2tics format ""

set key off
plot sin(2*x), cos(2*x)

# (c)
set label 2 "(c) n=3"

set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT-1*plotY
set bmargin at screen 1.0-marT-2*plotY

unset xlabel; set xtics format ""
unset ylabel; set ytics format ""
unset x2label; set x2tics format ""
unset y2label; set y2tics format ""

set ytics add ("" 1.2) # prevent overwriting of label of (a)

# Axis Labels
set xlabel "X-LABEL"  offset 13.5 , 0
set ylabel "Y-LABEL"  offset  0   , 5

set xtics format "%g" # x Tics on
set ytics format "%g" # y Tics on

plot sin(3*x), cos(3*x)
unset xlabel ; unset ylabel

# (d)
set label 2 "(d) n=4"
set lmargin at screen marL + 1*plotX
set rmargin at screen marL + 2*plotX
set tmargin at screen 1.0-marT-1*plotY
set bmargin at screen 1.0-marT-2*plotY

unset xlabel; set xtics format ""
unset ylabel; set ytics format ""
unset x2label; set x2tics format ""
unset y2label; set y2tics format ""

set xtics format "%g" # x Tics on
set xtics add ("" -10) # prevent overwriting of label of (c)

set key on
plot sin(4*x) t "sin(n x)", cos(4*x) t "cos(n x)"

unset multiplot
unset output

# trim eps
s = 'epstool --copy --quiet --bbox "plot.gpeps" "plot.eps"' ; system (s) ; system "rm plot.gpeps"
# eps -> pdf
if (outtype eq "pdf") s = 'epstopdf --embed "plot.eps"' ; system (s) #embed=embed fonts
# eps -> png
if (outtype eq "png-solid") s = 'convert -density 150 -trim +repage "plot.gpeps" -background white -flatten +matte -type Palette "plot.png"' ; system (s)
if (outtype eq "png-trans") s = 'convert -density 150 -trim +repage "plot.gpeps" -transparent white "plot.png"' ; system (s)
# remove eps
system "rm plot.eps"
