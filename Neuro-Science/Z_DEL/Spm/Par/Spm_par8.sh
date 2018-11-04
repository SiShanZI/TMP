#!/bin/bash
# 1
##$ -S /bin/sh
#echo $1 && cd $1
# 2
#PBS -l nodes=1:ppn=6
#PBS -q short
#echo $PBS_O_WORKDIR && cd $PBS_O_WORKDIR
#
cd Mat_Spm_H
matlab -nodisplay << TAG
addpath(genpath('/home/wangchenxi/Documents/MATLAB/Spm8'));
load /home/wangchenxi/Data/Def/Brain/Co/Spm_par8.mat;
matlabbatch{1}.spm.spatial.coreg.estimate.ref = {'bt2.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estimate.source = {'bt1.nii,1'};
matlabbatch{2}.spm.spatial.normalise.est.subj.source = {'bt1.nii,1'};
matlabbatch{2}.spm.spatial.normalise.est.eoptions.template = {'/home/wangchenxi/Data/Def/Brain/Co/MNI152_T1_1mm_brain.nii,1'};
matlabbatch{3}.spm.util.defs.comp{1}.inv.comp{1}.sn2def.matname = {'bt1_sn.mat'};
matlabbatch{3}.spm.util.defs.comp{1}.inv.space = {'bt2.nii,1'};
matlabbatch{3}.spm.util.defs.fnames = {'/home/wangchenxi/Data/Def/Brain/Co/MRIcron_MNI_aal_90.nii,1'};
spm_jobman('run', matlabbatch);
exit
TAG
mv wMRIcron_MNI_aal_90.nii dmri_par.nii
cd ..

