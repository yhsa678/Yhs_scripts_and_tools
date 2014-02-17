function flag = WaitFileFlag(fileflag, folder)
% waiting [folder, fileflag] file, if the file is existed, then return,
% otherwise waiting...
if ~exist('folder', 'var')
    folder = '';
end

while (1)
    found = dir(fullfile(folder, fileflag));
    if isempty(found)
        flag = false;
    else
        flag = true;
        return;
    end
    pause(0.333);
end
