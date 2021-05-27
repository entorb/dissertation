#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "0goldenerSchnitt.gp"

data= "../data/" . datafolderN4 . "/evap/0.0225_02.0_067.dat"
factorM = 1.0
factorD = 0.0123006903762474 # tooling correction

set xlabel "Layer Thickness (nm)"
set xtics
set ylabel axisLabelCond
set ytics nomirror format "%.1f"
set ytics add ("0" 0)
set y2label "Partial Thickness of Dopant (nm)"
set y2tics nomirror  format "%.1f" 0.1
set mytics 3 # minor ytics

#set samples 1000

set key bottom right invert at graph 1,graph 0
set key samplen 1.5
fd(x) = md * x
fc(x) = mc * x +bc
fit [0:*] fd(x) data u (($2*factorM)+($3*factorD)):($3*factorD) via md
fit [15:*] fc(x) data u (($2*factorM)+($3*factorD)):($4*1E-9) via mc, bc

# conductivity
set ytics 0.3
set output "evap-n-Pd-2wt-cond" . ".gp". term
set key on
set key width -4.5
set arrow 1 from first 4.9  , first 0.45 rto graph -0.1, graph 0 ls 70 back # ls 1 lw 2
set arrow 4 from first 4.9  , first 0.75 rto graph -0.1, graph 0 ls 70 back # ls 1 lw 2
set arrow 2 from first 10.8 , first 0.45 rto graph +0.1, graph 0 ls 70 back # ls 2 lw 2

set arrow 3 from first 11.1 , graph 0.05 rto graph +0.1, graph 0 back lw 2 # ls 2 lw 2
set label 3 "Time" at 12.5, graph 0.10 center

# Strich-Punkt
if (color eq "color") set style line  3 lt 5 linecolor rgb "dark-magenta"
if (color eq "sw")    set style line  3 lt 3 

# s in S/cm = I/V * d/l * 1 / thickness * 1/100
V=10
DvsL=0.25 # = d/l
plot [0:*] [0:1.5] [:] [0:*] \
data u (($2*factorM)+($3*factorD)):($3*factorD) title "Dopant" w lines axes x1y2 ls 2 \
,data u (($2*factorM)+($3*factorD)):($4/V * DvsL * 1/(($2*factorM)+($3*factorD)-2.0) * 1/100) t "{/Symbol-Oblique s}, 2nm offset" w lines ls 3 \
,data u (($2*factorM)+($3*factorD)):($4/V * DvsL * 1/(($2*factorM)+($3*factorD)) * 1/100) t "{/Symbol-Oblique s}" w lines ls 1
unset output
#  fd(x) t "fit" axes x1y2 ls 50 \
unset arrow 1
unset arrow 2
unset arrow 4

set output "evap-n-Pd-2wt-current" . ".gp". term
#set terminal postscript size 12cm,7cm

set ylabel "Current ({/Symbol m}A)"

set multiplot
# plot 1(main)
set size 1.0 , 1.0
set origin 0.0,0.0
set ytics 30 format "%.f"
set ytics add ("0" 0)
set y2tics 0.1 format "%.1f"
set ytics add ("0" 0)
set key width -4.5
set arrow 1 from first 22, first 93 rto graph -0.15, graph 0 ls 70 back # 1 lw 2
set arrow 2 from first 22.75, first 105 rto graph +0.15, graph 0 ls 70 back # 2 lw 2
plot [0:*] [0:150] [0:*] [0:*] \
data u (($2*factorM)+($3*factorD)):($4*1E-9/1E-6) title "Current" w lines ls 1 \
,fc(x)/1E-6 t "linear fit" axes x1y1 ls 50 \
,data u (($2*factorM)+($3*factorD)):($3*factorD) title "Dopant" w lines axes x1y2 ls 2

unset label 3
unset arrow 3
unset arrow 1
unset arrow 2

# plot 2(inset)
insetX0=GSrandLR +0.02
insetX=0.2
insetY=0.3
insetY0=1.0-GSrandBT -insetY-0.02

set size insetX , insetY
set origin insetX0,insetY0
clear # clear the plot area from grid lines etc
set object 1 rect from screen insetX0, screen insetY0 to screen insetX0+insetX, screen insetY0+insetY back behind
set object 1 rect fc rgb "white" fillstyle solid 1.0
set lmargin 3.5; set bmargin 1.5; set rmargin 0.75; set tmargin 0.25
unset key
unset xlabel
unset ylabel
unset y2label
set xtics (0,"2.5" 2.5,5) font ",18"
#set ytics 1E-12,1000 format "%.e" font ",18"
set ytics ("1pA" 1E-12, "1nA" 1E-9, "1{/Symbol m}A" 1E-6) font ",18"
#set format y "10^{%L}"
unset y2tic
#set y2tics (0,0.06)
set logscale y
plot [0:5.0] [1E-13:1E-4] [0:*] [0:*] \
data u (($2*factorM)+($3*factorD)):($4*1E-9) title "Current" w lines ls 1
unset logscale y

unset multiplot
set size 1.0 , 1.0
set origin 0.0,0.0
unset output

load "footer.gp"
