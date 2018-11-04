function [header, tracks] = trk_R(trk)
%
% Author: John Colby (johncolby@ucla.edu), Mar 2010, UCLA Developmental Cognitive Neuroimaging Group (Sowell Lab)
% 1st_edit: Tengda Zhao, Sep 2013, BNU 2nd_edit: Chenxi Wang, Oct 2016, BNU
%
fid = fopen(trk, 'rb', 'l'); header = get_header(fid); if header.hdr_size ~= 1000; fclose(fid); fid = fopen(trk, 'r', 'b'); header = get_header(fid); if header.hdr_size ~= 1000; error('Wrong in header! '); fclose(fid); end; end;
itrk = 0; while feof(fid) == 0; itrk = itrk+1;
tmp = fread(fid, 1, 'int32'); if tmp ~= 0;
tracks(itrk).nPoints = tmp;
tracks(itrk).matrix  = fread(fid, [3+header.n_scalars, tracks(itrk).nPoints], 'float32')'; if header.n_properties; tracks(itrk).props = fread(fid, header.n_properties, 'float32'); end;
header.n_count = itrk;
end; end; fclose(fid);
end
%
%
%
function header = get_header(fid)
%
header.id_string = fread(fid, 6, '*char')'; % transpose...
header.dim = fread(fid, 3, 'int16')'; header.voxel_size = fread(fid, 3, 'float32')';
header.origin = fread(fid, 3, 'float32')'; header.n_scalars = fread(fid, 1, 'int16')'; header.scalar_name = fread(fid, [20, 10], '*char')'; header.n_properties = fread(fid, 1, 'int16')'; header.property_name = fread(fid, [20, 10], '*char')';
header.vox_to_ras = fread(fid, [4, 4], 'float32')'; header.reserved = fread(fid, 444, '*char')'; header.voxel_order = fread(fid, 4, '*char')'; header.pad2 = fread(fid, 4, '*char')'; header.image_orientation_patient = fread(fid, 6, 'float32')'; header.pad1 = fread(fid, 2, '*char')';
header.invert_x = fread(fid, 1, 'uint8'); header.invert_y = fread(fid, 1, 'uint8'); header.invert_z = fread(fid, 1, 'uint8'); header.swap_xy = fread(fid, 1, 'uint8'); header.swap_yz = fread(fid, 1, 'uint8'); header.swap_zx = fread(fid, 1, 'uint8');
header.n_count = fread(fid, 1, 'int32')'; header.version = fread(fid, 1, 'int32')'; header.hdr_size = fread(fid, 1, 'int32')';
end
%

