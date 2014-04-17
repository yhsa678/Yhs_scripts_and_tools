fileNo = '00010';
imgfilename = [fileNo '._c.png'];
depfilename = [fileNo '_depthMap.bin'];

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
P = load([fileNo '_P.txt']);
[K, R, C, pp, pv] = decomposecamera(P);
%%
% K = cam.K;
T = -R*C;
[X, Y] = meshgrid(1:size(img, 2), 1:size(img, 1));
X = X(:)'; Y = Y(:)';
depVal = dep(:)';
points2D = ([X; Y; ones(size(X))] .* repmat(depVal, 3, 1)); 
points3D = K\points2D;

% R = cam.R;
% T = cam.T;
points3D = [R', -R'*T] * [points3D; ones(1, size(points3D, 2))];

%%
ind = sub2ind([size(img, 1) size(img, 2)], Y, X);
rr = img(:, :, 1);
gg = img(:, :, 2);
bb = img(:, :, 3);
rgb = [rr(ind); gg(ind); bb(ind)];
%%
Write3DPointsToPlyFile([fileNo '.ply'], points3D, rgb')

