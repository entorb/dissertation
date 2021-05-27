#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

set style line  101 lt 1 lw 4 lc rgb "black" # voll
set style line  102 lt 5 lw 4 lc rgb "black" # Strich-Punkt
set style line  103 lt 2 lw 4 lc rgb "black" # Striche1
if (color eq "color") set style line  104 lt 1 lw 3 lc rgb "blue"
if (color eq "sw")    set style line  104 lt 4 lw 3

d='../mathematica/export/Ef-von-DopEff.dat'
dGauss = "../data/sim-gauss.dat"

# set key b l at 0.0013,-20
# set key t l at graph 0.9, 1.00
# set key b l
set key t r at graph 1, graph 1
set key width -4.5 samplen 1
set key noinvert

set style data lines

set ylabel axisLabelEf offset 0,0
unset logscale x2 # for gaussplot
# set x2tics

set ytics autofreq
set mytics 4 # minor ytics

set arrow 1 nohead from graph 0.3333,graph 0 rto graph 0,0.2 ls 50 front
set label 1 "{/URWClassico-Ita DOS(E)}" at graph 0.16,graph .1 center font ",18"
if (color eq "color") set label 1 textcolor rgb "blue"
if (color eq "sw") set label 1 textcolor rgb "gray20"
if (color eq "color") set arrow 1 lc rgb "blue" 
if (color eq "sw") set arrow 1 lc rgb "gray20" 

set yrange  [0:-500]
set y2range [0:-500]

# set y2tics out
set y2tics (\
"-1{/Symbol-Oblique s}_G" -100\
,"-2{/Symbol-Oblique s}_G" -200\
,"-3{/Symbol-Oblique s}_G" -300\
,"-4{/Symbol-Oblique s}_G" -400\
,"-5{/Symbol-Oblique s}_G" -500\
)

set xtics add (0.5)
set samples 600
f(x) = 0
set output "calc-Ef-von-DopEff" . ".gp" . term
# set grid front
plot \
 d u 1:3 title "allowed range" with filledcurve x2 ls 1 lc rgb "gray60" \
,(x<0.49)?1/0: f(x) notitle  with filledcurve x2 ls 1 lc rgb "gray60" \
,d u 1:5 t "{/Symbol-Oblique h}_{dop}=1%"   ls 103\
,d u 1:4 t "{/Symbol-Oblique h}_{dop}=10%"  ls 102\
,d u 1:3 t "{/Symbol-Oblique h}_{dop}=100%" ls 101\
,dGauss u (($2*(sqrt(2 * pi) * 100.0)*(0.3333))+0.0):(-$1) axis x2y1 notitle w lines ls 104
unset output
# unset arrow 1
# set logscale x2

unset xtics
load "00_vs_doping-header.gp"
set xtics

load "00header.gp"
load "0goldenerSchnitt.gp"

set key l b at first 0.3, first -110
set key samplen 1.5 font ",16" width -3
set mytics 5

set yrange  [0:-200]
set y2range [0:-200]

unset y2tics
# set ytics add ("-{/Symbol-Oblique s}_G" -100)
set ytics add ("" -75 1)
set label 2 "-3{/Symbol-Oblique s}_G" at graph -0.137,first -75
if (color eq "color") set label 2  textcolor rgb "blue"
if (color eq "sw") set label 2  textcolor rgb "gray20"

unset logscale x2 # for gaussplot
# set x2tics

set ylabel axisLabelEs

# set arrow 1 from graph 0.3333,graph 0 rto graph 0,first -25
# set arrow 2 nohead from graph 0.0,first -75 rto graph 0.10,0 ls 50 lc rgb "blue" front
set arrow 2 nohead from graph 0.0,first -75 rto graph 0.03,0 ls 50 front
if (color eq "color") set arrow 2 lc rgb "blue" 
if (color eq "sw") set arrow 2 lc rgb "gray20" 
set label 1 at graph 0.08,graph 0.06
set output "calc-Es-von-DopEff" . ".gp" . term
# set grid front
plot \
 d u 1:($5+225) t "{/Symbol-Oblique h}_{dop}=1%"   w l ls 103 \
,d u 1:($4+225) t "{/Symbol-Oblique h}_{dop}=10%"  w l ls 102 \
,d u 1:($3+225) t "{/Symbol-Oblique h}_{dop}=100%" w l ls 101 \
,dataN2 u 1:($7*(c0C+40)/1000) title materialN2 w lp ls 2\
,dataN1 u 1:($7*(c0C+40)/1000) title materialN1 w lp ls 1\
,dataN3 u 1:($7*(c0C+40)/1000) title materialN3 w lp ls 3\
,dataN4 u 1:($7*(c0C+40)/1000) title materialN4 w lp ls 4\
,dGauss u ((($2)*(sqrt(2 * pi) * 100.0)*(0.3333))+0.0):(-$1+225) axis x2y1 notitle w lines ls 104
unset output

load "footer.gp"
