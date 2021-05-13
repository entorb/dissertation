#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

color = "sw" # DEFAULT

load "00header.gp"

set terminal postscript size 6cm,14.85cm

Ef1 = -200.0
Ef2 = Ef1+50
Ec = 0 # Nullpunkt
Emax = Ec +150
Emin = Ef1-50
set xrange  [Emax:Emin]
set x2range [Emax:Emin]
T=25.0 # C
kT = ckb * (c0C+T) /ce # in eV

unset xlabel

set key off

set style function l
set samples 600

# Funktionen
sEf1 = sprintf("%d",Ef1)
sEf2 = sprintf("%d",Ef2)
fermi1 (x)     = 1 / ( 1+ exp ( ((1.0*x-Ef1)/1000)/(kT) ) ) # x in meV
fermi2 (x)     = 1 / ( 1+ exp ( ((1.0*x-Ef2)/1000)/(kT) ) ) # x in meV
dos (x)     = sqrt (x/1000) # x in meV
n1 (x)     = fermi1(x) * dos(x)
n2 (x)     = fermi2(x) * dos(x)

set xtics ( "" Ec , "" Ef1 , "" Ef2 )
set xtics nomirror rotate by 90
set y2tics nomirror rotate by 90
unset ytics

set output "sim_Fermi-DOS-n-inorg".".gp".term
set multiplot layout 3,1 columnsfirst upwards

set lmargin at screen 0.005 #0.01
set rmargin at screen 0.8
set tmargin 0
set bmargin 0 # wird später geändert

marB = 0.09 # in screen coordinates
marT = 0.005 # 0.005
plothoehe = (1.0-marB-marT)/3

plotmitte1 = marB + 0.5*plothoehe
plotmitte2 = marB + 1.5*plothoehe
plotmitte3 = marB + 2.5*plothoehe

labelmarL=0.95
set label 4 at screen labelmarL , screen plotmitte1 center rotate by 90 "{/URWClassico-Ita f}_{FD} ({/URWClassico-Ita E})"
set label 5 at screen labelmarL , screen plotmitte2 center rotate by 90 "{/URWClassico-Ita DOS} ({/URWClassico-Ita E})"
set label 6 at screen labelmarL , screen plotmitte3 center rotate by 90 "{/URWClassico-Ita n}_e' ({/URWClassico-Ita E}) = {/URWClassico-Ita f}_{FD} · {/URWClassico-Ita DOS}"

set label 3 at first (Emin+0.5*(Emax-Emin)),graph -0.25 center rotate by 180 "Energy"

set label 7 at first Ec ,graph -0.1 center rotate by 90 "{/URWClassico-Ita E}_{C}"
set label 8 at first Ef1,graph -0.1 center rotate by 90 "{/URWClassico-Ita E}_{F1}"
set label 9 at first Ef2,graph -0.1 center rotate by 90 "{/URWClassico-Ita E}_{F2}"

set label 1 sLabelA at graph 0.075, graph 0.2 center rotate by 90

# plot 1 (unten)
#clear # clear the plot area from grid lines etc
set y2tics (0 , "½" 0.5 , 1) offset 0,-0.6

set size 1.0 , plothoehe
set origin  0.0 , marB

set grid y2
plot [:] [0:1]\
  fermi1(x) t "{/URWClassico-Ita E}_{F1} = ".sEf1."meV" ls 2\
, fermi2(x) t "{/URWClassico-Ita E}_{F2} = ".sEf2."meV" ls 3

set y2tics ("" 0 , "" 0.5 , "" 1)
unset y2tics
unset label 3
unset label 4 ;unset label 5 ;unset label 6
unset label 7 ;unset label 8 ;unset label 9

# plot 2 (mitte)
#clear # clear the plot area from grid lines etc
set size 1.0 , plothoehe
set origin  0.0 , (marB+plothoehe)
set label 1 sLabelB
set label 2 at graph 1.07 , graph 0.5 center rotate by 90 "(a.u.)"
unset xtics

# custom grid lines
set arrow 1 nohead from first Ec, graph 0 rto graph 0, graph 1.0 ls 40
set arrow 2 nohead from first Ef2, graph 0 rto graph 0, graph 1.0 ls 40
set arrow 3 nohead from first Ef1, graph 0 rto graph 0, graph 1.0 ls 40

set arrow 5 nohead from graph 0, graph 0.5 rto graph 1.0, graph 0 ls 40

# linie, die den Graphen von n2 verlängert
set arrow 4 nohead front from first Ec , screen marB + 2.0*plothoehe rto first +0.52 , graph 0.3 ls 3

plot [:] [*:0.4] \
dos (x) ls 1

# plot 3 (oben)
#clear # clear the plot area from grid lines etc
set size 1.0 , plothoehe
set origin 0.0 , (marB+2*plothoehe)
set label 1 sLabelC
#set label 2  # ist ja noch gültig
unset xtics

set label at first Ec+27 , graph 0.05 center rotate by 90 "{/URWClassico-Ita n}_{e1}" font ",18" front
set label at first Ec+27 , graph 0.4  center rotate by 90 "{/URWClassico-Ita n}_{e2}" font ",18" front textcolor rgb "white"

# Var 1
# plot [:] [*:*] \
# #  n1(x) ls 2 \
# ,n2(x) ls 3

# Var 2
# set style fill solid 1.0 noborder
# plot [:] [*:*] \
# '+' using 1:(n1($1)):(n2($1)) with filledcurve below ls 1 lc rgb "gray40" \
# , '+' using 1:(n1($1)):(0) with filledcurve above ls 1 lc rgb "gray60" \
# ,n1(x) ls 2 \
# ,n2(x) ls 3

# Var 3
set style fill solid 1.0 border
plot [:] [*:*] \
 n2(x) with filledcurve y1=0 ls 3 lc rgb "gray40" \
,n1(x) with filledcurve y1=0 ls 2 lc rgb "gray60" \
,n1(x) ls 2 \
,n2(x) ls 3

unset multiplot
unset output

load "footer.gp"

print kT