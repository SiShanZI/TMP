#!/bin/bash
#
#PBS -l nodes=1:ppn=6
#PBS -q short
echo $PBS_O_WORKDIR && cd $PBS_O_WORKDIR

# get ready: dmri_moco.nii.gz, bvecs_rot, Mask_FA.nii.gz(Mask_WM.nii.gz), dmri_par.nii.gz ## bt1.nii.gz, bt2.nii.gz

mkdir Mat_H
cp dmri_H/dmri_moco.nii.gz dmri_H/bvecs_rot dmri_H/Mask_FA.nii.gz Co_H/Mask_WM.nii.gz Co_H/dmri_par.nii.gz Mat_H
cd Mat_H
awk '{for(i=1; i<=NF; i++){Mat[FNR, i]=$i}}END{for(i=1; i<=NF; i++){for(j=1; j<=FNR; j++){printf Mat[j, i] " "}print ""}}' bvecs_rot > bvecs

fslchfiletype NIFTI Mask_FA.nii.gz Mask_FA.nii && rm -f Mask_FA.nii.gz
fslchfiletype NIFTI Mask_WM.nii.gz Mask_WM.nii && rm -f Mask_WM.nii.gz
fslchfiletype NIFTI dmri_par.nii.gz dmri_par.nii && rm -f dmri_par.nii.gz

dti_recon dmri_moco.nii.gz dti -gm bvecs -no_eigen -no_exp # -b 1000(default) -b0 1(num of b0 default)
rm -f dti_b0.nii dti_dwi.nii dti_fa.nii dti_fa_color.nii dti_adc.nii
dti_tracker dti dti.trk -m Mask_WM.nii 0.2 1 -at 45 -iz # -rseed -sm -ix -iy -iz -sxy -syz -sxz
dti_tracker dti dti8.trk -m Mask_WM.nii 0.2 1 -at 45 -iz -rseed 8 # -sm -ix -iy -iz -sxy -syz -sxz
# spline_filter dti_tmp.trk 1 dti.trk && rm -f *tmp*
cd ..

