#!/usr/bin/gnuplot

term="eps"
color="sw"
color="color"

load "00header.gp"
load "0goldenerSchnitt.gp"

set style data lp

set key l t at first 90, first 20 samplen .75
set key width -5 height 0.0 font ",18"

set ylabel "Normalized {/Symbol-Oblique s}"
#set ytics 4
set xlabel axisLabelTinC
set xrange [20:125]
set yrange [0:25]
set mytics 5
set mxtics 4

dir="../data/einzelne/p-killing/gut/"
set output "killing-MeO" . ".gp" . term
plot \
  dir."MeO+F36_0.0226_05.0_086.dat" u 3:($5/9.9792e-006) t "MeO_^-TPD_^_^_^ :_^_^_^ C_{60}F_{36} (0.023_ MR)" ls 2 lw 1.5 ps 1.5 pt 11\
, dir."MeO+F6_0.0397_02.3_012.dat"  u 3:($5/6.4674e-005) t "MeO_^-TPD_^_^_^ :_^_^_^ F_6_^-TCNNQ (0.040_ MR)"  ls 1 lw 1.5 ps 1.5  \
, dir."BF+F6_0.1032_04.9_015.dat"   u 3:($5/2.5870e-005) t "BF_^-DPB_^_^_^ :_^_^_^ F_6_^-TCNNQ (0.100_ MR)"   ls 3 lw 1.5 ps 1.5/1.2
unset output

load "footer.gp"
