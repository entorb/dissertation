#!/usr/bin/gnuplot
# todo überarbeiten via set tmargin at screen etc, siehe 0T-Cond-n3+n4.gp

term = "eps"
color="sw"
color="color"

load "00header.gp"

set output "T-S-n-AS.gp" . term
set terminal postscript enhanced size 14.85cm,12cm

set xtics mirror
set key font ",18" spacing 0.8  outside right top width -1 title "{/URWClassico-Ita C} (MR)"

xmin = 28

plotbreite=0.32
plothoehe=0.4
marT=1.0-0.02
marB=0.1
marL=0.11
marR=1.0-0.02
marL2=marR-plotbreite
spacingKey=0.02
spacingKeyYoffset=0.05

set multiplot layout 2,2 rowsfirst

#==> Start AOB

datafolder = "../data/n2_C60+AOB/byDoping"
material = materialN2
d1 = datafolder . "/See_0.0067_00.3_046.dat"
d2 = datafolder . "/See_0.0144_00.5_048.dat"
d3 = datafolder . "/See_0.0264_01.0_044.dat"
d4 = datafolder . "/See_0.0546_02.0_043.dat"
d5 = datafolder . "/See_0.1103_03.9_047.dat"
d6 = datafolder . "/See_0.1419_05.0_041.dat"
d7 = datafolder . "/See_0.2392_08.0_042.dat"
d8 = datafolder . "/See_0.3700_12.0_050.dat"
d9 = datafolder . "/See_0.5099_15.8_049.dat"

set label 2 sLabelA . " ".material at graph 0.05, graph 0.92
set obj 3 rect at graph 0.30, graph 0.92 size char 11, char 1.2
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder  back # front behind
#set label 3 material at graph 0.5, graph 0.92 center font ",18" front

set lmargin at screen marL
set tmargin at screen marT
set bmargin at screen (marT-plothoehe)
set rmargin at screen (marL+plotbreite)
set key at screen (marL+plotbreite+spacingKey) , marT-spacingKeyYoffset left
#set key title "Cr_2(hpp)_4\n^ Doping(MR)^ "
#set key title "Doping(MR)"

#set lmargin ; set rmargin ; set bmargin; set tmargin
#set key at marL+plotbreite+spacingKey, marT
unset xlabel

xmax=102; set xtics 20

ymax=700
set ytics (\
    "0" 0 \
,  "-100" 100 \
,  "-200" 200 \
,  "-300" 300 \
,  "-400" 400 \
,  "-500" 500 \
,  "-600" 600 \
,  "-700" 700 \
,  "-800" 800 \
)

# T-S-lin
set arrow 1 from first 95, graph .88 to first 95, graph 0.20 ls 70
set label 1 "{/URWClassico-Ita C}" at 95,graph .93 center font ",18" tc ls 71
set ylabel axisLabelS offset 0.75,0

plot [xmin:xmax] [0:ymax]\
    d1 u ($1):(abs($2)) title "0.0067" w lp ls 9 lw 2 ps 1.5\
,   d2 u ($1):(abs($2)) title "0.014"  w lp ls 8 lw 2 ps 1.5\
,   d3 u ($1):(abs($2)) title "0.026"  w lp ls 7 lw 2 ps 1.5/1.2\
,   d4 u ($1):(abs($2)) title "0.055"  w lp ls 6 lw 2 ps 1.5\
,   d5 u ($1):(abs($2)) title "0.11"   w lp ls 5 lw 2 ps 1.5\
,   d6 u ($1):(abs($2)) title "0.14"   w lp ls 4 lw 2 ps 1.5\
,   d7 u ($1):(abs($2)) title "0.24"   w lp ls 3 lw 2 ps 1.5\
,   d8 u ($1):(abs($2)) title "0.37"   w lp ls 2 lw 2 ps 1.5/1.2\
,   d9 u ($1):(abs($2)) title "0.51"   w lp ls 1 lw 2 ps 1.5
unset arrow 1;
unset label 1

set label 2 sLabelB . " " . material
set tmargin at screen marT
set bmargin at screen marT-plothoehe
set lmargin at screen marL2
set rmargin at screen marL2+plotbreite

set key off
set ylabel axisLabelSnorm offset 1,0
set ytics 0.1 format "%.1f"

plot [xmin:xmax] [*:*] \
    d1 u ($1):(abs($2/(-556.018))) title "0.0067" w lp ls 9 lw 2 ps 1.5\
