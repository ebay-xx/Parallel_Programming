/*******************************************************************************
*
*  Serial main() function to call compress
*
********************************************************************************/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <assert.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <limits.h>

#include "compress.h"
#include "omp.h"

/*------------------------------------------------------------------------------
* Name:  Parallel Version
* Action:  Compress the file under each directory
*-----------------------------------------------------------------------------*/
int main ( int argc, char** argv )
{
  int count = 0;
  int maxval = 4;
  int a[5];
  int b[5] = {1, 2, 3, 4, 5};
  int c[5] = {1, 2, 3, 4, 5};

  /* Create a thread for each directory in the root directory */
  #pragma omp parallel for shared(count)
  while (count <= maxval) {
	printf ( "OMP Thread %d count = [%d]\n", omp_get_thread_num(), count);
	a[count] = b[count] + c[count];
	count++;
  }
  for (int i=0;i<5;i++)
	printf("a[%d] is: %d", i, a[i]);
}

