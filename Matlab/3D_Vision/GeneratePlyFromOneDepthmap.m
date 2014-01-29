function GeneratePlyFromOneDepthmap(plyFilename, cam, depthmap, sample)
% generate 3D point clouds from one depthmap and its camera
% use intrisic matrix only, under camera coordinate
    if nargin < 4
        sample = 1;
    end
    
    [height, width] = size(depthmap);
    
    x = 1:sample:width;
    y = 1:sample:height;
    [X, Y] = meshgrid(x, y);
    X = X(:)';
    Y = Y(:)';
    ind = sub2ind([height, width], Y, X);
    depthValue = depthmap(ind);
    
    img = imread(cam.imgpath);
    RR = img(:,:,1); GG = img(:,:,2); BB = img(:,:,3);
    colorR = RR(ind); colorG = GG(ind); colorB = BB(ind);
    CC = [colorR', colorG', colorB'];
    
    K = cam.K;
    points2D = ([X; Y; ones(size(X))] .* repmat(depthValue, 3, 1)); 
    points3D = K\points2D;
    
    Write3DPointsToPlyFile(plyFilename, points3D, CC);
end