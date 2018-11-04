function trk_W(header, tracks, trk)
%
% Author: John Colby (johncolby@ucla.edu), Apr 2010, UCLA Developmental Cognitive Neuroimaging Group (Sowell Lab)
% 1st_edit: Chenxi Wang, Oct 2016, BNU
%
% Write header
fid = fopen(trk, 'w');
fwrite(fid, header.id_string', '*char');
fwrite(fid, header.dim', 'int16'); fwrite(fid, header.voxel_size', 'float32');
fwrite(fid, header.origin', 'float32'); fwrite(fid, header.n_scalars', 'int16'); fwrite(fid, header.scalar_name', '*char'); fwrite(fid, header.n_properties', 'int16'); fwrite(fid, header.property_name', '*char');
fwrite(fid, header.vox_to_ras', 'float32'); fwrite(fid, header.reserved', '*char'); fwrite(fid, header.voxel_order', '*char'); fwrite(fid, header.pad2', '*char'); fwrite(fid, header.image_orientation_patient', 'float32'); fwrite(fid, header.pad1', '*char');
fwrite(fid, header.invert_x, 'uint8'); fwrite(fid, header.invert_y, 'uint8'); fwrite(fid, header.invert_z, 'uint8'); fwrite(fid, header.swap_xy, 'uint8'); fwrite(fid, header.swap_yz, 'uint8'); fwrite(fid, header.swap_zx, 'uint8');
fwrite(fid, header.n_count', 'int32'); fwrite(fid, header.version', 'int32'); fwrite(fid, header.hdr_size', 'int32');
% Write tracks
for itrk = 1:header.n_count
fwrite(fid, tracks(itrk).nPoints, 'int32');
fwrite(fid, tracks(itrk).matrix', 'float32'); if header.n_properties; fwrite(fid, tracks(itrk).props, 'float32'); end;
end; fclose(fid);
end
%
