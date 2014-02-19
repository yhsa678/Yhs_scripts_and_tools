function WriteListFilepathAsAFile(filename, list, attachedFolder, attachedName)
% write a list of files, their filepath into a text file
% simple but commonly used as other module input

fout = fopen(filename, 'w');
for k = 1:numel(list)
    if exist('attachedFolder', 'var')
        [~, fname, fext] = fileparts(list(k).filepath);
        if exist('attachedName', 'var')
            fprintf(fout, '%s\r\n', fullfile(attachedFolder, [fname, attachedName]));
        else
            fprintf(fout, '%s\r\n', fullfile(attachedFolder, [fname, fext]));
        end        
    else
        fprintf(fout, '%s\r\n', list(k).filepath);
    end
end
fclose(fout);