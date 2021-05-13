#!/usr/bin/perl -w
use strict; use warnings; use Data::Dumper;

print "REALLY WANT TO MODIFY ALL GP files???  \n\n";

print "(s)w or (c)olor? ";
my $mode = <STDIN>;
chop $mode;
die "ERROR: wrong choise '$mode'\n" if not $mode=~m/[sc]/;

my @L = <0*.gp>;
# @L = ('0evap.gp');
foreach my $f (@L) {
next if ($f =~ m/^(0goldenerSchnitt|00header|00_vs_doping)/);
#   print $f,"\n";
  open (FH, "< $f");
  my $cont = join "", <FH>;
  my $res = 0;
  close FH;
  if ($mode eq "c") {
    $res = 1 if ($cont =~ s/color\s*=\s*"color"\ncolor\s*=\s*"sw"\n/color="sw"\ncolor="color"\n/);
    
  } elsif ($mode eq "s") {
    $res = 1 if ($cont =~ s/color\s*=\s*"sw"\ncolor\s*=\s*"color"\n/color="color"\ncolor="sw"\n/);
    
  }
  if ($res!=1) {print "Not successfull in $f\n";}
  
  open (FH, "> $f");
  print FH $cont;
  close FH;
  }
