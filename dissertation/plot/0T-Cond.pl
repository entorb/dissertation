#!/usr/bin/perl -w
use warnings; use strict;
use Data::Dumper;

my $cont = '
#!/usr/bin/gnuplot
term = "eps"
color = "color"
load "00header.gp"
#load "00_vs_T-header.gp"
set xlabel axisLabelTrez
set xtics nomirror
set xtics 0.1 format "%.1f"
set x2label axisLabelTinC
xmin = 1000.0/3.4-c0C # T in C

set key outside right top font ",18" spacing 0.75 width -2

load "9LayoutCond.gp"

#set terminal postscript size 14.85cm,7cm

set rmargin 10
set tmargin 3
set lmargin 7
set arrow 1 from first (1000/(35+c0C)), graph .10 rto 0 , graph 0.85 front ls 60
set label 1 "MR" at (1000/(35+c0C)),graph .05 center
';

my @sampleDirs;
push @sampleDirs, <../data/n*>;
push @sampleDirs, <../data/p*>;

#TODO
#@sampleDirs = grep {m/n(3|4)/} @sampleDirs;
#@sampleDirs = grep {m/n(1|2)/} @sampleDirs;

# @sampleDirs = grep {not m/LongtimeCondAuswahl/} @sampleDirs;
# @sampleDirs = grep {not m/n1b/} @sampleDirs;
# @sampleDirs = grep {not m/p-n-ZnPc/} @sampleDirs;

@sampleDirs = grep {m/p[1-4]_/} @sampleDirs;

#TODO
exit;

foreach my $datafolder (@sampleDirs) {
  print $datafolder ,"\n";
  $datafolder =~ m/((n|p)\d+)_/;
  my $matNr=$1;
  print "$datafolder : material\U$matNr\n";

  if ($matNr =~ m/^(p1|p2)$/) { # MeO
    $cont .= "xmax = 1000.0/3.1-c0C\n";
    $cont .= 'set x2tics ("25" 1000./(c0C+25) , "35" 1000./(c0C+35) , "45" 1000./(c0C+45)  )'."\n";
  } elsif ($matNr =~ m/^(p3|p4|p5)$/) { # BF-DPB
    $cont .= "xmax = 1000.0/2.8-c0C\n";
    $cont .= 'set x2tics ("25" 1000./(c0C+25) , "30" 1000./(c0C+30) , "40" 1000./(c0C+40) , "50" 1000./(c0C+50) , "60" 1000./(c0C+60), "70" 1000./(c0C+70), "80" 1000./(c0C+80) )'."\n";
  } elsif ($matNr =~ m/^(n3|n4)$/) { # CrPd + WPd
    $cont .= "xmax = 1000.0/2.9-c0C\n";
    $cont .= 'set x2tics ("25" 1000./(c0C+25) , "30" 1000./(c0C+30) , "40" 1000./(c0C+40) , "50" 1000./(c0C+50) , "60" 1000./(c0C+60), "70" 1000./(c0C+70) )'."\n";
  } elsif ($matNr =~ m/^(n1|n2|n1b)$/) { # dmbi+aob
    $cont .= "xmax = 1000.0/2.65-c0C\n";
    $cont .= 'set x2tics ("25" 1000./(c0C+25) , "50" 1000./(c0C+50) , "75" 1000./(c0C+75), "100" 1000./(c0C+100) )'."\n";
  }else {
    $cont .= "xmax = 102\n";
  }
  if ($matNr =~ m/^n\d$/) { # n-doping
    $cont .= "set yrange[5E-3:10]\n";
  }else {
    $cont .= "set yrange[*:*]\n";
  }

  $cont .= '
datafolder = "'.$datafolder.'/byDoping"
material = material'."\U$matNr".'
#set title material
set key title "Doping(MR)"
set output "T-Cond-'.$matNr.'.gp" . term
';

  my @files = (); # for joined plot
  my @MRs   = ();
  my @filepaths = reverse <$datafolder/byDoping/Cond_*.dat>; # highest doping first
  foreach my $file2 (@filepaths) {
    $file2 =~ m/(Cond_([^_]+).*\.dat)/ or die "Bad filename $file2\n";
    my $file = $1;
    my $MR = $2;
    if ($MR<0.01) {$MR = sprintf("%.4f",$MR+0)}
    elsif ($MR<0.1) {$MR = sprintf("%.3f",$MR+0)}
    else  {$MR = sprintf("%.2f",$MR+0)}
    push @files, $file; # for joined plot
    push @MRs  , $MR;
  } # end foreach my $file

# joined plots
  @_ = ();

  for (my $i=1;$i<=$#files+1;$i++) {
    my $f = $files[$i-1];
    print $f,"\n";
    my $mr = $MRs[$i-1];
    $cont .= "d$i = datafolder . \"/$f\"\n";
    $cont .= "f$i(x) = a$i + b$i * x\n";
    $cont .= "fit f$i(x) d$i using (1000./(\$1+c0C)):(log(\$2)) via a$i, b$i\n";

    push @_ , "d$i u (1000./(\$1+c0C)):(\$2) title \"$mr\" with points ls $i ps 1.5, exp(f$i(x)) notitle with lines ls $i lw 2";

  }
  $cont .= '
left = 1000./(xmax+c0C) ; right = 1000./(xmin+c0C)
plot [left:right] [:] [left:right] \
';
  $cont .= join "\\\n,  ", @_;
  $cont .= "\nunset output\n";
} # end foreach $datafolder

$cont .= 'load "footer.gp"'."\n";

open (FH, "> temp.gp");
print FH $cont;
close FH;

system "gnuplot temp.gp";
$_ = 'fit.log'; unlink $_ if -f $_;
#$_ = 'temp.gp'; unlink $_ if -f $_;

