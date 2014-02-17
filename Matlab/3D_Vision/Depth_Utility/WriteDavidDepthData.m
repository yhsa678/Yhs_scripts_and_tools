function WriteDavidDepthData(fileName, data)

% thanks Enliang, too!
% 
% std::ofstream out(filename,std::ios_base::out|std::ios_base::binary);
% verify(out.is_open(),"Failed to open iamge data file.");
% // Write image stat.
% ImageFileStat stat;
% stat.width = image.width();
% stat.height = image.height();
% stat.numChannels = image.numChannels();
% stat.bitDepth = sizeof(Elem)*8;
% // TODO: Create a mechanism for getting a type constant.
% //       Then type can be stored exactly.
% unsigned int type = 0xffffffff;
% out.write((char*)&stat.width,sizeof(unsigned int));
% out.write((char*)&stat.height,sizeof(unsigned int));
% out.write((char*)&stat.numChannels,sizeof(unsigned int));
% out.write((char*)&stat.bitDepth,sizeof(unsigned int));
% out.write((char*)&type,sizeof(unsigned int));
% // Write image data.
% out.write((char*)&image(0,0,0),sizeof(Elem)*image.width()*image.height()*image.numChannels());


[height, width, numChannels] = size(data);
bitDepth = 32;

fid = fopen(fileName, 'w');
info = [width, height, numChannels, bitDepth, 111];

fwrite(fid, info, 'uint32');
fwrite(fid, data', 'float32');
fclose(fid);



























