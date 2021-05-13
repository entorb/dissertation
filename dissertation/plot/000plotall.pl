#!/usr/bin/perl -w

print "REALLY WANT TO REMOVE ALL PDF & PNG???  " and <STDIN>;

unlink <*.png>;
unlink <*.pdf>;

my $lockfile = '000plotAll.lock';
open (FH, "> $lockfile");
print FH "";
close FH;

foreach (<0*.gp>) {
  print "$_\n";
#   <STDIN>;
  next if m/^00/;
  system "gnuplot $_";

}

foreach (<0T-*.pl>) {
  print "$_\n";
  next if m/^00/;
  system "perl $_";
}

# now run the convertscript with to options given in footer.gp
my $cont = "term = 'eps'\n";
open (FH, "< footer.gp");
$cont .= join "",<FH>;
close FH;

open (FH, "> temp.gp");
print FH $cont;
close FH;

unlink $lockfile; # remove lock
system "gnuplot temp.gp"; # starts convert.pl
unlink 'temp.gp';
