d1 = datafolder . "/Cond_0.4921_19.8_025.dat"
f1(x) = a1 + b1 * x
fit f1(x) d1 using (1000./($1+c0C)):(log($2)) via a1, b1
d2 = datafolder . "/Cond_0.3496_15.9_023.dat"
f2(x) = a2 + b2 * x
fit f2(x) d2 using (1000./($1+c0C)):(log($2)) via a2, b2
d3 = datafolder . "/Cond_0.2217_10.0_014.dat"
f3(x) = a3 + b3 * x
fit f3(x) d3 using (1000./($1+c0C)):(log($2)) via a3, b3
d4 = datafolder . "/Cond_0.1685_07.8_024.dat"
f4(x) = a4 + b4 * x
fit f4(x) d4 using (1000./($1+c0C)):(log($2)) via a4, b4
d5 = datafolder . "/Cond_0.1032_04.9_015.dat"
f5(x) = a5 + b5 * x
fit f5(x) d5 using (1000./($1+c0C)):(log($2)) via a5, b5
d6 = datafolder . "/Cond_0.0621_03.0_018.dat"
f6(x) = a6 + b6 * x
fit f6(x) d6 using (1000./($1+c0C)):(log($2)) via a6, b6
d7 = datafolder . "/Cond_0.0402_02.0_016.dat"
f7(x) = a7 + b7 * x
fit f7(x) d7 using (1000./($1+c0C)):(log($2)) via a7, b7
d8 = datafolder . "/Cond_0.0203_01.0_026.dat"
f8(x) = a8 + b8 * x
fit f8(x) d8 using (1000./($1+c0C)):(log($2)) via a8, b8
#d9 = datafolder . "/Cond_0.0100_00.5_027.dat"
#f9(x) = a9 + b9 * x
#fit f9(x) d9 using (1000./($1+c0C)):(log($2)) via a9, b9
d9 = datafolder . "/Cond_0.0100_00.5_021.dat"
f9(x) = a9 + b9 * x
fit f9(x) d9 using (1000./($1+c0C)):(log($2)) via a9, b9
# d10 = datafolder . "/Cond_0.0100_00.5_021.dat"
# f10(x) = a10 + b10 * x
# fit f10(x) d10 using (1000./($1+c0C)):(log($2)) via a10, b10

left = 1000./(xmax+c0C) ; right = 1000./(xmin+c0C)
plot [left:right] [:] [left:right] \
 d1 u (1000./($1+c0C)):($2)  title "0.49"   with points ls 1  lw 2 ps 1.5, exp(f1(x)) notitle with lines ls 50 \
,d2 u (1000./($1+c0C)):($2)  title "0.35"   with points ls 2  lw 2 ps 1.5, exp(f2(x)) notitle with lines ls 50 \
,d3 u (1000./($1+c0C)):($2)  title "0.22"   with points ls 3  lw 2 ps 1.5/1.2, exp(f3(x)) notitle with lines ls 50 \
,d4 u (1000./($1+c0C)):($2)  title "0.17"   with points ls 4  lw 2 ps 1.5, exp(f4(x)) notitle with lines ls 50 \
,d5 u (1000./($1+c0C)):($2)  title "0.10"   with points ls 5  lw 2 ps 1.5, exp(f5(x)) notitle with lines ls 50 \
,d6 u (1000./($1+c0C)):($2)  title "0.062"  with points ls 6  lw 2 ps 1.5, exp(f6(x)) notitle with lines ls 50 \
,d7 u (1000./($1+c0C)):($2)  title "0.040"  with points ls 7  lw 2 ps 1.5, exp(f7(x)) notitle with lines ls 50 \
,d8 u (1000./($1+c0C)):($2)  title "0.020"  with points ls 8  lw 2 ps 1.5/1.2, exp(f8(x)) notitle with lines ls 50 \
,d9 u (1000./($1+c0C)):($2)  title "0.010"  with points ls 9  lw 2 ps 1.5, exp(f9(x)) notitle with lines ls 50 \
, dLeak u (1000./($3+c0C)):(ItoCond($2)) t "leakage" w l ls 20

# ,d10 u (1000./($1+c0C)):($2) title "0.010 " with points ls 10 lw 2 ps 1.5, exp(f10(x)) notitle with lines ls 50