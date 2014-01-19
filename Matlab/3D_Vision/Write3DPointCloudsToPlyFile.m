function ret = Write3DPointCloundsToPlyFile(outFileName, pts, rgb)
% Write out a .ply file with 3D point clouds, optionally have color
% texture

    if nargin < 3
        rgb = [];
    end
    % points are arranged in row order
    num = size(pts, 1);

    fid = fopen(outFileName, 'w');
    fprintf(fid, 'ply\r\n');
    fprintf(fid, 'format ascii 1.0\r\n');
    fprintf(fid, 'element vertex %d\r\n', num);
    fprintf(fid, 'property float x\r\n');
    fprintf(fid, 'property float y\r\n');
    fprintf(fid, 'property float z\r\n');

    data = pts;
    % difference between uchar and diffuse_uchar?
    if ~isempty(rgb)
        fprintf(fid, 'property uchar red\r\n');
        fprintf(fid, 'property uchar green\r\n');
        fprintf(fid, 'property uchar blue\r\n');
        data = [data rgb];
    end

    fprintf(fid, 'end_header\r\n');    


    % for k = 1:num
    %     fprintf(fid, '%f %f %f', pts(k, 1), pts(k, 2), pts(k, 3));
    %     if ~isempty(color)
    %         fprintf(fid, ' %u %u %u', color(k, 1), color(k, 2), color(k, 3));
    %     end
    %     fprintf(fid, '\r\n');
    % end

    if isempty(rgb)
        fprintf(fid, '%f %f %f\r\n', data');
    else
        fprintf(fid, '%f %f %f %u %u %u\r\n', data');
    end
    fclose(fid);

    ret = true;
end