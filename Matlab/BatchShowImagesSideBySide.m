function BatchShowImagesSideBySide(img1Folder, img1ext, img2Folder, img2ext)
% e.g. img1ext = '.jpg'
d1 = dir(img1Folder);
d1(1:2) = [];

h = figure();
for k = 1:length(d1)
    pos = strfind(d1(k).name, img1ext);
    if ~pos
        continue;
    end
    figure(h), clf;
    subplot(1, 2, 1), imshow(fullfile(img1Folder, d1(k).name));
    subplot(1, 2, 2), imshow(fullfile(img2Folder, [d1(k).name(1:pos(end)-1) img2ext]));
    pause
end

return