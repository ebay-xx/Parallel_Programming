#!/bin/bash

#Merge the standard output and standard error
#$ -j y

#Execute the job from the current working directory
#$ -cwd

#Specify that the interpreting shell for this job is the Bash shell
#$ -S /bin/bash

#Execute the initialization script
#. $HOME/.bashrc

echo "Executing CoinFlip with 1 thread for 10000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 10000000; 
done

echo "Executing CoinFlip with 1 thread for 20000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 20000000; 
done

echo "Executing CoinFlip with 1 thread for 30000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 30000000; 
done

echo "Executing CoinFlip with 1 thread for 40000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 40000000; 
done

echo "Executing CoinFlip with 1 thread for 50000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 50000000; 
done

echo "Executing CoinFlip with 1 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 100000000; 
done

echo "Executing CoinFlip with 1 thread for 200000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 200000000; 
done

echo "Executing CoinFlip with 1 thread for 300000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 300000000; 
done

echo "Executing CoinFlip with 1 thread for 400000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 400000000; 
done

echo "Executing CoinFlip with 1 thread for 500000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 1 500000000; 
done

####################################

echo "Executing CoinFlip with 2 thread for 10000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 10000000; 
done

echo "Executing CoinFlip with 2 thread for 20000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 20000000; 
done

echo "Executing CoinFlip with 2 thread for 30000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 30000000; 
done

echo "Executing CoinFlip with 2 thread for 40000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 40000000; 
done

echo "Executing CoinFlip with 2 thread for 50000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 50000000; 
done

echo "Executing CoinFlip with 2 thread for 100000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 100000000; 
done

echo "Executing CoinFlip with 2 thread for 200000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 200000000; 
done

echo "Executing CoinFlip with 2 thread for 300000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 300000000; 
done

echo "Executing CoinFlip with 2 thread for 400000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 400000000; 
done

echo "Executing CoinFlip with 2 thread for 500000000 coin flips"
for (( i=1; i<=5; i++ )); 
do java CoinFlip 2 500000000; 
done

