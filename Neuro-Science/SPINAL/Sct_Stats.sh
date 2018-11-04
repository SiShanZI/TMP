#!/bin/bash
# change "div", "Stats", "atlas -vert"

div=(1 2 3 4 5 6 7 1:2 2:3 3:4 4:5 5:6 6:7 1:7)
DTI=(AD FA MD RD)
WMtr=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29

# t1
cd t1_C
mkdir Stats
#
for d in ${div[@]}; do
sct_process_segmentation -i t1_seg.nii.gz -p csa -vert $d >/dev/null 2>&1
rm -f csa.txt csa_volume.nii.gz && mv csa_mean.txt Stats/Cord_csa_${d} && mv volume.txt Stats/Cord_vol_${d}
sct_process_segmentation -i t1_proGM.nii.gz -p csa -vert $d >/dev/null 2>&1
rm -f csa.txt csa_volume.nii.gz && mv csa_mean.txt Stats/GM_csa_${d} && mv volume.txt Stats/GM_vol_${d}
sct_process_segmentation -i t1_proWM.nii.gz -p csa -vert $d >/dev/null 2>&1
rm -f csa.txt csa_volume.nii.gz && mv csa_mean.txt Stats/WM_csa_${d} && mv volume.txt Stats/WM_vol_${d}
done
#
cd Stats
cat Cord_csa* > div_csa_Cord && cat Cord_vol* > div_vol_Cord
cat GM_csa* > div_csa_GM && cat GM_vol* > div_vol_GM
cat WM_csa* > div_csa_WM && cat WM_vol* > div_vol_WM
rm -f Cord_* GM_* WM_*
cd ..
#
cd ..

# dmri
cd dmri_C
mkdir Stats
#
for d in ${div[@]}; do
for dti in ${DTI[@]}; do
sct_extract_metric -i dti_${dti}.nii.gz -f label/atlas -l sc -vert $d -o Cord_${dti}_${d} -method map >/dev/null 2>&1 && mv Cord_${dti}_${d} Stats
sct_extract_metric -i dti_${dti}.nii.gz -f label/atlas -l gm -vert $d -o GM_${dti}_${d} -method map >/dev/null 2>&1 && mv GM_${dti}_${d} Stats
sct_extract_metric -i dti_${dti}.nii.gz -f label/atlas -l wm -vert $d -o WM_${dti}_${d} -method map >/dev/null 2>&1 && mv WM_${dti}_${d} Stats
done
done
#
for dti in ${DTI[@]}; do
sct_extract_metric -i dti_${dti}.nii.gz -f label/atlas -l ${WMtr} -vert 1:7 -o WMtr_${dti} -method map >/dev/null 2>&1 && mv WMtr_${dti} Stats
done
#
cd Stats
cat Cord_AD* > div_AD_Cord && cat Cord_FA* > div_FA_Cord && cat Cord_MD* > div_MD_Cord && cat Cord_RD* > div_RD_Cord
cat GM_AD* > div_AD_GM && cat GM_FA* > div_FA_GM && cat GM_MD* > div_MD_GM && cat GM_RD* > div_RD_GM
cat WM_AD* > div_AD_WM && cat WM_FA* > div_FA_WM && cat WM_MD* > div_MD_WM && cat WM_RD* > div_RD_WM
rm -f Cord_* GM_* WM_*
cd ..
#
cd ..
#
