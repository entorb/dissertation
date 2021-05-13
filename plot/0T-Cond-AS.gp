#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

load "00header.gp"

#set macros # Enable the use of macros

#load "00_vs_T-header.gp"
set xlabel axisLabelTrez
set xtics nomirror
set xtics 0.1 format "%.1f"
set x2label axisLabelTinC
xmin = 1000.0/3.4-c0C # T in C
set yrange[3E-3:10]

set key top font ",18" spacing 0.75 noopaque

load "9LayoutCond.gp"
set ylabel offset 2.5,1
set ytics format "%g"

set terminal postscript size 14.85cm,7cm

xmax = 1000.0/2.9-c0C
set x2tics ("30" 1000./(c0C+30) , "50" 1000./(c0C+50) , "70" 1000./(c0C+70))

#Arrow and MR
set arrow 1 from first 3, graph .12 to first 3,graph 0.75 front ls 70
set label 1 "{/URWClassico-Ita C}" at 3,graph .07 center font ",18" tc ls 71

marB=0.15
marT=1.0-marB
marL=0.08
marOffsetb=0.485 # distance between lmargin of plot a and lmargin of plot b
#marR=0.360
plotbreite=0.315
marKey=marL+plotbreite+0.000
set tmargin at screen marT; set bmargin at screen marB

#set arrow 9 from screen 0.5 , screen 0 rto 0 , screen 1 nohead

set output "T-Cond-n-AS.gp" . term
set multiplot layout 2,1 rowsfirst

# --- GRAPH a: AOB
material = materialN2
set lmargin at screen marL; set rmargin at screen marL+plotbreite

set key title "{/URWClassico-Ita C} (MR)" at screen marKey, marT left width -1.5
# ^ C_{60}:AOB^ \n

set label 2 sLabelA . " " . material at first 2.92,graph .075 left
set obj 3 rect at 3.035, graph .075 size char 10, char 1.4
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder back  #back behind front

xMR=(1000.0/(35+c0C))
set arrow 1 from first xMR, graph .12 to first xMR,graph 0.75
set label 1 at xMR,graph .07

datafolder = "../data/n2_C60+AOB/byDoping"
d1 = datafolder . "/Cond_0.5099_15.8_049.dat"
f1(x) = a1 + b1 * x
fit f1(x) d1 using (1000./($1+c0C)):(log($2)) via a1, b1
d2 = datafolder . "/Cond_0.3700_12.0_050.dat"
f2(x) = a2 + b2 * x
fit f2(x) d2 using (1000./($1+c0C)):(log($2)) via a2, b2
d3 = datafolder . "/Cond_0.2392_08.0_042.dat"
f3(x) = a3 + b3 * x
fit f3(x) d3 using (1000./($1+c0C)):(log($2)) via a3, b3
d4 = datafolder . "/Cond_0.1419_05.0_041.dat"
f4(x) = a4 + b4 * x
fit f4(x) d4 using (1000./($1+c0C)):(log($2)) via a4, b4
d5 = datafolder . "/Cond_0.1103_03.9_047.dat"
f5(x) = a5 + b5 * x
fit f5(x) d5 using (1000./($1+c0C)):(log($2)) via a5, b5
d6 = datafolder . "/Cond_0.0546_02.0_043.dat"
f6(x) = a6 + b6 * x
fit f6(x) d6 using (1000./($1+c0C)):(log($2)) via a6, b6
d7 = datafolder . "/Cond_0.0264_01.0_044.dat"
f7(x) = a7 + b7 * x
fit f7(x) d7 using (1000./($1+c0C)):(log($2)) via a7, b7
d8 = datafolder . "/Cond_0.0144_00.5_048.dat"
f8(x) = a8 + b8 * x
fit f8(x) d8 using (1000./($1+c0C)):(log($2)) via a8, b8
d9 = datafolder . "/Cond_0.0067_00.3_046.dat"
f9(x) = a9 + b9 * x
fit f9(x) d9 using (1000./($1+c0C)):(log($2)) via a9, b9

left = 1000./(xmax+c0C) ; right = 1000./(xmin+c0C)
plot [left:right] [:] [left:right] \
 d1 u (1000./($1+c0C)):($2) title "0.51"   with points ls 1 lw 2 ps 1.5, exp(f1(x)) notitle with lines ls 50\
