#!/bin/bash
#
# Customized batch script for Chenxi to calculate DTI metrics in the spinal cord white matter between C1 and C5.
# get ready: RPI, disc_Z

# t1
#
cd t1_C
# Smooth along z (to improve segmentation)
# sct_maths -i t1.nii.gz -smooth 0,0,3 -o t1_smooth.nii.gz >/dev/null 2>&1
# Spinal cord segmentation
sct_propseg -i t1.nii.gz -c t1 >/dev/null 2>&1
# fslview t1.nii.gz t1_seg.nii.gz -l Red -b 0,1 -t 0.7 &
# Vertebral labeling
sct_label_vertebrae -i t1.nii.gz -s t1_seg.nii.gz -initz $(cat disc_Z) >/dev/null 2>&1
# fslview t1.nii.gz t1_seg_labeled.nii.gz -l Random-Rainbow -t 0.5 &
# Tips: We choose these levels since we are interested in quantifying at these levels
sct_label_utils -i t1_seg_labeled.nii.gz -p label-vertebrae -vert 3,7 >/dev/null 2>&1
# Register to template
sct_register_to_template -i t1.nii.gz -s t1_seg.nii.gz -l labels.nii.gz >/dev/null 2>&1
# fslview t1.nii.gz template2anat -b 0,4000 &
# Warp template
sct_warp_template -d t1.nii.gz -w warp_template2anat.nii.gz >/dev/null 2>&1 && cp label/template/MNI-Poly-AMU_GM.nii.gz t1_proGM.nii.gz && cp label/template/MNI-Poly-AMU_WM.nii.gz t1_proWM.nii.gz
# fslview t1.nii.gz label/template/MNI-Poly-AMU_T2.nii.gz -b 0,4000 label/template/MNI-Poly-AMU_level.nii.gz -l MGH-Cortical -t 0.5 label/template/MNI-Poly-AMU_GM.nii.gz -l Red-Yellow -b 0.5,1 label/template/MNI-Poly-AMU_WM.nii.gz -l Blue-Lightblue -b 0.5,1 &
cd ..

# dmri
#
cd dmri_C
# bring T1 segmentation in dmri space to create mask (no optimization)
sct_maths -i dmri.nii.gz -mean t -o dmri_mean.nii.gz >/dev/null 2>&1
sct_register_multimodal -i ../t1_C/t1_seg.nii.gz -d dmri_mean.nii.gz -identity 1 -x nn >/dev/null 2>&1 && rm -f warp* dmri_mean_reg.nii.gz
# create mask to help moco and for faster processing
sct_create_mask -i dmri_mean.nii.gz -o mask.nii.gz -p centerline,t1_seg_reg.nii.gz -size 71 >/dev/null 2>&1 && rm -f t1_seg_reg.nii.gz
# fslview dmri_mean.nii.gz mask.nii.gz -l Red -t 0.5 &
# crop data
sct_crop_image -i dmri.nii.gz -o dmri_crop.nii.gz -m mask.nii.gz -dim 0,1,2 >/dev/null 2>&1
# fslview dmri_crop.nii.gz &
# motion correction
sct_dmri_moco -i dmri_crop.nii.gz -bvec bvecs >/dev/null 2>&1 && rm -f b0*
# Compute DTI
sct_dmri_compute_dti -i dmri_crop_moco.nii.gz -bval bvals -bvec bvecs >/dev/null 2>&1
# segmentation with propseg
sct_propseg -i dwi_moco_mean.nii.gz -c t1 >/dev/null 2>&1
# fslview dwi_moco_mean.nii.gz -b 0,300 dwi_moco_mean_seg.nii.gz -l Red -b 0,1 -t 0.7 &
# Register template to dwi
sct_register_multimodal -i ../t1_C/label/template/MNI-Poly-AMU_T2.nii.gz -d dwi_moco_mean.nii.gz -iseg ../t1_C/label/template/MNI-Poly-AMU_cord.nii.gz -dseg dwi_moco_mean_seg.nii.gz -param step=1,type=seg,algo=slicereg2d_translation,metric=MeanSquares:step=2,type=seg,algo=bsplinesyn,metric=MeanSquares >/dev/null 2>&1
# Concatenate transfo: (1) template -> anat ; (2) anat -> dmri
sct_concat_transfo -w ../t1_C/warp_template2anat.nii.gz,warp_MNI-Poly-AMU_T22dwi_moco_mean.nii.gz -d dwi_moco_mean.nii.gz -o warp_template2dmri.nii.gz >/dev/null 2>&1 && rm -f warp_*MNI-Poly-AMU_T2* *reg*
# Warp template and white matter atlas
sct_warp_template -d dwi_moco_mean.nii.gz -w warp_template2dmri.nii.gz >/dev/null 2>&1
# fslview dwi_moco_mean.nii.gz -b 0,300 label/template/MNI-Poly-AMU_T2.nii.gz -b 0,4000 label/template/MNI-Poly-AMU_level.nii.gz -l MGH-Cortical -t 0.5 label/template/MNI-Poly-AMU_GM.nii.gz -l Red-Yellow -b 0.5,1 label/template/MNI-Poly-AMU_WM.nii.gz -l Blue-Lightblue -b 0.5,1 &
cd ..
#
