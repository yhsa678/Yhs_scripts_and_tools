function ShowSequenceImageOnFigure(img, imgId, figHandle, windowSize, timeout)
% Show sequence images on specific figure
% used for demo a sequene of results

if ~exist('timeout', 'var')
    timeout = 0.001;
end

if ~exist('windowSize', 'var')
    windowSize= [100 100 640 480];
end

if ~exist('figHandle', 'var')
    figHandle = -1;
end

if figHandle == -1
    hFig = figure; % new figure
else
    hFig = figure(figHandle);
end

if ~exist('imgId', 'var')
    imgId = 0;
end

if mod(imgId, 50) == 0
    % clear figures to speed up the visualization a bit
    % no use clf, could avoid blinking..., but seems to slow down the
    % showing procedure
%     figure(hFig), clf;
end
    
set(gcf, 'Position', windowSize);
figure(hFig);image(img);
axis('off'); axis('equal'); axis('tight');
set(gca,'LooseInset', get(gca,'TightInset'));
drawnow;

pause(timeout);




