function [pts3d, rgb] = GeneratePointCloudsFromOneDepthmapGlobal(cam, depthmap, sample)
% generate 3D point clouds from one depthmap and its camera
% use intrisic and extrinsic matrix, under global coordinate
    if nargin < 3
        sample = 1;
    end
    [points3D, rgb] = GeneratePointCloudsFromOneDepthmap(cam, depthmap, sample);
    % one more step to use R, T
    R = cam.R;
    T = cam.T;
    points3D = [R', -R'*T] * [points3D; ones(1, size(points3D, 2))];
    
    pts3d = points3D;
end