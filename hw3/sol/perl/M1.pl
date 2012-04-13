#!/usr/bin/perl

%hash = ();

while ($Line=<STDIN>) {	#read in the file
	chomp($Line);
	@Array = split(/ +/,$Line);		#split the string into arrays
	
	for ($i=1;$i<@Array;$i++) {
		if ($Array[$i] =~ /^\#/ ) {		#find the tag
			$Array[$i] =~ s/^(\#.+)[,\"]+/$1/i;	#turn characters into small cases, delete comma and quotation 
			print $Array[0],"\t",$Array[$i],"\n";
		}
	}
}