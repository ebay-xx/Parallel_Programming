#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "mpi.h"

void generate();

int main(int argc, char**argv)
{
    int i,j,k;
    
    int *lower;         
    int *upper;         
    int *grid;          
    int *localGrid;    
    int *output;
    int gridSize;     
    int offset;         
    
	int proc_Num;
    int rank;

    MPI_Status stat;
    int prev;
    int next;

    int iterations = 64;

    /* Global constant data */
    const int dimension = 16;     // assume a square grid
    const int global_grid[ 256 ] = { 0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 };

 
    
    
    if(MPI_Init(&argc, &argv) != MPI_SUCCESS) {
        printf("MPI_Init error\n");
	}

    MPI_Comm_size(MPI_COMM_WORLD, &proc_Num);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    assert(dimension % proc_Num == 0);
    
    if(rank == proc_Num - 1) {
        next = 0;
	}
    else {
        next = rank + 1;
	}
    if(rank == 0) {
        prev = proc_Num - 1;
	}
    else {
        prev = rank - 1;
	}

    lower = malloc(sizeof(int)*dimension);
    upper = malloc(sizeof(int)*dimension);
    grid = malloc(sizeof(int)*dimension*dimension/proc_Num);
    localGrid = malloc(sizeof(int)*dimension*dimension/proc_Num);
    output = malloc(sizeof(int)*dimension*dimension);
    gridSize = dimension*dimension/proc_Num;
    offset = rank*gridSize;

    for(i=0; i < gridSize; i++) {
        grid[i] = global_grid[i + offset];
	}


    for(i =0; i < iterations; i++){
        if(rank % 2 == 1){
            MPI_Recv(lower, dimension, MPI_INT, prev, 2, MPI_COMM_WORLD, &stat);
            MPI_Recv(upper, dimension, MPI_INT, next, 2, MPI_COMM_WORLD, &stat);
            MPI_Send(&grid[gridSize - dimension], dimension, MPI_INT, next, 2, MPI_COMM_WORLD);
            MPI_Send(&grid[0], dimension, MPI_INT, prev, 2, MPI_COMM_WORLD);
        }
        else{
            MPI_Send(&grid[gridSize - dimension], dimension, MPI_INT, next, 2, MPI_COMM_WORLD);
            MPI_Send(&grid[0], dimension, MPI_INT, prev, 2, MPI_COMM_WORLD);
            MPI_Recv(lower, dimension, MPI_INT, prev, 2, MPI_COMM_WORLD, &stat);
            MPI_Recv(upper, dimension, MPI_INT, next, 2, MPI_COMM_WORLD, &stat);
        }

        if(proc_Num == 16) {
            generate(&localGrid[0],lower, &grid[0], upper,dimension);
		}
        else {
            generate(&localGrid[0],lower, &grid[0], &grid[dimension],dimension);
            
            for(j = 1; j< dimension/proc_Num-1; j++) {
                generate(&localGrid[j*dimension], &grid[j*dimension - dimension], &grid[j*dimension], &grid[j*dimension + dimension],dimension);
			}
        
            generate(&localGrid[gridSize - dimension], &grid[gridSize - 2*dimension], &grid[gridSize - dimension], upper,dimension);
        }
            

        for(j = 0; j<gridSize; j++) {
            grid[j] = localGrid[j];
		}

        MPI_Gather(grid,gridSize, MPI_INT, output, gridSize, MPI_INT, 0, MPI_COMM_WORLD);

        if(rank == 0){
            printf("Iteration: %d grid \n", i);
            for(k = 0; k < dimension; k++){
                for(j = 0; j< dimension; j++){
                    if(j != dimension - 1)
                        printf("%d ",output[k*dimension+j]);
                    else
                        printf("%d\n",output[k*dimension+j]);
                }
            }
        }
    }
    
    MPI_Finalize();
    free(lower);
    free(upper);
    free(grid);
    free(localGrid);
    free(output);
}


void generate(int *grid, int *lower, int *value, int *upper, int dimension){
    int i, left, right, nbSize;
    
    for(i = 0; i < dimension; i++){
		if(i == 0) {
            left = dimension - 1;
		}
        else {
            left = i - 1;
		}
        if(i == dimension - 1) {
            right = 0;
		}
        else {
            right = i + 1;
		}
        
        nbSize = value[left] + value[right] + upper[i] + upper[left] + upper[right] + lower[i] + lower[left] + lower[right];
        
        if(nbSize == 3) {
            grid[i] = 1;
		}
        else if(nbSize == 2 && value[i] == 1) {
            grid[i] = 1;
		}
        else {
            grid[i] = 0;
		}
    }
}
