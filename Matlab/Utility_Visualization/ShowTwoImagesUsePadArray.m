function imgTwo = ShowTwoImagesUsePadArray(img1, img2, isShow)
% show two images side by side
% using padarray to fill the border, if the two images are not in same size

if ischar(img1)
    img1 = imread(img1);
end
if ischar(img2)
    img2 = imread(img2);
end   

if size(img1, 3) == 1
    img1 = repmat(img1, [1 1 3]);
end
if size(img2, 3) == 1
    img2 = repmat(img2, [1 1 3]);
end

if ~exist('isShow', 'var')
    isShow = true;
end

sz1 = size(img1);
sz2 = size(img2);

sz = max(sz1, sz2);

grayBorder = 255;
img1 = padarray(img1, [sz(1)-sz1(1) 0], grayBorder, 'post');
img2 = padarray(img2, [sz(1)-sz2(1) 0], grayBorder, 'post');

imgTwo = [img1 img2];

if isShow
    figure;
    image(imgTwo);
    axis equal; axis tight;
end

