#!/bin/bash
#
#PBS -l nodes=1:ppn=6
#PBS -q short
echo $PBS_O_WORKDIR && cd $PBS_O_WORKDIR

cd t1_H
mkdir fast
fast -g -p -o fast/Seg bt1.nii.gz
#fslstats fast/Seg_pve_1.nii.gz -V -M | awk '{print $2 * $3}'
cd ..

