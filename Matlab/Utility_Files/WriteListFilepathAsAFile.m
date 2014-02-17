function WriteListFilepathAsAFile(filename, list)
% write a list of files, their filepath into a text file
% simple but commonly used as other module input

fout = fopen(filename, 'w');
for k = 1:numel(list)
    fprintf(fout, '%s\r\n', list(k).filepath);
end
fclose(fout);