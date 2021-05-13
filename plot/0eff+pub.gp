#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

color="sw" # Default!

load "00header.gp"
load "0goldenerSchnitt.gp"

set style data l

# set key l c at first 8, first 20 samplen .75
# set key width -5 height 0.0 font ",18"
#
# set mytics 5
# set mxtics 4

set ylabel "Publications per Year"
set xlabel "Year"
set xrange [1985:2015] ; set xtics 10 ; set mxtics 5

set ytics nomirror
set y2tics nomirror

dir="../data/eff+publications"

oled_pub = dir."/oled-pub.dat"
oled_eff = dir."/oled-eff.dat"
opv_pub  = dir."/opv-pub.dat"
opv_eff  = dir."/opv-eff.dat"

set label 1 "" at graph 0.13, graph 0.9425 center front
set key l t at first 1987, graph 0.97 width -4.5 samplen .75

set terminal postscript eps size 20cm,20cm # wichtig das quadratisch wegen Goldener Schnitt, sonst unten anpassen

marL=0.12
marT=0.04
plotX=(1.0/5.0) # 20:5=4cm breit
plotY=plotX*1.618 # Goldener Schnitt a:b = 1.618

set ylabel  offset  2.5,0
set y2label offset -3.0,0

set ytics  rotate by 90 center offset -.25,-0.25
set y2tics rotate by 90 center offset -.50,-0.25

set output "oled+opv-pub+eff" . ".gp" . term
set multiplot

# (b) OPV
set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT-1*plotY
set bmargin at screen 1.0-marT-2*plotY
set key title "OPV"
set label 1 sLabelB
set arrow 1 from first 2008.3 , first 550  rto graph -0.2, graph 0 ls 70 back # ls 1 lw 2
set arrow 2 from first 2005 , second 3.7 rto graph 0.2, graph 0 ls 70 back # ls 1 lw 2
set y2label "Record Power Conversion\nEfficiency (%)"
set y2range [0:14]; set y2tics 3; set my2tics 3
set yrange [0:1700] ; set ytics 500 ; set mytics 5
plot \
opv_pub u 1:2 t "Publications" \
,opv_eff u 1:2 t "Efficiency" axes x1y2

# (a) OLED
set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-1*plotY
set key title "OLED"
set label 1 sLabelA
set arrow 1 from first 2004 , first 450  rto graph -0.2, graph 0 ls 70 back # ls 1 lw 2
set arrow 2 from first 2003.8 , second 90 rto graph 0.2, graph 0 ls 70 back # ls 1 lw 2
set xtics format ""
set xlabel ""
set y2label "Green OLED Record\nLuminous Efficacy (lm/W)"
set yrange [0:*] ; set ytics 250 ; set mytics 5

set y2range [0:*] ; set y2tics 50; set my2tics 5
plot \
oled_pub u 1:2 t "Publications" \
,oled_eff u 1:2 t "Efficacy" axes x1y2

unset multiplot
unset output

load "footer.gp"
