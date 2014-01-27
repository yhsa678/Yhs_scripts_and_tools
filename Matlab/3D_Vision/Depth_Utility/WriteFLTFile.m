function WriteFLTFile( fileName, data)

[height, width, channels] = size(data);

fid = fopen(fileName, 'w');
assert(fid >0)
fprintf(fid, '%d&%d&%d&', width, height, channels);
fwrite(fid, data', 'float32');
fclose(fid);

% show = LoadFLTFile(fileName);