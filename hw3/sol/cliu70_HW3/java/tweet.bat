javac -classpath hadoop-0.20.2-core.jar -d test/TweetPair_classes test/TweetPair.java
jar -cvf TweetPair.jar -C test/TweetPair_classes/ .
bin/hadoop jar TweetPair.jar org.myorg.TweetPair test/input test/output test/output2
