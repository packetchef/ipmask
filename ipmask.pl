#!/usr/bin/env perl

# grep -E --color '\b[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b' sample.txt

#	if(/($matchThis)/g) {
#		# print whole line
#		# print "$_\n";
#		# print just the match (first)
#		print "$1\n";	
#	}

my $matchThis = '\b[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b';
my $salt = "MIT";

sub maskIt {
	$maskInput = $_[0];
	#return substr($maskInput, 0, (length $maskInput)/2);
	#return substr($maskInput, 0, 5) . "xxxxxx";
	return crypt $maskInput, $salt;
}

#my $inputFile = $ARGV[0];
#open (IPLIST, $inputFile);
#while ( <IPLIST> ) {
#	chomp;
#	my $readLine = $_;
#	my @matches = $readLine =~ /($matchThis)/g;
#	foreach my $match (@matches) {
#		#print "$match\n";
#		my $maskedIP = maskIt ($match);
#		print "$maskedIP\n";
#	}
#}
#close (IPLIST);	

my $inputFile = $ARGV[0];
open (IPLIST, $inputFile);
while ( <IPLIST> ) {
	chomp;
	my $readLine = $_;
	$readLine =~ s/($matchThis)/maskIt($1)/ge;
	print "$readLine\n";
}
close (IPLIST);

