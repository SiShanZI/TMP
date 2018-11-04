#!/bin/bash
#
#PBS -l nodes=1:ppn=6
#PBS -q short
echo $PBS_O_WORKDIR && cd $PBS_O_WORKDIR

Par=/lustre/shulab/Sue/Def/Brain/Co/Fsl_MNI_aal_90.nii.gz #####
flirt -omat Co_H/t1_2_MNI_affine.mat -in t1_H/bt1.nii.gz -ref ${FSLDIR}/data/standard/MNI152_T1_2mm_brain.nii.gz -dof 12
#slicesdir $(imglob *)
fnirt --cout=Co_H/Warp_t1_2_MNI_nl.nii.gz --iout=Co_H/t1_2_MNI.nii.gz --in=t1_H/t1.nii.gz --aff=Co_H/t1_2_MNI_affine.mat --config=T1_2_MNI152_2mm
invwarp --out=Co_H/Warp_MNI_2_t1_nl.nii.gz --ref=t1_H/t1.nii.gz --warp=Co_H/Warp_t1_2_MNI_nl.nii.gz
applywarp --out=Co_H/dmri_par.nii.gz --in=${Par} --ref=dmri_H/t2.nii.gz --interp=nn --warp=Co_H/Warp_MNI_2_t1_nl.nii.gz --postmat=Co_H/t1_2_dmri.mat

