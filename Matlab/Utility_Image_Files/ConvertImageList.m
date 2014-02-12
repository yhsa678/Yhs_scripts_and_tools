function ct = ConvertImageList(imglist, tarfmt, delOrigin)
% convert all the images in imglist to a target format

if ~exist('delOrigin', 'var')
    delOrigin = false;
end

if tarfmt(1)~='.'
    tarfmt = ['.' tarfmt];
end

ct = 0;
for k = 1:numel(imglist)
    fprintf(1, '%d of %d: Converting %s...\n', k, numel(imglist), imglist(k).filepath);
    img = imread(imglist(k).filepath);
    [folder, fname, ~] = fileparts(imglist(k).filepath);
    imwrite(img, fullfile(folder, [fname tarfmt]));
    ct = ct+1;
end

if delOrigin
    DeleteListFiles(imglist);
end

end
