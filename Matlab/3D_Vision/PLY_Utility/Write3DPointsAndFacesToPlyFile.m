function ret = Write3DPointsAndFacesToPlyFile(outFileName, pts, rgb, faces)
% Write out a .ply file with 3D points and faces, optionally have color
% texture
    
    assert(logical(exist('faces', 'var')), 'faces variable must be existed! Or call the one without using faces');
    
    if ~exist('rgb', 'var')
        rgb = [];
    end
    
    % arrange points in row order
    % i.e. 
    % x y z
    % x y z
    % ......
    % x y z
    if size(pts,1)==3 && size(pts,2)~=3
        pts = pts';
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
        data = [data single(rgb)];
    end
    
    if exist('faces', 'var')
        % output faces
        numFaces = size(faces, 1);
        fprintf(fid, 'element face %d\r\n', numFaces);
        fprintf(fid, 'property list uint8 int32 vertex_indices\r\n');
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
    
    if exist('faces', 'var')
        fmtstr = '';
        for k = 1:size(faces, 2)
            fmtstr = [fmtstr '%d '];
        end
        fmtstr = [strtrim(fmtstr) '\r\n'];
        fprintf(fid, fmtstr, faces');
    end
    
    fclose(fid);

    ret = true;
end