#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

color= "sw" # DEFAULT

load "00header.gp"

set terminal postscript size 14.85cm,14.85cm

#Gauss DOS
Eg = 0 # Et + 200 # 2sigma von Etr weg
s = 100.0 # gauss sigma

Et = Eg -2*s #0.0 # Nullpunkt = Ec für inorg
Ef = Et -2*s #-200.0

# inorg
Ec = Et

T=25.0 # C
kT = ckb * (c0C+T) /ce # in eV

Emax = Ef+400 # = Eg
Emin = Ef - 100

set xrange  [Emin:Emax]
set x2range [Emin:Emax]

fermi(x)     = 1 / ( 1+ exp ( ((1.0*x-Ef)/1000)/(kT) ) ) # x = E in meV
# fB(x)     = 1 / ( exp ( ((1.0*x-Ef)/1000)/(kT) ) ) # x = E in meV
dosSqrt(x)     = sqrt ((x-Ec)/1000) # x = E in meV
dosGauss(x) = 1/(sqrt(2 * pi) * s) * exp(- ( (x-Eg)**2/(2*s**2)  ) )
nInorg (x)     = dosSqrt(x) * fermi(x) # integration missing to get n_e
nOrg (x)     = dosGauss(x) * fermi(x) # integration missing to get n_e

set style function lines

set ytics (0,"½" 0.5,1)
set ytics ("" 0,"" 0.5,"" 1) # keine zahlen, da sqrt-dos nicht normierbar

set label 1 at graph 0.06 , graph 0.8 center

set arrow 2 heads from first Ef, graph 0.1 to first Ec, graph 0.1 front
set label 2 "{/URWClassico-Ita E}_S" at first (Ef+0.5*(Ec-Ef)) , graph 0.17 center front
set label 4 "{/URWClassico-Ita n}_{e}" center front

set style fill transparent solid 1.0 border

set output "sim_Fermi-DOS-Es-inorg+org" . ".gp". term
set multiplot

marT=0.03
spacingY=0.05
plotY= 1.0/3.0 # 14.85cm/3=4.95cm
set rmargin at screen 0.985
set lmargin at screen 0.000

# (a) inOrg
set label 1 sLabelA ." CSC"
set label 4 at first Ec+19 , graph 0.7
set tmargin at screen 1.0-marT
set bmargin at screen 1.0-marT-plotY
set xtics (\
 "{/URWClassico-Ita E}_{C}" Ec\
,"{/URWClassico-Ita E}_{F}" Ef\
)
set key height 0.1 samplen 0.75 spacing 1.2 width -5 invert
set key center center at first (Ef+0.5*(Ec-Ef)) , graph 0.75

set samples 600

set arrow 3 nohead front from first Ec , graph 0 rto first +0.6 , graph 0.35 ls 1

plot [:] [0:*] \
 nInorg (x)  axes x1y2 with filledcurve y1=0 ls 1 lc rgb "gray60" t "{/URWClassico-Ita n}_e={/Symbol ò} {/URWClassico-Ita n}_{e}' {/URWClassico-Ita dE}" \
,nInorg (x)  axes x1y2 ls 1 t "{/URWClassico-Ita n}_{e}'({/URWClassico-Ita E}) = {/URWClassico-Ita f}_{FD} · {/URWClassico-Ita DOS}" \
,dosSqrt (x)/dosSqrt (Emax) t "{/URWClassico-Ita DOS}" ls 3 \
,fermi(x) t "{/URWClassico-Ita f}_{FD}" ls 4

unset arrow 3

set key off

# (b) Org
set label 1 sLabelB ." OSC"
set label 4 at first Ef+58 , graph 0.7
set tmargin at screen 1.0-marT-plotY-spacingY
set bmargin at screen 1.0-marT-2*plotY-spacingY

set xtics (\
 "{/URWClassico-Ita E}_{Tr}" Et\
,"{/URWClassico-Ita E}_{F}" Ef\
,"{/URWClassico-Ita E}_{G}-{/Symbol-Oblique s}_G" Eg-s\
,"{/URWClassico-Ita E}_{G}" Eg\
)
set xlabel "Energy {/URWClassico-Ita E}"

set arrow 3 nohead from first Ef, graph 0.0 rto graph 0,graph 0.7 ls 40 front
set arrow 4 nohead from first Et, graph 0.0 rto graph 0,graph 0.7 ls 40 front

set samples 200

plot [:] [0:*] \
  nOrg (x) axes x1y2 with filledcurve y1=0 ls 1 lc rgb "gray60" t "{/URWClassico-Ita n}_e" \
, nOrg (x) axes x1y2 ls 1 t "{/URWClassico-Ita n}'({/URWClassico-Ita E}) = {/URWClassico-Ita f}_{FD} · {/URWClassico-Ita DOS}" \
,dosGauss(x)/dosGauss(0) t "{/URWClassico-Ita DOS}" ls 3\
,fermi(x) t "{/URWClassico-Ita f}_{FD}" ls 4

unset multiplot
unset output
load "footer.gp"
