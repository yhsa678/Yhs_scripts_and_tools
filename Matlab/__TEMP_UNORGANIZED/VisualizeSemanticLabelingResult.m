d = dir('.');
d(1:2) = [];
num = 0;
for k = 1:length(d)
    if ~exist(fullfile(d(k).name, 'label_out_color.png'))
        continue;
    end
    num = num+1;
    figure(1), clf, hold on,
    subplot(1, 3, 1), imshow(fullfile(d(k).name, 'img_seg.jpg'));
    if exist(fullfile(d(k).name, 'label_color.png'))
        subplot(1, 3, 2), imshow(fullfile(d(k).name, 'label_color.png'));
    end
    if exist(fullfile(d(k).name, 'label_out_color.png'))
        subplot(1, 3, 3), imshow(fullfile(d(k).name, 'label_out_color.png'));
    end
    pause
end
num