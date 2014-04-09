imgfilename = '00045._c.png';
depfilename = '00045_depthMap.bin';

img = imread(imgfilename);
imsz = size(img);

[data, dims] = CMPMVS_ReadBinFileZlib(depfilename);

assert(prod(imsz(1:2)) == dims, 'dimensions should be valid');

dep = reshape(data, imsz(1:2));
lmin = min(min(dep(dep~=-1)));
lmax = max(max(dep));

%%
figure, set(gca,'LooseInset', get(gca,'TightInset'));
imagesc(dep, [0, lmax]), colormap(jet), colorbar;
axis equal; axis tight; axis off;

%%
% reproject to 3d using P matrix
% decomposecamera(P)
K = cam.K;
    points2D = ([X; Y; ones(size(X))] .* repmat(depthValue, 3, 1)); 
    points3D = K\points2D;

 R = cam.R;
    T = cam.T;
    points3D = [R', -R'*T] * [points3D; ones(1, size(points3D, 2))];



