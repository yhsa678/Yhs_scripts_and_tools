function [data, dims] = CMPMVS_ReadBinFile(filename)
%CMPMVS_READBINFILE read .bin file in CMPMVS's output, plain, do not use
%   zlib as encoder
%
%   See also zlibdecode

filename = '00001._c.png.sift';
fin = fopen(filename, 'r');
flag = fread(fin, 10, 'int32')

% 
% dims = fread(fin, 1, 'int32');
% tmpsz = fread(fin, 1, 'int32');
% 
% buf = uint8(fread(fin, tmpsz, 'uint8'));
% buf = zlibdecode(buf);
% buf = typecast(buf, 'single');
fclose(fin);
% 
% data = buf;

end