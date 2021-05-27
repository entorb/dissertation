

d1 = datafolder . "/Cond_0.1988_27.9_103.dat"
f1(x) = a1 + b1 * x
fit f1(x) d1 using (1000./($1+c0C)):(log($2)) via a1, b1
d2 = datafolder . "/Cond_0.0978_16.0_101.dat"
f2(x) = a2 + b2 * x
fit f2(x) d2 using (1000./($1+c0C)):(log($2)) via a2, b2
d3 = datafolder . "/Cond_0.0560_09.8_098.dat"
f3(x) = a3 + b3 * x
fit f3(x) d3 using (1000./($1+c0C)):(log($2)) via a3, b3
d4 = datafolder . "/Cond_0.0280_05.2_100.dat"
f4(x) = a4 + b4 * x
fit f4(x) d4 using (1000./($1+c0C)):(log($2)) via a4, b4
d5 = datafolder . "/Cond_0.0220_04.1_102.dat"
f5(x) = a5 + b5 * x
fit f5(x) d5 using (1000./($1+c0C)):(log($2)) via a5, b5
d6 = datafolder . "/Cond_0.0105_02.0_099.dat"
f6(x) = a6 + b6 * x
fit f6(x) d6 using (1000./($1+c0C)):(log($2)) via a6, b6

left = 1000./(xmax+c0C) ; right = 1000./(xmin+c0C)
plot [left:right] [:] [left:right] \
 d1 u (1000./($1+c0C)):($2) title "0.20"  with points ls 1 lw 2 ps 1.5, exp(f1(x)) notitle with lines ls 50 \
,d2 u (1000./($1+c0C)):($2) title "0.098" with points ls 2 lw 2 ps 1.5, exp(f2(x)) notitle with lines ls 50 \
,d3 u (1000./($1+c0C)):($2) title "0.056" with points ls 3 lw 2 ps 1.5/1.2, exp(f3(x)) notitle with lines ls 50 \
,d4 u (1000./($1+c0C)):($2) title "0.028" with points ls 4 lw 2 ps 1.5, exp(f4(x)) notitle with lines ls 50 \
,d5 u (1000./($1+c0C)):($2) title "0.022" with points ls 5 lw 2 ps 1.5, exp(f5(x)) notitle with lines ls 50 \
,d6 u (1000./($1+c0C)):($2) title "0.011" with points ls 6 lw 2 ps 1.5, exp(f6(x)) notitle with lines ls 50 \
, dLeak u (1000./($3+c0C)):(ItoCond($2)) t "leakage" w l ls 20

# d4 u (1000./($1+c0C)):($2) title "0.028 " with points ls 4lw 2 ps 1.5, exp(f4(x)) notitle with lines ls 4 lw 2

