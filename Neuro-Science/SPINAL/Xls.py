#!/usr/bin/env python

import os
from glob import glob
import numpy as np
import nibabel as nib

def div_stack(div = 14, Path_1 = 't1_C/Stats', Path_2 = 'dmri_C/Stats', Xls = ['div_csa_Cord', 'div_vol_Cord', 'div_AD_Cord', 'div_FA_Cord', 'div_MD_Cord', 'div_RD_Cord', 'div_csa_GM', 'div_vol_GM', 'div_AD_GM', 'div_FA_GM', 'div_MD_GM', 'div_RD_GM', 'div_csa_WM', 'div_vol_WM', 'div_AD_WM', 'div_FA_WM', 'div_MD_WM', 'div_RD_WM']):
    """
    Output format: 
    One Sub: 
    |                                                                                                                                                |
    | C1, C1+C2, C1~C7, C2, C2+C3, C3, C3+C4, C4, C4+C5, C5, C5+C6, C6, C6+C7, C7                                                                    |
    | Cord_csa  Cord_vol  Cord_AD  Cord_FA  Cord_MD  Cord_RD  GM_csa  GM_vol  GM_AD  GM_FA  GM_MD  GM_RD  WM_csa  WM_vol  WM_AD  WM_FA  WM_MD  WM_RD |
    |                                                                                                                                                |
    """
    Op = []
    os.mkdir('tmp')
    tmp_abs = os.path.abspath('tmp')
    os.environ['tmp_abs'] = tmp_abs
    for i in [Path_1, Path_2]:
        for j in sorted(glob(i+'/div*')):
            jj = os.path.split(j)[1]
            os.environ['j'] = j
            os.environ['jj'] = jj
            os.system('cat $j | grep -v ^# | grep -v ^$ > ${tmp_abs}/${jj}')


    os.chdir('tmp')
    tmp_obj = map(lambda x : open(x, 'r').readlines(), Xls)
    for i in range(div):
        for j in range(len(Xls)):
            Op.append(tmp_obj[j][i].split(', ')[-2])


    os.chdir('..')
    os.system('rm -rf tmp')
    return Op

def WMtr_C(WMn = 30, Path = 'dmri_C/Stats', Xls = ['WMtr_AD', 'WMtr_FA', 'WMtr_MD', 'WMtr_RD']):
    """
    Output format: 
    One Sub: 
    |                  |                  |
    | WMtr_00          | WMtr_01          | ...
    | AD  FA  MD  RD   | AD  FA  MD  RD   | ...
    |                  |                  |
    """
    Op = []
    tmp_dir = os.getcwd()
    os.chdir(Path)
    tmp_obj = map(lambda x : open(x, 'r').readlines(), Xls)
    for i in range(1, WMn+1)[::-1]:
        for j in range(4):
            Op.append(tmp_obj[j][-i].split(', ')[-2])


    os.chdir(tmp_dir)
    return Op

def tbss_WMtr(Sub, Filter = 'all*', mask = 'mean_FA_skeleton_mask.nii.gz', Atlas = os.path.join(os.popen('echo -n $FSLDIR').read(), 'data/atlases/JHU/JHU-ICBM-labels-1mm.nii.gz')):
    """
    Atlas: JHU, $FSLDIR/data/atlases/JHU/JHU-ICBM-labels-1mm.nii.gz
    Output format: 
    |        |                  |                  |
    |        | WMtr_00          | WMtr_01          | ...
    |        | AD  FA  MD  RD   | AD  FA  MD  RD   | ...
    | Sub001 |                  |                  |
    | Sub002 |                  |                  |
    | ...    |                  |                  |

    """
    Op = []
    Op_tmp = []
    atlas = nib.load(Atlas).get_data()
    mask = nib.load(mask).get_data()
    Index = np.unique(atlas)[1:]
    for i in range(Sub):
        print i
        for j in sorted(glob(Filter)):
            Sub_dti = nib.load(j).dataobj[..., i]
            for k in Index:
                Op_tmp.append(np.sum(Sub_dti * (atlas == k)) / np.sum(mask * (atlas == k)))



    for i in range(Sub):
        for j in range(len(Index)):
            for k in range(4):
                Op.append(Op_tmp[i * 4 * len(Index) + j + k * len(Index)])



    np.savetxt('tbss_WMtr', np.array(Op).reshape(Sub, -1))

def tbss_glob(Sub, Filter = 'all*', mask = 'mean_FA_skeleton_mask.nii.gz'):
    """
    Output format: 
    |        |                                      |
    |        | tbss_AD  tbss_FA  tbss_MD  tbss_RD   |
    | Sub001 |                                      |
    | Sub002 |                                      |
    | ...    |                                      |

    """
    Op = []
    Deno = np.sum(nib.load(mask).get_data())
    for i in range(Sub):
        print i
        for j in sorted(glob(Filter)):
            tmp_img = nib.load(j).dataobj[..., i]
            Op.append(np.sum(tmp_img) / Deno)
        
    
    np.savetxt('tbss_glob', np.array(Op).reshape(Sub, -1))

def Sienax(File = 'report.sienax', Path = 't1_H/t1_sienax'):
    """
    Output format: 
    One Sub: 
    |           |          |           |          |           |          |            |           |            |           |
    | Br_volN   | Br_vol   | WM_volN   | WM_vol   | GM_volN   | GM_vol   | CSF_volN   | CSF_vol   | PGM_volN   | PGM_vol   |
    |           |          |           |          |           |          |            |           |            |           |
    """
    Op = []
    tmp_dir = os.getcwd()
    os.chdir(Path)
    tmp_obj = open(File, 'r').readlines()
    Op.append(float(tmp_obj[-1][:-1].split(' ')[-2]))
    Op.append(float(tmp_obj[-1][:-1].split(' ')[-1]))
    Op.append(float(tmp_obj[-2][:-1].split(' ')[-2]))
    Op.append(float(tmp_obj[-2][:-1].split(' ')[-1]))
    Op.append(float(tmp_obj[-3][:-1].split(' ')[-2]))
    Op.append(float(tmp_obj[-3][:-1].split(' ')[-1]))
    Op.append(float(tmp_obj[-4][:-1].split(' ')[-4]))
    Op.append(float(tmp_obj[-4][:-1].split(' ')[-3]))
    Op.append(float(tmp_obj[-5][:-1].split(' ')[-4]))
    Op.append(float(tmp_obj[-5][:-1].split(' ')[-3]))
    os.chdir(tmp_dir)
    return Op

