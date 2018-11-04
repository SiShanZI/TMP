#!/bin/bash
# 1
##$ -S /bin/sh
#echo $1 && cd $1
# 2
#PBS -l nodes=1:ppn=6
#PBS -q short
#echo $PBS_O_WORKDIR && cd $PBS_O_WORKDIR
#
cd t1_H
fsl5.0-fslchfiletype NIFTI t1.nii.gz ts.nii
matlab -nodisplay << TAG
load /home/wangchenxi/Data/Def/Brain/T1/Seg.mat;
matlabbatch{1,1}.spm.spatial.preproc.channel.vols = {'ts.nii,1'};
spm_jobman('run', matlabbatch);
exit
TAG
mv c1ts.nii Seg_GM.nii && mv c2ts.nii Seg_WM.nii && mv c3ts.nii Seg_CSF.nii
TT=0.95 ##
fsl5.0-fslmaths Seg_WM.nii -thr $TT -add 1 -uthr 1 -add 1 -uthr 1.5 Mask_WM.nii.gz
cd ..
fsl5.0-flirt -out Co_H/Mask_WM.nii.gz -in t1_H/Mask_WM.nii.gz -ref dmri_H/t2.nii.gz -applyxfm -init Co_H/t1_2_dmri.mat -interp nearestneighbour

