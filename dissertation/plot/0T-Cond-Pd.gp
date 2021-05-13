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
set yrange[3E-2:10]

set key top font ",18" spacing 0.75 noopaque

load "9LayoutCond.gp"
set ylabel offset 1.5,0

set terminal postscript size 14.85cm,7cm

# set arrow 1 from first (1000/(35+c0C)), graph .12 to first (1000/(35+c0C)) , graph 0.95 front ls 70
# set label 1 "MR" at (1000/(35+c0C)),graph .075 center
xmax = 1000.0/2.9-c0C
set x2tics ("30" 1000./(c0C+30) , "50" 1000./(c0C+50) , "70" 1000./(c0C+70))

#Arrow and MR
xMR=(1000.0/(27.5+c0C))
set arrow 1 from first xMR, graph .08 to first xMR,graph 0.92 front ls 70
set label 1 "{/URWClassico-Ita C}" at xMR,graph .05 center font ",18" tc ls 71

marB=0.15
marT=1.0-marB
marL=0.08
marOffsetb=0.4875 # distance between lmargin of plot a and lmargin of plot b
#marR=0.360
plotbreite=0.32
marKey=marL+plotbreite+0.000
set tmargin at screen marT; set bmargin at screen marB

#set arrow 9 from screen 0.5 , screen 0 rto 0 , screen 1 nohead

set output "T-Cond-n-Pd.gp" . term
set multiplot layout 2,1 rowsfirst

# --- GRAPH a: Cr2hpp4
material = materialN4
set lmargin at screen marL; set rmargin at screen marL+plotbreite

set key title "{/URWClassico-Ita C} (MR)" at screen marKey, marT left width -1.7
# "C_{60}^ :\n^_ Cr_2(hpp)_4^_ \n^^^ {/URWClassico-Ita C} (MR)^^^ "
set label 2 sLabelA . " " . material at first 2.92,graph .075 left
set obj 3 rect at 3.07, graph .075 size char 13, char 1.4
set obj 3 fc rgb "white" fillstyle solid 1.0 noborder back  #back behind front

datafolder = "../data/n4_C60+Cr2hpp4/byDoping"
d1 = datafolder . "/Cond_0.3453_23.9_078.dat"
f1(x) = a1 + b1 * x
fit f1(x) d1 using (1000./($1+c0C)):(log($2)) via a1, b1
d2 = datafolder . "/Cond_0.2082_15.9_075.dat"
f2(x) = a2 + b2 * x
fit f2(x) d2 using (1000./($1+c0C)):(log($2)) via a2, b2
d3 = datafolder . "/Cond_0.1494_12.0_077.dat"
f3(x) = a3 + b3 * x
fit f3(x) d3 using (1000./($1+c0C)):(log($2)) via a3, b3
d4 = datafolder . "/Cond_0.0966_08.1_074.dat"
f4(x) = a4 + b4 * x
fit f4(x) d4 using (1000./($1+c0C)):(log($2)) via a4, b4
d5 = datafolder . "/Cond_0.0454_04.0_066.dat"
f5(x) = a5 + b5 * x
fit f5(x) d5 using (1000./($1+c0C)):(log($2)) via a5, b5
d6 = datafolder . "/Cond_0.0225_02.0_067.dat"
f6(x) = a6 + b6 * x
fit f6(x) d6 using (1000./($1+c0C)):(log($2)) via a6, b6
d7 = datafolder . "/Cond_0.0115_01.0_068.dat"
f7(x) = a7 + b7 * x
fit f7(x) d7 using (1000./($1+c0C)):(log($2)) via a7, b7
d8 = datafolder . "/Cond_0.0054_00.5_069.dat"
f8(x) = a8 + b8 * x
fit f8(x) d8 using (1000./($1+c0C)):(log($2)) via a8, b8
d9 = datafolder . "/Cond_0.0041_00.4_071.dat"
f9(x) = a9 + b9 * x
fit f9(x) d9 using (1000./($1+c0C)):(log($2)) via a9, b9
d10 = datafolder . "/Cond_0.0033_00.3_072.dat"
f10(x) = a10 + b10 * x
fit f10(x) d10 using (1000./($1+c0C)):(log($2)) via a10, b10
d11 = datafolder . "/Cond_0.0020_00.2_070.dat"
f11(x) = a11 + b11 * x
fit f11(x) d11 using (1000./($1+c0C)):(log($2)) via a11, b11

left = 1000./(xmax+c0C) ; right = 1000./(xmin+c0C)
plot [left:right] [:] [left:right] \
 d1  u (1000./($1+c0C)):($2) title "0.35"   with points ls 1 lw 2 ps 1.5, exp(f1(x))  notitle with lines ls 50 \
,d2  u (1000./($1+c0C)):($2) title "0.21"   with points ls 2 lw 2 ps 1.5, exp(f2(x))  notitle with lines ls 50 \
,d3  u (1000./($1+c0C)):($2) title "0.15"   with points ls 3 lw 2 ps 1.5/1.2, exp(f3(x)) notitle with lines ls 50 \
,d4  u (1000./($1+c0C)):($2) title "0.097"  with points ls 4 lw 2 ps 1.5, exp(f4(x))  notitle with lines ls 50 \
,d5  u (1000./($1+c0C)):($2) title "0.045"  with points ls 5 lw 2 ps 1.5, exp(f5(x))  notitle with lines ls 50 \
,d6  u (1000./($1+c0C)):($2) title "0.022"  with points ls 6 lw 2 ps 1.5, exp(f6(x))  notitle with lines ls 50 \
,d7  u (1000./($1+c0C)):($2) title "0.011"  with points ls 7 lw 2 ps 1.5, exp(f7(x))  notitle with lines ls 50 \
,d8  u (1000./($1+c0C)):($2) title "0.0054" with points ls 8 lw 2 ps 1.5/1.2, exp(f8(x)) notitle with lines ls 50\
,d9  u (1000./($1+c0C)):($2) title "0.0041" with points ls 9 lw 2 ps 1.5, exp(f9(x))  notitle with lines ls 50 \
,d10 u (1000./($1+c0C)):($2) title "0.0033" with points ls 10lw 2 ps 1.5, exp(f10(x)) notitle with lines ls 50 \
,d11 u (1000./($1+c0C)):($2) title "0.0020" with points ls 11lw 2 ps 1.5, exp(f11(x)) notitle with lines ls 50

