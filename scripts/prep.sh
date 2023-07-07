## ---------------------------
##
## Script name: prep.sh
##
## Purpose of script:
##    This code provides the files in the correct shape to
##    to be analyzed with the Gromacs suite.
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
##    the complex' index (Gromacs files ndx), such as Protein 
##    or Backbone or others. 
##    In this case 0 stands for System.
##
## ---------------------------


#!/bin/bash
## ---------------------------

$1=mytrajectory

## ---------------------------
## SET TIME
## input: the trajectory you want to analyze
## purpose: this step is essential to set the initial frame of the
##   trajectory to start from 0, allowing the further analyses to
##   not be misaligned.

echo "0 l" | nohup gmx trjcat -f $1.xtc -settime -o $1_time.xtc 

## ---------------------------
## EXTRACTION of THE FIRST FRAME
## input: the pdb file used to run the simulation (also tpr files
##  can be provided) and the trajectory previously treated.
## purpose: to save the first frame of the trajectory in a pdb 
##  file, containing the information about the 3D structure of 
##  simulated complex.

echo "0" | nohup gmx trjconv -s $1.pdb -f $1_time.xtc -dump 0 -o first_frame_$1.pdb
