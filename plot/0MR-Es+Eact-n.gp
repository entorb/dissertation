#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
set terminal postscript size 14.85cm,7cm

set key spacing 1.5 width -1.5
set key b l # r t at first 0.01, graph 0.25
set tmargin 0.5

Temp=40
set yrange [0:200]; set y2range [0:200]
set ytics 50; set y2tics 50
set mytics 5

sEact="{/URWClassico-Ita E}_{act,{/Symbol s}}"
sEs="|{/URWClassico-Ita E}_{S}|"

set output "MR-Es+Eact-Pd" . ".gp" . term
set multiplot

marL=0.09
plotbreite=0.425

#(a) CrPd
material = materialN4
set label 2 sLabelA . " " . material at graph 0.05, graph 0.92 left front
set obj 3 rect at graph 0.3, graph 0.92 size char 14, char 1.5
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder front #back behind
set lmargin at screen marL
set rmargin at screen marL+plotbreite
set ylabel axisLabelE ; set ylabel offset 2,0.0
set xlabel axisLabelMR offset screen 0.5*plotbreite, character 0.5

set y2tics format ''
plot \
  dataN4 u ($1):($6) title sEact ls 24 \
, dataN4 u ($1):(abs($7)*(c0C+int(Temp))/1000) title sEs ls 4

#(b) WPd
material = materialN3
set label 2 sLabelB . " " . material
set lmargin at screen marL+plotbreite
set rmargin at screen marL+plotbreite+plotbreite

set ylabel "" ; set ytics format ''
set y2tics format '%g'
set xtics add ('' 0.001)
set xlabel ""
plot \
  dataN3 u ($1):($6) title sEact ls 23 \
, dataN3 u ($1):(abs($7)*(c0C+int(Temp))/1000) title sEs ls 3

set xtics add ('0.001' 0.001)
unset multiplot
unset output

set yrange [0:300]; set y2range [0:300]

set output "MR-Es+Eact-AS" . ".gp" . term
set multiplot

#(a) AOB
material = materialN2
set label 2 sLabelA . " " . material at graph 0.05, graph 0.92 left front
set obj 3 rect at graph 0.3, graph 0.92 size char 14, char 1.5
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder front #back behind
set lmargin at screen marL
set rmargin at screen marL+plotbreite
set y2tics format ''
set ytics format '%g'
set ylabel axisLabelE ; set ylabel offset 1.0,0.0 
set xlabel axisLabelMR offset screen 0.5*plotbreite, character 0.5

plot \
  dataN2 u ($1):($6) title sEact ls 22 \
, dataN2 u ($1):(abs($7)*(c0C+int(Temp))/1000) title sEs ls 2

#(b) DMBI-POH
material = materialN1
set label 2 sLabelB . " " . material
set lmargin at screen marL+plotbreite
set rmargin at screen marL+plotbreite+plotbreite

unset ylabel; set ytics format ''
set y2tics format '%g'
set xtics add ('' 0.001)
set xlabel ""
plot \
  dataN1 u ($1):($6) title sEact ls 21 \
, dataN1 u ($1):(abs($7)*(c0C+int(Temp))/1000) title sEs ls 1

set xtics add ('0.001' 0.001)
unset multiplot
unset output
unset obj 3

# o-MeO-DMBI
set output "MR-Es+Eact-DMBIs" . ".gp" . term
load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"
material = materialN1b
unset label 2
# set lmargin 5.5 ; set rmargin 0.5 ; set tmargin 0.5
# set key b l at graph 0, graph 0
set key t r #at graph 1 , graph 1
set key samplen 0 spacing 1.1 width -6
set ytics format '%g'
set ylabel axisLabelE offset 0,0
set xlabel axisLabelMR offset 0,0.5
unset y2tics
plot \
  dataN1 u ($1):($6) title sEact." (".materialN1.")" ls 21 \
, dataN1b u ($1):($6) title sEact." (".materialN1b.")" ls 25 \
, dataN1 u ($1):(abs($7)*(c0C+int(Temp))/1000) title sEs." (".materialN1.")" ls 1 \
, dataN1b u ($1):((-$7)*(c0C+int(Temp))/1000) title sEs." (".materialN1b.")" ls 5 ps 2.75
unset output

load "footer.gp"
