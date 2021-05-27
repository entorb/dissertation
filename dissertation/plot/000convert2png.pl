#!/usr/bin/perl -w

my $den = 100;

print "REALLY WANT TO RECREATE ALL PNGs???  " and <STDIN>;
unlink <*.png>;

my @L = <*.pdf>;

foreach my $f (@L) {
  print "$f\n";
  my $n = $f;
  $n =~ s/\.pdf/.png/;
  $_ = "convert -density $den -trim +repage $f $n" ; # -type Palette 
  system ($_);
  }