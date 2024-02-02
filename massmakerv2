#!/bin/bash

minim_a=1000
maxim_a=6000
stepsize_a=1000

minim_b=100
maxim_b=900
stepsize_b=100

itnum_a=$((($maxim_a - $minim_a)/$stepsize_a))
itnum_b=$((($maxim_b - $minim_b)/$stepsize_b))

for (( i = 0; i <= $itnum_a; i++ ))
do 
	for (( j = 0; j <= $itnum_b; j++ ))
	do
		val_a=$((($i*$stepsize_a)+$minim_a))
		val_b=$((($j*$stepsize_b)+$minim_b))
	        printf "$val_a $val_b \n" >> mass2.txt

	done
done
