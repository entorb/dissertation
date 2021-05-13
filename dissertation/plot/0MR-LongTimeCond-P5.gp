#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

color= "sw" # DEFAULT

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

# p3 -> P2 daher ls 2
d = "../data/longtimecond/p5_P5+F4-TCNQ-LongTimeCondAuswahl.dat"

#set key top right at graph 1 , graph 1 noinvert width -2.5 height 0.2

set xzeroaxis ls -1 lw 1

set ylabel axisLabelLTConda offset -1,0
set y2label axisLabelLTCondtau offset 0,0
#set lmargin 7
#set rmargin 6
set ytics  nomirror format "%+g%%" 10
set mytics 4
set y2tics nomirror format "%.1f" 0.2
set my2tics 4
set ytics  add ("0" 0)
set y2tics add ("0" 0)

set key b r width 0.5 spacing 1.2 samplen 1.5

set arrow 1 from first 0.018, first -12 rto graph -0.1,0 ls 70
set arrow 2 from first 0.018, first -15.5 rto graph 0.1,0 ls 70

set output "MR-LongTimeCond-P5" . ".gp" . term
plot [:] [*:*] [:] [0:1] \
 d u 1:($5*100) title "{/Symbol-Oblique c}" w lp ls 2 \
,d u 1:($6/3600) axes x1y2 title "{/Symbol-Oblique t}" w lp ls 3
unset output

load "footer.gp"

