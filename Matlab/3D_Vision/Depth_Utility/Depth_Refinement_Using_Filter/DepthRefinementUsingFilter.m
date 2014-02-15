function depOut = DepthRefinementUsingFilter(depIn, guidedImg, filterType)

if ~exist('filterType', 'var')
    filterType = 'WMF';
end

% prepare tmp files, depth data and guided image
dInName = 'tmp_dep_in.txt';
dOutName = 'tmp_dep_out.txt';
WriteFLTFile(dInName, depIn);

imTmpName = 'tmp_img_guided.png';
imwrite(guidedImg, imTmpName);

% use filter
s = which('Depth_Refine_with_Filter.exe');
if strcmpi(filterType, 'WMF')
    command = sprintf('!%s %s %s %s 1', s, imTmpName, ...
        dInName, dOutName);
end

if strcmpi(filterType, 'CLMF-1')
    command = sprintf('!%s %s %s %s 0', s, imTmpName, ...
        dInName, dOutName);
end

fprintf(1, 'Doing %s filtering...\n', filterType);
tic;
eval(command);
toc;
depOut = LoadFLTFile(dOutName);

% clear tmp files
delete(dInName);
delete(dOutName);
delete(imTmpName);
