function dout = LoadFLTFile(fileName)
% Load .flt(.txt) file, a format that used by Liang's depth map
% 
fid = fopen(fileName);

line = fscanf(fid, '%d&%d&%d&',[1,3]);
width = line(1);
height = line(2);
channels = line(3); 
num = width*height*channels;
D = fscanf(fid, '%f', num);
fclose(fid);

dout = reshape(D, [width, height]);
dout = dout';
% figure, imagesc(dout), axis equal;
