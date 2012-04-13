#!/usr/bin/perl

%hash=();

while ($Line=<STDIN>) {
	chomp($Line);
	@uTag = split(/[ |\s]+/, $Line); #split the line into arrays
	$hash{$uTag[0]}{$uTag[1]} = 1; #2 dimensional hash
}

foreach $user (keys %hash) {
	print $user;
	foreach $tag (keys %{$hash{$user}}) {
		print "\t", $tag;
	}
	print "\n";
}



