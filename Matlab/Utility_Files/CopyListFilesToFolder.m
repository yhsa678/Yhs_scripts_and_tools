function ct = CopyListFilesToFolder(list, newfolder, renameByOrder, renameFmt)
%COPYLISTFILESTOFOLDER copy list files to a new folder
%    optionally, the copied files could be renamed in a new order
%
%   See also ListCertainFormatFilesInAFolder,
%   ListCertainNameFilesInAFolder, DeleteListFiles
    if ~exist('newfolder', 'dir')
        mkdir(newfolder);
    end
    
    if ~exist('renameByOrder', 'var')
        renameByOrder = false;
    end
    
    if ~exist('renameFmt', 'var')
        renameFmt = '%05d';
    end

    for k = 1:numel(list)
        [~, fname, fext] = fileparts(list(k).filepath);
        if ~renameByOrder
            copyfile(list(k).filepath, fullfile(newfolder, [fname fext]));
        else
            copyfile(list(k).filepath, fullfile(newfolder, [sprintf(renameFmt, k) fext]));
        end
    end
    
    ct = numel(list);
end