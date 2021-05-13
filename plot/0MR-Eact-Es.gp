#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

# set ylabel offset 1.75,0
# set lmargin 6
# set rmargin 0.5
set key height 0.5

set style data linespoints

sEact="{/URWClassico-Ita E}_{act,{/Symbol s}}"
sEs="|{/URWClassico-Ita E}_{S}|"
set ylabel sEact."-".sEs." (meV)"

Temp = 40

set ytics 25
set mytics 5
set yrange [*:100]
set xzeroaxis ls -1 lw 1

set output "MR-Eact-Es-n-Pd" . ".gp" . term
set key t l
set key width widthKeyPd
plot  \
 dataN4 u ($1):(($6)-(abs($7)*(c0C+int(Temp))/1000)) title materialN4 ls 4 \
,dataN3 u ($1):(($6)-(abs($7)*(c0C+int(Temp))/1000)) title materialN3 ls 3
unset output

set output "MR-Eact-Es-n-AS" . ".gp" . term
set key width widthKeyAS
set key t r
plot  \
 dataN2 u ($1):(($6)-(abs($7)*(c0C+int(Temp))/1000)) title materialN2 ls 2 \
,dataN1 u ($1):(($6)-(abs($7)*(c0C+int(Temp))/1000)) title materialN1 ls 1
unset output

# P
sEs="{/URWClassico-Ita E}_{S}"
set ylabel sEact."-".sEs." (meV)"

set ytics 50
set mytics 5
set yrange [0:*]

set key spacing 1.1 width widthKeyp height 0
set key b l #at graph 0, graph 0

set output "MR-Eact-Es-p" . ".gp" . term
plot \
 dataP1 u ($1):(($6)-(abs($7)*(c0C+int(Temp))/1000)) title materialP1 ls 1 \
,dataP2 u ($1):(($6)-(abs($7)*(c0C+int(Temp))/1000)) title materialP2 ls 32 \
,dataP3 u ($1):(($6)-(abs($7)*(c0C+int(Temp))/1000)) title materialP3 ls 3 \
,dataP4 u ($1):(($6)-(abs($7)*(c0C+int(Temp))/1000)) title materialP4 ls 34
unset output

load "footer.gp"
