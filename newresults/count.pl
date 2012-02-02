#!/use/bin/perl
use strict;
use warnings;

my %calls=();

my $apicount = 0;
my $eventcount=0;
while(<>){
  chomp;
  next unless m/^chrome\.tabs\.([^.]+)/;
  my $call=$1;
  next if $call =~ m/onRemoved|create|update|remove/;
  if($call =~ m/^on/){
    $eventcount++;
  }else{
    $apicount++;
  }
}

print $eventcount,"\t",$apicount,"\n";


