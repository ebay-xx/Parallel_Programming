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

echo "Executing CoinFlip with 2 threads for 200000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 200000000; 
done

echo "Executing CoinFlip with 3 thread for 300000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 3 300000000; 
done

echo "Executing CoinFlip with 4 thread for 400000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 4 400000000; 
done

echo "Executing CoinFlip with 5 thread for 500000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 5 500000000; 
done

echo "Executing CoinFlip with 6 thread for 600000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 6 600000000; 
done

echo "Executing CoinFlip with 7 thread for 700000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 7 700000000; 
done

echo "Executing CoinFlip with 8 thread for 800000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 8 800000000; 
done

echo "Executing CoinFlip with 9 thread for 900000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 9 900000000; 
done

echo "Executing CoinFlip with 10 thread for 1000000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 10 1000000000; 
done

echo "Executing CoinFlip with 11 thread for 1100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 11 1100000000; 
done

echo "Executing CoinFlip with 12 thread for 1200000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 12 1200000000; 
done

echo "Executing CoinFlip with 13 thread for 1300000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 13 1300000000; 
done

echo "Executing CoinFlip with 14 thread for 1400000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 14 1400000000; 
done

echo "Executing CoinFlip with 15 thread for 1500000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 15 1500000000; 
done

echo "Executing CoinFlip with 16 thread for 1600000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 16 1600000000; 
done