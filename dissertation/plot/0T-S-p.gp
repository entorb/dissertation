#!/usr/bin/gnuplot
term = "eps"
color="sw"
color="color"

load "00header.gp"

set terminal postscript enhanced size 14.85cm,5.25cm # because will be changed for multiplots

set key title "{/URWClassico-Ita C} (MR)" outside right top
set key font ",18" spacing 0.62 # fur für p1, rest bisschen größer

#load "00_vs_T-header.gp"
set xlabel axisLabelTminC
set xtics mirror

xmin = 28
set tmargin 2

ymax=1000

plotX=0.32
marL=0.105
marR=0.005

set arrow 1 from first (42.5), graph .92 to first (42.5), graph 0.05 ls 70
set label 1 "{/URWClassico-Ita C}" at (42.5),graph .95 center tc ls 71
set label 2 sLabelA at graph 0.90, graph 0.90 center # (a),...
set label 3 "" at graph 1.3, screen 0.93 center # Title
set ylabel offset 1.0,0

set key t l at screen marL+plotX+0.01, graph 1

#==> Start ../data/p1_MeO+F6-TCNNQ : materialP1
set output "T-S-p1.gp" . term
set multiplot

datafolder = "../data/p1_MeO+F6-TCNNQ/byDoping"
material = materialP1
#xmax=47; set xtics 5
xmax=82; set xtics 10

set label 3 material
xMR=42.5
set arrow 1 from first xMR, graph .74 to first xMR, graph 0.05 ls 70
set label 1 "{/URWClassico-Ita C}" at xMR,graph .78 center font ",18" tc ls 71

set lmargin at screen marL
set rmargin at screen marL+plotX

d1 = datafolder . "/See_0.0040_00.2_008.dat"
d2 = datafolder . "/See_0.0125_00.7_006.dat"
d3 = datafolder . "/See_0.0238_01.4_007.dat"
d4 = datafolder . "/See_0.0374_02.2_003.dat"
d5 = datafolder . "/See_0.0397_02.3_012.dat"
d6 = datafolder . "/See_0.0469_02.7_005.dat"
d7 = datafolder . "/See_0.0469_02.8_004.dat"
d8 = datafolder . "/See_0.0586_03.4_010.dat"
d9 = datafolder . "/See_0.0766_04.4_009.dat"
d10 = datafolder . "/See_0.1732_09.3_011.dat"
d11 = datafolder . "/See_0.2899_14.7_028.dat"

# left Plot
set label 2 sLabelA
set ylabel axisLabelS
set ytics 200 format "%g"
set key on

plot [xmin:xmax] [0:ymax]\
    d1 u ($1):(abs($2)) title "0.0040" w lp ls 11 lw 2 ps 1.5\
,   d2  u ($1):(abs($2)) title "0.013" w lp ls 10 lw 2 ps 1.5\
,   d3  u ($1):(abs($2)) title "0.024" w lp ls 9  lw 2 ps 1.5\
,   d4  u ($1):(abs($2)) title "0.037" w lp ls 8  lw 2 ps 1.5/1.2\
,   d5  u ($1):(abs($2)) title "0.040" w lp ls 7  lw 2 ps 1.5\
,   d6  u ($1):(abs($2)) title "0.047" w lp ls 6  lw 2 ps 1.5\
,   d7  u ($1):(abs($2)) title "0.047" w lp ls 5  lw 2 ps 1.5\
,   d8  u ($1):(abs($2)) title "0.059" w lp ls 4  lw 2 ps 1.5\
,   d9  u ($1):(abs($2)) title "0.077" w lp ls 3  lw 2 ps 1.5/1.2\
,   d10 u ($1):(abs($2)) title "0.17"  w lp ls 2  lw 2 ps 1.5\
,   d11 u ($1):(abs($2)) title "0.29"  w lp ls 1  lw 2 ps 1.5
unset arrow 1; unset label 1; set label 3 ""

set key off
set label 2 sLabelB

