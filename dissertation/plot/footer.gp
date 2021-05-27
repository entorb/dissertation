#!/usr/bin/gnuplot
# if (term eq "eps") s = "perl convertEPS.pl --nopdf --noeps --png --dpi 200 --nopngtrans --notrim"." " ; system (s)
if (term eq "eps") s = "perl convertEPS.pl --pdf --noeps --nopng --dpi 150 --nopngtrans --trim"." " ; system (s)

system ("rm -f fit.log")

