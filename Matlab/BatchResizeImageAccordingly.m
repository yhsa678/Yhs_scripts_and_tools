function [numOfCvted, nameOfCvtedImg] = BatchResizeImageAccordingly(folder, srcFmt, refFolder, refFmt, tarFmt, delOri)
%%%
% batch resize images to reference image size in REFFOLDER, these images
% are in REFFMT
% optionally, convert to from SRCFMT to TARFMT
% delete original file if DELORI = true
% Usage:
% 		folder - images
%       srcFmt - file extension filter
% 
% e.g. 
% BatchConvertImages(folder, 'png', refFolder)
% BatchConvertImages(folder, 'png', refFolder, 'jpg', true)
% 
%%%

if nargin < 6
    delOri = false;
end

if nargin < 5
    tarFmt = srcFmt;
end

assert(~isempty(srcFmt));

% originFolderBackup = pwd;

d = dir(folder);
d(1:2) = [];

% cd(folder);

numOfCvted = 0;
nameOfCvtedImg = [];

for k = 1:length(d)
    if d(k).isdir
%         [subnum subnames] = BatchResizeImage(d(k).name, srcFmt, tarSize, tarFmt, delOri);
%         numOfCvted = numOfCvted + subnum;
%         nameOfCvtedImg = strvcat(nameOfCvtedImg, subnames);
        continue;
    else
        if strfind(d(k).name, ['.' srcFmt])
            pos = strfind(d(k).name, '.');
            tarName = fullfile(folder, [d(k).name(1:pos(end)-1) '.' tarFmt]);
            
            tarSize = size(imread(fullfile(refFolder, [d(k).name(1:pos(end)) refFmt])));
            imwrite(imresize(imread(fullfile(folder, d(k).name)), tarSize(1:2), 'nearest'), tarName, tarFmt);
            
            if delOri == true
                delete(fullfile(folder, d(k).name));
            end
            
            numOfCvted = numOfCvted + 1;
            disp(tarName)
            nameOfCvtedImg = strvcat(nameOfCvtedImg, tarName);
        end 
    end
end

% cd(originFolderBackup);
return 