## ---------------------------
##
## Script name: interactions.sh
##
## Purpose of script:
##    This code provides the results of hydrogen bonds and 
##    salt bridges analyses to evaluate specific interaction
##    in the complexes.
##
## Author: Davide Pietrafesa
##
## Date Created: 2023-07-01
##
## Copyright (c) Davide Pietrafesa, 2023
## Email: davide.pietrafesa@uniroma2.it
##
## ---------------------------
## Gromacs version: 2022.5
## VMD version: 1.9.3
##
## Notes:
##  The input files require the hb.vmd and the saltbr.vmd scripts.
##
## ---------------------------

#!/bin/bash

$1=traj_species1
$2=traj_species2
$3=traj_species3

## ---------------------------
## Hydrogen bonds calculations
## input:  the first frame pbd files, prepared with the prep.sh, 
##  and the skipped trajectories, prepared with the PCA.sh.
## purpose: to compute the total and the average number of hydrogen
##  bonds of the complexes.

vmd first_frame_$1.pdb $1_skip10.xtc -dispdev none -e hb.vmd
for f in *hb_protein*; do mv "$f" "$(echo "$f" | sed s/hb_protein/total_hb_$1/)"; done 
vmd first_frame_$2.pdb $2_skip10.xtc -dispdev none -e hb.vmd
for f in *hb_protein*; do mv "$f" "$(echo "$f" | sed s/hb_protein/total_hb_$2/)"; done 
vmd first_frame_$3.pdb $3_skip10.xtc -dispdev none -e hb.vmd
for f in *hb_protein*; do mv "$f" "$(echo "$f" | sed s/hb_protein/total_hb_$3/)"; done 

mv *.dat *.xvg
echo "$1" > average_hb.txt | gmx analyze -f total_hb_$1.xvg | tee -a average_hb.txt
echo "$2" | tee -a average_hb.txt | gmx analyze -f total_hb_$2.xvg | tee -a average_hb.txt
echo "$3" | tee -a average_hb.txt | gmx analyze -f total_hb_$3.xvg | tee -a average_hb.txt

## ---------------------------
## Salt bridges calculations
## input:  the first frame pbd files, prepared with the prep.sh, 
##  and the skipped trajectories, prepared with the PCA.sh.
##  Because of the possible high number of outputs of this analysis
##  I suggest to create folders -specific for complexes- in which
##  perform the second part of this script. The saltbr.vmd script
##  must be in the new directory.
## purpose: to compute the total number of salt bridges.

mkdir ./$1_SB
cp saltbr.vmd ./$1_SB
cd ./$1_SB
vmd first_frame_$1.pdb $1_skip10.xtc -dispdev none -e saltbr.vmd

mkdir ./$2_SB
cp saltbr.vmd ./$2_SB
cd ./$2_SB
vmd first_frame_$2.pdb $2_skip10.xtc -dispdev none -e saltbr.vmd

mkdir ./$3_SB
cp saltbr.vmd ./$3_SB
cd ./$3_SB
vmd first_frame_$3.pdb $3_skip10.xtc -dispdev none -e saltbr.vmd
