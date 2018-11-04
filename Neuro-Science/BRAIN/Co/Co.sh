#!/bin/bash
#
#PBS -l nodes=1:ppn=6
#PBS -q short
echo $PBS_O_WORKDIR && cd $PBS_O_WORKDIR

mkdir Co_H
flirt -omat Co_H/dmri_2_t1.mat -in dmri_H/t2.nii.gz -ref t1_H/t1.nii.gz -dof 6 -cost normmi # mutualinfo
convert_xfm -omat Co_H/t1_2_dmri.mat -inverse Co_H/dmri_2_t1.mat
#slicesdir $(imglob *)
flirt -out Co_H/t1_2_dmri.nii.gz -in t1_H/t1.nii.gz -ref dmri_H/t2.nii.gz -applyxfm -init Co_H/t1_2_dmri.mat
#bet
#flirt -out t1_H/bt1_help_mask.nii.gz -in dmri_H/bt2_mask.nii.gz -ref t1_H/t1.nii.gz -applyxfm -init Co_H/dmri_2_t1.mat -interp nearestneighbour
#bet t1.nii.gz bt1.nii.gz -f 0.3 -R
#fslmaths t1_H/bt1.nii.gz -mas t1_H/bt1_help_mask.nii.gz t1_H/bt1.nii.gz

