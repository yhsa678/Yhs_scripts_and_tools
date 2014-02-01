function PrintFigureToFile(hFig, fileName, fileExt)
% use print to save out matlab figure 
    if nargin < 3
        fileExt = 'png';
    end
    
    print(hFig, ['-d' fileExt], [fileName '.' fileExt]);
end
