folder = 'streetview_sample';
d = dir(folder);
d(1:2) = [];
for k = 1:length(d)
disp(fullfile(folder, d(k).name))
end
%%
attr = 'img';
folderImg = '701_StillsRaw_full';
folderLabel = 'LabeledApproved_full';

ratio = 0.9;
folder = folderImg;
d = dir(folder);
d(1:2) = [];

totalNum = length(d);
trainNum = round(ratio*totalNum);
seq = randperm(totalNum);

fout = fopen(['list_' attr '_train.txt'], 'w');
for k = 1:length(d)
    if k > trainNum 
        break;
    end
    fprintf(fout, '%s\n', fullfile(folder, d(seq(k)).name));
end
fclose(fout);

fout = fopen(['list_' attr '_test.txt'], 'w');
while k < totalNum
    fprintf(fout, '%s\n', fullfile(folder, d(seq(k)).name));
    k = k+1;
end
fclose(fout);

attr = 'label';
folder = folderLabel;
d = dir(folder);
d(1:2) = [];

fout = fopen(['list_' attr '_train.txt'], 'w');
for k = 1:length(d)
    if k > trainNum 
        break;
    end
    fprintf(fout, '%s\n', fullfile(folder, d(seq(k)).name));
end
fclose(fout);

fout = fopen(['list_' attr '_test.txt'], 'w');
while k < totalNum
    fprintf(fout, '%s\n', fullfile(folder, d(seq(k)).name));
    k = k+1;
end
fclose(fout);

return
%%
folder = 'building_small';
d = dir(folder);
d(1:2) = [];

fout = fopen(['list_' folder '_test.txt'], 'w');
for k = 1:length(d)
    fprintf(fout, '%s\n', fullfile(folder, d(k).name));
end
fclose(fout);