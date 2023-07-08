## ---------------------------
##
## Script name: PCA.sh
##
## Purpose of script:
##    This code computes the Principal Component Analysis (PCA)
##    in an easy and fast way. 
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
##    In this case 0 stands for System and 3 for C-alpha.
##
## ---------------------------

#!/bin/bash

$1=traj_species1
$2=traj_species2
$3=traj_species3

## ---------------------------
## SKIPPING EVERY 10 FRAMES
## input: the first frame pdb and the trajectory setted to 0, both
##  prepared with prep.sh.
## purpose: this step is necessary to skip the trajectories and
##  save computational time. PCA can be a very expensive analysis,
##  especially if you have heavy trajectories. Here I skip every 10
##  frames because my trajectories were saved every 1000 steps (2ps)

echo "0" | nohup gmx trjconv -s first_frame_$1.pdb -f $1_time.xtc -skip 10 -o $1_skip10.xtc
echo "0" | nohup gmx trjconv -s first_frame_$2.pdb -f $2_time.xtc -skip 10 -o $2_skip10.xtc
echo "0" | nohup gmx trjconv -s first_frame_$3.pdb -f $3_time.xtc -skip 10 -o $3_skip10.xtc

## ---------------------------
## PCA calculations
## input: the first frame pdb prepared with prep.sh and the trajectory
##  skipped right now.
## purpose: to retrieve the covariance matrices, the 2d projections, the 
##  the RMSF on the first three eigenvectors. This step also allows to 
##  extract the collective motions of the complexes. 

echo "3 3" | nohup gmx covar -s -s first_frame_$1.pdb -f $1_skip10.xtc \
  -o $1_eigenval.xvg -v $1_eigenvec.trr -ascii $1_covariance_matrix.dat -l $1_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v $1_eigenvec.trr -s first_frame_$1.pdb -f $1_skip10.xtc \
 -eig $1_eigenval.xvg -proj $1_proj.xvg -2d $1_2dproj.xvg -rmsf $1_rmsf.xvg \
 -extr $1_extrPC_collective.pdb -tu ns -first 1 -last 3 -max 0 -nframes 250

echo "3 3" | nohup gmx covar -s -s first_frame_$2.pdb -f $2_skip10.xtc \
  -o $2_eigenval.xvg -v $2_eigenvec.trr -ascii $2_covariance_matrix.dat -l $2_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v $2_eigenvec.trr -s first_frame_$2.pdb -f $2_skip10.xtc \
 -eig $2_eigenval.xvg -proj $2_proj.xvg -2d $2_2dproj.xvg -rmsf $2_rmsf.xvg \
 -extr $2_extrPC_collective.pdb -tu ns -first 1 -last 3 -max 0 -nframes 250

 echo "3 3" | nohup gmx covar -s -s first_frame_$3.pdb -f $3_skip10.xtc \
  -o $3_eigenval.xvg -v $3_eigenvec.trr -ascii $3_covariance_matrix.dat -l $3_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v $3_eigenvec.trr -s first_frame_$3.pdb -f $3_skip10.xtc \
 -eig $3_eigenval.xvg -proj $3_proj.xvg -2d $3_2dproj.xvg -rmsf $3_rmsf.xvg \
 -extr $3_extrPC_collective.pdb -tu ns -first 1 -last 3 -max 0 -nframes 250
