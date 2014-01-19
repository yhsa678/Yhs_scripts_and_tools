function numPro = BatchPrintDepthMap(folder)
%%%
% batch process .flt(.txt) depth map files and print out visualize result
% Usage:
%		folder - depth map, .flt(.txt) file
%
%%%

d = dir(folder);
d(1:2) = [];
cd(folder);

for k = 1:length(d)
    if isempty(strfind(d(k).name, '.txt')) && isempty(strfind(d(k).name, '.flt'))
        continue;
    end
                
    dep = LoadFLTFile(d(k).name);
    

    hFig = figure(1); clf;
    colormap('jet');
    imagesc(dep);
    
    print(hFig, '-dpng', [d(k).name(1:strfind(d(k).name, '.')) 'png']);
end

numPro = length(d);
cd('..');
return

