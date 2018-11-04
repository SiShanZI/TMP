#!/bin/bash
#
#PBS -l nodes=1:ppn=6
#PBS -q short
echo $PBS_O_WORKDIR && cd $PBS_O_WORKDIR

cd dmri_H
eddy_correct dmri dmri_moco 0

fslroi dmri_moco t2 0 1
bet t2 bt2 -m -f 0.1

fdt_rotate_bvecs bvecs bvecs_rot *ecclog
dtifit -k dmri_moco -o dti -r bvecs_rot -b bvals -m *mask*
fslmaths dti_FA.nii.gz -min 1 -ero Mask_FA.nii.gz

mkdir dti
mv dti*.nii.gz dti
cd dti
cp dti_L1.nii.gz dti_AD.nii.gz
fslmaths dti_L2.nii.gz -add dti_L3.nii.gz -div 2 dti_RD.nii.gz
cd ..
cd ..

