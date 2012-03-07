#!/bin/bash

#Merge the standard output and standard error
#$ -j y

#Execute the job from the current working directory
#$ -cwd

#Specify that the interpreting shell for this job is the Bash shell
#$ -S /bin/bash

#Execute the initialization script
. $HOME/.bashrc

echo "Executing SealedDES with 1 thread for 20 key bits"
for (( i=1; i<=5; i++ )); 
do java SealedDES 1 20; 
done

echo "Executing SealedDES with 2 threads for 21 key bits"
for (( i=1; i<=5; i++ )); 
do java SealedDES 2 21; 
done

echo "Executing SealedDES with 4 thread for 22 key bits"
for (( i=1; i<=5; i++ )); 
do java SealedDES 4 22; 
done

echo "Executing SealedDES with 8 thread for 23 key bits"
for (( i=1; i<=5; i++ )); 
do java SealedDES 8 23; 
done


