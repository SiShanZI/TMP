#!/bin/bash
#
#PBS -l nodes=1:ppn=6
#PBS -q short
echo $PBS_O_WORKDIR && cd $PBS_O_WORKDIR

# slicesdir $(imglob *)
# Fsl_glm

tbss_1_preproc *.nii.gz; tbss_2_reg -T; tbss_3_postreg -S; tbss_4_prestats 0.2
tbss_non_FA MD; tbss_non_FA AD; tbss_non_FA RD
mv .tbsslog tbsslog

