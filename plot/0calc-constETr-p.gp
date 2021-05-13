#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

dp1='../mathematica/export/nVonEtr-p1_MeO+F6-TCNNQ.dat'
dp2='../mathematica/export/nVonEtr-p2_MeO+C60F36.dat'
dp3='../mathematica/export/nVonEtr-p3_BF-DPB+F6-TCNNQ.dat'
dp4='../mathematica/export/nVonEtr-p4_BF-DPB+C60F36.dat'

denMeO =  cNa*1.463/608.7
denLili = cNa*1.210/720.9

mobULmeo  = 1E-4
mobULlili = 1E-4

set style data linespoints
set label 1 "" at graph 0.05, graph 0.90 center front

#set label 2 "{/URWClassico-Ita E}_{Tr}=-225meV" at graph 0.5, graph 0.95 center front

set key noinvert width -1

set logscale y
set ylabel "Mobility {/Symbol-Oblique m} (cm²/Vs)" offset 0,0 # \nat {/URWClassico-Ita E}_{Tr}=-225meV
set label 1 sLabelC
set ytics format "%g"
set xlabel offset 0,0
set key off

#mob = cond/(ce * n)
# mob(x,y) = x/(ce*y) # x = cond = #2 ; y = ne = data 4..8
dopEff = 1.0
mob2(C,c,n) = c / (ce* (n * dopEff * (C/(C+1)))) # C,cond, nM

set format y "%.1e"
set format y "10^{%L}"

set output "calc-constEtr400-p-Mob-log" . ".gp" . term
plot  [:][:]\
 dp2 u ($1):(mob2($1,$2,denMeO)) t materialP2 ls 32 \
,dp1 u ($1):(mob2($1,$2,denMeO)) t materialP1 ls 1 \
,dp3 u ($1):(mob2($1,$2,denLili)) t materialP3 ls 3 \
,dp4 u ($1):(mob2($1,$2,denLili)) t materialP4 ls 34
unset output

unset logscale y
set output "calc-constEtr400-p-Mob-lin" . ".gp" . term
replot
unset output

set ylabel "Charge Carrier Density {/URWClassico-Ita n}_h (cm^{-3})" offset 0,0 # \nat {/URWClassico-Ita E}_{Tr}=-225meV
#set title "{/URWClassico-Ita E}_{Tr}=-225meV"
set label 1 sLabelA
set xtics nomirror
set x2tics
set key off
set key r b at graph 1.0, graph 0.0

set logscale y
set format y "%.1e"
unset xlabel ; set xtics format ""
set format y "10^{%L}"

# n2(c,m) = c / (ce * m) # cond,mob

#mob =
set output "calc-constEtr400-p-CCD-log" . ".gp" . term
plot  [:][:]\
 dp1 u 1:($6) t materialP1 ls 1 \
,dp2 u 1:($6) t materialP2 ls 32 \
,dp3 u 1:($6) t materialP3 ls 3 \
,dp4 u 1:($6) t materialP4 ls 34
unset output

unset logscale y
set format y "%g"
set output "calc-constEtr400-p-CCD-lin" . ".gp" . term
replot
unset output

unset title
set ylabel "Doping Efficiency {/Symbol-Oblique h}_{dop}" offset 1.1,0 # \nat {/URWClassico-Ita E}_{Tr}=-225meV
set key off
set label 1 sLabelB
set xtics mirror #format ""
unset x2tics
#unset xlabel ; set xtics format ""
set ytics format "%g%%"
set logscale y
# ne = cond / (e * mob)
nM = cNa * 1.63 / 720.6
nD(x) = nM * x / (1+x) # x=C
# dopEff(x,y) = 100.0*y/nD(x) # x=C, y=ne
#dopEff = ne/nD # ne = ne(Etr) in data 4..8
dopEff2 (C,c,m,n) = 100.0 * (c / (ce * m)) /n * ((C+1)/C) # C in MR, c = cond, m=mob, n=nM

set output "calc-constEtr400-p-DopEff-log" . ".gp" . term
plot  [:][:]\
 dp2 u ($1):(dopEff2($1,$2,mobULmeo,denMeO))   t materialP2 ls 32 \
,dp1 u ($1):(dopEff2($1,$2,mobULmeo,denMeO))   t materialP1 ls 1 \
,dp3 u ($1):(dopEff2($1,$2,mobULlili,denLili)) t materialP3 ls 3 \
,dp4 u ($1):(dopEff2($1,$2,mobULlili,denLili)) t materialP4 ls 34
unset output

#set key t r at graph 0.95, graph 0.95
unset logscale y
set output "calc-constEtr400-p-DopEff-lin" . ".gp" . term
replot
unset output

load "footer.gp"
