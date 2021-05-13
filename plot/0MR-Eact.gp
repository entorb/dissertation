#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

set ylabel axisLabelEact #offset 1.75,0
set mytics 5
# set lmargin 6
# set rmargin 0.5
set key height 0.5 b l # t l at graph 0, graph 0.2

set style data linespoints

set output "MR-Eact-n-Pd" . ".gp" . term
set key width widthKeyPd
plot  [:][0:200]\
 dataN3 u ($1):($6) title materialN3 ls 3 \
,dataN4 u ($1):($6) title materialN4 ls 4
unset output

set output "MR-Eact-n-AS" . ".gp" . term
set key width widthKeyAS
plot  [:][0:250]\
 dataN2 u ($1):($6) title materialN2 ls 2 \
,dataN1 u ($1):($6) title materialN1 ls 1
unset output

# P
set key spacing 1.1 width widthKeyp height 0
#set key b l #at graph 0, graph 0.03
set ytics 100
set mytics 4

set output "MR-Eact-p-all" . ".gp" . term
plot  [:][0:*]\
 dataP4 u ($1):($6) title materialP4 ls 34 \
,dataP3 u ($1):($6) title materialP3 ls 3 \
,dataP2 u ($1):($6) title materialP2 ls 32 \
,dataP1 u ($1):($6) title materialP1 ls 1
unset output

load "footer.gp"
