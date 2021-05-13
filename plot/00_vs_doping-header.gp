#!/usr/bin/gnuplot
set xlabel axisLabelMR
set logscale x ; set logscale x2
#xmin =  ; xmax = 1.0

# set xtics add (0.003, 0.03,0.3) # ohne sind größenordnungen besser zu erkennen
set xrange  [0.001:1.0]
set x2range [0.001:1.0]

#set arrow 1 back from xmaxFit, graph 0 to xmaxFit, graph 1 nohead ls 30

# set style line  1 ps 1 lw 1.5
# set style line  2 ps 1 lw 1.5
# set style line  3 ps .75 lw 1.5 # quadrat sonst zu groß
# set style line  4 ps 1 lw 1.5
# set style line  5 ps 1 lw 1.5
