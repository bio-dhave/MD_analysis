## ---------------------------
##
## Script name: stability_analysis.sh
##
## Purpose of script:
##    This code provides the results of RMSD and RMSF analysis
##    to validate the stability of the complexes simulated
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
##
## Notes:
##  The input files need to be prepared with the prep.sh. 
##  The echo arguments refer to the number corresponding in
##    the complex' index (Gromacs file ndx), such as Protein 
##    or Backbone or others. 
##    In this case 0 stands for System while 3 is for C-alpha.
##
## ---------------------------

#!/bin/bash

$1=traj_species1
$2=traj_species2
$3=traj_species3

## ---------------------------
## RMSD calculation on C-alpha
## input: the first frame pdb and the trajectory setted to 0,
##  both prepared with prep.sh.
## purpose: to calculate the RMSD of the carbon alpha of the
##  complexes and evaluate if the simulation time is sufficient
##  to reach the plateau.

echo "3 3" | nohup gmx rms -s first_frame_$1.pdb -f $1_time.xtc -tu ns -o $1_rmsd_calpha.xvg
echo "3 3" | nohup gmx rms -s first_frame_$2.pdb -f $2_time.xtc -tu ns -o $2_rmsd_calpha.xvg
echo "3 3" | nohup gmx rms -s first_frame_$3.pdb -f $3_time.xtc -tu ns -o $3_rmsd_calpha.xvg

## ---------------------------
## RMSF calculation on C-alpha
## input: the first frame pdb and the trajectory setted to 0,
##  both prepared with prep.sh.
## purpose: to calculate the RMSF of the carbon alpha of the
##  complexes and estabilish the residues flucuations.

echo "3" | nohup gmx rmsf -s first_frame_$1.pdb -f $1_time.xtc -res -o $1_rmsf_calpha.xvg
echo "3" | nohup gmx rmsf -s first_frame_$2.pdb -f $2_time.xtc -res -o $2_rmsf_calpha.xvg
echo "3" | nohup gmx rmsf -s first_frame_$3.pdb -f $3_time.xtc -res -o $3_rmsf_calpha.xvg
