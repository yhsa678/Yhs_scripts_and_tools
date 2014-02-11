function list = ListCertainFormatFilesInAFolder(folder, fmt, boolSubFolder)
    % list certain .fmt files inside a folder (including subfolder)
    % if use fmt as '.', basically could list every thing
    if nargin < 3 
        boolSubFolder = false;
    end
    
    fmt = upper(fmt); % all compare in uppercase
    
    d = dir(folder);
    d(1:2) = []; % omit '.' and '..'
    list = [];
    
    id = 1;
    for k = 1:numel(d)
        if d(k).isdir 
            if boolSubFolder
                list = [list, ListCertainFormatFilesInAFolder(fullfile(folder, d(k).name), fmt, boolSubFolder)];
                id = size(list,1)+1;
            else
                continue;
            end
        end
        [~, ~, fileExt] = fileparts(d(k).name);
        if ~isempty(strfind(upper(fileExt), fmt))
            list(id).filepath = fullfile(folder, d(k).name);
            id = id+1;
        end
    end
end