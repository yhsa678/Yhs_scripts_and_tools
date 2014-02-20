function ct = CopyListFilesToFolder(list, newfolder, renameByOrder)
    % copy files (filepath in list) into new folder
    if ~exist('newfolder', 'dir')
        mkdir(newfolder);
    end
    
    if ~exist('renameByOrder', 'var')
        renameByOrder = false;
    end

    for k = 1:numel(list)
        [~, fname, fext] = fileparts(list(k).filepath);
        if ~renameByOrder
            copyfile(list(k).filepath, fullfile(newfolder, [fname fext]));
        else
            copyfile(list(k).filepath, fullfile(newfolder, [sprintf('f-%06d', k) fext]));
        end
    end
    
    ct = numel(list);
end