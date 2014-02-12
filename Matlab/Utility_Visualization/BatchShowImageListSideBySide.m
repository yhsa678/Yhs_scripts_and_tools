function BatchShowImageListSideBySide(imgl1, imgl2)

assert(numel(imgl1) == numel(imgl2), 'The two lists should be the same size!');

h = figure();
for k = 1:numel(imgl1)
    figure(h), clf;
    subplot(1, 2, 1), imshow(imgl1(k));
    subplot(1, 2, 2), imshow(imgl2(k));
    pause
end

return