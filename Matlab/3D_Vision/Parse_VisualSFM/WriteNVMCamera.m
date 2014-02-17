function WriteNVMCamera(outNVMFile, cam)
    % write out cameras into .NVM format
    fid = fopen(outNVMFile, 'w');
    
    % header
    fprintf(fid, 'NVM_V3\r\n\n');
    % cameras
    fprintf(fid, '%d\n', numel(cam));

    for k = 1:numel(cam)
        fprintf(fid, '%s %.8f ', cam(k).name, cam(k).focalLength);
        fprintf(fid, '%.12f %.12f %.12f %.12f ', cam(k).quaternion(1), ...
            cam(k).quaternion(2), cam(k).quaternion(3), cam(k).quaternion(4));
        fprintf(fid, '%.12f %.12f %.12f ', cam(k).pos(1), cam(k).pos(2), cam(k).pos(3));
        fprintf(fid, '%.12f 0\r\n',  cam(k).distortion);        
    end
    
    fprintf(fid, '\r\n');
    % zero points
    fprintf(fid, '0\r\n');
    fclose(fid);
end