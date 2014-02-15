function [pts3d, rgb, faces] = GeneratePointCloudsFromOneDepthmapGlobal(cam, depthmap, sample, showCam)
% generate 3D point clouds from one depthmap and its camera
% use intrisic and extrinsic matrix, under global coordinate
    if ~exist('sample', 'var')
        sample = 1;
    end
    
    if ~exist('showCam', 'var')
        showCam = false;
    end
    
    if showCam 
        [points3D, rgb, faces] = GeneratePointCloudsFromOneDepthmap(cam, depthmap, sample, showCam);
    else
        [points3D, rgb] = GeneratePointCloudsFromOneDepthmap(cam, depthmap, sample);
    end
    % one more step to use R, T 
    % to project into a global cordinate
    R = cam.R;
    T = cam.T;
    points3D = [R', -R'*T] * [points3D; ones(1, size(points3D, 2))];
    
    pts3d = points3D;
end