set lmargin at screen 1.0-marR-plotX
set rmargin at screen 1.0-marR

# T-S-lin-norm
set ylabel axisLabelSnorm
set ytics 0.05 format "%.2f"

plot [xmin:xmax] [0.95:1.10] \
    d1  u ($1):(abs($2/(649.037))) title "0.0040" w lp ls 11 lw 2 ps 1.5\
,   d2  u ($1):(abs($2/(531.557))) title "0.013"  w lp ls 10 lw 2 ps 1.5\
,   d3  u ($1):(abs($2/(401.689))) title "0.024"  w lp ls 9  lw 2 ps 1.5\
,   d4  u ($1):(abs($2/(332.029))) title "0.037"  w lp ls 8  lw 2 ps 1.5/1.2\
,   d5  u ($1):(abs($2/(337.938))) title "0.040"  w lp ls 7  lw 2 ps 1.5\
,   d6  u ($1):(abs($2/(373.450))) title "0.047"  w lp ls 6  lw 2 ps 1.5\
,   d7  u ($1):(abs($2/(303.659))) title "0.047"  w lp ls 5  lw 2 ps 1.5\
,   d8  u ($1):(abs($2/(310.147))) title "0.059"  w lp ls 4  lw 2 ps 1.5\
,   d9  u ($1):(abs($2/(180.468))) title "0.077"  w lp ls 3  lw 2 ps 1.5/1.2\
,   d10 u ($1):(abs($2/(217.340))) title "0.17"   w lp ls 2  lw 2 ps 1.5\
,   d11 u ($1):(abs($2/(143.179))) title "0.29"   w lp ls 1  lw 2 ps 1.5

unset multiplot
unset output

# end ../data/p1_MeO+F6-TCNNQ

#==> Start ../data/p2_MeO+C60F36 : materialP2
set output "T-S-p2.gp" . term
set multiplot

set key spacing 0.68

datafolder = "../data/p2_MeO+C60F36/byDoping"
material = materialP2
#xmax=47; set xtics 5

set label 3 material
#xMR=43.75
set arrow 1 from first xMR, graph .76 to first xMR, graph 0.05 ls 70
set label 1 "{/URWClassico-Ita C}" at xMR,graph .8 center font ",18" tc ls 71

set lmargin at screen marL
set rmargin at screen marL+plotX

d1 = datafolder . "/See_0.0022_00.5_089.dat"
d2 = datafolder . "/See_0.0049_01.1_088.dat"
d3 = datafolder . "/See_0.0060_01.4_097.dat"
d4 = datafolder . "/See_0.0089_02.0_090.dat"
d5 = datafolder . "/See_0.0179_04.0_095.dat"
d6 = datafolder . "/See_0.0375_08.0_094.dat"
d7 = datafolder . "/See_0.0828_16.0_087.dat"
d8 = datafolder . "/See_0.2013_31.7_092.dat"
d9 = datafolder . "/See_0.4997_53.6_093.dat"

# left Plot
set label 2 sLabelC
set ylabel axisLabelS
set ytics 200 format "%g"
set key on

plot [xmin:xmax] [0:ymax]\
    d1 u ($1):(abs($2)) title "0.0022" w lp ls 9  lw 2 ps 1.5\
,   d2 u ($1):(abs($2)) title "0.0049" w lp ls 8  lw 2 ps 1.5/1.2\
,   d3 u ($1):(abs($2)) title "0.0060" w lp ls 7  lw 2 ps 1.5\
,   d4 u ($1):(abs($2)) title "0.0089" w lp ls 6  lw 2 ps 1.5\
,   d5 u ($1):(abs($2)) title "0.018"  w lp ls 5  lw 2 ps 1.5\
,   d6 u ($1):(abs($2)) title "0.037"  w lp ls 4  lw 2 ps 1.5\
,   d7 u ($1):(abs($2)) title "0.083"  w lp ls 3  lw 2 ps 1.5/1.2\
,   d8 u ($1):(abs($2)) title "0.20"   w lp ls 2  lw 2 ps 1.5\
,   d9 u ($1):(abs($2)) title "0.50"   w lp ls 1  lw 2 ps 1.5
unset arrow 1; unset label 1; set label 3 ""

