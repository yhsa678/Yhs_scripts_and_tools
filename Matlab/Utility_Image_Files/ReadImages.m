function list = ReadImages(folder, ext)
    
    if ~exist('ext', 'var')
        ext = '.';
    else 
        ext = upper(ext);
    end
    % read images from a folder, store it as a list
    if folder == '.'
        folder = pwd;
    end
    
    d = dir(folder);
    d(1:2) = []; % remove '.', '..'
    
    imgId = 1;
    for k = 1:numel(d)
        % all convert to uppercase to find if it contain certain extension
        if isempty(strfind(upper(d(k).name), ext))
            continue;
        end
        
        list(imgId).imgpath = fullfile(folder, d(k).name);
        fprintf(1, 'No. %d of %d\nReading image %s...\n', k, numel(d), list(imgId).imgpath);
        list(imgId).img = imread(list(imgId).imgpath);
        if size(list(imgId).img, 3) == 1
            list(imgId).img = repmat(list(imgId).img, [1, 1, 3]);
        end
        imgId = imgId+1;
    end
end