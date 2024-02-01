#!/bin/bash

# Check if three arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <filename> <nohupfilename> <outputfilename>"
    exit 1
fi

filename="$1"                                           #File with MG5 commands 
nohupfilename="$2"                                      #Name of file where bash output is stored. 
outputfilename="$3"                                     #Name of file where cross-section data is saved

rm nohup.out                                            #Removes previous output
nohup ../bin/mg5_aMC "$filename"                        #Run 
cp nohup.out "$nohupfilename"                           #Copy output 
grep "Cross-section :" "$nohupfilename" > temp1         #Copy lines with cross-section
awk '{print $3}' temp1 > "$outputfilename"              #Save only value
rm temp1
#rm $nohupfilename                                      #Comment in if you do not want to save the nohup out