set key off
set label 2 sLabelD

set lmargin at screen 1.0-marR-plotX
set rmargin at screen 1.0-marR

# T-S-lin-norm
set ylabel axisLabelSnorm
set ytics 0.05 format "%.2f"

plot [xmin:xmax] [0.95:1.10] \
    d1 u ($1):(abs($2/(709.474))) title "0.0022" w lp ls 9  lw 2 ps 1.5\
,   d2 u ($1):(abs($2/(647.159))) title "0.0049" w lp ls 8  lw 2 ps 1.5/1.2\
,   d3 u ($1):(abs($2/(510.510))) title "0.0060" w lp ls 7  lw 2 ps 1.5\
,   d4 u ($1):(abs($2/(460.874))) title "0.0089" w lp ls 6  lw 2 ps 1.5\
,   d5 u ($1):(abs($2/(455.511))) title "0.018"  w lp ls 5  lw 2 ps 1.5\
,   d6 u ($1):(abs($2/(448.075))) title "0.037"  w lp ls 4  lw 2 ps 1.5\
,   d7 u ($1):(abs($2/(339.364))) title "0.083"  w lp ls 3  lw 2 ps 1.5/1.2\
,   d8 u ($1):(abs($2/(291.354))) title "0.20"   w lp ls 2  lw 2 ps 1.5\
,   d9 u ($1):(abs($2/(123.056))) title "0.50"   w lp ls 1  lw 2 ps 1.5

unset multiplot
unset output

# end ../data/p2_MeO+C60F36

# #==> Start ../data/p3_BF-DPB+F6-TCNNQ : materialP3
set output "T-S-p3.gp" . term
set multiplot

datafolder = "../data/p3_BF-DPB+F6-TCNNQ/byDoping"
material = materialP3
#xmax=77; set xtics 10

set label 3 material
xMR=67.5
set arrow 1 from first xMR, graph .68 to first xMR, graph 0.05 ls 70
set label 1 "{/URWClassico-Ita C}" at xMR,graph .72 center font ",18" tc ls 71

set lmargin at screen marL
set rmargin at screen marL+plotX

d1 = datafolder . "/See_0.0100_00.5_021.dat"
#d2 = datafolder . "/See_0.0100_00.5_027.dat"
d2 = datafolder . "/See_0.0203_01.0_026.dat"
d3 = datafolder . "/See_0.0402_02.0_016.dat"
d4 = datafolder . "/See_0.0621_03.0_018.dat"
d5 = datafolder . "/See_0.1032_04.9_015.dat"
d6 = datafolder . "/See_0.1685_07.8_024.dat"
d7 = datafolder . "/See_0.2217_10.0_014.dat"
d8 = datafolder . "/See_0.3496_15.9_023.dat"
d9 = datafolder . "/See_0.4921_19.8_025.dat"

# left Plot
set label 2 sLabelE
set ylabel axisLabelS
set ytics 200 format "%g"
set key on

plot [xmin:xmax] [0:ymax]\
    d1  u ($1):(abs($2)) title "0.010" w lp ls 9  lw 2 ps 1.5\
,   d2  u ($1):(abs($2)) title "0.020" w lp ls 8  lw 2 ps 1.5/1.2\
,   d3  u ($1):(abs($2)) title "0.040" w lp ls 7  lw 2 ps 1.5\
,   d4  u ($1):(abs($2)) title "0.062" w lp ls 6  lw 2 ps 1.5\
,   d5  u ($1):(abs($2)) title "0.10"  w lp ls 5  lw 2 ps 1.5\
,   d6  u ($1):(abs($2)) title "0.17"  w lp ls 4  lw 2 ps 1.5\
,   d7  u ($1):(abs($2)) title "0.22"  w lp ls 3  lw 2 ps 1.5/1.2\
,   d8  u ($1):(abs($2)) title "0.35"  w lp ls 2  lw 2 ps 1.5\
,   d9  u ($1):(abs($2)) title "0.49"  w lp ls 1  lw 2 ps 1.5
unset arrow 1; unset label 1; set label 3 ""

