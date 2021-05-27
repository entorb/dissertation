#!/usr/bin/gnuplot
set size 1,1

# if (term eq "png") set terminal png enhanced giant size 1024,768
# pngcairo testen?

if (color eq "sw")    set terminal postscript monochrome
if (color eq "color") set terminal postscript color

#set terminal postscript eps enhanced dashed size 10cm,7cm fontfile add "aunl8a.pfa" fontfile add "aunlo8a.pfa" font "UniversCE-Light,22pt" # 10x7 # fontsize 14 = default
# {/UniversCE-LightOblique }

set terminal postscript eps enhanced clip dashed size 5cm,5cm fontfile add "uopr8a.pfa" fontfile add "uopri8a.pfa" fontfile add "uopb8a.pfa" font "URWClassico-Reg,22pt" # 10x7 # fontsize 14 = default

# UniversCE-Medium: fontfile add "aunr8a.pfa" fontfile add "aunro8a.pfa"
# UniversCE-Light:  fontfile add "aunl8a.pfa" fontfile add "aunlo8a.pfa"
# URWClassico-Reg: fontfile add "uopr8a.pfa"
# URWClassico-Ita: fontfile add "uopri8a.pfa"
# URWClassico-Bol: fontfile add "uopb8a.pfa"
# URWClassico-BolIta: fontfile add "uopbi8a.pfa"

# default for postscript  10 x 7 inches
# default for eps  5 x 3.5 inches
# monochrome dashed
# color solid

# Fonts
# Arial
# UniversCE
# UniversCE-Oblique
# UniversCE-Bold
# Symbol
# Symbol-Oblique

# .pfb font files in ~/texmf/...
# aunr8r  UniversCE-Medium
# aunro8r UniversCE-Oblique
# aunl8r  UniversCE-Light
# aunlo8r UniversCE-LightOblique
# aunb8r  UniversCE-Bold
# aunbo8r UniversCE-BoldOblique
# aubr8r  UniversCE-Black
# aubro8r UniversCE-BlackOblique
#
# Univers.ttf Univers 55, Regular

# Latex pagewidth is set to 15cm
# 10 x 7 -> 7.5cm x 5.25cm

set encoding utf8
set border back

set style data points
set style function lines
set style increment user

set lmargin 5.5
set rmargin 1.75 # reset by "set rmargin" without number
set tmargin 0.75
set bmargin 2.6

# grid
set style line 40 lt 1 lw 2 linecolor rgb "grey70"
set grid ls 40
# Fits
set style line 50 lt 0 lw 6 lc rgb "black"
set style line 51 lt 0 lw 6 lc rgb "black"
set style line 52 lt 0 lw 6 lc rgb "black"
set style line 53 lt 0 lw 6 lc rgb "black"
set style line 54 lt 0 lw 6 lc rgb "black"
set style line 55 lt 0 lw 6 lc rgb "black"
set style line 56 lt 0 lw 6 lc rgb "black"
set style line 57 lt 0 lw 6 lc rgb "black"
set style line 58 lt 0 lw 6 lc rgb "black"
set style line 59 lt 0 lw 6 lc rgb "black"
set style line 60 lt 0 lw 6 lc rgb "black"
set style line 61 lt 0 lw 6 lc rgb "black"
set style line 62 lt 0 lw 6 lc rgb "black"
set style line 63 lt 0 lw 6 lc rgb "black"
set style line 64 lt 0 lw 6 lc rgb "black"
set style line 65 lt 0 lw 6 lc rgb "black"
set style line 66 lt 0 lw 6 lc rgb "black"
set style line 67 lt 0 lw 6 lc rgb "black"
set style line 68 lt 0 lw 6 lc rgb "black"
set style line 69 lt 0 lw 6 lc rgb "black"

#arrows
set style line 70 lt -1 lw 2 linecolor rgb "grey40"
# text next to arrows ("C" in c vs T)
set style line 71 lt -1 lw 2 linecolor rgb "grey30"

