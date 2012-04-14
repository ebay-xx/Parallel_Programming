********************************
* CHANG LIU
* chang.liu@jhu.edu
*
* EN.600.420 (01) Parallel Programming
* 2012 SPRING
* HOMEWORK 3
********************************

java/	This contains java code for the jar version, tweet.bat is the command I used to run the 
	java version on my Ubuntu
perl/	This contains perl script for the stream version

cliu70_HW4.pdf	Writeup for hw3
design.txt	Design of the Map/Reduce
link.txt	links to my S3 output files



********************************
Running Instruction:

1. Stream Version:

(1) simple input:

Phase I

Input Location: s3n://tweets.simple/
Output Location: s3n://changhw3/output/stream/simple
Mapper:  s3n://changhw3/stream/M1.pl
Reducer: s3n://changhw3/stream/R1.pl


Phase II

Input Location: s3n://changhw3/output/stream/simple/
Output Location: s3n://changhw3/output/stream/simple2/
Mapper:  s3n://changhw3/stream/M2.pl
Reducer: s3n://changhw3/stream/R2.pl



(2) large input:

Phase I
Input Location: s3n://tweets.large/
Output Location: s3n://changhw3/output/stream/large/
Mapper:  s3n://changhw3/stream/M1.pl
Reducer: s3n://changhw3/stream/R1.pl


Phase II

Input Location: s3n://changhw3/output/stream/large/
Output Location: s3n://changhw3/output/stream/large2/
Mapper:  s3n://changhw3/stream/M2.pl
Reducer: s3n://changhw3/stream/R2.pl




1. JAR Version:

(1) simple input:

JAR Location: s3n://chang.jars/TweetPair.jar
JAR Arguments: org.myorg.TweetPair s3n://tweets.simple/ s3n://changhw3/simple.output1/ s3n://changhw3/simple.output2/


(2) large input:

JAR Location: s3n://chang.jars/TweetPair.jar
JAR Arguments: org.myorg.TweetPair s3n://tweets.large/ s3n://changhw3/large.output1/ s3n://changhw3/large.output2/



