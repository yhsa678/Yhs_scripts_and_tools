function ct = ResizeImageList(imglist, newSize)
% resize all the images in imglist to a newSize 
% usually newSize = [numrows, numcols], accept any parameters that passed
% to the second parameter in imresize function
ct = 0;
for k = 1:numel(imglist)
    fprintf(1, '%d of %d: Resizing %s...\n', k, numel(imglist), imglist(k).filepath);
    img = imread(imglist(k).filepath);
    imwrite(imresize(img, newSize), imglist(k).filepath);
    ct = ct+1;
end

end