# white title box to cover grid, NOT HERE!!! just copy paste
#set label 2 "(a)" at graph 0.5, graph 0.92 center front
#set obj 10 rect at graph 0.5, graph 0.92 size char 14, char 1.5
#set obj 10 fc rgb "white" fillstyle solid 1.0 border -1 front #back behind

set xlabel offset 0.0,0.5
set ylabel offset 0,0 #1.25,0.0
set x2label offset 0.0,-0.5
set y2label offset 0,0 #-1.25,0.0

#key
set key box height 0.1 width -0.5 reverse noinvert Left opaque samplen 0 font ",18"

set style increment user

if (color eq "sw") set style line  1 lt 1 # voll
if (color eq "sw") set style line  2 lt 5 # Strich-Punkt
if (color eq "sw") set style line  3 lt 2 # Striche1
if (color eq "sw") set style line  4 lt 8 # Strich-Punkt-Punkt
if (color eq "sw") set style line  5 lt 4 # Striche3
if (color eq "sw") set style line  6 lt 6 # Striche2-Punkt
if (color eq "sw") set style line  7 lt 3 # Striche2
if (color eq "sw") set style line  8 lt 1 # voll
if (color eq "sw") set style line  9 lt 5 # Strich-Punkt
if (color eq "sw") set style line 10 lt 2 # Striche1
if (color eq "sw") set style line 11 lt 8 # Strich-Punkt-Punkt
if (color eq "sw") set style line 12 lt 4 # Striche3
if (color eq "sw") set style line 13 lt 6 # Striche2-Punkt
if (color eq "sw") set style line 14 lt 3 # Striche2
if (color eq "sw") set style line 15 lt 1 # voll
if (color eq "sw") set style line 16 lt 5 # Strich-Punkt
if (color eq "sw") set style line 17 lt 2 # Striche1
if (color eq "sw") set style line 18 lt 8 # Strich-Punkt-Punkt
if (color eq "sw") set style line 19 lt 4 # Striche3
if (color eq "sw") set style line 20 lt 6 # Striche2-Punkt
# wie 1-5, nur mit vollen symbolen
if (color eq "sw") set style line 21 lt 1 # voll
if (color eq "sw") set style line 22 lt 5 # Strich-Punkt
if (color eq "sw") set style line 23 lt 2 # Striche1
if (color eq "sw") set style line 24 lt 8 # Strich-Punkt-Punkt
if (color eq "sw") set style line 25 lt 4 # Striche3
# p-doping: ls 1, 32, 3, 34
if (color eq "sw") set style line 32 lt 5 # Strich-Punkt
if (color eq "sw") set style line 34 lt 8 # Strich-Punkt-Punkt