,   d2 u ($1):(abs($2/(-492.412))) title "0.014"  w lp ls 8 lw 2 ps 1.5/1.2\
,   d3 u ($1):(abs($2/(-448.628))) title "0.026"  w lp ls 6 lw 2 ps 1.5\
,   d4 u ($1):(abs($2/(-436.148))) title "0.055"  w lp ls 6 lw 2 ps 1.5\
,   d5 u ($1):(abs($2/(-483.887))) title "0.11"   w lp ls 5 lw 2 ps 1.5\
,   d6 u ($1):(abs($2/(-378.941))) title "0.14"   w lp ls 4 lw 2 ps 1.5\
,   d7 u ($1):(abs($2/(-262.560))) title "0.24"   w lp ls 3 lw 2 ps 1.5/1.2\
,   d8 u ($1):(abs($2/(-201.081))) title "0.37"   w lp ls 2 lw 2 ps 1.5\
,   d9 u ($1):(abs($2/(-186.742))) title "0.51"   w lp ls 1 lw 2 ps 1.5

#==> Start DMBI-POH
set xlabel axisLabelTminC

datafolder = "../data/n1_C60+OH-DMBI/byDoping"
material = materialN1
d1 = datafolder . "/See_0.0133_00.4_036.dat"
d2 = datafolder . "/See_0.0271_00.9_033.dat"
d3 = datafolder . "/See_0.0550_01.8_032.dat"
d4 = datafolder . "/See_0.1085_03.5_034.dat"
d5 = datafolder . "/See_0.1699_05.4_040.dat"
d6 = datafolder . "/See_0.2363_07.3_037.dat"
d7 = datafolder . "/See_0.3568_10.6_035.dat"
d8 = datafolder . "/See_0.6533_17.9_038.dat"

set label 2 sLabelC . " " . material at graph 0.05, graph 0.92
set obj 3 rect at graph 0.43, graph 0.92 size char 16, char 1.2
#set obj 3 fc rgb "white" fillstyle solid 1.0 noborder  back # front behind
set lmargin at screen marL
set bmargin at screen marB
set tmargin at screen marB+plothoehe
set rmargin at screen marL+plotbreite
set key at screen (marL+plotbreite+spacingKey) , marB+plothoehe-spacingKeyYoffset left

ymax=700
set ytics (\
    "0" 0 \
,  "-100" 100 \
,  "-200" 200 \
,  "-300" 300 \
,  "-400" 400 \
,  "-500" 500 \
,  "-600" 600 \
,  "-700" 700 \
,  "-800" 800 \
)

set arrow 1 from first 95, graph .75 to first 95, graph 0.05 ls 70
set label 1 "{/URWClassico-Ita C}" at 95,graph .80 center font ",18" tc ls 71
set ylabel axisLabelS offset 0.75,0

plot [xmin:xmax] [0:ymax]\
    d1 u ($1):(abs($2)) title "0.013 " w lp ls 8 lw 2 ps 1.5/1.2\
,   d2 u ($1):(abs($2)) title "0.027" w lp ls 7 lw 2 ps 1.5\
,   d3 u ($1):(abs($2)) title "0.055" w lp ls 6 lw 2 ps 1.5\
,   d4 u ($1):(abs($2)) title "0.11"  w lp ls 5 lw 2 ps 1.5\
,   d5 u ($1):(abs($2)) title "0.17"  w lp ls 4 lw 2 ps 1.5\
,   d6 u ($1):(abs($2)) title "0.24"  w lp ls 3 lw 2 ps 1.5/1.2\
,   d7 u ($1):(abs($2)) title "0.36"  w lp ls 2 lw 2 ps 1.5\
,   d8 u ($1):(abs($2)) title "0.65"  w lp ls 1 lw 2 ps 1.5
unset arrow 1;
unset label 1

set label 2 sLabelD . " ".material # T-S-lin-norm
set tmargin at screen marB+plothoehe
set bmargin at screen marB
set lmargin at screen marL2
set rmargin at screen marL2+plotbreite

set key off
set ylabel axisLabelSnorm offset 1,0
set ytics 0.1 format "%.1f"

plot [xmin:xmax] [*:*] \
    d1 u ($1):(abs($2/(-468.130))) title "0.013 " w lp ls 8 lw 2 ps 1.5/1.2\
,   d2 u ($1):(abs($2/(-422.902))) title "0.027" w lp ls 7 lw 2 ps 1.5\
,   d3 u ($1):(abs($2/(-341.188))) title "0.055" w lp ls 6 lw 2 ps 1.5\
,   d4 u ($1):(abs($2/(-202.678))) title "0.11"  w lp ls 5 lw 2 ps 1.5\
,   d5 u ($1):(abs($2/(-197.663))) title "0.17"  w lp ls 4 lw 2 ps 1.5\
,   d6 u ($1):(abs($2/(-169.596))) title "0.24"  w lp ls 3 lw 2 ps 1.5/1.2\
,   d7 u ($1):(abs($2/(-123.613))) title "0.36"  w lp ls 2 lw 2 ps 1.5\
,   d8 u ($1):(abs($2/(-160.712))) title "0.65"  w lp ls 1 lw 2 ps 1.5

unset multiplot
unset output

load "footer.gp"

