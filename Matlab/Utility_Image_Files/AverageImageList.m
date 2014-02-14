function aveImg = AverageImageList(imglist, imgSize)
% average all the images in the list
% resize all the image to a certain size
if ~exist('imgSize', 'var')
    imgSize = [512, 512];
end

sumImg = zeros(imgSize(1), imgSize(2), 3);
for k = 1:numel(imglist)
    fprintf(1, '%d of %d: Summing image %s...\n', k, numel(imglist), imglist(k).filepath);
    img = imread(imglist(k).filepath);
    sumImg = sumImg + double(imresize(img, imgSize));
end

aveImg = uint8(sumImg./numel(imglist));
end