if (color eq "color") set style line  1 lt 1 linecolor rgb "red"
if (color eq "color") set style line 51 lc rgb "red"
if (color eq "color") set style line  2 lt 1 linecolor rgb "blue"
if (color eq "color") set style line 52 lc rgb "blue"
if (color eq "color") set style line  3 lt 1 linecolor rgb "dark-magenta"
if (color eq "color") set style line 53 lc rgb "dark-magenta"
if (color eq "color") set style line  4 lt 1 linecolor rgb "dark-green"
if (color eq "color") set style line 54 lc rgb "dark-green"
if (color eq "color") set style line  5 lt 1 linecolor rgb "black"
if (color eq "color") set style line 55 lc rgb "black"
if (color eq "color") set style line  6 lt 1 linecolor rgb "brown"
if (color eq "color") set style line 56 lc rgb "brown"
if (color eq "color") set style line  7 lt 1 linecolor rgb "dark-red"
if (color eq "color") set style line 57 lc rgb "dark-red"
if (color eq "color") set style line  8 lt 1 linecolor rgb "dark-blue"
if (color eq "color") set style line 58 lc rgb "dark-blue"
if (color eq "color") set style line  9 lt 1 linecolor rgb "magenta"
if (color eq "color") set style line 59 lc rgb "magenta"
if (color eq "color") set style line 10 lt 1 linecolor rgb "green"
if (color eq "color") set style line 60 lc rgb "green"
if (color eq "color") set style line 11 lt 1 linecolor rgb "dark-orange"
if (color eq "color") set style line 61 lc rgb "dark-orange"
if (color eq "color") set style line 12 lt 1 linecolor rgb "blue"
if (color eq "color") set style line 62 lc rgb "blue"
if (color eq "color") set style line 13 lt 1 linecolor rgb "dark-magenta"
if (color eq "color") set style line 63 lc rgb "dark-magenta"
if (color eq "color") set style line 14 lt 1 linecolor rgb "dark-green"
if (color eq "color") set style line 64 lc rgb "dark-green"
if (color eq "color") set style line 15 lt 1 linecolor rgb "brown"
if (color eq "color") set style line 65 lc rgb "brown"
if (color eq "color") set style line 16 lt 1 linecolor rgb "dark-red"
if (color eq "color") set style line 66 lc rgb "dark-red"
if (color eq "color") set style line 17 lt 1 linecolor rgb "dark-blue"
if (color eq "color") set style line 67 lc rgb "dark-blue"
if (color eq "color") set style line 18 lt 1 linecolor rgb "magenta"
if (color eq "color") set style line 68 lc rgb "magenta"
if (color eq "color") set style line 19 lt 1 linecolor rgb "green"
if (color eq "color") set style line 69 lc rgb "green"
if (color eq "color") set style line 20 lt 1 linecolor rgb "dark-orange"
# arrow= 70 if (color eq "color") set style line 70 lc rgb "dark-orange"
# wie 1-5, nur mit vollen symbolen
if (color eq "color") set style line 21 lt 1 linecolor rgb "red"
if (color eq "color") set style line 22 lt 1 linecolor rgb "blue"
if (color eq "color") set style line 23 lt 1 linecolor rgb "dark-magenta"
if (color eq "color") set style line 24 lt 1 linecolor rgb "dark-green"
if (color eq "color") set style line 25 lt 1 linecolor rgb "black"
# p-doping: ls 1, 32, 3, 34
if (color eq "color") set style line 32 lt 1 linecolor rgb "blue"
if (color eq "color") set style line 34 lt 1 linecolor rgb "dark-green"

set style line  1 lw 4 ps 2.5 pointtype 10 #= dreieck unten
set style line  2 lw 4 ps 2.5 pointtype  8 #= dreieck oben
set style line  3 lw 4 ps 2.5/1.1 pointtype  4 #= quadrat gerade , muss kleiner skaliert werden
set style line  4 lw 4 ps 2.5*1.1 pointtype 12 #= quadrat gedreht, muss größer skaliert werden
set style line  5 lw 4 ps 2.5 pointtype  6 #= kreis
set style line  6 lw 4 ps 2.5 pointtype 11 #= dreieck unten voll
set style line  7 lw 4 ps 2.5 pointtype  9 #= dreieck oben voll
set style line  8 lw 4 ps 2.5/1.1 pointtype  5 #= quadrat gerade voll
set style line  9 lw 4 ps 2.5*1.1 pointtype 13 #= quadrat gedreht voll
set style line 10 lw 4 ps 2.5 pointtype  7 #= kreis voll
set style line 11 lw 4 ps 2.5 pointtype 10 #= dreieck unten
set style line 12 lw 4 ps 2.5 pointtype  8 #= dreieck oben
set style line 13 lw 4 ps 2.5/1.1 pointtype  4 #= quadrat gerade
set style line 14 lw 4 ps 2.5*1.1 pointtype 12 #= quadrat gedreht
set style line 15 lw 4 ps 2.5 pointtype  6 #= kreis
set style line 16 lw 4 ps 2.5 pointtype 11 #= dreieck unten voll
set style line 17 lw 4 ps 2.5 pointtype  9 #= dreieck oben voll
set style line 18 lw 4 ps 2.5/1.1 pointtype  5 #= quadrat gerade voll
set style line 19 lw 4 ps 2.5*1.1 pointtype 13 #= quadrat gedreht voll
set style line 20 lw 4 ps 2.5 pointtype  7 #= kreis voll

