function ShowListImages(list, showNum, Nx, Ny, timeout, windowSize, figId)
%
% show Nx*Ny images in the list
%


Nimages = numel(list);
if nargin < 4
    Nx = 6; Ny = 5; % will show 6x5 images per figure
end

if nargin < 2
    showNum = Nimages;
end

if nargin < 5
    timeout = 0.001;
end

if nargin < 6
    windowSize= [0 0 1280 720];
end

 if ~exist('figId', 'var')
        figId = 1;
    end

Dx = 1/Nx; Dy = 1/Ny;

i = 0;
while i<Nimages && i<showNum
    hFig = figure(figId);
    
    if mod(i, 50) == 0
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


