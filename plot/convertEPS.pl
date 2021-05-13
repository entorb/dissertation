#!/usr/bin/perl -w

# 31.08.2011 Added multithreading to speed up eps -> png conversion
# 15.09.2011 command line options
# 11.05.2012 fixed output of non-transparent images
# 11.05.2012 using epstool to fix bounding box
# 07.07.2012 option --trim to choose if epstool should be used
# 14.09.2012 lock for plotall

use warnings; use strict;
#use Data::Dumper;

# do nothing if the plotall.pl. when finished the lock is removed and than all stuff isplottet
exit 0 if (-f '000plotAll.lock');

my $numThreads = 4; # parallel processed files

use Getopt::Long;
my %o; # stores command line parameters/options
$o{'pdf'} = 1;
$o{'eps'} = 0;
$o{'png'} = 0;
$o{'dpi'} = 150;
$o{'pngtrans'} = 0;
$o{'trim'} = 0; # use epstool to draw boundary box around plot
my $res = GetOptions (\%o, "pdf!", "eps!", "png!", "dpi:i","pngtrans!", "trim!"); #$fname.gpeps
# :i = optimal number

my $plotdir = ".";
$plotdir = shift if @ARGV;
chdir $plotdir or die $!;

my @a = <*.gpeps>;

use threads;
use Thread::Queue;

# list of jobs
my $q = new Thread::Queue;
$q->enqueue($_) for @a;
for (1..$numThreads) { $q->enqueue(undef); } # for stop condition

my @Threads = ();
for my $thrNum (1..$numThreads) {
  push @Threads,threads->new(\&tsub,$thrNum);
}

# Wait for all threads to complete execution.
foreach (@Threads) {
  print $_->join; # wait for thread, returns return value
}

# the work to be done for all items of queue
sub tsub {
  my $thrNum = shift;
  my $howMany=0;

  while (my $file = $q->dequeue) {
    # process $file
    my $fname = $file; $fname =~ s/(\.gpeps|\.dat\.gpeps)$//; # remove ext

    # eps2eps ist doof, weil macht Schriften haesslich
    #print `eps2eps "$fname.gpeps" "$fname.eps"` ; unlink "$fname.gpeps";
    # generate/fix/shrink bounding box

    # epstool ist besser http://www.ctan.org/tex-archive/support/ghostscript/ghostgum
    if ($o{'trim'}) {
      print `epstool --copy --quiet --bbox "$file" "$fname.eps"`;
      unlink "$file";
    } else {
      rename "$file","$fname.eps" ;
    }

    if ($o{'pdf'})    { print `epstopdf --embed "$fname.eps"` ; } #embed=embed fonts
    else { unlink "$fname.pdf"; }

    if ($o{'png'})    {
      my $s = "convert";
      $s .= " -density $o{'dpi'} -trim +repage";
      if ($o{'pngtrans'}) {
        $s .= " \"$fname.eps\" -transparent white";
      }
      else {
        $s .= " \"$fname.eps\" -background white -flatten +matte"; # -quality 90
      }
      $s .= " -type Palette " unless $o{'pngtrans'}; # indexed colorspace if not transparent
      $s .=  " \"$fname.png\"";
      print `$s`;
    }
    else { unlink "$fname.png"; }

    if    ($o{'eps'})   {}
    else { unlink "$fname.eps"; }

    print "$thrNum: $fname\n";
    $howMany++;
  }
  return ;#"$thrNum: $howMany computed\n";
}
