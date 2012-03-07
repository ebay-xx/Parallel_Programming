#!/bin/bash

#Merge the standard output and standard error
#$ -j y

#Execute the job from the current working directory
#$ -cwd

#Specify that the interpreting shell for this job is the Bash shell
#$ -S /bin/bash

#Execute the initialization script
. $HOME/.bashrc

--tee DESlogfile.txt

echo "Executing SealedDES with 1 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 1 20; 
done

echo "Executing SealedDES with 2 threads for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 2 20; 
done

echo "Executing SealedDES with 3 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 3 20; 
done

echo "Executing SealedDES with 4 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 4 20; 
done

echo "Executing SealedDES with 5 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 5 20; 
done

echo "Executing SealedDES with 6 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 6 20; 
done

echo "Executing SealedDES with 7 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 7 20; 
done

echo "Executing SealedDES with 8 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 8 20; 
done

echo "Executing SealedDES with 9 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 9 20; 
done

echo "Executing SealedDES with 10 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 10 20; 
done

echo "Executing SealedDES with 11 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 11 20; 
done

echo "Executing SealedDES with 12 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 12 20; 
done

echo "Executing SealedDES with 13 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 13 20; 
done

echo "Executing SealedDES with 14 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 14 20; 
done

echo "Executing SealedDES with 15 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 15 20; 
done

echo "Executing SealedDES with 16 thread for 20 key bits"
for (( i=1; i<=3; i++ )); 
do java SealedDES 16 20; 
done