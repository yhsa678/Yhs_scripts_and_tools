%%
% iml = ReadImages('C:\Users\yhs\Sync\building\image');
iml = ReadImages(pwd, '.JPG');

iml = RankNeighborBasedOnGist(iml);

%%
fout = fopen('topK-pairs.txt', 'w');
for k = 1:numel(iml)
    for k2 = 1:3
        fprintf(fout, '%s %s\r\n', iml(k).imgpath, iml(iml(k).rankUsingGist(k2+1)).imgpath);
    end
end
fclose(fout);
fprintf(1, 'end\n');
%%
for k = 1:numel(iml)
    figure(1), clf
    imshow(iml(k).img);
    
    mshow = [];
    for k2 = 1:9
        mshow = cat(4, mshow, imresize(iml(iml(k).rankUsingGist(k2)).img, [256 256]));
    end
    figure(2), clf
    montage(mshow)
    pause
    
end