function dout = LoadFLTFile(fileName, isShow)
% Load .flt file, a format that used by Enliang's depth map
% depth map format: 
% width, height, channels in ascii
% then (width*height*channels) numbers of 'float' type in binary
fid = fopen(fileName);

line = fscanf(fid, '%d&%d&%d&',[1,3]);
width = line(1);
height = line(2);
channels = line(3); 
num = width*height*channels;
D = fread(fid, num, 'float');
fclose(fid);

dout = reshape(D, [width, height]);
dout = dout';

if ~exist('isShow', 'var')
    isShow = false;
end
if isShow
    figure; imagesc(dout); colormap(jet); colorbar; axis equal; axis tight;
end
