function list = ReadListFilepathAsAFile(filename, catFileFolder)
% assume each line is a filename
% no empty line

if ~exist('catFileFolder', 'var')
    catFileFolder = '';
end

fin = fopen(filename, 'r');
kid = 1;
while (1)
    tline = fgetl(fin);
    if ~ischar(tline), break, end;
    tline = strtrim(tline);
    if isempty(tline), continue, end;
    list(kid).filepath = fullfile(catFileFolder, tline);
    kid = kid+1;
end

fclose(fin);
