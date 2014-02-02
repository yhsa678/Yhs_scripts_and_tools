function [gist, param] = GetImageGist(img, param)

    % a simple wrapper extracted from demoGist
    % Parameters:
    if nargin < 2
        param.imageSize = [256 256]; % it works also with non-square images
        param.orientationsPerScale = [8 8 8 8];
        param.numberBlocks = 4;
        param.fc_prefilt = 4;
    end
    
    % Computing gist requires 1) prefilter image, 2) filter image and collect
    % output energies
    [gist, param] = LMgist(img, '', param);
end