## ---------------------------
##
## Script name: stability_analysis.sh
##
## Purpose of script:
##    This code provides the results of RMSD and RMSF analysis
##    to understand the stability of the complexes simulated
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
##    In this case 0 stands for System while 3 is for C-alpha
##
## ---------------------------


## ---------------------------

#!/bin/bash

#RMSD Calpha
#cristatus
echo "3 3" | nohup gmx rms -s cristatus/noATP/md_0_noATP_B1B1.pdb -f cristatus/noATP/md_noATP_B1B1_time.xtc -tu ns -o cristatus/noATP/B1B1_rmsd.xvg
echo "3 3" | nohup gmx rms -s cristatus/noATP/md_0_noATP_B1B2.pdb -f cristatus/noATP/md_noATP_B1B2_time.xtc -tu ns -o cristatus/noATP/B1B2_rmsd.xvg
echo "3 3" | nohup gmx rms -s cristatus/noATP/md_0_noATP_B2B2.pdb -f cristatus/noATP/md_noATP_B2B2_time.xtc -tu ns -o cristatus/noATP/B2B2_rmsd.xvg
#marthae
echo "3 3" | nohup gmx rms -s marthae/noATP/md_0_noATP_B1B1.pdb -f marthae/noATP/md_noATP_B1B1_time.xtc -tu ns -o marthae/noATP/B1B1_rmsd.xvg
echo "3 3" | nohup gmx rms -s marthae/noATP/md_0_noATP_B1B2.pdb -f marthae/noATP/md_noATP_B1B2_time.xtc -tu ns -o marthae/noATP/B1B2_rmsd.xvg
echo "3 3" | nohup gmx rms -s marthae/noATP/md_0_noATP_B2B2.pdb -f marthae/noATP/md_noATP_B2B2_time.xtc -tu ns -o marthae/noATP/B2B2_rmsd.xvg
#pallidus
echo "3 3" | nohup gmx rms -s marthae/noATP/md_0_noATP_B1B1.pdb -f marthae/noATP/md_noATP_B1B1_time.xtc -tu ns -o marthae/noATP/B1B1_rmsd.xvg
echo "3 3" | nohup gmx rms -s marthae/noATP/md_0_noATP_B1B2.pdb -f marthae/noATP/md_noATP_B1B2_time.xtc -tu ns -o marthae/noATP/B1B2_rmsd.xvg
echo "3 3" | nohup gmx rms -s marthae/noATP/md_0_noATP_B2B2.pdb -f marthae/noATP/md_noATP_B2B2_time.xtc -tu ns -o marthae/noATP/B2B2_rmsd.xvg

#RMSF Calpha
#cristatus
echo "3" | nohup gmx rmsf -s cristatus/noATP/md_0_noATP_B1B1.pdb -f cristatus/noATP/md_noATP_70ns_B1B1.xtc -res -o cristatus/noATP/B1B1_rmsf.xvg
echo "3" | nohup gmx rmsf -s cristatus/noATP/md_0_noATP_B1B2.pdb -f cristatus/noATP/md_noATP_70ns_B1B2.xtc -res -o cristatus/noATP/B1B2_rmsf.xvg
echo "3" | nohup gmx rmsf -s cristatus/noATP/md_0_noATP_B2B2.pdb -f cristatus/noATP/md_noATP_70ns_B2B2.xtc -res -o cristatus/noATP/B2B2_rmsf.xvg
#marthae
echo "3" | nohup gmx rmsf -s marthae/noATP/md_0_noATP_B1B1.pdb -f marthae/noATP/md_noATP_70ns_B1B1.xtc -res -o marthae/noATP/B1B1_rmsf.xvg
echo "3" | nohup gmx rmsf -s marthae/noATP/md_0_noATP_B1B2.pdb -f marthae/noATP/md_noATP_70ns_B1B2.xtc -res -o marthae/noATP/B1B2_rmsf.xvg
echo "3" | nohup gmx rmsf -s marthae/noATP/md_0_noATP_B2B2.pdb -f marthae/noATP/md_noATP_70ns_B2B2.xtc -res -o marthae/noATP/B2B2_rmsf.xvg
#pallidus
echo "3" | nohup gmx rmsf -s pallidus/noATP/md_0_noATP_B1B1.pdb -f pallidus/noATP/md_noATP_70ns_B1B1.xtc -res -o pallidus/noATP/B1B1_rmsf.xvg
echo "3" | nohup gmx rmsf -s pallidus/noATP/md_0_noATP_B1B2.pdb -f pallidus/noATP/md_noATP_70ns_B1B2.xtc -res -o pallidus/noATP/B1B2_rmsf.xvg
echo "3" | nohup gmx rmsf -s pallidus/noATP/md_0_noATP_B2B2.pdb -f pallidus/noATP/md_noATP_70ns_B2B2.xtc -res -o pallidus/noATP/B2B2_rmsf.xvg

