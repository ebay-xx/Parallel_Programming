import java.util.*;

class CoinFlip implements Runnable
{
  // Create some variables for testing.
  //int threads;    // number of threads
  int total = 0;	// Total numbers of tosses
  
  static long num_heads = 0;	// Number of heads for each thread
  static long total_heads = 0;	// Total number of heads
 
  // Run: overrides Runnabale.Run, thread entry point
  public void run ()
  {
	Random r = new Random(); 
	int heads = 0;
    for ( int i=0; i<total; i++ )
    {
      //Toss the coin
      if(r.nextBoolean())
    	  heads++;
    }
    num_heads = heads;
  }

  // Constructor: set thread id
  CoinFlip (int total_tosses ) 
  {
    //this.threads = num_threads;
    this.total = total_tosses;
  }
  
  public static double getHeads() {
	  return num_heads;
  }

  public static void main ( String[] args )
  {
    if ( 2 != args.length ) 
    {
      System.out.println ("Usage: CoinFlip #threads #totaltosses");
      return;
    } 

    // Get the number of threads we are going to run from the command line
    int numthreads = Integer.parseInt (args[0]);
    int totaltosses = Integer.parseInt (args[1]);

    // Time stamp start
    double start_time = System.currentTimeMillis();
    
    // Array to hold references to thread objects
    Thread[] threads = new Thread[numthreads];

    // create and start specified thread objects of class SynchronizedWorks
    for ( int i=0; i<numthreads; i++ )
    {
      threads[i] = new Thread (new CoinFlip((int)(totaltosses / numthreads)));
      threads[i].start();
    }

    // Await the completion of all threads
    for ( int i=0; i<numthreads; i++ )
    {
      try
      {
        threads[i].join();
        total_heads += CoinFlip.getHeads();
      }
      catch (InterruptedException e)
      {
         System.out.println("Thread interrupted.  Exception: " + e.toString() +
                           " Message: " + e.getMessage()) ;
        return;
      }
    }
    // Time stamp end
    double end_time = System.currentTimeMillis();
    System.out.println(total_heads + " heads in " + totaltosses + " coin tosses.");
    System.out.println("Elapsed time: " + (end_time - start_time) + "ms.");
  }
}
