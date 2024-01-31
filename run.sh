#!/bin/bash

filename="pp_qcd.txt"
massfilename="mass_lq.txt"
pdg=4210012

iter_number=$(wc -l < $massfilename)
rm $filename

echo -e "import model U1_noCKM_UFO/  
define pb = p b b~ a 
define u11x = u11 u11~
define jb = j j b 
generate pb pb > u11x u11x QCD==2 QED==0 VLQ==0 
output k0_u1_pairproduction" >> "$filename"

for (( i = 1; i<=$iter_number; i++ ))
do

imass=`head -$i $massfilename | tail -1 | awk {'print $1'}`
echo -e "launch -n run_mass$imass
set param_card yuku1ll 3 3 1 
set param_card mass $pdg $imass" >> "$filename"

done


#../bin/mg5_amc $filename

exit 0
