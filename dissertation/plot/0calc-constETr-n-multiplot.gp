#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
# load "0goldenerSchnitt.gp"

dn1='../mathematica/export/nVonEtr-n1_C60+OH-DMBI.dat'
dn2='../mathematica/export/nVonEtr-n2_C60+AOB.dat'
dn3='../mathematica/export/nVonEtr-n3_C60+W2hpp4.dat'
dn4='../mathematica/export/nVonEtr-n4_C60+Cr2hpp4.dat'

set terminal postscript eps enhanced clip dashed size 30cm,30cm

marL=0.12
marT=0.07
plotY=5.5/30 # 5.5cm plothöhe
plotX=plotY*1.618 # Golden Ratio = a:b = 1.618
plotDY=0.014

set style data linespoints
set label 1 "" at graph 0.05, graph 0.925 center front

set key invert width -2
set key off

set logscale y

set output "calc-constEtr-n-225" . ".gp" . term
set multiplot

# (a)
set label 1 sLabelA
set ylabel "Charge Carrier Density {/URWClassico-Ita n}_e (cm^{-3})" offset 0,0
set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-1*plotY

set xtics mirror
# set x2tics
set format y "%.1e"
unset xlabel ; set xtics format ""
set format y "10^{%L}"
plot  [:][:]\
 dn2 u 1:($5) t materialN2 ls 2 \
,dn1 u 1:($5) t materialN1 ls 1 \
,dn3 u 1:($5) t materialN3 ls 3 \
,dn4 u 1:($5) t materialN4 ls 4

# (b)
set label 1 sLabelB
set ylabel "Doping Efficiency {/Symbol-Oblique h}_{dop}" offset 1.1,0

set tmargin at screen 1.0-marT-1*plotY-1*plotDY
set bmargin at screen 1.0-marT-2*plotY-1*plotDY

set key l b at first 0.03, first 50
set xtics mirror #format ""
unset x2tics
set ytics format "%g%%"
set logscale y
# ne = cond / (e * mob)
nM = cNa * 1.63 / 720.6
nD(x) = nM * x / (1+x) # x=C
dopEff(x,y) = 100.0*y/nD(x) # x=C, y=ne
#dopEff = ne/nD # ne = ne(Etr) in data 4..8

plot  [:][:]\
 dn2 u ($1):(dopEff($1,$5)) t materialN2 ls 2 \
,dn1 u ($1):(dopEff($1,$5)) t materialN1 ls 1 \
,dn3 u ($1):(dopEff($1,$5)) t materialN3 ls 3 \
,dn4 u ($1):(dopEff($1,$5)) t materialN4 ls 4

print dopEff(0.0033,2.765152627191139328e18)

# (c)
set label 1 sLabelC

set tmargin at screen 1.0-marT-2*plotY-2*plotDY
set bmargin at screen 1.0-marT-3*plotY-2*plotDY

set key off
set ylabel "Mobility {/Symbol-Oblique m} (cm²/Vs)" offset 0,0
set ytics format "%g"
set xtics format "%g"
load "00_vs_doping-header.gp"

mob(x,y) = x/(ce*y) # x = cond = #2 ; y = ne = data 4..8

plot  [:][:]\
 dn2 u ($1):(mob($2,$5)) t materialN2 ls 2 \
,dn1 u ($1):(mob($2,$5)) t materialN1 ls 1 \
,dn3 u ($1):(mob($2,$5)) t materialN3 ls 3 \
,dn4 u ($1):(mob($2,$5)) t materialN4 ls 4

unset multiplot
unset output

set output "calc-constEtr-n-210" . ".gp" . term
set multiplot

# (a)
set label 1 sLabelA
set ylabel "Charge Carrier Density {/URWClassico-Ita n}_e (cm^{-3})" offset 0,0
set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-1*plotY

set xtics mirror
# set x2tics
set format y "%.1e"
unset xlabel ; set xtics format ""
set format y "10^{%L}"
plot  [:][:]\
 dn2 u 1:($9) t materialN2 ls 2 \
,dn1 u 1:($9) t materialN1 ls 1 \
,dn3 u 1:($9) t materialN3 ls 3 \
,dn4 u 1:($9) t materialN4 ls 4

# (b)
set label 1 sLabelB
set ylabel "Doping Efficiency {/Symbol-Oblique h}_{dop}" offset 1.1,0

set tmargin at screen 1.0-marT-1*plotY-1*plotDY
set bmargin at screen 1.0-marT-2*plotY-1*plotDY

set key l b at first 0.03, first 50
set xtics mirror #format ""
unset x2tics
set ytics format "%g%%"
set logscale y
# ne = cond / (e * mob)
nM = cNa * 1.63 / 720.6
nD(x) = nM * x / (1+x) # x=C
dopEff(x,y) = 100.0*y/nD(x) # x=C, y=ne
#dopEff = ne/nD # ne = ne(Etr) in data 4..8

plot  [:][:]\
 dn2 u ($1):(dopEff($1,$9)) t materialN2 ls 2 \
,dn1 u ($1):(dopEff($1,$9)) t materialN1 ls 1 \
,dn3 u ($1):(dopEff($1,$9)) t materialN3 ls 3 \
,dn4 u ($1):(dopEff($1,$9)) t materialN4 ls 4

print dopEff(0.0033,4.132154985970036736e18)

# (c)
set label 1 sLabelC

set tmargin at screen 1.0-marT-2*plotY-2*plotDY
set bmargin at screen 1.0-marT-3*plotY-2*plotDY

set key off
set ylabel "Mobility {/Symbol-Oblique m} (cm²/Vs)" offset 0,0
set ytics format "%g"
set xtics format "%g"
load "00_vs_doping-header.gp"

mob(x,y) = x/(ce*y) # x = cond = #2 ; y = ne = data 4..8

plot  [:][:]\
 dn2 u ($1):(mob($2,$9)) t materialN2 ls 2 \
,dn1 u ($1):(mob($2,$9)) t materialN1 ls 1 \
,dn3 u ($1):(mob($2,$9)) t materialN3 ls 3 \
,dn4 u ($1):(mob($2,$9)) t materialN4 ls 4

unset multiplot
unset output

load "footer.gp"
