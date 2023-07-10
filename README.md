# MD_analysis
<p align="justify">
A simple package of scripts for analyzing classical molecular dynamics (MD) trajectories 

#### 🐢 WHAT
<img align="right" src="https://media3.giphy.com/media/YztxmD3AAmnq8/giphy.gif?cid=ecf05e47jedaif3wllqjib35s13rnuodjt0hoz98tmgml4ry&ep=v1_gifs_search&rid=giphy.gif&ct=g" width=230>

This repository is created as a result of a project I participated in for structural analysis on the differences between hemoglobins of three species of iguanas living in different environmental conditions. In particular, the study aimed to understand the role of ATP in the structural stabilization of hemoglobin.

(Yeah, technically that emoji is a turtle, but the iguana's one is still missing).

#### 🌊 WHY
This repository contains the scripts used for the analysis of molecular dynamics trajectories (xtc files - Gromacs portable files) using the Gromacs 2022.5 suite. The performed analyses include:
- Root Mean Square Deviation (RMSD);
- Root Mean Square Fluctuations (RMSF);
- Principal Component Analysis (PCA);
- Hydrogen bonds analysis (HB);
- Salt bridges analysis (SB)

For each analysis, a sample result has been provided.

#### 💻 HOW
To use this script, it is necessary to have a Unix-based OS (e.g., Ubuntu) and have the Gromacs suite installed. If you haven't done it yet, Gromacs is an open-source software that can be installed by running the command 

```sudo apt-install gmx``` 


in the terminal. [Here](https://manual.gromacs.org/2022-current/index.html) you can check the Gromacs 2022.5 manual for everything else.

It is also necessary the VMD (Visual Molecular Dynamics) programme. You can install it referring to this [page](https://www.ks.uiuc.edu/Research/vmd/current/ig/ig.html).
</p>
