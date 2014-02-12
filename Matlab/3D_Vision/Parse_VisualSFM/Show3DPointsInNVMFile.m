function Show3DPointsInNVMFile(nvmFileName, axisRange, sampleRate)
    
    % read NVM file and show 3D points
    if nargin < 3
        sampleRate = 0.01; % show 1%'s points
    end
    
    if nargin < 2
        axisRange = [];
    end
    
    [~, p3d] = ReadNVM(nvmFileName);
    pts = [];
    for k = 1:size(p3d, 2)
        pts = [pts; p3d(k).pos];
    end
    Show3DPoints(pts, axisRange, sampleRate);    
end