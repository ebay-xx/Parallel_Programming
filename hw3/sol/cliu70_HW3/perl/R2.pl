#!/usr/bin/perl

%hash=();

while ($Line=<STDIN>) {
	chomp($Line);
	@Tmp = split(/[ |\s]+/, $Line);	#split the line into arrays
	$hash{$Tmp[0]}{$Tmp[1]} = 1;	#2 dimensional hash
}

foreach $pair (keys %hash) {
	$i = 0;
	$user_str = ();
	$pair_str =  "<". $pair. ">\t";
	foreach $user (keys %{$hash{$pair}}) {
		if ($i!=0) {
			$user_str = $user_str. " ";
		}
		$i++;
		$user_str = $user_str. $user;
	}
	if ($i>1) {		#only output tag pairs used by 2 users or more
		print $pair_str, $user_str, "\n";
	}
}
