function ct = CopyListFilesToFolder(list, newfolder)
    % copy files (filepath in list) into new folder
    if ~exist('newfolder', 'dir')
        mkdir(newfolder);
    end

    for k = 1:numel(list)
        [~, fname, fext] = fileparts(list(k).filepath);
        copyfile(list(k).filepath, fullfile(newfolder, [fname fext]));
    end
    
    ct = numel(list);
end