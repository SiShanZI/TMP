function Spm_Case(template, atlas, bt1, bt2); if nargin < 3; bt1 = 'bt1.nii'; bt2 = 'bt2.nii'; end
%
load Spm_Case.mat
matlabbatch{1}.spm.spatial.coreg.estwrite.ref{1} = strcat(bt2, ',1');
matlabbatch{1}.spm.spatial.coreg.estwrite.source{1} = strcat(bt1, ',1');
matlabbatch{2}.spm.spatial.normalise.est.subj.source{1} = strcat('Co_', bt1, ',1');
matlabbatch{2}.spm.spatial.normalise.est.eoptions.template{1} = strcat(template, ',1');
matlabbatch{3}.spm.util.defs.fnames{1} = strcat(atlas, ',1');
matlabbatch{3}.spm.util.defs.comp{1}.inv.comp{1}.sn2def.matname{1} = strrep(strcat('Co_', bt1), '.nii', '_sn.mat');
matlabbatch{3}.spm.util.defs.comp{1}.inv.space{1} = strcat('Co_', bt1, ',1');
%
spm_jobman('run', matlabbatch);
end
%