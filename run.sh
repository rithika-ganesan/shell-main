#!/bin/bash

# This script generates a text file containing MadGraph5 commands to loop over different masses for a particle.

filename="pp_qcd.txt" #Change what the output text file is called
massfilename="mass.txt" #Add text file containing masses, similarly decay widths 
pdg=4210012 #PDG code for the particle whose mass is being varied

iter_number=$(wc -l < $massfilename)
rm $filename

#Add your initialization commands here
echo -e "define pb = p b b~ a 
define jb = j j b 
generate pb pb > jb jb QCD==2 QED==0 
output output_name" >> "$filename"

for (( i = 1; i<=$iter_number; i++ ))
do

imass=`head -$i $massfilename | tail -1 | awk {'print $1'}` #Pulls data from the mass text file
echo -e "launch -n run_mass$imass
set param_card yuku1ll 3 3 1 
set param_card mass $pdg $imass" >> "$filename"

done


#../bin/mg5_amc $filename

exit 0
