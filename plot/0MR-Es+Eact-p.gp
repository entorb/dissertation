#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
set terminal postscript size 14.85cm,10cm

set key spacing 1.5 width -1.5
set key b l # at graph 0, graph 0

Temp=40
ymax=450
set yrange  [0:ymax]
set y2range [0:ymax]

sEact="{/URWClassico-Ita E}_{act,{/Symbol s}}"
#sEs="|{/URWClassico-Ita E}_{S}|"
sEs="{/URWClassico-Ita E}_{S}"

set output "MR-Es+Eact-p" . ".gp" . term
set multiplot # layout 2,2 rowsfirst

set xlabel  "" offset 0,0
set ylabel  "" offset 0,0
set x2label "" offset 0,0
set y2label "" offset 0,0

set xtics  format ""
set x2tics format ""
set ytics  format "" 100
set y2tics format "" 100
set mytics 4

marL=0.1
marR=0.065
marT=0.002
marB=0.1
plotX=(1.0-marL-marR)/2
plotY=(1.0-marB-marT)/2

#labely=0.0+400.0/ymax # =8.0/9 # genau mittig auf Linie bei 400
labely=0.9
set label 1 "" at graph 0.5, graph labely center front
set obj 3 rect at graph 0.5, graph labely size char 21, char 1.5
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder front #back behind

#set label 2 axisLabelMR at screen marL+plotX, screen 0.04 center front font "URWClassico-Ita,22pt"

#(a) MeO+F6
material = materialP1
data = dataP1
set label 1 sLabelA . " " . material
set obj 3 size char 22, char 1.5
set lmargin 0; set rmargin 0; set bmargin 0; set tmargin 0;
set lmargin at screen marL
set tmargin at screen marB+2*plotY
set rmargin at screen marL+plotX
set bmargin at screen marB+plotY

set ytics format "%g"
set y2tics format ""
set xtics format ""
plot \
  data u ($1):($6) title sEact ls 21\
, data u ($1):(abs($7)*(c0C+int(Temp))/1000) title sEs ls 1

#(b) MeO+F36
material = materialP2
data = dataP2
set label 1 sLabelB . " " . material
set obj 3 size char 18, char 1.5
set lmargin 0; set rmargin 0; set bmargin 0; set tmargin 0;
set lmargin at screen marL+plotX
set tmargin at screen marB+2*plotY
set rmargin at screen marL+2*plotX
set bmargin at screen marB+plotY
set xtics format ""
set ytics format ""
set y2tics format "%g"
plot \
  data u ($1):($6) title sEact ls 22 \
, data u ($1):(abs($7)*(c0C+int(Temp))/1000) title sEs ls 2

#(c) BF+F6
material = materialP3
data = dataP3
set label 1 sLabelC . " " . material
set obj 3 size char 20, char 1.10
set lmargin 0; set rmargin 0; set bmargin 0; set tmargin 0;
set lmargin at screen marL
set bmargin at screen marB
set rmargin at screen marL+plotX
set tmargin at screen marB+plotY
set ytics format "%g"
set y2tics format ""
set xtics format "%g" add ("" 1)
plot \
  data u ($1):($6) title sEact ls 23\
, data u ($1):(abs($7)*(c0C+int(Temp))/1000) title sEs ls 3

#(d) BF+F36
material = materialP4
data = dataP4
set label 1 sLabelD . " " . material
set obj 3 size char 16.5, char 1.5
set lmargin 0; set rmargin 0; set bmargin 0; set tmargin 0;
set rmargin at screen marL+plotX+plotX
set bmargin at screen marB
set lmargin at screen marL+plotX
set tmargin at screen marB+plotY
set ytics format ""
set y2tics format "%g"
set xtics format "%g" add ("1" 1)

set xlabel axisLabelMR offset screen -0.5*plotX, character 0.5
set ylabel axisLabelE  offset screen -0.460, screen 0.5*plotY

plot \
  data u ($1):($6) title sEact ls 24 \
, data u ($1):(abs($7)*(c0C+int(Temp))/1000) title sEs ls 4

unset multiplot
unset output

load "footer.gp"
