#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"

set key bottom left
set ylabel axisLabelS
set ytics 100

set ylabel offset 0,0
set y2label offset 0,0

# set lmargin 7.25
# set rmargin 7.25

set key b l height 0.5

Temp = 40

set style data linespoints

set y2tics nomirror
set ytics nomirror

set mytics 4

set y2tics (\
     "0"    0.0\
,   "-50"   -50.0/(c0C+int(Temp))*1000\
,  "-100"  -100.0/(c0C+int(Temp))*1000\
,  "-150"  -150.0/(c0C+int(Temp))*1000\
,  "-200"  -200.0/(c0C+int(Temp))*1000\
,  "-250"  -250.0/(c0C+int(Temp))*1000\
,  "-300"  -300.0/(c0C+int(Temp))*1000\
,  "-350"  -350.0/(c0C+int(Temp))*1000\
,  "-400"  -400.0/(c0C+int(Temp))*1000\
,  "-450"  -450.0/(c0C+int(Temp))*1000\
,  "-500"  -500.0/(c0C+int(Temp))*1000\
)

set y2label axisLabelEs

set output "MR-See+Es-n-Pd" . ".gp" . term
set key width widthKeyPd
ymaxS = -200.0/(c0C+int(Temp))*1000
set yrange  [0:ymaxS]; set y2range [0:ymaxS]
plot \
 dataN4 u 1:7 title materialN4 ls 4 \
,dataN3 u 1:7 title materialN3 ls 3
unset output

set output "MR-See+Es-n-AS" . ".gp" . term
set key width widthKeyAS
#ymaxS = 200.0/(c0C+int(Temp))*1000
#set yrange  [0:ymaxS]; set y2range [0:ymaxS]
plot \
 dataN2 u 1:7 title materialN2 ls 2 \
,dataN1 u 1:7 title materialN1 ls 1
unset output

unset mytics
unset ytics

# P
reset
load "00header.gp"
load "00_vs_doping-header.gp"
load "0goldenerSchnitt.gp"
set style data linespoints

set ylabel axisLabelS
set y2label axisLabelEs

set ylabel offset 2.0,0
set yrange[*:*]
set mytics 4
#set ytics autofreq
set ytics autofreq nomirror
set ytics 200
set y2tics (\
     "0"    0.0\
,   "50"   50.0/(c0C+int(Temp))*1000\
,  "100"  100.0/(c0C+int(Temp))*1000\
,  "150"  150.0/(c0C+int(Temp))*1000\
,  "200"  200.0/(c0C+int(Temp))*1000\
,  "250"  250.0/(c0C+int(Temp))*1000\
,  "300"  300.0/(c0C+int(Temp))*1000\
,  "350"  350.0/(c0C+int(Temp))*1000\
)

set output "MR-See+Es-p-all" . ".gp" . term
set key spacing 1.1 width widthKeyp height 0
set key b l # at graph 0, graph 0
#set key off
ymaxS = 1000 # 350.0/(c0C+int(Temp))*1000

set yrange  [0:ymaxS]; set y2range [0:ymaxS]
plot \
 dataP4 u ($1):($7) title materialP4 ls 34 \
,dataP3 u ($1):($7) title materialP3 ls 3 \
,dataP2 u ($1):(abs($7)) title materialP2 ls 32 \
,dataP1 u ($1):($7) title materialP1 ls 1
unset output

load "footer.gp"
