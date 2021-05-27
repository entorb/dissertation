#!/usr/bin/gnuplot
# todo überarbeiten via set tmargin at screen etc, siehe 0T-Cond-n3+n4.gp

term = "eps"
color="sw"
color="color"

load "00header.gp"

set output "T-S-n-Pd.gp" . term
set terminal postscript enhanced size 14.85cm,12cm

set xtics mirror
set key font ",18" spacing 0.8  outside right top width -1 title "{/URWClassico-Ita C} (MR)"

xmin = 28

plotbreite=0.31
plothoehe=0.4
marT=1.0-0.02
marB=0.1
marL=0.11
marR=1.0-0.01
marL2=marR-plotbreite
spacingKey=0.025
spacingKeyYoffset=0.05

set multiplot layout 2,2 rowsfirst

#==> Start Cr2hpp4

datafolder = "../data/n4_C60+Cr2hpp4/byDoping"
material = materialN4
d1 = datafolder . "/See_0.0020_00.2_070.dat"
d2 = datafolder . "/See_0.0033_00.3_072.dat"
d3 = datafolder . "/See_0.0041_00.4_071.dat"
d4 = datafolder . "/See_0.0054_00.5_069.dat"
d5 = datafolder . "/See_0.0115_01.0_068.dat"
d6 = datafolder . "/See_0.0225_02.0_067.dat"
d7 = datafolder . "/See_0.0454_04.0_066.dat"
d8 = datafolder . "/See_0.0966_08.1_074.dat"
d9 = datafolder . "/See_0.1494_12.0_077.dat"
d10 = datafolder . "/See_0.2082_15.9_075.dat"
d11 = datafolder . "/See_0.3453_23.9_078.dat"

set label 2 sLabelA . " ".material at graph 0.05, graph 0.92
#set label 3 material at graph 0.5, graph 0.92 center font ",18" front
set obj 3 rect at graph 0.37, graph 0.92 size char 14, char 1.2
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder back  #back behind front

set lmargin at screen marL
set tmargin at screen marT
set bmargin at screen (marT-plothoehe)
set rmargin at screen (marL+plotbreite)
set key at screen (marL+plotbreite+spacingKey) , marT-spacingKeyYoffset left

#set lmargin ; set rmargin ; set bmargin; set tmargin
#set key at marL+plotbreite+spacingKey, marT
unset xlabel

xmax=72; set xtics 10

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
set arrow 1 from first 65, graph .88 to first 65, graph 0.05 ls 70
set label 1 "{/URWClassico-Ita C}" at 65,graph .93 center font ",18" tc ls 71
set ylabel axisLabelS offset 0.75,0

plot [xmin:xmax] [0:ymax]\
    d1 u ($1):(abs($2))  title "0.0020" w lp ls 11 lw 2 ps 1.5\
,   d2 u ($1):(abs($2))  title "0.0033" w lp ls 10 lw 2 ps 1.5\
,   d3 u ($1):(abs($2))  title "0.0041" w lp ls 9  lw 2 ps 1.5\
,   d4 u ($1):(abs($2))  title "0.0054" w lp ls 8  lw 2 ps 1.5/1.2\
,   d5 u ($1):(abs($2))  title "0.011"  w lp ls 7  lw 2 ps 1.5\
,   d6 u ($1):(abs($2))  title "0.022"  w lp ls 6  lw 2 ps 1.5\
,   d7 u ($1):(abs($2))  title "0.045"  w lp ls 5  lw 2 ps 1.5\
,   d8 u ($1):(abs($2))  title "0.097"  w lp ls 4  lw 2 ps 1.5\
,   d9 u ($1):(abs($2))  title "0.15"   w lp ls 3  lw 2 ps 1.5/1.2\
,   d10 u ($1):(abs($2)) title "0.21"   w lp ls 2  lw 2 ps 1.5\
,   d11 u ($1):(abs($2)) title "0.35"   w lp ls 1  lw 2 ps 1.5
unset arrow 1; unset label 1

set label 2 sLabelB . " " . material
set tmargin at screen marT
set bmargin at screen marT-plothoehe
set lmargin at screen marL2
set rmargin at screen marL2+plotbreite

set key off
set ylabel axisLabelSnorm offset 1,0
set ytics 0.05 format "%.2f"

plot [xmin:xmax] [*:*] \
    d1  u ($1):(abs($2/(-584.645))) title "0.0020" w lp ls 11 lw 2 ps 1.5\
,   d2  u ($1):(abs($2/(-312.499))) title "0.0033" w lp ls 10 lw 2 ps 1.5\
,   d3  u ($1):(abs($2/(-314.384))) title "0.0041" w lp ls 9  lw 2 ps 1.5\
,   d4  u ($1):(abs($2/(-273.042))) title "0.0054" w lp ls 8  lw 2 ps 1.5/1.2\
,   d5  u ($1):(abs($2/(-294.198))) title "0.011"  w lp ls 7  lw 2 ps 1.5\
,   d6  u ($1):(abs($2/(-283.241))) title "0.022"  w lp ls 6  lw 2 ps 1.5\
,   d7  u ($1):(abs($2/(-179.423))) title "0.045"  w lp ls 5  lw 2 ps 1.5\
,   d8  u ($1):(abs($2/(-177.578))) title "0.097"  w lp ls 4  lw 2 ps 1.5\
,   d9  u ($1):(abs($2/(-151.617))) title "0.15"   w lp ls 3  lw 2 ps 1.5/1.2\
,   d10 u ($1):(abs($2/(-130.852))) title "0.21"   w lp ls 2  lw 2 ps 1.5\
,   d11 u ($1):(abs($2/(-127.277))) title "0.35"   w lp ls 1  lw 2 ps 1.5

