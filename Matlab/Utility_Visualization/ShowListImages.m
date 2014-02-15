function ShowListImages(list, showNum, Nx, Ny, timeout, windowSize, figId)
%
% show Nx*Ny images in the list
%
% adapted code from labelmeToolbox

Nimages = numel(list);
if ~exist('Nx', 'var') | ~exist('Ny', 'var')
    Nx = 6; Ny = 5; % will show 6x5 images per figure
end

if ~exist('showNum', 'var')
    
    showNum = Nimages;
end

if showNum < 0
    showNum = Nimages;
end

if ~exist('timeout', 'var')
    timeout = 0.001;
end

if ~exist('windowSize', 'var')
    windowSize= [100 100 640 480];
end

if ~exist('figId', 'var')
    figId = -1;
end

Dx = 1/Nx; Dy = 1/Ny;

i = 0;
while i<Nimages && i<showNum
    if figId == -1
        hFig = figure;
    else
        hFig = figure(figId);
    end
    
    if mod(i, 50) == 0
        % clear figures to speed up the visualization a bit
        % initially only used for 1x1 case
        figure(hFig), clf;
    end
    
    set(gcf,'Position',windowSize);
    for y = Ny-1:-1:0
        for x = 0:Nx-1
            i = i+1;
            if i>Nimages
                return
            end
            img = imread(list(i).filepath); % Load image
            figure(hFig);
            axes('position', [x*Dx y*Dy Dx Dy]); % create axis
            
            
            imagesc(img);
            axis('off'); axis('equal'); axis('tight');
            
            pause(timeout);
            drawnow
        end
    end
end


