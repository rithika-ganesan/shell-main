#!/bin/bash

#This script generates a text file that can be run with MadGraph5. The purpose is to simplify looping over different masses, decay widths, or other parameters. The script requires an input text file with this data in the same folder. 

filename="mg5.txt"                            #Name of the output file
massfilename="mass2.txt"                      #Name of the input file
pdg_lq=4210012                                #PDG codes of particles whose parameters are being changed. 
pdg_rhn=9900016

iter_number=$(wc -l < $massfilename)          #Finds no. of iterations from the no. of entries in the input
rm $filename                                  #Removes preceding output file with same name if any

echo -e "import model U1_noCKM_UFO/           
define pb = p b b~ a 
define u11x = u11 u11~
define jb = j j b 
generate pb pb > u11x n3 jb VLQ=2 
output k0_u1_single_a" >> "$filename"         #Initialization commands here

for (( i = 1; i<=$iter_number; i++ ))
do

lqmass=`head -$i $massfilename | tail -1 | awk {'print $1'}`               #First column of input text file.
rhnmass=`head -$i $massfilename | tail -1 | awk {'print $2'}`              #Second column of input text file. 
echo -e "launch -n run$i
set param_card yuku1ll 3 3 1 
set param_card mass $pdg_rhn $rhnmass 
set param_card mass $pdg_lq $lqmass" >> "$filename"                        #Loop commands here

done


#../bin/mg5_amc $filename                                                  #Uncomment to run directly

exit 0
