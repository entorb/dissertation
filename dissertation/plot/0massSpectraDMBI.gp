#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

color="sw" # DEFAULT

load "00header.gp"

set style data lines

set xlabel "Mass (u)"
set ylabel "Current (pA)" offset 2,0 #  textcolor ls 1
set key off

set terminal postscript size 14.85cm,7cm
data = "../data/mass-spek/20111123-104433-3.asc"

set output "massSpekDMBI.gp".term

set multiplot
# plot 1(main)
set size 1.0 , 1.0
set origin 0.0,0.0

  # insets
x0=0.135
y0=0.40
x=0.3
x1=x0+x
y=0.45
y1=y0+y
x0r=0.63
x1r=x0r+x
xminL=125
xmaxL=145
xminR=250
xmaxR=260

set arrow 1 from first xminL, first 0 to screen x0, screen y0 nohead ls 0
set arrow 2 from first xmaxL, first 0 to screen x1, screen y0 nohead ls 0
set arrow 3 from first xminR, first 0 to screen x0r, screen y0 nohead ls 0
set arrow 4 from first xmaxR, first 0 to screen x1r, screen y0 nohead ls 0

set ytics 2
set lmargin 4.75
set tmargin 0.5
set mytics 2 # minor ytics

plot [0:300] [-0.07:10] [0:300]\
  data using ($1):($2*1E12) every 5 #lw 4

unset arrow 1; unset arrow 2; unset arrow 3; unset arrow 4

set lmargin 0 ; set rmargin 0 ; set tmargin 0 ; set bmargin 0
unset ylabel; unset xlabel
set grid
set ytics font ",18"
set xtics font ",18"
unset mytics
# plot 1, left

set origin x0,y0
set size x , y

set ytics (0,10)
# minor tics
set ytics add ("" 2 0)
set ytics add ("" 4 0)
set ytics add ("" 6 0)
set ytics add ("" 8 0)
set xtics (125,145) nomirror
set xtics add ("" 130 0)
set xtics add ("" 135 0)
set xtics add ("" 140 0)
set x2tics (127,142) font ",18"
clear # clear the plot area from grid lines etc

# set object 1 rect from screen x0, screen y0 to screen x1, screen y1 back behind
# set object 1 rect fc rgb "white" fillstyle solid 1.0
#
# set object 2 rect from screen x0r, screen y0 to screen x1r, screen y1 back behind
# set object 2 rect fc rgb "white" fillstyle solid 1.0

dataLeft="../data/mass-spek/20111123-110145.asc"

plot [xminL:xmaxL][-0.07:10] \
  data using ($1):($2*1E12) #lw 4

# plot 3(inset right)
set origin x0r,y0
set size x , y

set xtics (250,260) nomirror
set x2tics (254.3) font ",18"
set ytics (-0.06,0.01)
# minor tics
set xtics add ("" 252 0)
set xtics add ("" 254 0)
set xtics add ("" 256 0)
set xtics add ("" 258 0)
set ytics add ("" -0.04 0)
set ytics add ("" -0.02 0)
set ytics add ("" -0.0  0)
clear # clear the plot area from grid lines etc

dataRight = "../data/mass-spek/20111123-110625.asc"

plot [xminR:xmaxR][-0.06:0.01] \
  dataRight using ($1):($2*1E12) #lw 4

unset multiplot
set size 1.0 , 1.0
set origin 0.0,0.0
unset output

load "footer.gp"