# wie 1-5, nur mit vollen symbolen
# volle Symbole (müssen noch größer skaliert werden, weil randline fehlt)
set style line 21 lw 4 ps 2.5*1.19 pointtype 11 #= dreieck unten voll
set style line 22 lw 4 ps 2.5*1.19 pointtype  9 #= dreieck oben voll
set style line 23 lw 4 ps 2.5/1.1*1.115 pointtype  5 #= quadrat gerade , muss kleiner skaliert werden voll
set style line 24 lw 4 ps 2.5*1.1*1.135 pointtype 13 #= quadrat gedreht, muss größer skaliert werden voll
set style line 25 lw 4 ps 2.5*1.11 pointtype 7 #= kreis voll

# wie 1-5, nur mit vollen symbolen, aber:
# p-doping: ls 1, 32, 3, 34 = 
# 1  dreieck oben
# 32 dreieck oben voll
# 3  quadrat gerade
# 34 quadrat gerade voll
set style line 32 lw 4 ps 2.5*1.19 pointtype 11 #= dreieck unten voll
set style line 34 lw 4 ps 2.5/1.1*1.115 pointtype 5  #= quadrat gerade , muss kleiner skaliert werden voll

# pointtype  8 #= dreieck oben
# pointtype  9 #= dreieck oben voll
# pointtype 10 #= dreieck unten
# pointtype 11 #= dreieck unten voll
# pointtype  4 #= quadrat gerade
# pointtype  5 #= quadrat gerade voll
# pointtype 12 #= quadrat gedreht
# pointtype 13 #= quadrat gedreht voll
# pointtype  6 #= kreis
# pointtype  7 #= kreis voll

# set style line 11 lt 1 #linecolor rgb "dark-cyan"
# set style line 12 lt 1 #linecolor rgb "magenta"
# set style line 13 lt 1 #linecolor rgb "cyan"
# set style line 14 lt 1 #linecolor rgb "dark-green"
# set style line 15 lt 1 #linecolor rgb "dark-orange"
# set style line 16 lt 1 #linecolor rgb "dark-red"
# set style line 17 lt 1 #linecolor rgb "green"
# set style line 18 lt 1 #linecolor rgb "dark-blue"
# set style line 19 lt 1 #linecolor rgb "brown"
# set style line 20 lt 1 #linecolor rgb "red"

# mark at MR=0.15
#set style line  30 lt 3 ps 1 lw 4 linecolor rgb "dark-green"
#set style line  31 lt 2 ps 1 lw 3 linecolor rgb "black"

#\cite{CODATA06}
ckb = 1.3806504e-23    # J/K
ce  = 1.602167487e-19  # Coulomb
cNa = 6.02214179e23    # 1/mol

# not used so far
cmu = 1.660538782e-27 # kg atomic mass constant

# sonst
c0C = 273.15          # Celsius
ckbeV = ckb/ce        # eV/K = = 0.000086173857

FIT_LIMIT = 1e-10 # wichtig fuer guten Fit!

fSeebeckEnergy(x,y,z) = 0.0 + \
  1000/ce * ckb* ( y +c0C) * ( \
  ce/ckb*(abs(x * 1E-6)) - z )
# x= S (uV/K) !!!
# y= T (C)
# z= A
# returns meV!

datafolderN1 = "n1_C60+OH-DMBI"
datafolderN1b = "n1b_C60+oMeO-DMBI"
datafolderN2 = "n2_C60+AOB"
datafolderN3 = "n3_C60+W2hpp4"
datafolderN4 = "n4_C60+Cr2hpp4"

dataN1 = "../data/" . datafolderN1 . "/Zusammenfassung.dat"
dataN1b = "../data/" . datafolderN1b . "/Zusammenfassung.dat"
dataN2 = "../data/" . datafolderN2 . "/Zusammenfassung.dat"
dataN3 = "../data/" . datafolderN3 . "/Zusammenfassung.dat"
dataN4 = "../data/" . datafolderN4 . "/Zusammenfassung.dat"

