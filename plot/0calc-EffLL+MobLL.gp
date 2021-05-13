#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

set style data linespoints
set logscale y
set key b r at 0.01,0.01 invert width -2

set ylabel "Lower Limit of Mobility {/Symbol-Oblique m}_{LL} (cm²/Vs)" offset 1,-1
set logscale y

# mob = cond / (e * n)
# n = nM * dopEff * (C/(C+1))# C=x
nM = cNa * 1.63 / 720.6
dopEff = 1.0

n(x) = nM * dopEff * (x/(x+1)) # x=C
mob(x,y) = y / (ce*n(x)) # y=cond, x=C
mob2(C,c,n) = c / (ce* (n * dopEff * (C/(C+1)))) # C,cond, nM

set output "calc-MobLL-n" . ".gp" . term
plot  [:][5E-3:]\
 dataN2 u ($1):(mob($1,$5)) t materialN2 ls 2 \
,dataN1 u ($1):(mob($1,$5)) t materialN1 ls 1 \
,dataN3 u ($1):(mob($1,$5)) t materialN3 ls 3 \
,dataN4 u ($1):(mob($1,$5)) t materialN4 ls 4
unset output

set terminal postscript eps enhanced clip dashed size 30cm,30cm

marL=0.12
marT=0.04
plotY=5.5/30 # 5.5cm plothöhe
plotX=plotY*1.618 # Golden Ratio = a:b = 1.618
plotDY=0.015

# n = cond / (e * mob)
# n = nM * dopEff * (C/(C+1))# C=x
# dopEff = (x) n/nM * ((C+1)/C)# C=x
nM = cNa * 1.63 / 720.6
mob = 5.0
n(y) = y / (ce * mob) # y=cond
n2(c,m) = c / (ce * m) # cond,mob
dopEff (x,y) = 100.0*n(y)/nM * ((x+1)/x) # C=x, y=cond

dopEff2 (C,c,m,n) = 100.0 * (c / (ce * m)) /n * ((C+1)/C) # C in MR, c = cond, m=mob, n=nM

#n(x) = nM * dopEff * (x/(x+1)) # x=C
#mob(x,y) = y / (ce*n(x)) # y=cond, x=C

set label 1 "" at graph 0.05, graph 0.925 center front

set output "calc-CCDLL+neLL-n" . ".gp" . term
set multiplot

# (a)
set label 1 sLabelA
set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-1*plotY

unset xlabel; set xtics format "" mirror
unset ylabel; set ytics format "" mirror
unset x2label; unset x2tics
unset y2label; unset y2tics

set format y "%.1e"
set format y "10^{%L}"
unset xlabel
set xtics format ""

set ylabel "Lower Limit of\nDensity of Free Electrons {/URWClassico-Ita n}_{e,LL} (cm^{-3})" offset -1,0
# set key t l at .1, 1E17 invert width -2
# set key off

# set output "calc-CCDLL-n" . ".gp" . term
plot  [:][1E16:1E19]\
 dataN2 u ($1):(n($5)) t materialN2 ls 2 \
,dataN1 u ($1):(n($5)) t materialN1 ls 1 \
,dataN3 u ($1):(n($5)) t materialN3 ls 3 \
,dataN4 u ($1):(n($5)) t materialN4 ls 4

# (b)
set label 1 sLabelB

# set lmargin at screen marL + 1*plotX
# set rmargin at screen marL + 2*plotX
set tmargin at screen 1.0-marT-1*plotY-plotDY
set bmargin at screen 1.0-marT-2*plotY-plotDY

unset ylabel; set ytics format ""
unset xlabel; set xtics format "%g"
load "00_vs_doping-header.gp"
unset x2label; 
unset y2label;

set key l b at first 0.03, first 50 invert width -2

set ylabel "Lower Limit of\nDoping Efficiency {/Symbol-Oblique h}_{dop,LL}" offset 0,1
set ytics format "%g%%"

# set output "calc-EffLL-n" . ".gp" . term
plot  [:][:]\
 dataN2 u ($1):(dopEff($1,$5)) t materialN2 ls 2 \
,dataN1 u ($1):(dopEff($1,$5)) t materialN1 ls 1 \
,dataN3 u ($1):(dopEff($1,$5)) t materialN3 ls 3 \
,dataN4 u ($1):(dopEff($1,$5)) t materialN4 ls 4
# unset output

# print "max CrPd"
# print dopEff(0.0054,1.057e+000)

