#!/bin/bash
#
#PBS -l nodes=1:ppn=6
#PBS -q short
echo $PBS_O_WORKDIR && cd $PBS_O_WORKDIR

cd t1_H
fslreorient2std t1.nii.gz t1_std.nii.gz
mv t1.nii.gz t1_raw.nii.gz
mv t1_std.nii.gz t1_fullfov.nii.gz
robustfov -b $(cat Z) -r t1.nii.gz -i t1_fullfov.nii.gz  ##  180, Size + 10mm
bet t1.nii.gz bt1.nii.gz -f 0.3 -R
cd ..

