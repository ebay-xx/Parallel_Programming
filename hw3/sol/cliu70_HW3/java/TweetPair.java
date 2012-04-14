package org.myorg;

import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Reducer.Context;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import java.io.*;

public class TweetPair
{
  public static class TweetMapP1 extends Mapper<Object, Text, Text, Text>
  {

    public void map(Object key, Text value, Context context ) 
        throws IOException, InterruptedException
    {
      // Acquire the line from the mapper
      String line = value.toString();

      // Tokenize the line
      StringTokenizer tokenizer = new StringTokenizer(line);

      // Get the User ID of the person
      Text uid = new Text(tokenizer.nextToken());
      // Store tweet of the same user in tweets
      Text tweets = new Text();
      
      while(tokenizer.hasMoreTokens()) {
    	  String temp = tokenizer.nextToken();
    	  if(temp.startsWith("#")) {
    		  tweets = new Text(StringFilter(temp));
    		  context.write(uid, tweets);
//    		  System.out.println(uid + ": " + tweets);
    	  }
      }
    }
  }

  public static class TweetReduceP1 extends Reducer<Text, Text, Text, Text> 
  {
 
    // Implement the reducer
    public void reduce(Text key, Iterable<Text> values, Context context) 
        throws IOException, InterruptedException
    {
    	
    	Text result = new Text();
        // Tokenize the line
        StringTokenizer tokenizer =  new StringTokenizer("");
        // use isSame to flag if a new tag is already in the output value of not
        boolean isSame = false;

        for ( Text val : values )
        {
//        	System.out.println("****key: " + key.toString() + "******* val: " + val.toString());
        	while(tokenizer.hasMoreTokens()) {
        		String tmp = tokenizer.nextToken();
//        		System.out.println("!!!!!! tmp: " + tmp);
        		if(tmp.equals(val.toString())) {
//        			System.out.println("key = " + key.toString() + "<<<<<<<<<<<<<<< In while << tmp = " + tmp + " AND val = " + val.toString());
        			isSame = true;
        			break;
        		}
//        		System.out.println("tmp: " + tmp + "@@@@@@@@@@@");
        	}
        	
        	if(isSame == false) {
//        		System.out.println("^^^^^^^^ write [ " + val.toString() + " ] into result ^^^^^^^^^");
        		result = new Text(result.toString() + " " + val.toString());
        	}
        	
        	tokenizer = new StringTokenizer(result.toString());
        	isSame = false;
        	
        }
      
     
        context.write(key,result);
     
    }
  }
  
  public static class TweetMapP2 extends Mapper<Object, Text, Text, Text>
  {
    //private final static NullWritable nullw = NullWritable.get();

    public void map(Object key, Text value, Context context ) 
        throws IOException, InterruptedException
    {
      // Acquire the line from the mapper
      String line = value.toString();

      // Tokenize the line
      StringTokenizer tokenizer = new StringTokenizer(line);

   // Get the ID of the person
      Text tag = new Text();
      Text user = new Text(tokenizer.nextToken());
      int numTweets = tokenizer.countTokens();
      
      Text[] tags = new Text[numTweets];
      
      for(int i=0;i<numTweets;i++) {
    	  tags[i] = new Text(tokenizer.nextToken());
      }
      
      for(int i=0;i<numTweets-1;i++) {
    	  for(int j=i+1;j<numTweets;j++) {
    		  if(tags[i].toString().compareTo(tags[j].toString()) < 0) {
    			  tag = new Text("< " + tags[i] + ", " + tags[j] + " >: ");
    		  }
    		  else {
    			  tag = new Text("< " + tags[j] + ", " + tags[i] + " >: ");
    		  }
    		  context.write(tag, user);
//    		  System.out.println("<<<<<< tag = " + tag + ", user = " + user + " >>>>>>>>");
    	  }
      }
    }
  }

  public static class TweetReduceP2 extends Reducer<Text, Text, Text, Text> 
  {

    // Implement the reducer
    public void reduce(Text key, Iterable<Text> values, Context context) 
        throws IOException, InterruptedException
    {
    	int sum = 0;
    	Text result = new Text();

        for ( Text val : values )
        {
        	result = new Text(result + " " + val);
        	sum += 1;
        }
      
        if(sum > 1) {
        	context.write(key,result);
        }
     
    }
  }

  public static void main(String[] args) throws Exception 
  {
     Configuration conf = new Configuration();

//  RB Notice no combiner class

    Job job = new Job(conf, "TweetPairP1");
    job.setJarByClass(TweetPair.class);
    job.setMapperClass(TweetMapP1.class);
    job.setReducerClass(TweetReduceP1.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    
    if(job.waitForCompletion(true) == true) {
    	job = new Job(conf, "TweetPairP2");
        job.setJarByClass(TweetPair.class);
        job.setMapperClass(TweetMapP2.class);
        job.setReducerClass(TweetReduceP2.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);
        FileInputFormat.addInputPath(job, new Path(args[1]));
        FileOutputFormat.setOutputPath(job, new Path(args[2]));
    }
    
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
  

  public static String StringFilter(String str) throws PatternSyntaxException {
	  String regEx = "[^0-9a-zA-Z]";
	  Pattern p = Pattern.compile(regEx);
      Matcher m = p.matcher(str.substring(str.length()-1));   
	  return  (str.substring(0, str.length()-1).trim().toUpperCase() + m.replaceAll("").trim().toUpperCase());   
  }   
}