,d2 u (1000./($1+c0C)):($2) title "0.37"   with points ls 2 lw 2 ps 1.5, exp(f2(x)) notitle with lines ls 50\
,d3 u (1000./($1+c0C)):($2) title "0.24"   with points ls 3 lw 2 ps 1.5/1.2, exp(f3(x)) notitle with lines ls 50\
,d4 u (1000./($1+c0C)):($2) title "0.14"   with points ls 4 lw 2 ps 1.5, exp(f4(x)) notitle with lines ls 50\
,d5 u (1000./($1+c0C)):($2) title "0.11"   with points ls 5 lw 2 ps 1.5, exp(f5(x)) notitle with lines ls 50\
,d6 u (1000./($1+c0C)):($2) title "0.055"  with points ls 6 lw 2 ps 1.5, exp(f6(x)) notitle with lines ls 50\
,d7 u (1000./($1+c0C)):($2) title "0.026"  with points ls 7 lw 2 ps 1.5, exp(f7(x)) notitle with lines ls 50\
,d8 u (1000./($1+c0C)):($2) title "0.014"  with points ls 8 lw 2 ps 1.5/1.2, exp(f8(x)) notitle with lines ls 50\
,d9 u (1000./($1+c0C)):($2) title "0.0067" with points ls 9 lw 2 ps 1.5, exp(f9(x)) notitle with lines ls 50\

# --- GRAPH b: DMBI-POH
material = materialN1
set lmargin at screen marOffsetb+marL; set rmargin at screen marOffsetb+marL+plotbreite
set key at screen marKey+marOffsetb, marT left

xMR=(1000.0/(32.5+c0C))
set arrow 1 from first xMR, graph .24 to first xMR , graph 0.98
set label 1 at first xMR,graph .2

datafolder = "../data/n1_C60+OH-DMBI/byDoping"
set key title "{/URWClassico-Ita C} (MR)" width 0
# C_{60} :\nDMBI_^-POH\n
set label 2 sLabelB . " " . material
set obj 3 rect at 3.1, graph .075 size char 15, char 1.4
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder back  #back
unset ylabel
d1 = datafolder . "/Cond_0.6533_17.9_038.dat"
f1(x) = a1 + b1 * x
fit f1(x) d1 using (1000./($1+c0C)):(log($2)) via a1, b1
d2 = datafolder . "/Cond_0.3568_10.6_035.dat"
f2(x) = a2 + b2 * x
fit f2(x) d2 using (1000./($1+c0C)):(log($2)) via a2, b2
d3 = datafolder . "/Cond_0.2363_07.3_037.dat"
f3(x) = a3 + b3 * x
fit f3(x) d3 using (1000./($1+c0C)):(log($2)) via a3, b3
d4 = datafolder . "/Cond_0.1699_05.4_040.dat"
f4(x) = a4 + b4 * x
fit f4(x) d4 using (1000./($1+c0C)):(log($2)) via a4, b4
d5 = datafolder . "/Cond_0.1085_03.5_034.dat"
f5(x) = a5 + b5 * x
fit f5(x) d5 using (1000./($1+c0C)):(log($2)) via a5, b5
d6 = datafolder . "/Cond_0.0550_01.8_032.dat"
f6(x) = a6 + b6 * x
fit f6(x) d6 using (1000./($1+c0C)):(log($2)) via a6, b6
d7 = datafolder . "/Cond_0.0271_00.9_033.dat"
f7(x) = a7 + b7 * x
fit f7(x) d7 using (1000./($1+c0C)):(log($2)) via a7, b7
d8 = datafolder . "/Cond_0.0133_00.4_036.dat"
f8(x) = a8 + b8 * x
fit f8(x) d8 using (1000./($1+c0C)):(log($2)) via a8, b8

left = 1000./(xmax+c0C) ; right = 1000./(xmin+c0C)
plot [left:right] [:] [left:right] \
 d1 u (1000./($1+c0C)):($2) title "0.65"   with points ls 1 lw 2 ps 1.5, exp(f1(x)) notitle with lines ls 50 \
,d2 u (1000./($1+c0C)):($2) title "0.36"   with points ls 2 lw 2 ps 1.5, exp(f2(x)) notitle with lines ls 50 \
,d3 u (1000./($1+c0C)):($2) title "0.24"   with points ls 3 lw 2 ps 1.5/1.2, exp(f3(x)) notitle with lines ls 50 \
,d4 u (1000./($1+c0C)):($2) title "0.17"   with points ls 4 lw 2 ps 1.5, exp(f4(x)) notitle with lines ls 50 \
,d5 u (1000./($1+c0C)):($2) title "0.11"   with points ls 5 lw 2 ps 1.5, exp(f5(x)) notitle with lines ls 50 \
,d6 u (1000./($1+c0C)):($2) title "0.055"  with points ls 6 lw 2 ps 1.5, exp(f6(x)) notitle with lines ls 50 \
,d7 u (1000./($1+c0C)):($2) title "0.027"  with points ls 7 lw 2 ps 1.5, exp(f7(x)) notitle with lines ls 50 \
,d8 u (1000./($1+c0C)):($2) title "0.013"  with points ls 8 lw 2 ps 1.5/1.2, exp(f8(x)) notitle with lines ls 50
xmax = 1000.0/2.9-c0C
set x2tics ("25" 1000./(c0C+25) , "30" 1000./(c0C+30) , "40" 1000./(c0C+40) , "50" 1000./(c0C+50) , "60" 1000./(c0C+60), "70" 1000./(c0C+70) )
set yrange[5E-3:10]

unset multiplot
unset output

load "footer.gp"
