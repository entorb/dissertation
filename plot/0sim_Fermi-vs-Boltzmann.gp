#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

color = "sw" # DEFAULT

load "00header.gp"

#set ytics format "%.2f"
#set y2tics format "%.2f"

# line at y=0.5
#set arrow from graph 0, first 0.5 to graph 1, first 0.5 nohead ls 40 lw 2 back
set ytics 0,0.2,1

set key bottom left at graph 0.04, graph 0.0 samplen 0.75
set ytics 0.25 ; set y2tics 0.25

T=25 # C
T100=100 #C
kT = ckb * (c0C+T) /ce
print kT # 0.025692751856473

# x = E-Ef in meV
fermi (x)     = 1 / ( 1+ exp ( (1.0*x/1000)/(ckb * (c0C+T) /ce ) ) )
fermi100 (x)     = 1 / ( 1+ exp ( (1.0*x/1000)/(ckb * (c0C+T100) /ce ) ) )
boltzmann (x) = 1 / (    exp ( (1.0*x/1000)/(ckb * (c0C+T) /ce) ) )

fermi_kT (x)     = 1 / ( 1+ exp ( 1.0*x) ) # in Einheiten von kT
boltzmann_kT (x) = 1 / (    exp ( 1.0*x) )

print boltzmann_kT (3) # =0.0497870683678639

set terminal postscript size 14.85cm,5cm
set label 1 "" at graph 0.75+0.125, graph 0.75+0.125 front center #font ",24"

set output "sim_Fermi-vs-Boltzmann" . ".gp". term
set multiplot # layout 2,1 rowsfirst

marL=0.075
plotbreite=0.44

# plot 1(left)
set key width -1.5
set label 1 sLabelA
set lmargin at screen marL
set rmargin at screen marL+plotbreite

data_fermi0K = "../data/einzelne/data_fermi0K.dat"

# (x<=0.003)||(x>=fitHigh)?1/0:

set xlabel "{/URWClassico-Ita E}-{/URWClassico-Ita E}_F (meV)" ; set xtics 75
set ylabel "Occupation Probability" offset 4,0
set ytics mirror 0.25
set ytics add ("¼" 0.25, "½" 0.5, "¾" 0.75) # copy and paste aus char tabelle
set key title "Fermi-Dirac"
unset y2tics ; unset y2label
plot [-150:150] [0:1] \
  data_fermi0K u 1:2 t "{/URWClassico-Ita T}=0K" w l ls 2\
, fermi(x) title "{/URWClassico-Ita T}=25°C" ls 1\
, fermi100(x) title "{/URWClassico-Ita T}=100°C" ls 3\

# plot 2(right)
set label 1 sLabelB
set lmargin at screen marL+plotbreite
set rmargin at screen marL+plotbreite+plotbreite

unset ylabel;
set y2tics mirror add ("¼" 0.25, "½" 0.5, "¾" 0.75)
set ytics mirror add ("" 0.25, "" 0.5, "" 0.75)
set ytics format ""
#set y2label "Occupation Probability";
#set y2tics mirror 0.25; set grid y2
set key title "T=25°C" width -2.5
set xlabel "({/URWClassico-Ita E}-{/URWClassico-Ita E}_F) / ({/URWClassico-Ita k}_B{/URWClassico-Ita T)}"
set xtics (-3,0,3,6)
plot [-6:6] [0:1] \
  fermi_kT (x) title "Fermi-Dirac" \
, boltzmann_kT (x) title "Boltzmann" ls 3
unset multiplot
unset output

load "footer.gp"

