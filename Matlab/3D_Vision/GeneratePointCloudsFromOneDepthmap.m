function [pts3d, rgb, faces] = GeneratePointCloudsFromOneDepthmap(cam, depthmap, sample, showCam)
%GENERATEPOINTCLOUDSFROMONEDEPTHMAP
%   generate 3D point clouds from one depthmap and its camera
%   use intrisic matrix only, under camera coordinate
%   optionally: 
%   output camera projection center and image plane
%   i.e. 5 points: camera center, upleft, upright, lowleft, lowright of image
%   plane, and 6 faces of the projection volume
%
%   See also GeneratePointCloudsFromOneDepthmapGlobal

    if ~exist('sample', 'var')
        sample = 1;
    end
    
    if ~exist('showCam', 'var')
        showCam = false;
    end
    
    [height, width] = size(depthmap);
    
    x = 1:sample:width;
    y = 1:sample:height;
    [X, Y] = meshgrid(x, y);
    X = X(:)';
    Y = Y(:)';
    ind = sub2ind([height, width], Y, X);
    depthValue = depthmap(ind);
    
    img = imread(cam.filepath);
    if cam.channel == 1
        % if it is gray image
        RR = img; GG = img; BB = img;
    else
        RR = img(:,:,1); GG = img(:,:,2); BB = img(:,:,3);
    end
    colorR = RR(ind); colorG = GG(ind); colorB = BB(ind);
    CC = [colorR', colorG', colorB'];
    
    K = cam.K;
    points2D = ([X; Y; ones(size(X))] .* repmat(depthValue, 3, 1)); 
    points3D = K\points2D;
    
    pts3d = points3D;
    rgb = CC;
    
    if showCam
        % add camera
        pImg = [1, 1, 1;
            1, height, 1;
            width, 1, 1;
            width, height, 1]';
        pImg3d = K\pImg;
                
        pts3d = [pts3d pImg3d zeros(3, 1)];
        
        rgb = [rgb; ones(5, 3).*128];
        
        fId = size(pts3d, 2)-1;
        faces = [3 fId fId-4 fId-3;
            3 fId fId-3 fId-2;
            3 fId fId-2 fId-1;
            3 fId fId-1 fId-4;
            3 fId-1 fId-2 fId-3;
            3 fId-2 fId-3 fId-4];
    end
                
end