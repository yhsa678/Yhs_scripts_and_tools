function PrintFigureToFile(hFig, fileName, fileExt)
% use print to save out matlab figure 
    if nargin < 3
        fileExt = 'png';
    end
    
    print(hFig, ['-d' fileExt], [filename '.' fileExt]);
end
