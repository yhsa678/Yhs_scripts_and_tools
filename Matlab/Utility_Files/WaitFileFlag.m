function flag = WaitFileFlag(fileflag, folder)

if nargin < 2
    folder = pwd;
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
return;