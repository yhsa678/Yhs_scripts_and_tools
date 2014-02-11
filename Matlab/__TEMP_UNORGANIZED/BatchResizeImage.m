%% batch rename files
srcFolder = 'Image_List\\';
dstFolder = 'list_renamed\\';
delete([dstFolder '*.*'])
d = dir(srcFolder);
for k = 1:length(d)
    if d(k).name(1) == '.'
        continue;
    end
 
    imwrite(imread([srcFolder d(k).name]), [dstFolder 'Z_' d(k).name]);
    d(k).name
end

%% batch resize images
srcFolder = 'building_imgOri\\';
dstFolder = 'building_img\\';
delete([dstFolder '*.*']);
d = dir(srcFolder);
for k = 1:length(d)
    if d(k).name(1) == '.'
        continue;
    end
 
    imwrite(imresize(imread([srcFolder d(k).name]), [256 256], 'bicubic'), [dstFolder d(k).name]);
    d(k).name
end

%% create fake semantic and geo label
option = 'geo';
option = 'sem';
refFile = load(['coast_arnat59_' option '.mat']);
srcFolder = 'building_img\\';
dstFolder = ['building_' option 'label\\'];
delete([dstFolder '*.*'])
d = dir(srcFolder);
for k = 1:length(d)
    if d(k).name(1) == '.'
        continue;
    end
    
    save([dstFolder strcat(d(k).name(1:strfind(d(k).name, '.')-1), '.mat')], '-struct', 'refFile');
    d(k).name
end
%% disp list
srcFolder = 'building_img\\';
d = dir(srcFolder);
for k = 1:length(d)
    if d(k).name(1) == '.'
        continue;
    end
    disp(d(k).name)
   
end