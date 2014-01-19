function [numOfCvted, nameOfCvtedImg] = BatchConvertImageFormat(folder, srcFmt, tarFmt, delOri)
%%%
% batch convert images format from SRCFMT to TARFMT
% delete original file if DELORI = true
% Usage:
% 		folder - images
% 
% e.g. 
% BatchConvertImages(folder, 'jpg', 'ppm')
% BatchConvertImages(folder, 'png', 'jpg', true)
% BatchConvertImages(folder, '', 'jpg', true)
% 
%%%

if nargin < 4
    delOri = false;
end

if srcFmt == tarFmt
    return
end

originFolderBackup = pwd;


d = dir(folder);
d(1:2) = [];

cd(folder);

numOfCvted = 0;
nameOfCvtedImg = [];

for k = 1:length(d)
    if d(k).isdir
        [subnum subnames] = BatchConvertImageFormat(d(k).name, srcFmt, tarFmt, delOri);
        numOfCvted = numOfCvted + subnum;
        nameOfCvtedImg = strvcat(nameOfCvtedImg, subnames);
    else
        if strfind(d(k).name, ['.' srcFmt])
            pos = strfind(d(k).name, '.');
            tarName = [d(k).name(1:pos(end)-1) '.' tarFmt];
            imwrite(imread(d(k).name), tarName, tarFmt)
            
            if delOri == true
                delete(d(k).name);
            end
            
            numOfCvted = numOfCvted + 1;
            nameOfCvtedImg = strvcat(nameOfCvtedImg, fullfile(pwd, tarName));
        end 
    end
end

cd(originFolderBackup);
return 