function [data, dims] = CMPMVS_ReadBinFileZlib(filename)
%CMPMVS_READBINFILE read .bin file in CMPMVS's output, which use zlib as
%   encoder
%
%   See also zlibdecode

fin = fopen(filename, 'r');
flag = fread(fin, 1, 'int32');
assert(flag == -1, 'CMPMVS bin file header must be -1.');

dims = fread(fin, 1, 'int32');
tmpsz = fread(fin, 1, 'int32');

buf = uint8(fread(fin, tmpsz, 'uint8'));
buf = zlibdecode(buf);
buf = typecast(buf, 'single');
fclose(fin);

data = buf;

end