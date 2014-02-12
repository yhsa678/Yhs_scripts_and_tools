function ct = DeleteListFiles(list)
    % delete the files that specify in the list
    ct = 0;
    for k = 1:numel(list)
        if exist(list(k).filepath, 'file')
            delete(list(k).filepath);
            ct = ct+1;
        end
    end
end