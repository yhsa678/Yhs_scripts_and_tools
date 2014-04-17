function dep = CMPMVS_ShowDepthBinZlib(depfilename, imgfilename)
%CMPMVS_SHOWDEPTHBINZLIB
%   See also

img = imread(imgfilename);
imsz = size(img);

[data, dims] = CMPMVS_ReadBinFileZlib(depfilename);

assert(prod(imsz(1:2)) == dims, 'dimensions should be valid');

dep = reshape(data, imsz(1:2));
lmin = min(min(dep(dep~=-1)));
lmax = max(max(dep));
figure;
subplot(1, 2, 1), imagesc(dep, [lmin, lmax]);
axis equal; axis tight;
colorbar;
subplot(1, 2, 2), imshow(img);
axis equal; axis tight;

dep(dep==-1) = lmin;
figure;
% imshowpair(dep, img, 'montage');
imshowpair(dep, img, 'blend', 'Scaling', 'independent');
axis equal; axis tight;