'''
#skippo ogni 10 frame
#cristatus
echo "0" | nohup gmx trjconv -s cristatus/noATP/md_0_noATP_B1B1.pdb -f cristatus/noATP/md_noATP_70ns_B1B1.xtc -skip 10 -o cristatus/noATP/md_noATP_skip10_B1B1.xtc
echo "0" | nohup gmx trjconv -s cristatus/noATP/md_0_noATP_B1B2.pdb -f cristatus/noATP/md_noATP_70ns_B1B2.xtc -skip 10 -o cristatus/noATP/md_noATP_skip10_B1B2.xtc
echo "0" | nohup gmx trjconv -s cristatus/noATP/md_0_noATP_B2B2.pdb -f cristatus/noATP/md_noATP_70ns_B2B2.xtc -skip 10 -o cristatus/noATP/md_noATP_skip10_B2B2.xtc
#marthae
echo "0" | nohup gmx trjconv -s marthae/noATP/md_0_noATP_B1B1.pdb -f marthae/noATP/md_noATP_70ns_B1B1.xtc -skip 10 -o marthae/noATP/md_noATP_skip10_B1B1.xtc
echo "0" | nohup gmx trjconv -s marthae/noATP/md_0_noATP_B1B2.pdb -f marthae/noATP/md_noATP_70ns_B1B2.xtc -skip 10 -o marthae/noATP/md_noATP_skip10_B1B2.xtc
echo "0" | nohup gmx trjconv -s marthae/noATP/md_0_noATP_B2B2.pdb -f marthae/noATP/md_noATP_70ns_B2B2.xtc -skip 10 -o marthae/noATP/md_noATP_skip10_B2B2.xtc
#pallidus
echo "0" | nohup gmx trjconv -s pallidus/noATP/md_0_noATP_B1B1.pdb -f pallidus/noATP/md_noATP_70ns_B1B1.xtc -skip 10 -o pallidus/noATP/md_noATP_skip10_B1B1.xtc
echo "0" | nohup gmx trjconv -s pallidus/noATP/md_0_noATP_B1B2.pdb -f pallidus/noATP/md_noATP_70ns_B1B2.xtc -skip 10 -o pallidus/noATP/md_noATP_skip10_B1B2.xtc
echo "0" | nohup gmx trjconv -s pallidus/noATP/md_0_noATP_B2B2.pdb -f pallidus/noATP/md_noATP_70ns_B2B2.xtc -skip 10 -o pallidus/noATP/md_noATP_skip10_B2B2.xtc

#PCA Calpha
#cristatus
echo "3 3" | nohup gmx covar -s cristatus/noATP/md_0_noATP_B1B1.pdb -f cristatus/noATP/md_noATP_skip10_B1B1.xtc \
  -o cristatus/noATP/PCA/B1B1_eigenval.xvg -v cristatus/noATP/PCA/B1B1_eigenvec.trr -ascii cristatus/noATP/PCA/B1B1_covariance_matrix.dat -l cristatus/noATP/PCA/B1B1_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v cristatus/noATP/PCA/B1B1_eigenvec.trr -s cristatus/noATP/md_0_noATP_B1B1.pdb -f cristatus/noATP/md_noATP_skip10_B1B1.xtc \
 -eig cristatus/noATP/PCA/B1B1_eigenval.xvg -proj cristatus/noATP/PCA/B1B1_proj.xvg -2d cristatus/noATP/PCA/B1B1_2dproj.xvg -rmsf cristatus/noATP/PCA/B1B1_rmsf.xvg \
 -extr cristatus/noATP/PCA/B1B1_extrPC_collective.pdb -tu ns -first 1 -last 2 -max 0 -nframes 10

echo "3 3" | nohup gmx covar -s cristatus/noATP/md_0_noATP_B1B2.pdb -f cristatus/noATP/md_noATP_skip10_B1B2.xtc \
  -o cristatus/noATP/PCA/B1B2_eigenval.xvg -v cristatus/noATP/PCA/B1B2_eigenvec.trr -ascii cristatus/noATP/PCA/B1B2_covariance_matrix.dat -l cristatus/noATP/PCA/B1B2_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v cristatus/noATP/PCA/B1B2_eigenvec.trr -s cristatus/noATP/md_0_noATP_B1B2.pdb -f cristatus/noATP/md_noATP_skip10_B1B2.xtc \
 -eig cristatus/noATP/PCA/B1B2_eigenval.xvg -proj cristatus/noATP/PCA/B1B2_proj.xvg -2d cristatus/noATP/PCA/B1B2_2dproj.xvg -rmsf cristatus/noATP/PCA/B1B2_rmsf.xvg \
 -extr cristatus/noATP/PCA/B1B2_extrPC_collective.pdb -tu ns -first 1 -last 2 -max 0 -nframes 10

echo "3 3" | nohup gmx covar -s cristatus/noATP/md_0_noATP_B2B2.pdb -f cristatus/noATP/md_noATP_skip10_B2B2.xtc \
  -o cristatus/noATP/PCA/B2B2_eigenval.xvg -v cristatus/noATP/PCA/B2B2_eigenvec.trr -ascii cristatus/noATP/PCA/B2B2_covariance_matrix.dat -l cristatus/noATP/PCA/B2B2_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v cristatus/noATP/PCA/B2B2_eigenvec.trr -s cristatus/noATP/md_0_noATP_B2B2.pdb -f cristatus/noATP/md_noATP_skip10_B2B2.xtc \
 -eig cristatus/noATP/PCA/B2B2_eigenval.xvg -proj cristatus/noATP/PCA/B2B2_proj.xvg -2d cristatus/noATP/PCA/B2B2_2dproj.xvg -rmsf cristatus/noATP/PCA/B2B2_rmsf.xvg \
 -extr cristatus/noATP/PCA/B2B2_extrPC_collective.pdb -tu ns -first 1 -last 2 -max 0 -nframes 10

#marthae
echo "3 3" | nohup gmx covar -s marthae/noATP/md_0_noATP_B1B1.pdb -f marthae/noATP/md_noATP_skip10_B1B1.xtc \
  -o marthae/noATP/PCA/B1B1_eigenval.xvg -v marthae/noATP/PCA/B1B1_eigenvec.trr -ascii marthae/noATP/PCA/B1B1_covariance_matrix.dat -l marthae/noATP/PCA/B1B1_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v marthae/noATP/PCA/B1B1_eigenvec.trr -s marthae/noATP/md_0_noATP_B1B1.pdb -f marthae/noATP/md_noATP_skip10_B1B1.xtc \
 -eig marthae/noATP/PCA/B1B1_eigenval.xvg -proj marthae/noATP/PCA/B1B1_proj.xvg -2d marthae/noATP/PCA/B1B1_2dproj.xvg -rmsf marthae/noATP/PCA/B1B1_rmsf.xvg \
 -extr marthae/noATP/PCA/B1B1_extrPC_collective.pdb -tu ns -first 1 -last 2 -max 0 -nframes 10

echo "3 3" | nohup gmx covar -s marthae/noATP/md_0_noATP_B1B2.pdb -f marthae/noATP/md_noATP_skip10_B1B2.xtc \
  -o marthae/noATP/PCA/B1B2_eigenval.xvg -v marthae/noATP/PCA/B1B2_eigenvec.trr -ascii marthae/noATP/PCA/B1B2_covariance_matrix.dat -l marthae/noATP/PCA/B1B2_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v marthae/noATP/PCA/B1B2_eigenvec.trr -s marthae/noATP/md_0_noATP_B1B2.pdb -f marthae/noATP/md_noATP_skip10_B1B2.xtc \
 -eig marthae/noATP/PCA/B1B2_eigenval.xvg -proj marthae/noATP/PCA/B1B2_proj.xvg -2d marthae/noATP/PCA/B1B2_2dproj.xvg -rmsf marthae/noATP/PCA/B1B2_rmsf.xvg \
 -extr marthae/noATP/PCA/B1B2_extrPC_collective.pdb -tu ns -first 1 -last 2 -max 0 -nframes 10

echo "3 3" | nohup gmx covar -s marthae/noATP/md_0_noATP_B2B2.pdb -f marthae/noATP/md_noATP_skip10_B2B2.xtc \
  -o marthae/noATP/PCA/B2B2_eigenval.xvg -v marthae/noATP/PCA/B2B2_eigenvec.trr -ascii marthae/noATP/PCA/B2B2_covariance_matrix.dat -l marthae/noATP/PCA/B2B2_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v marthae/noATP/PCA/B2B2_eigenvec.trr -s marthae/noATP/md_0_noATP_B2B2.pdb -f marthae/noATP/md_noATP_skip10_B2B2.xtc \
 -eig marthae/noATP/PCA/B2B2_eigenval.xvg -proj marthae/noATP/PCA/B2B2_proj.xvg -2d marthae/noATP/PCA/B2B2_2dproj.xvg -rmsf marthae/noATP/PCA/B2B2_rmsf.xvg \
 -extr marthae/noATP/PCA/B2B2_extrPC_collective.pdb -tu ns -first 1 -last 2 -max 0 -nframes 10

#pallidus
echo "3 3" | nohup gmx covar -s pallidus/noATP/md_0_noATP_B1B1.pdb -f pallidus/noATP/md_noATP_skip10_B1B1.xtc \
  -o pallidus/noATP/PCA/B1B1_eigenval.xvg -v pallidus/noATP/PCA/B1B1_eigenvec.trr -ascii pallidus/noATP/PCA/B1B1_covariance_matrix.dat -l pallidus/noATP/PCA/B1B1_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v pallidus/noATP/PCA/B1B1_eigenvec.trr -s pallidus/noATP/md_0_noATP_B1B1.pdb -f pallidus/noATP/md_noATP_skip10_B1B1.xtc \
 -eig pallidus/noATP/PCA/B1B1_eigenval.xvg -proj pallidus/noATP/PCA/B1B1_proj.xvg -2d pallidus/noATP/PCA/B1B1_2dproj.xvg -rmsf pallidus/noATP/PCA/B1B1_rmsf.xvg \
 -extr pallidus/noATP/PCA/B1B1_extrPC_collective.pdb -tu ns -first 1 -last 2 -max 0 -nframes 10

echo "3 3" | nohup gmx covar -s pallidus/noATP/md_0_noATP_B1B2.pdb -f pallidus/noATP/md_noATP_skip10_B1B2.xtc \
  -o pallidus/noATP/PCA/B1B2_eigenval.xvg -v pallidus/noATP/PCA/B1B2_eigenvec.trr -ascii pallidus/noATP/PCA/B1B2_covariance_matrix.dat -l pallidus/noATP/PCA/B1B2_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v pallidus/noATP/PCA/B1B2_eigenvec.trr -s pallidus/noATP/md_0_noATP_B1B2.pdb -f pallidus/noATP/md_noATP_skip10_B1B2.xtc \
 -eig pallidus/noATP/PCA/B1B2_eigenval.xvg -proj pallidus/noATP/PCA/B1B2_proj.xvg -2d pallidus/noATP/PCA/B1B2_2dproj.xvg -rmsf pallidus/noATP/PCA/B1B2_rmsf.xvg \
 -extr pallidus/noATP/PCA/B1B2_extrPC_collective.pdb -tu ns -first 1 -last 2 -max 0 -nframes 10

echo "3 3" | nohup gmx covar -s pallidus/noATP/md_0_noATP_B2B2.pdb -f pallidus/noATP/md_noATP_skip10_B2B2.xtc \
  -o pallidus/noATP/PCA/B2B2_eigenval.xvg -v pallidus/noATP/PCA/B2B2_eigenvec.trr -ascii pallidus/noATP/PCA/B2B2_covariance_matrix.dat -l pallidus/noATP/PCA/B2B2_covar.log -tu ns
echo "3 3" | nohup gmx anaeig -v pallidus/noATP/PCA/B2B2_eigenvec.trr -s pallidus/noATP/md_0_noATP_B2B2.pdb -f pallidus/noATP/md_noATP_skip10_B2B2.xtc \
 -eig pallidus/noATP/PCA/B2B2_eigenval.xvg -proj pallidus/noATP/PCA/B2B2_proj.xvg -2d pallidus/noATP/PCA/B2B2_2dproj.xvg -rmsf pallidus/noATP/PCA/B2B2_rmsf.xvg \
 -extr pallidus/noATP/PCA/B2B2_extrPC_collective.pdb -tu ns -first 1 -last 2 -max 0 -nframes 10


#cross-correlation matrices
#cristatus
python3 /work/dave/scripts/correlation_matrix.py -f cristatus/noATP/PCA/B1B1_covariance_matrix.dat -nres 578 -name cristatus/noATP/B1B1_crossmatrix.png
python3 /work/dave/scripts/correlation_matrix.py -f cristatus/noATP/PCA/B1B2_covariance_matrix.dat -nres 578 -name cristatus/noATP/B1B2_crossmatrix.png
python3 /work/dave/scripts/correlation_matrix.py -f cristatus/noATP/PCA/B2B2_covariance_matrix.dat -nres 578 -name cristatus/noATP/B2B2_crossmatrix.png
#marthae
python3 /work/dave/scripts/correlation_matrix.py -f marthae/noATP/PCA/B1B1_covariance_matrix.dat -nres 578 -name marthae/noATP/B1B1_crossmatrix.png
python3 /work/dave/scripts/correlation_matrix.py -f marthae/noATP/PCA/B1B2_covariance_matrix.dat -nres 578 -name marthae/noATP/B1B2_crossmatrix.png
python3 /work/dave/scripts/correlation_matrix.py -f marthae/noATP/PCA/B2B2_covariance_matrix.dat -nres 578 -name marthae/noATP/B2B2_crossmatrix.png
#pallidus
python3 /work/dave/scripts/correlation_matrix.py -f pallidus/noATP/PCA/B1B1_covariance_matrix.dat -nres 578 -name pallidus/noATP/B1B1_crossmatrix.png
python3 /work/dave/scripts/correlation_matrix.py -f pallidus/noATP/PCA/B1B2_covariance_matrix.dat -nres 578 -name pallidus/noATP/B1B2_crossmatrix.png
python3 /work/dave/scripts/correlation_matrix.py -f pallidus/noATP/PCA/B2B2_covariance_matrix.dat -nres 578 -name pallidus/noATP/B2B2_crossmatrix.png


#hydrogen bonds
cd cristatus/noATP/
vmd md_0_noATP_B1B1.pdb md_noATP_skip10_B1B1.xtc -dispdev none -e hb_protein_B1B1.vmd
vmd md_0_noATP_B1B2.pdb md_noATP_skip10_B1B2.xtc -dispdev none -e hb_protein_B1B2.vmd
vmd md_0_noATP_B2B2.pdb md_noATP_skip10_B2B2.xtc -dispdev none -e hb_protein_B2B2.vmd
#SB
vmd md_0_noATP_B1B1.pdb md_noATP_skip10_B1B1.xtc -dispdev none -e saltbr_B1B1.vmd
vmd md_0_noATP_B1B2.pdb md_noATP_skip10_B1B2.xtc -dispdev none -e saltbr_B1B2.vmd
vmd md_0_noATP_B2B2.pdb md_noATP_skip10_B2B2.xtc -dispdev none -e saltbr_B2B2.vmd
cd SB_B1B1
./salt2.sh
cd ../SB_B1B2
./salt2.sh
cd ../SB_B2B2
./salt2.sh
cd /work/dave/iguane/marthae/noATP
vmd md_0_noATP_B1B1.pdb md_noATP_skip10_B1B1.xtc -dispdev none -e hb_protein_B1B1.vmd
vmd md_0_noATP_B1B2.pdb md_noATP_skip10_B1B2.xtc -dispdev none -e hb_protein_B1B2.vmd
vmd md_0_noATP_B2B2.pdb md_noATP_skip10_B2B2.xtc -dispdev none -e hb_protein_B2B2.vmd
#SB
vmd md_0_noATP_B1B1.pdb md_noATP_skip10_B1B1.xtc -dispdev none -e saltbr_B1B1.vmd
vmd md_0_noATP_B1B2.pdb md_noATP_skip10_B1B2.xtc -dispdev none -e saltbr_B1B2.vmd
vmd md_0_noATP_B2B2.pdb md_noATP_skip10_B2B2.xtc -dispdev none -e saltbr_B2B2.vmd
cd SB_B1B1
./salt2.sh
cd ../SB_B1B2
./salt2.sh
cd ../SB_B2B2
./salt2.sh
cd /work/dave/iguane/pallidus/noATP
vmd md_0_noATP_B1B1.pdb md_noATP_skip10_B1B1.xtc -dispdev none -e hb_protein_B1B1.vmd
vmd md_0_noATP_B1B2.pdb md_noATP_skip10_B1B2.xtc -dispdev none -e hb_protein_B1B2.vmd
vmd md_0_noATP_B2B2.pdb md_noATP_skip10_B2B2.xtc -dispdev none -e hb_protein_B2B2.vmd
#SB
vmd md_0_noATP_B1B1.pdb md_noATP_skip10_B1B1.xtc -dispdev none -e saltbr_B1B1.vmd
vmd md_0_noATP_B1B2.pdb md_noATP_skip10_B1B2.xtc -dispdev none -e saltbr_B1B2.vmd
vmd md_0_noATP_B2B2.pdb md_noATP_skip10_B2B2.xtc -dispdev none -e saltbr_B2B2.vmd
cd SB_B1B2 
./salt2.sh
cd ../SB_B1B2 
./salt2.sh
cd ../SB_B2B2
./salt2.sh
cd /work/dave/iguane

#analizzo i file salt bridge prendendo solo quelli con distanza 4-6 e 6-8
#salvo tutto su un unico file in txt
#cristatus
echo "CRISTATUS B1B1" > /work/dave/iguane/SB_filtered_noATP.txt
for i in `ls -d /work/dave/iguane/cristatus/noATP/SB_B1B1` ; do
        for file in `ls -d $i/*.dat.txt` ; do
               sed 's/%//g;s/\./,/g' $file |  awk -vvar=$file 'NR==3, NR==4 {if ($5 >= 50) print var"\t"$0}'  | tee -a /work/dave/iguane/SB_filtered_noATP.txt
        done
done
echo "CRISTATUS B1B2" | tee -a /work/dave/iguane/SB_filtered_noATP.txt
for i in `ls -d /work/dave/iguane/cristatus/noATP/SB_B1B2` ; do
        for file in `ls -d $i/*.dat.txt` ; do
               sed 's/%//g;s/\./,/g' $file |  awk -vvar=$file 'NR==3, NR==4 {if ($5 >= 50) print var"\t"$0}'  | tee -a /work/dave/iguane/SB_filtered_noATP.txt
        done
done
echo "CRISTATUS B2B2" | tee -a /work/dave/iguane/SB_filtered_noATP.txt
for i in `ls -d /work/dave/iguane/cristatus/noATP/SB_B2B2` ; do
        for file in `ls -d $i/*.dat.txt` ; do
               sed 's/%//g;s/\./,/g' $file |  awk -vvar=$file 'NR==3, NR==4 {if ($5 >= 50) print var"\t"$0}'  | tee -a /work/dave/iguane/SB_filtered_noATP.txt
        done
done
#marthae
echo "MARTHAE B1B1" | tee -a /work/dave/iguane/SB_filtered_noATP.txt
for i in `ls -d /work/dave/iguane/marthae/noATP/SB_B1B1` ; do
        for file in `ls -d $i/*.dat.txt` ; do
               sed 's/%//g;s/\./,/g' $file |  awk -vvar=$file 'NR==3, NR==4 {if ($5 >= 50) print var"\t"$0}'  | tee -a /work/dave/iguane/SB_filtered_noATP.txt
        done
done
echo "MARTHAE B1B2" | tee -a /work/dave/iguane/SB_filtered_noATP.txt
for i in `ls -d /work/dave/iguane/marthae/noATP/SB_B1B2` ; do
        for file in `ls -d $i/*.dat.txt` ; do
               sed 's/%//g;s/\./,/g' $file |  awk -vvar=$file 'NR==3, NR==4 {if ($5 >= 50) print var"\t"$0}'  | tee -a /work/dave/iguane/SB_filtered_noATP.txt
        done
done
echo "MARTHAE B2B2" | tee -a /work/dave/iguane/SB_filtered_noATP.txt
for i in `ls -d /work/dave/iguane/marthae/noATP/SB_B2B2` ; do
        for file in `ls -d $i/*.dat.txt` ; do
               sed 's/%//g;s/\./,/g' $file |  awk -vvar=$file 'NR==3, NR==4 {if ($5 >= 50) print var"\t"$0}'  | tee -a /work/dave/iguane/SB_filtered_noATP.txt
        done
done
#pallidus
echo "PALLIDUS B1B1" | tee -a /work/dave/iguane/SB_filtered_noATP.txt
for i in `ls -d /work/dave/iguane/pallidus/noATP/SB_B1B1` ; do
        for file in `ls -d $i/*.dat.txt` ; do
               sed 's/%//g;s/\./,/g' $file |  awk -vvar=$file 'NR==3, NR==4 {if ($5 >= 50) print var"\t"$0}'  | tee -a /work/dave/iguane/SB_filtered_noATP.txt
        done
done
echo "PALLIDUS B1B2" | tee -a /work/dave/iguane/SB_filtered_noATP.txt
for i in `ls -d /work/dave/iguane/pallidus/noATP/SB_B1B2` ; do
        for file in `ls -d $i/*.dat.txt` ; do
               sed 's/%//g;s/\./,/g' $file |  awk -vvar=$file 'NR==3, NR==4 {if ($5 >= 50) print var"\t"$0}'  | tee -a /work/dave/iguane/SB_filtered_noATP.txt
        done
done
echo "PALLIDUS B2B2" | tee -a /work/dave/iguane/SB_filtered_noATP.txt
for i in `ls -d /work/dave/iguane/pallidus/noATP/SB_B2B2` ; do
        for file in `ls -d $i/*.dat.txt` ; do
               sed 's/%//g;s/\./,/g' $file |  awk -vvar=$file 'NR==3, NR==4 {if ($5 >= 50) print var"\t"$0}'  | tee -a /work/dave/iguane/SB_filtered_noATP.txt
        done
done
'''
