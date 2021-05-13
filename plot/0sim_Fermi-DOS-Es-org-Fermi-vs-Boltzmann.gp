#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

color = "sw" # DEFAULT

load "00header.gp"

set terminal postscript size 14.85cm,6cm

set ylabel offset 1.0,0.0 ; set y2label offset -0.25,0.0 ; set xlabel offset 0.0,0.5 ; set x2label offset 0.0,0.0

set lmargin ; set bmargin
set tmargin 0.5
set rmargin 2.25

Et = 0.0 # Nullpunkt = Ec für inorg
#Gauss DOS
s = 100.0 # gauss sigma

Eg = Et + 2*s # 3sigma von Ef weg

Ef = Et - 2*s
#Ef = -400.0

Emax = Eg
Emin = Ef - 1*s

T=25.0 # C
kT = ckb * (c0C+T) /ce # in eV

set xrange  [Emin:Emax]
set x2range [Emin:Emax]

fermi(x)     = 1 / ( 1+ exp ( ((1.0*x-Ef)/1000)/(kT) ) ) # x = E in meV
fB(x)     = 1 / ( exp ( ((1.0*x-Ef)/1000)/(kT) ) ) # x = E in meV
#dosSqrt(x)     = sqrt ((x-Ec)/1000) # x = E in meV
dosGauss(x) = 1/(sqrt(2 * pi) * s) * exp(- ( (x-Eg)**2/(2*s**2)  ) )
#nInorg (x)     = dosSqrt(x) * fermi(x) # integration missing to get n_e
nOrg (x)     = dosGauss(x) * fermi(x) # integration missing to get n_e
nOrgB (x)     = dosGauss(x) * fB(x) # integration missing to get n_e

set style function l
set samples 300
set key width 1 height 0.1 samplen 0.75 spacing 1.2
set key l c invert

set ytics (0,"½" 0.5,1)
set ylabel "{/URWClassico-Ita f} ({/URWClassico-Ita E})"
set xlabel "Energy {/URWClassico-Ita E}"
set y2label "{/URWClassico-Ita DOS} ({/URWClassico-Ita E})"
set xtics (\
"{/URWClassico-Ita E}_{F}" Ef\
,"{/URWClassico-Ita E}_{G}=0" Eg\
,"-1{/Symbol-Oblique s}_G" Eg-s\
,"-2{/Symbol-Oblique s}_G" Eg-2*s\
,"-3{/Symbol-Oblique s}_G" Eg-3*s\
)
#  "{/URWClassico-Ita E}_{Tr}" Et\

# set arrow 1 heads from first Ef, graph 0.1 to first Et, graph 0.1
# set label 1 "{/URWClassico-Ita E}_S" at first (Ef+0.5*(Et-Ef)) , graph 0.17 center
# set arrow 2 heads from first Et, graph 0.1 to first Eg, graph 0.1
# set label 2 "{/URWClassico-Ita E}_{offset}" at first (Et+0.5*(Eg-Et)) , graph 0.17 center

# set label 9 "(b)" at graph 0.03 , graph 0.9 center

set output "sim_Fermi-DOS-Es-org-Fermi-vs-Boltzmann" . ".gp". term
set multiplot

# size of inset
x0=0.35
y0=0.52
x=0.3
y=0.43
x1=x0+x
y1=y0+y
xminInset=(Ef-100)
xmaxInset=(Eg)
xmaxInset=Emax
xminInset=Emin
set arrow 3 from first xminInset, first 0 to screen x0, screen y0 nohead ls 0
set arrow 4 from first xmaxInset, first 0 to screen x1, screen y0 nohead ls 0

# plot 1(main)
set size 1.0 , 1.0
set origin 0.0,0.0

plot [:] [0:1] \
 dosGauss (x) t "{/URWClassico-Ita DOS}" axes x1y2 \
,fermi(x) t "{/URWClassico-Ita f}_{FD}" ls 2\
,fB(x) t "{/URWClassico-Ita f}_{B}" ls 3

# unset label 1; unset arrow 1
# unset label 2; unset arrow 2
unset label 9

# plot 2, inset
set origin x0,y0
set size x , y

unset xtics
unset ytics
unset xlabel; unset ylabel; unset y2label
set key off
set lmargin 0 ; set bmargin 0 ; set rmargin 0 ; set tmargin 0 ;

clear # clear the plot area from grid lines etc

set xtics (\
  "{/URWClassico-Ita E}_{F}"  Ef \
, "{/URWClassico-Ita E}_{G}"  Eg \
,"-2{/Symbol-Oblique s}_G" Eg-2*s\
," " Eg-1*s\
," " Eg-3*s\
) font ",18"
# "{/URWClassico-Ita E}_{Tr}" Et \

# manual grid line
# add hidden grid line
set arrow nohead front from first Ef     , graph 0 rto graph 0 , graph 1 ls 40
set arrow nohead front from first Eg-1*s , graph 0 rto graph 0 , graph 0.7 ls 40
set arrow nohead front from first Eg-2*s , graph 0 rto graph 0 , graph 0.7 ls 40
set arrow nohead front from first Eg-3*s , graph 0 rto graph 0 , graph 0.7 ls 40

set ylabel "{/URWClassico-Ita n}'({/URWClassico-Ita E}) = {/URWClassico-Ita f} · {/URWClassico-Ita DOS}" font ",18" offset 0.75,0.0

set label at first Ef+0.7*s , graph 0.2 center "{/URWClassico-Ita n}_{e}" font ",18" front

set style fill transparent solid 1.0 border
plot [xminInset:xmaxInset][0:*] \
nOrgB (x) with filledcurve y1=0 ls 3 lc rgb "gray40"  \
, nOrgB (x) ls 3 \
, nOrg (x) with filledcurve y1=0 ls 3 lc rgb "gray60"  \
, nOrg (x) ls 2
# , dosGauss(x) * fB(x) ls 1

unset multiplot
unset output

load "footer.gp"

