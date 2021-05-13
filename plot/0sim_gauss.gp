#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

color = "sw" # DEFAULT

load "00header.gp"
load "0goldenerSchnitt.gp"

#set terminal postscript size 10cm,5cm

#set lmargin 8
#set rmargin 2
set xlabel "Energy {/URWClassico-Ita E}"
set ylabel "Density of States {/URWClassico-Ita DOS}" # offset 1,0

unset key

Eg=2000.0
s=200.0 # sigma in meV
f(x) = 1/(sqrt(2 * pi) * s) * exp(- ( (x-Eg)**2/(2*s**2)  ) )

#f(x) = 1 * exp(- ( (x-Eg)**2/(2*s**2)  ) )

s1=sprintf("%.1f",f(Eg-1*s)/f(Eg)*100.0)
s2=sprintf("%.1f",f(Eg-2*s)/f(Eg)*100.0)
s3=sprintf("%.1f",f(Eg-3*s)/f(Eg)*100.0)

set ytics (\
'100%%' f(Eg) \
,s1."%%" f(Eg-s)\
,s2."%%" f(Eg-2*s)\
,s3."%%" f(Eg-3*s)\
)

set xtics ("{/URWClassico-Ita E}_G=0" Eg\
, "{/Symbol-Oblique s}_G" Eg+1*s, "-{/Symbol-Oblique s}_G" Eg-1*s\
, "2{/Symbol-Oblique s}_G" Eg+2*s, "-2{/Symbol-Oblique s}_G" Eg-2*s\
, "3{/Symbol-Oblique s}_G" Eg+3*s, "-3{/Symbol-Oblique s}_G" Eg-3*s\
)

set output "sim_gauss-malen" . ".gp". term
plot [Eg-3*s:Eg+3*s] [0:*] f(x)
unset output

#
#
# # für Inkscape import von 2 Gaussen
# Eg=0
# s1=100.0 # sigma in meV
# s2=s1*2 # sigma in meV
# plotweite=7*s2
# set samples 1000
# f1(x) = 0.001 + 1/(sqrt(2 * pi) * s1) * exp(- ( (x-Eg)**2/(2*s1**2)  ) )
# f2(x) = 1/(sqrt(2 * pi) * s2) * exp(- ( (x-Eg)**2/(2*s2**2)  ) )
#
# # 1 /(sqrt(2 * pi) * 100) * exp(- ( (x)**2/(2*100**2)  ) )
#
# unset xlabel; unset ylabel; unset ytics; unset xtics
# set output "temp" . ".gp". term
# plot [Eg-plotweite:Eg+plotweite] [0:*] f1(x),f2(x)
# unset output

load "footer.gp"

