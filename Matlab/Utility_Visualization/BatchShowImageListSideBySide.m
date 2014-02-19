function BatchShowImageListSideBySide(imgl1, imgl2)

assert(numel(imgl1) == numel(imgl2), 'The two lists should be the same size!');

h = figure();
for k = 1:numel(imgl1)
    figure(h), clf;
    set(gca,'LooseInset', get(gca,'TightInset'));
    subplot(1, 2, 1), imshow(imread(imgl1(k).filepath));
    subplot(1, 2, 2), imshow(imread(imgl2(k).filepath));
    
    pause
end

return