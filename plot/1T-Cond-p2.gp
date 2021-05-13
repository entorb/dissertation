d1 = datafolder . "/Cond_0.4997_53.6_093.dat"
f1(x) = a1 + b1 * x
fit f1(x) d1 using (1000./($1+c0C)):(log($2)) via a1, b1
d2 = datafolder . "/Cond_0.2013_31.7_092.dat"
f2(x) = a2 + b2 * x
fit f2(x) d2 using (1000./($1+c0C)):(log($2)) via a2, b2
d3 = datafolder . "/Cond_0.0828_16.0_087.dat"
f3(x) = a3 + b3 * x
fit f3(x) d3 using (1000./($1+c0C)):(log($2)) via a3, b3
d4 = datafolder . "/Cond_0.0375_08.0_094.dat"
f4(x) = a4 + b4 * x
fit f4(x) d4 using (1000./($1+c0C)):(log($2)) via a4, b4
d5 = datafolder . "/Cond_0.0179_04.0_095.dat"
f5(x) = a5 + b5 * x
fit f5(x) d5 using (1000./($1+c0C)):(log($2)) via a5, b5
d6 = datafolder . "/Cond_0.0089_02.0_090.dat"
f6(x) = a6 + b6 * x
fit f6(x) d6 using (1000./($1+c0C)):(log($2)) via a6, b6
d7 = datafolder . "/Cond_0.0060_01.4_097.dat"
f7(x) = a7 + b7 * x
fit f7(x) d7 using (1000./($1+c0C)):(log($2)) via a7, b7
d8 = datafolder . "/Cond_0.0049_01.1_088.dat"
f8(x) = a8 + b8 * x
fit f8(x) d8 using (1000./($1+c0C)):(log($2)) via a8, b8
d9 = datafolder . "/Cond_0.0022_00.5_089.dat"
f9(x) = a9 + b9 * x
fit f9(x) d9 using (1000./($1+c0C)):(log($2)) via a9, b9

left = 1000./(xmax+c0C) ; right = 1000./(xmin+c0C)
plot [left:right] [:] [left:right] \
 d1 u (1000./($1+c0C)):($2) title "0.50"   with points ls 1 lw 2 ps 1.5, exp(f1(x)) notitle with lines ls 50 \
,d2 u (1000./($1+c0C)):($2) title "0.20"   with points ls 2 lw 2 ps 1.5, exp(f2(x)) notitle with lines ls 50 \
,d3 u (1000./($1+c0C)):($2) title "0.083"  with points ls 3 lw 2 ps 1.5/1.2, exp(f3(x)) notitle with lines ls 50 \
,d4 u (1000./($1+c0C)):($2) title "0.037"  with points ls 4 lw 2 ps 1.5, exp(f4(x)) notitle with lines ls 50 \
,d5 u (1000./($1+c0C)):($2) title "0.018"  with points ls 5 lw 2 ps 1.5, exp(f5(x)) notitle with lines ls 50 \
,d6 u (1000./($1+c0C)):($2) title "0.0089" with points ls 6 lw 2 ps 1.5, exp(f6(x)) notitle with lines ls 50 \
,d7 u (1000./($1+c0C)):($2) title "0.0060" with points ls 7 lw 2 ps 1.5, exp(f7(x)) notitle with lines ls 50 \
,d8 u (1000./($1+c0C)):($2) title "0.0049" with points ls 8 lw 2 ps 1.5/1.2, exp(f8(x)) notitle with lines ls 50 \
,d9 u (1000./($1+c0C)):($2) title "0.0022" with points ls 9 lw 2 ps 1.5, exp(f9(x)) notitle with lines ls 50 \
, dLeak u (1000./($3+c0C)):(ItoCond($2)) t "leakage" w l ls 20