set key off
set label 2 sLabelF

set lmargin at screen 1.0-marR-plotX
set rmargin at screen 1.0-marR

# T-S-lin-norm
set ylabel axisLabelSnorm
set ytics 0.1 format "%.2f"

plot [xmin:xmax] [0.85:1.15] \
    d1  u ($1):(abs($2/(866.973))) title "0.010" w lp ls 9  lw 2 ps 1.5\
,   d2  u ($1):(abs($2/(669.230))) title "0.020" w lp ls 8  lw 2 ps 1.5/1.2\
,   d3  u ($1):(abs($2/(657.793))) title "0.040" w lp ls 7  lw 2 ps 1.5\
,   d4  u ($1):(abs($2/(525.592))) title "0.062" w lp ls 6  lw 2 ps 1.5\
,   d5  u ($1):(abs($2/(361.888))) title "0.10"  w lp ls 5  lw 2 ps 1.5\
,   d6  u ($1):(abs($2/(286.126))) title "0.17"  w lp ls 4  lw 2 ps 1.5\
,   d7  u ($1):(abs($2/(246.680))) title "0.22"  w lp ls 3  lw 2 ps 1.5/1.2\
,   d8  u ($1):(abs($2/(170.648))) title "0.35"  w lp ls 2  lw 2 ps 1.5\
,   d9  u ($1):(abs($2/(100.254))) title "0.49"  w lp ls 1  lw 2 ps 1.5

unset multiplot
unset output

# end ../data/p3_BF-DPB+F6-TCNNQ

#==> Start ../data/p4_BF-DPB+C60F36 : materialP4
set output "T-S-p4.gp" . term
set multiplot

datafolder = "../data/p4_BF-DPB+C60F36/byDoping"
material = materialP4
set label 3 material
set arrow 1 from first 45, graph .82 to first 45, graph 0.42 ls 70
set label 1 "{/URWClassico-Ita C}" at 45,graph .87 center font ",18" tc ls 71

set lmargin at screen marL
set rmargin at screen marL+plotX

#d1 = datafolder . "/See_0.0280_05.2_100.dat"
d1 = datafolder . "/See_0.0560_09.8_098.dat"
d2 = datafolder . "/See_0.0978_16.0_101.dat"
d3 = datafolder . "/See_0.1988_27.9_103.dat"

# left Plot
set label 2 sLabelG
set ylabel axisLabelS
set ytics 200 format "%g"
set key on

plot [xmin:xmax] [0:ymax]\
    d1 u ($1):(abs($2)) title "0.056" w lp ls 3  lw 2 ps 1.5/1.2\
,   d2 u ($1):(abs($2)) title "0.098" w lp ls 2  lw 2 ps 1.5\
,   d3 u ($1):(abs($2)) title "0.20"  w lp ls 1  lw 2 ps 1.5
unset arrow 1; unset label 1
set label 3 ""
set key off
set label 2 sLabelH

set lmargin at screen 1.0-marR-plotX
set rmargin at screen 1.0-marR

# T-S-lin-norm
set ylabel axisLabelSnorm
set ytics 0.1 format "%.2f"

plot [xmin:xmax] [0.50:1.15] \
    d1 u ($1):(abs($2/(770.071))) title "0.056" w lp ls 3  lw 2 ps 1.5/1.2\
,   d2 u ($1):(abs($2/(685.281))) title "0.098" w lp ls 2  lw 2 ps 1.5\
,   d3 u ($1):(abs($2/(563.895))) title "0.20"  w lp ls 1  lw 2 ps 1.2

unset multiplot
unset output

# end ../data/p4_BF-DPB+C60F36

load "footer.gp"
