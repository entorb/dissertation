#!/usr/bin/perl -w
use warnings; use strict;
use Data::Dumper;

my $cont = '
#!/usr/bin/gnuplot
term = "eps"
color = "color"
load "00header.gp"
#load "00_vs_T-header.gp"
set xlabel "Temperature (°C)"
set xtics mirror

xmin = 28
';
$cont .= "\n\n\n";

my @sampleDirs;
push @sampleDirs, <../data/n*>;
push @sampleDirs, <../data/p*>;

#TODO
#@sampleDirs = grep {m/p[1-4]_/} @sampleDirs;
@sampleDirs = grep {not m/LongtimeCondAuswahl/} @sampleDirs;
@sampleDirs = grep {not m/p-n-ZnPc/} @sampleDirs;
@sampleDirs = grep {not m/n1b_C60\+oMeO-DMBI/} @sampleDirs;

# @sampleDirs = grep {m/p5/} @sampleDirs;

#TODO
exit;

foreach my $datafolder (@sampleDirs) {
  my $a; # multiplot a
  $datafolder =~ m/((n|p)\d+b?)_/;
  my $matNr=ucfirst($1);
  $_ = "#==> Start $datafolder : material$matNr\n";
  $cont .= $_;
  print $_;
  if ($matNr=~m/N(1|2)/) {$a .="xmax=102; set xtics 20\n"}
  elsif ($matNr=~m/N(3|4)/) {$a .="xmax=73; set xtics 10\n"}
  elsif ($matNr=~m/P[1-2]/) {$a .="xmax=48; set xtics 10\n"}
  elsif ($matNr=~m/P[3-5]/) {$a .="xmax=73; set xtics 10\n"}
  else {$a .="xmax=102; set xtics 20\n"}

  if ($matNr =~ m/^n\d$/) { # n-doping
     $a .= '
ymax=700
set ytics (\
    "0" 0 \
,  "-100" 100 \
,  "-200" 200 \
,  "-300" 300 \
,  "-400" 400 \
,  "-500" 500 \
,  "-600" 600 \
,  "-700" 700 \
,  "-800" 800 \
) format "%g"
';
}else {
  $a .= '
set ytics 200 format "%g"
ymax=1000
  ';
}

  $cont .= '
datafolder = "'.$datafolder.'/byDoping"
material = material'."$matNr".'
#set title material
set key title "Doping(MR)" outside right top
set terminal postscript enhanced size 10cm,7cm # because will be changed for multiplots
set size 1.0 , 1.0
set origin 0.0,0.0
set rmargin; set lmargin
';

  my @files = ();
  my @MRs   = ();
  my %S40;
  my @filepaths = <$datafolder/byDoping/See_*.dat>; # lowset doping first
  foreach my $file2 (@filepaths) {
    $file2 =~ m/(See_([^_]+).*\.dat)/ or die "Bad filename $file2\n";
    my $file = $1;
    my $MR = $2;
    if ($MR<0.01) {$MR = sprintf("%.4f",$MR+0)}
    elsif ($MR<0.1) {$MR = sprintf("%.3f",$MR+0)}
    else  {$MR = sprintf("%.2f",$MR+0)}
    push @files, $file; # for joined plot
    push @MRs  , $MR;

    # read S(T=40)
    my $S40 = 0;
    open (FH, "< $file2");
    my @a = <FH>;
    close FH;
    @a = grep {not m/^#/} @a;
    @a = grep {m/40(\t|\.0\t)/} @a;
    if (not @a) {
      print "No 40C Seebeckdata found in file $file2!!!\n";
      $_ = <STDIN>;
    } else {
      $S40 = (split m/\t/,$a[0])[1];
      $S40{$file} = $S40; # store in hash
      }

  } # end foreach my $file2

# joined plot of S vs T
  my @a = ();
  for (my $i=1;$i<=$#files+1;$i++) {
    my $f = $files[$i-1];
#    print $f,"\n";
    my $mr = $MRs[$i-1];
    $cont .= "d$i = datafolder . \"/$f\"\n";
    push @a ,' '."d$i".' u ($1):(abs($2)) title "'.$mr.'" w linespoints lw 1 ps 1.5' ;
  }
  $a .= "\n\n# T-S-lin\n";
#  $cont .= 'set output "T-S-lin-'.$matNr.'.gp" . term'."\n";
if ($matNr =~ m/^n\d$/) {
  $a .= "set arrow 1 from first (55), graph .92 to first (55), graph 0.05 ls 60\nset label 1 'MR' at (55),graph .95 center\n";
} else {
  $a .= "set arrow 1 from first (42.5), graph .92 to first (42.5), graph 0.05 ls 60\nset label 1 'MR' at (42.5),graph .95 center\n";
}

  $a .= "set ylabel axisLabelS offset 0.5,0\n";
  $a .= "\nplot [xmin:xmax] [0:ymax]\\\n";
  $a .= join "\\\n,  ", @a;
  $a .= "\nunset arrow 1; unset label 1\n";
#  $cont .= $a;
#  $cont .= "unset output\n";
  $cont .= "\n\n\n";

  # normalized plots
  my @b = ();
  my $b='';
  for (my $i=1;$i<=$#files+1;$i++) {
    my $f = $files[$i-1];
    my $mr = $MRs[$i-1];
    push @b ,' '."d$i".' u ($1):(abs($2/('.$S40{$f}.'))) title "'.$mr.'" w linespoints lw 1 ps 1.5' ;
  }

  $b .= "# T-S-lin-norm\n";
#  $cont .= 'set output "T-S-lin-norm-'.$matNr.'.gp" . term'."\n";
  $b .= "set ylabel axisLabelSnorm\nset ytics 0.1 format \"%.1f\"\n";
  $b .= "\nplot [xmin:xmax] [*:*] \\\n";
  $b .= join "\\\n,  ", @b; $b .= "\n";
#  $cont .= $b;
#  $cont .= "unset output\n";

  $cont .= "\n\n\n".'set output "T-S-multi-'.$matNr.'.gp" . term
set terminal postscript enhanced size 14.85cm,7cm
set multiplot
set size 0.6 , 1.0
set origin 0.0,0.0
set rmargin 12
set label 2 sLabelA at graph 0.1, graph 0.93
'."$a".'

set key off
set size 0.4 , 1.0
set origin 0.6 , 0.0
set lmargin 6.5
set rmargin 0.4
set label 2 sLabelB
'."$b".'
unset multiplot
unset output'."\n
# end $datafolder\n\n\n\n";
  } # end foreach $datafolder

$cont .= 'load "footer.gp"'."\n";

open (FH, "> temp.gp");
print FH $cont;
close FH;

system "gnuplot temp.gp";
#$_ = 'temp.gp'; unlink $_ if -f $_;