#==> Start W2hpp4
set xlabel axisLabelTminC

datafolder = "../data/n3_C60+W2hpp4/byDoping"
d1 = datafolder . "/See_0.0040_00.5_058.dat"
d2 = datafolder . "/See_0.0079_01.0_057.dat"
d3 = datafolder . "/See_0.0080_01.0_056.dat"
d4 = datafolder . "/See_0.0161_02.0_054.dat"
d5 = datafolder . "/See_0.0326_04.0_063.dat"
d6 = datafolder . "/See_0.0331_04.1_061.dat"
d7 = datafolder . "/See_0.0692_08.1_055.dat"
d8 = datafolder . "/See_0.1474_15.9_059.dat"
d9 = datafolder . "/See_0.2485_24.1_062.dat"
d10 = datafolder . "/See_0.3720_32.2_060.dat"
material = materialN3

set label 2 sLabelC . " " . material
set lmargin at screen marL
set bmargin at screen marB
set tmargin at screen marB+plothoehe
set rmargin at screen marL+plotbreite
set key at screen (marL+plotbreite+spacingKey) , marB+plothoehe-spacingKeyYoffset left
xmax=72; set xtics 10

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

set arrow 1 from first 65, graph .88 to first 65, graph 0.05 ls 70
set label 1 "{/URWClassico-Ita C}" at 65,graph .93 center font ",18" tc ls 71
set ylabel axisLabelS offset 0.75,0

plot [xmin:xmax] [0:ymax]\
    d1  u ($1):(abs($2)) title "0.0040" w lp ls 10 lw 2 ps 1.5\
,   d2  u ($1):(abs($2)) title "0.0079" w lp ls 9  lw 2 ps 1.5\
,   d3  u ($1):(abs($2)) title "0.0080" w lp ls 8  lw 2 ps 1.5/1.2\
,   d4  u ($1):(abs($2)) title "0.016"  w lp ls 7  lw 2 ps 1.5\
,   d5  u ($1):(abs($2)) title "0.033"  w lp ls 6  lw 2 ps 1.5\
,   d6  u ($1):(abs($2)) title "0.033"  w lp ls 5  lw 2 ps 1.5\
,   d7  u ($1):(abs($2)) title "0.069"  w lp ls 4  lw 2 ps 1.5\
,   d8  u ($1):(abs($2)) title "0.15"   w lp ls 3  lw 2 ps 1.5/1.2\
,   d9  u ($1):(abs($2)) title "0.25"   w lp ls 2  lw 2 ps 1.5\
,   d10 u ($1):(abs($2)) title "0.37"   w lp ls 1  lw 2 ps 1.5
unset arrow 1; unset label 1

set label 2 sLabelD . " " . material
set tmargin at screen marB+plothoehe
set bmargin at screen marB
set lmargin at screen marL2
set rmargin at screen marL2+plotbreite

set key off
set ylabel axisLabelSnorm offset 1,0
set ytics 0.05 format "%.2f"

plot [xmin:xmax] [*:*] \
    d1 u ($1):(abs($2/(-533.352))) title "0.0040" w lp ls 10 lw 2 ps 1.5\
,   d2 u ($1):(abs($2/(-409.216))) title "0.0079" w lp ls 9  lw 2 ps 1.5\
,   d3 u ($1):(abs($2/(-337.099))) title "0.0080" w lp ls 8  lw 2 ps 1.5/1.2\
,   d4 u ($1):(abs($2/(-370.617))) title "0.016"  w lp ls 7  lw 2 ps 1.5\
,   d5 u ($1):(abs($2/(-192.574))) title "0.033"  w lp ls 6  lw 2 ps 1.5\
,   d6 u ($1):(abs($2/(-215.582))) title "0.033"  w lp ls 5  lw 2 ps 1.5\
,   d7 u ($1):(abs($2/(-154.624))) title "0.069"  w lp ls 4  lw 2 ps 1.5\
,   d8 u ($1):(abs($2/(-134.209))) title "0.15"   w lp ls 3  lw 2 ps 1.5/1.2\
,   d9 u ($1):(abs($2/(-118.479))) title "0.25"   w lp ls 2  lw 2 ps 1.5\
,   d10 u ($1):(abs($2/(-92.733))) title "0.37"   w lp ls 1  lw 2 ps 1.5

# end ../data/n3_C60+W2hpp4

unset multiplot
unset output

# end ../data/n4_C60+Cr2hpp4

load "footer.gp"