# --- GRAPH b: W2hpp4
material = materialN3
set lmargin at screen marOffsetb+marL; set rmargin at screen marOffsetb+marL+plotbreite
set key title "{/URWClassico-Ita C} (MR)" at screen marKey+marOffsetb, marT left width -1.5
# "C_{60}^ :\n^_ W_2(hpp)_4^_ \n^^^ {/URWClassico-Ita C} (MR)^^^ "

datafolder = "../data/n3_C60+W2hpp4/byDoping"
set label 2 sLabelB . " ". material
unset ylabel
#set ytics format '' ; set ytics add ('' 1, '' 10)
d1 = datafolder . "/Cond_0.3720_32.2_060.dat"
f1(x) = a1 + b1 * x
fit f1(x) d1 using (1000./($1+c0C)):(log($2)) via a1, b1
d2 = datafolder . "/Cond_0.2485_24.1_062.dat"
f2(x) = a2 + b2 * x
fit f2(x) d2 using (1000./($1+c0C)):(log($2)) via a2, b2
d3 = datafolder . "/Cond_0.1474_15.9_059.dat"
f3(x) = a3 + b3 * x
fit f3(x) d3 using (1000./($1+c0C)):(log($2)) via a3, b3
d4 = datafolder . "/Cond_0.0692_08.1_055.dat"
f4(x) = a4 + b4 * x
fit f4(x) d4 using (1000./($1+c0C)):(log($2)) via a4, b4
d5 = datafolder . "/Cond_0.0331_04.1_061.dat"
f5(x) = a5 + b5 * x
fit f5(x) d5 using (1000./($1+c0C)):(log($2)) via a5, b5
d6 = datafolder . "/Cond_0.0326_04.0_063.dat"
f6(x) = a6 + b6 * x
fit f6(x) d6 using (1000./($1+c0C)):(log($2)) via a6, b6
d7 = datafolder . "/Cond_0.0161_02.0_054.dat"
f7(x) = a7 + b7 * x
fit f7(x) d7 using (1000./($1+c0C)):(log($2)) via a7, b7
d8 = datafolder . "/Cond_0.0080_01.0_056.dat"
f8(x) = a8 + b8 * x
fit f8(x) d8 using (1000./($1+c0C)):(log($2)) via a8, b8
d9 = datafolder . "/Cond_0.0079_01.0_057.dat"
f9(x) = a9 + b9 * x
fit f9(x) d9 using (1000./($1+c0C)):(log($2)) via a9, b9
d10 = datafolder . "/Cond_0.0040_00.5_058.dat"
f10(x) = a10 + b10 * x
fit f10(x) d10 using (1000./($1+c0C)):(log($2)) via a10, b10

left = 1000./(xmax+c0C) ; right = 1000./(xmin+c0C)
plot [left:right] [:] [left:right] \
 d1  u (1000./($1+c0C)):($2) title "0.37"   with points ls 1 lw 2 ps 1.5, exp(f1(x))  notitle with lines ls 50 \
,d2  u (1000./($1+c0C)):($2) title "0.25"   with points ls 2 lw 2 ps 1.5, exp(f2(x))  notitle with lines ls 50 \
,d3  u (1000./($1+c0C)):($2) title "0.15"   with points ls 3 lw 2 ps 1.5/1.2, exp(f3(x)) notitle with lines ls 50 \
,d4  u (1000./($1+c0C)):($2) title "0.069"  with points ls 4 lw 2 ps 1.5, exp(f4(x))  notitle with lines ls 50 \
,d5  u (1000./($1+c0C)):($2) title "0.033"  with points ls 5 lw 2 ps 1.5, exp(f5(x))  notitle with lines ls 50 \
,d6  u (1000./($1+c0C)):($2) title "0.033"  with points ls 6 lw 2 ps 1.5, exp(f6(x))  notitle with lines ls 50 \
,d7  u (1000./($1+c0C)):($2) title "0.016"  with points ls 7 lw 2 ps 1.5, exp(f7(x))  notitle with lines ls 50 \
,d8  u (1000./($1+c0C)):($2) title "0.0080" with points ls 8 lw 2 ps 1.5/1.2, exp(f8(x)) notitle with lines ls 50 \
,d9  u (1000./($1+c0C)):($2) title "0.0079" with points ls 9 lw 2 ps 1.5, exp(f9(x))  notitle with lines ls 50 \
,d10 u (1000./($1+c0C)):($2) title "0.0040" with points ls 10lw 2 ps 1.5, exp(f10(x)) notitle with lines ls 50
xmax = 1000.0/2.9-c0C
set x2tics ("25" 1000./(c0C+25) , "30" 1000./(c0C+30) , "40" 1000./(c0C+40) , "50" 1000./(c0C+50) , "60" 1000./(c0C+60), "70" 1000./(c0C+70) )
set yrange[5E-3:10]

unset multiplot
unset output

load "footer.gp"
