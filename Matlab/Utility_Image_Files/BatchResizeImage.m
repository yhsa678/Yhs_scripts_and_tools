function [numOfCvted, nameOfCvtedImg] = BatchResizeImage(folder, srcFmt, tarSize, tarFmt, delOri)
%%%
% batch resize images to TARSIZE
% optionally, convert to from SRCFMT to TARFMT
% delete original file if DELORI = true
% Usage:
% 		folder - images
%       srcFmt - file extension filter
% 
% e.g. 
% BatchConvertImages(folder, 'png', [256 256])
% BatchConvertImages(folder, 'png', [256 256], 'jpg', true)
% BatchConvertImages(folder, '', 'jpg', true)
% 
%%%

if nargin < 5
    delOri = false;
end

if nargin < 4
    tarFmt = srcFmt;
end

assert(~isempty(srcFmt));

originFolderBackup = pwd;

d = dir(folder);
d(1:2) = [];

cd(folder);

numOfCvted = 0;
nameOfCvtedImg = [];

for k = 1:length(d)
    if d(k).isdir
        [subnum subnames] = BatchResizeImage(d(k).name, srcFmt, tarSize, tarFmt, delOri);
        numOfCvted = numOfCvted + subnum;
        nameOfCvtedImg = strvcat(nameOfCvtedImg, subnames);
    else
        if strfind(lower(d(k).name), ['.' lower(srcFmt)])
            pos = strfind(d(k).name, '.');
            tarName = [d(k).name(1:pos(end)-1) '.' tarFmt];
           
            imwrite(imresize(imread(d(k).name), tarSize, 'nearest'), tarName, tarFmt);
            
            if delOri == true
                delete(d(k).name);
            end
            
            numOfCvted = numOfCvted + 1;
            disp(fullfile(pwd, tarName))
            nameOfCvtedImg = strvcat(nameOfCvtedImg, fullfile(pwd, tarName));
        end 
    end
end

cd(originFolderBackup);
return 