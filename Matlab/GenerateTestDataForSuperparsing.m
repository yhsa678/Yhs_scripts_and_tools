function numOfProcessed = GenerateTestDataForSuperparsing(folder, testFolderName)
%%% 
% generate test images, fake geometric, semantic labels for superparsing system
% need change reference fake geo, sem labels accordingly
% Usage:
% 		folder - test images
% 		testFolderName - (optional) test set subfolder, easy to look up
% 
% GenerateTestDataForSuperparsing('test_image_folder')
% GenerateTestDataForSuperparsing('test_image_folder', 'test_set_name')
%
%%%

if nargin < 2
    testFolderName = '';
end

%% batch copy files (and rename files)
renameWord = ''; % 'Z_', [testFolderName '_'], etc.
tmpFolder = folder;
imgFolder = fullfile(tmpFolder, 'img', testFolderName);
d = dir(tmpFolder);
d(1:2) = [];
mkdir(imgFolder);
for k = 1:length(d)
    if d(k).isdir
        continue;
    end
    imwrite(imread(fullfile(tmpFolder, d(k).name)), fullfile(imgFolder, [renameWord d(k).name]));
end

%% batch process images
resizedFolder = fullfile(tmpFolder, 'Images', testFolderName);
geoFolder = fullfile(tmpFolder, 'GeoLabels', testFolderName);
semFolder = fullfile(tmpFolder, 'SemanticLabels', testFolderName);

d = dir(imgFolder);
d(1:2) = [];

mkdir(resizedFolder);
mkdir(geoFolder);
mkdir(semFolder);

%% reference geo and sem label mat
refGeoFile = load(fullfile('D:\Hongsheng\Test_Datasets\Parsing_Test', 'coast_arnat59_geo.mat'));
refSemFile = load(fullfile('D:\Hongsheng\Test_Datasets\Parsing_Test', 'coast_arnat59_sem.mat'));

idFileList = fopen(fullfile(tmpFolder, 'TestSet.txt'), 'w');
for k = 1:length(d)
    % batch resize
    imwrite(imresize(imread(fullfile(imgFolder, d(k).name)), [256 256], 'bicubic'), fullfile(resizedFolder, d(k).name));
    % create fake semantic and geo label
    pos = strfind(d(k).name, '.');
    save(fullfile(geoFolder, strcat(d(k).name(1:pos(end)-1), '.mat')), '-struct', 'refGeoFile');
    save(fullfile(semFolder, strcat(d(k).name(1:pos(end)-1), '.mat')), '-struct', 'refSemFile');
    
    % print test file list
    fprintf(idFileList, '%s\n', [testFolderName, '\', d(k).name]);
end

fclose(idFileList);

numOfProcessed = length(d);
return