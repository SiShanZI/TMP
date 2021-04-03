function trk_Matrix(trk, atlas, weight, scale); if nargin < 4; scale = 1:90; end
%
% Author: Tengda Zhao, Sep 2013 | 1st_edit: Chenxi Wang, Oct 2016
% BNU
%
[header, tracks] = trk_R(trk);
atlas = spm_read_vols(spm_vol(atlas)); weight = spm_read_vols(spm_vol(weight));
[Xlim, Ylim, Zlim] = deal(header.dim(1), header.dim(2), header.dim(3));
%
Fibers_mm = {}; Fibers_vox = {};
for i = 1:length(tracks)
Fibers_mm{i} = tracks(i).matrix;
Fibers_vox{i} = floor(tracks(i).matrix ./ repmat(header.voxel_size, tracks(i).nPoints, 1) + 1);
end
%
Matrix_FibN = zeros(length(scale), length(scale));
Matrix_VoxN = zeros(length(scale), length(scale));
Matrix_Weig = zeros(length(scale), length(scale));
header_sig = header; tracks_sig = [];
%
for i = 1:length(Fibers_vox); if size(Fibers_vox{i}, 1) > 4; if all(Fibers_vox{i}(:, 1) > 0) && all(Fibers_vox{i}(:, 1) <= Xlim) && all(Fibers_vox{i}(:, 2) > 0) && all(Fibers_vox{i}(:, 2) <= Ylim) && all(Fibers_vox{i}(:, 3) > 0) && all(Fibers_vox{i}(:, 3) <= Zlim);
m = atlas(Fibers_vox{i}(1, 1), Fibers_vox{i}(1, 2), Fibers_vox{i}(1, 3)); n = atlas(Fibers_vox{i}(end, 1), Fibers_vox{i}(end, 2), Fibers_vox{i}(end, 3));
if ~isempty(find(scale == m)) && ~isempty(find(scale == n)) && m ~= n
%
tracks_sig = [tracks_sig, tracks(i)];
Matrix_FibN(m, n) = Matrix_FibN(m, n) + 1; Matrix_FibN(n, m) = Matrix_FibN(m, n);
Matrix_VoxN(m, n) = Matrix_VoxN(m, n) + size(Fibers_vox{i}, 1); Matrix_VoxN(n, m) = Matrix_VoxN(m, n);
Matrix_Weig(m, n) = Matrix_Weig(m, n) + sum(weight(sub2ind(size(weight), Fibers_vox{i}(:, 1), Fibers_vox{i}(:, 2), Fibers_vox{i}(:, 3)))); Matrix_Weig(n, m) = Matrix_Weig(m, n);
%
end
end; end; end
%
Matrix_Weig = Matrix_Weig ./ Matrix_VoxN; Matrix_Weig(isnan(Matrix_Weig)) = 0;
header_sig.n_count = length(tracks_sig); trk_W(header_sig, tracks_sig, 'Sig8.trk');
save('Matrix8', 'Matrix_FibN')
end
%