#!/usr/bin/gnuplot

term = "eps"
color="sw"
color="color"

color = "sw" # DEFAULT

load "00header.gp"
load "0goldenerSchnitt.gp"
load "00_vs_doping-header.gp"

set ylabel  "Density of Host Molecules {/URWClassico-Ita n}_H  (1/{/URWClassico-Ita n}_{Mol})" offset 2,0
set y2label "Density of Dopant Molecules {/URWClassico-Ita n}_D (1/{/URWClassico-Ita n}_{Mol})" offset 1,0

#set ytics format "%g"
set format y2 "10^{%L}"
#set ytics 1000
set ytics add ("½" 0.5 0)
set y2tics add ("1" 1 , "½" 0.5 , "0.1" 0.1)
set ytics  nomirror
set y2tics nomirror
set logscale y
set logscale y2

set key b r width 2 samplen 1

nH(x) = 1.0 / (1+x)
nD(x) = nH(x)*x

# set arrow 1 from first 0.23, first 0.8  rto graph -0.1, graph 0 ls 70 #ls 1 lw 2
# set arrow 2 from first 0.12, second 0.1 rto graph 0.1, graph 0 ls 70 #ls 1 lw 2
# set output "sim_H+D-vs-MR.gp".term
# plot [0.001:1] \
#   nH(x) t "{/URWClassico-Ita n}_H"\
# , nD(x) axes x1y2 t "{/URWClassico-Ita n}_D"
# unset output

set ylabel  "Relative Densities of Host {/URWClassico-Ita n}_H and\nDopant {/URWClassico-Ita n}_D Molecules (1/{/URWClassico-Ita n}_{Mol})" offset 0,0
unset y2label

set format y "10^{%L}"
set ytics add ("1" 1 , "½" 0.5 , "0.1" 0.1)

# set label 1 at graph 0.5, graph 0.2 center front font ",18" "{/URWClassico-Ita n}_{Mol}={/URWClassico-Ita n}_{H}+{/URWClassico-Ita n}_{D}"
set key title "{/URWClassico-Ita n}_{Mol}^ ={/URWClassico-Ita n}_{H}+{/URWClassico-Ita n}_{D}"
# set key t l at 0.1,1E-2
set key l t at graph 2.0/3, first 0.01
set key noopaque width 0

# unset arrow 1 ; unset arrow 2
set ytics mirror
unset y2tics
set output "sim_H+D-vs-MR.gp".term
plot [0.001:1] [1E-3:1] \
  nH(x) t "{/URWClassico-Ita n}_H"\
, nD(x) t "{/URWClassico-Ita n}_D"
unset output

load "footer.gp"