materialN1 = "C_{60}_^_^_^ :_^_^_^ DMBI_^-POH"
materialN1b = "C_{60}_^_^_^ :_^_^_^ o_^-MeO_^-DMBI_^-I"
materialN2 = "C_{60}_^_^_^ :_^_^_^ AOB"
materialN3 = "C_{60}_^_^_^ :_^_^_^ W_2(hpp)_4"
materialN4 = "C_{60}_^_^_^ :_^_^_^ Cr_2(hpp)_4"
materialP1 = "MeO_^-TPD_^_^_^ :_^_^_^ F_6_^-TCNNQ"
materialP2 = "MeO_^-TPD_^_^_^ :_^_^_^ C_{60}F_{36}"
materialP3 = "BF_^-DPB_^_^_^ :_^_^_^ F_6_^-TCNNQ"
materialP4 = "BF_^-DPB_^_^_^ :_^_^_^ C_{60}F_{36}"
materialP5 = "Pentacene_^_^_^ :_^_^_^ F_4_^-TCNQ"

datafolderP1 = "p1_MeO+F6-TCNNQ"
datafolderP2 = "p2_MeO+C60F36" # zwar als drittes gemessen, aber hier als 2. aufgeführt, weil toller
datafolderP3 = "p3_BF-DPB+F6-TCNNQ" # ls 2 für MeO+C60F36
datafolderP4 = "p4_BF-DPB+C60F36"
datafolderP5 = "p5_P5+F4-TCNQ"

dataP1 = "../data/" . datafolderP1 . "/Zusammenfassung.dat"
dataP2 = "../data/" . datafolderP2 . "/Zusammenfassung.dat"
dataP3 = "../data/" . datafolderP3 . "/Zusammenfassung.dat"
dataP4 = "../data/" . datafolderP4 . "/Zusammenfassung.dat"
dataP5 = "../data/" . datafolderP5 . "/Zusammenfassung.dat"

# /UniversCE-LightOblique -> /URWClassico-Ita
axisLabelMR    ="Doping Concentration {/URWClassico-Ita C} (MR)"
axisLabelE     ="Energy {/URWClassico-Ita E} (meV)"
axisLabelEs    ="Seebeck Energy {/URWClassico-Ita E}_S (meV)"
axisLabelEtr   ="Transport Level {/URWClassico-Ita E}_{Tr} (meV)"
axisLabelEf    ="Fermi Level {/URWClassico-Ita E}_F (meV)"
axisLabelEact ="Activation Energy {/URWClassico-Ita E}_{act,{/Symbol-Oblique s}} (meV)"
axisLabelS     ="Seebeck Coeff. {/URWClassico-Ita S} ({/Symbol m}V/K)"
axisLabelSnorm ="{/URWClassico-Ita S} normalized"
axisLabelCond ="Conductivity {/Symbol-Oblique s} (S/cm)"
axisLabelTinC = "Temperature {/URWClassico-Ita T} (°C)"
axisLabelTminC = "Temperature {/URWClassico-Ita T}_m (°C)"
axisLabelTrez = "1000/{/URWClassico-Ita T} (1/K)"

axisLabelLTConda ="Maximum Relative Change {/Symbol-Oblique c}"
axisLabelLTCondtau ="Time Constant {/Symbol-Oblique t} (h)"

sLabelA = "{/URWClassico-Bol (a)}"
sLabelB = "{/URWClassico-Bol (b)}"
sLabelC = "{/URWClassico-Bol (c)}"
sLabelD = "{/URWClassico-Bol (d)}"
sLabelE = "{/URWClassico-Bol (e)}"
sLabelF = "{/URWClassico-Bol (f)}"
sLabelG = "{/URWClassico-Bol (g)}"
sLabelH = "{/URWClassico-Bol (h)}"

widthKeyAS=-0.75
widthKeyPd=-3.5
widthKeyp= -0.75
widthKeyP5 = -4