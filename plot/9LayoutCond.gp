set logscale y ; set format y "%.1e"
set format y "10^{%L}"
set ytics add ("0.1" 0.1, "1" 1, "10" 10) # to prevent 10^0 und 10^1
set ylabel axisLabelCond offset 0.0,0.0

