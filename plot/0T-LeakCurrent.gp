#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

set logscale y
set logscale y2
set ylabel "Current (A)" # @ {/URWClassico-Ita V}=10V
set y2label axisLabelCond
set format y "10^{%L}"
set ytics nomirror
# set ytics add ("0.1" 0.1, "1" 1, "10" 10) # to prevent 10^0 und 10^1

set xlabel axisLabelTrez
set xtics autofreq nomirror #format "%.1f"
set x2label axisLabelTinC
set x2tics (\
    "25" 1./(c0C+ 25) \
,   "50" 1./(c0C+ 50) \
,   "75" 1./(c0C+ 75) \
,  "100" 1./(c0C+100) \
)
set xtics (\
    "3.0" 3.0E-3 \
,   "3.2" 3.2E-3 \
,   "3.4" 3.4E-3 \
,   "2.8" 2.8E-3 \
,   "2.6" 2.6E-3 \
)

set format y2 "10^{%L}"
set y2tics autofreq

#x in nA, längen in cm
ItoCond(x)= (x*1E-9) / 10 * 0.2 / (2.0 * 0.1)
# cond in S/cm -> I (nA)
CondToI(x)= x * 10 * (2.0 * 0.1)/0.2 * 1E9

#set tmargin ; set bmargin; set lmargin; set rmargin
#set ylabel offset 0.0,0.0
#set xlabel offset 0.0,0.0
#set y2label offset 0.0,0.0
#set x2label offset 0.0,0.0

# set lmargin 5.3
# set rmargin 0.5
# set ylabel offset 1.5,0

set key t r #at graph 1, graph 1
#set key width widthKeyPd height 0.5 spacing 1.1

set key off

yOffset=0.0008 # 0.4pA
yOffset=0.0 # 0.4pA

set xrange  [0.00255:0.0034] # 1./(c0C+20)
set x2range [0.00255:0.0034]
set yrange  [5E-13:1E-9]
set y2range [ItoCond(5E-4):ItoCond(1)]

d = "../data/leakCurrents/120122-0014.dat"

# Fitting
# aus y=a*exp(-b*x) wird mit log auf beiden Seiten
f(x) = la-b*x
# startwerte
la = log(4.47E+11) ; b = 0.9257*ce/ckb # 925.7meV
FIT_LIMIT = 1e-10 # wichtig für guten Fit!
fit [*:1./(c0C+ 50)] f(x) d using (1./($3+c0C)):(log($2*1E0-yOffset)) via b,la
# convert this to exp function
fe(x)    = exp(f(x))

Ea = (b*ckb/ce*1000) # meV
sEa = sprintf ("Ea=%.1fmeV",Ea)
print sEa

# feav(x) = aav*exp(-bav*x)
# aav = 4.47E+11
# #Ea,av = 925.7meV
# bav=0.9257*ce/ckb

set output "T-LeakCurrent" . ".gp" . term
plot  \
 d u (1./(c0C+$3)):($2*1E0) title "data" with points ls 5 \
,(fe(x)+yOffset) ls 50 title "fit"
unset output
#,(feav(x)+yOffset) lt 2 t "average"

load "footer.gp"

