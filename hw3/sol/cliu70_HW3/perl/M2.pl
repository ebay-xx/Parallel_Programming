#!/usr/bin/perl

while ($Line=<STDIN>) {	#read in the file
	chomp($Line);
	@tList = split(/[ |\s]+/,$Line);		#split the string into arrays
	
	@tPair = ();

	for ($i=1;$i<@tList;$i++) {
		for ($j=$i+1;$j<@tList;$j++) {		#for every 2 elements and the first element in the array, output a string
			$tPair[0] = $tList[$i];
			$tPair[1] = $tList[$j];
			@tPair_sorted = sort { $a cmp $b } @tPair;	#sort the tag
			$pair=$tPair_sorted[0].",".$tPair_sorted[1]; 
			print $pair,"\t",$tList[0],"\n";	 
		}
	}
}

