#!/bin/bash

#Merge the standard output and standard error
#$ -j y

#Execute the job from the current working directory
#$ -cwd

#Specify that the interpreting shell for this job is the Bash shell
#$ -S /bin/bash

#Execute the initialization script
#. $HOME/.bashrc

echo "Executing CoinFlip with 1 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 100000000; 
done

echo "Executing CoinFlip with 2 threads for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 100000000; 
done

echo "Executing CoinFlip with 3 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 3 100000000; 
done

echo "Executing CoinFlip with 4 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 4 100000000; 
done

echo "Executing CoinFlip with 5 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 5 100000000; 
done

echo "Executing CoinFlip with 6 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 6 100000000; 
done

echo "Executing CoinFlip with 7 thread for 100000000 coin flips"
for (( i=1; i<=10; i++ )); 
do java CoinFlip 7 100000000; 
done

echo "Executing CoinFlip with 8 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 8 100000000; 
done

echo "Executing CoinFlip with 9 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 9 100000000; 
done

echo "Executing CoinFlip with 10 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 10 100000000; 
done

echo "Executing CoinFlip with 11 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 11 100000000; 
done

echo "Executing CoinFlip with 12 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 12 100000000; 
done

echo "Executing CoinFlip with 13 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 13 100000000; 
done

echo "Executing CoinFlip with 14 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 14 100000000; 
done

echo "Executing CoinFlip with 15 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 15 100000000; 
done

echo "Executing CoinFlip with 16 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 16 100000000; 
done