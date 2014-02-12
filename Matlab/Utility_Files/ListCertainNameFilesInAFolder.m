function list = ListCertainNameFilesInAFolder(folder, containedName, boolSubFolder)
    % list certain "containedName" files inside a folder (including subfolder)
    if nargin < 3 
        boolSubFolder = false;
    end
       
    d = dir(folder);
    d(1:2) = []; % omit '.' and '..'
    list = [];
    
    id = 1;
    for k = 1:numel(d)
        if d(k).isdir 
            if boolSubFolder
                list = [list, ListCertainNameFilesInAFolder(fullfile(folder, d(k).name), containedName, boolSubFolder)];
                id = size(list,1)+1;
            else
                continue;
            end
        end
        [~, filename, fileExt] = fileparts(d(k).name);
        fname = [filename fileExt];
        if ~isempty(strfind(fname, containedName))
            list(id).filepath = fullfile(folder, d(k).name);
            id = id+1;
        end
    end
end