unset multiplot
unset output

# p-Doping:

set output "calc-Mob+CCDLL+neLL-p" . ".gp" . term
set multiplot
unset y2tics
set ytics mirror

mobULmeo=2.3E-5
mobULlili=5.7E-5
mobULgeschaetzt = 1E-4

mobULmeo  = mobULgeschaetzt
mobULlili = mobULgeschaetzt

denMeO  = cNa*1.463/608.7
denLili = cNa*1.210/720.9

# (a)
set label 1 sLabelA
set lmargin at screen marL
set rmargin at screen marL + 1*plotX
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-1*plotY

set key off

set logscale y ; set format y "%.1e"
set format y "10^{%L}"
set ytics add ("0.1" 0.1, "1" 1, "10" 10) # to prevent 10^0 und 10^1
set ylabel "Lower Limit of Mobility {/Symbol-Oblique m}_{LL} (cm²/Vs)" offset -1,0

set xlabel "" ; set xtics format ""

set label 1 "" at graph 0.05, graph 0.075 center front

set arrow 1 nohead from graph 0.0/3,first 2.3E-5 to graph 1,first 2.3E-5 ls 50 front #lc rgb "red"
set arrow 2 nohead from graph 0.0/3,first 5.7E-5 to graph 1,first 5.7E-5 ls 50 front #lc rgb "dark-magenta"
# set arrow 1 nohead from graph 0.6667,first 2.3E-5 rto graph 0.1667,0 ls 50 lc rgb "red" front
# set arrow 2 nohead from graph 0.8333,first 5.7E-5 rto graph 0.1667,0 ls 50 lc rgb "dark-magenta" front
set label 1 sLabelA
set label 2 "{/Symbol-Oblique m} (MeO-TPD)" at graph 1.02, first 2.3E-5 font ",16" left
set label 3 "{/Symbol-Oblique m} (BF-DPB)"  at graph 1.02, first 5.7E-5 font ",16" left
# set output "calc-MobLL-p" . ".gp" . term
plot  [:][:]\
 dataP1 u ($1):(mob2($1,$5,cNa*1.463/608.7)) t materialP1 ls 1 \
,dataP2 u ($1):(mob2($1,$5,cNa*1.463/608.7)) t materialP2 ls 32\
,dataP3 u ($1):(mob2($1,$5,cNa*1.210/720.9)) t materialP3 ls 3 \
,dataP4 u ($1):(mob2($1,$5,cNa*1.210/720.9)) t materialP4 ls 34

unset arrow 1; unset arrow 2; unset label 2; unset label 3

# (b)
set label 1 sLabelB
set tmargin at screen 1.0-marT-1*plotY-1*plotDY
set bmargin at screen 1.0-marT-2*plotY-1*plotDY

set ylabel "Lower Limit of\nDensity of Free Holes {/URWClassico-Ita n}_{h,LL} (cm^{-3})" offset -1,0
set key l b at first .003, first 1E20 noinvert width -1

plot  [:][:]\
 dataP1 u ($1):(n2($5,mobULmeo)) t materialP1 ls 1 \
,dataP2 u ($1):(n2($5,mobULmeo)) t materialP2 ls 32 \
,dataP3 u ($1):(n2($5,mobULlili)) t materialP3 ls 3 \
,dataP4 u ($1):(n2($5,mobULlili)) t materialP4 ls 34

# (c)
set label 1 sLabelC
set tmargin at screen 1.0-marT-2*plotY-2*plotDY
set bmargin at screen 1.0-marT-3*plotY-2*plotDY

unset xlabel; set xtics format "%g"
load "00_vs_doping-header.gp"

set ylabel "Lower Limit of\nDoping Efficiency {/Symbol-Oblique h}_{dop,LL}" offset 0,1
set logscale y
set ytics format "%g%%"

set label 1 sLabelC

plot  [:][:]\
 dataP1 u ($1):(dopEff2($1,$5,mobULmeo,denMeO)) t materialP1 ls 1 \
,dataP2 u ($1):(dopEff2($1,$5,mobULmeo,denMeO)) t materialP2 ls 32 \
,dataP3 u ($1):(dopEff2($1,$5,mobULlili,denLili)) t materialP3 ls 3 \
,dataP4 u ($1):(dopEff2($1,$5,mobULlili,denLili)) t materialP4 ls 34

unset multiplot
unset output

load "footer.gp"
