function depth = ReadDavidDepthData(fileName, isShow)

% thanks Enliang!
% refer to David's depth format in C++
%
% ImageFileStat stat;
% unsigned int type;
% std::ifstream in(filename,std::ios_base::binary|std::ios_base::in);
% verify(in.is_open(),"Failed to open image data file.");
% in.read((char*)&stat.width,sizeof(unsigned int));
% in.read((char*)&stat.height,sizeof(unsigned int));
% in.read((char*)&stat.numChannels,sizeof(unsigned int));
% in.read((char*)&stat.bitDepth,sizeof(unsigned int));
% in.read((char*)&type,sizeof(unsigned int));
% // TODO: Create a mechanism for getting a type constant.
% //       Then type can be verified exactly.
% // Verify bit depth of type.
% verify(sizeof(Elem)*8==stat.bitDepth,"Image data incompatible with type.");
% // Read image.
% image.resize(stat.width,stat.height,stat.numChannels);
% in.read((char*)&image(0,0,0),sizeof(Elem)*stat.width*stat.height*stat.numChannels);

if ~exist('isShow', 'var')
    isShow = false;
end

fid = fopen(fileName, 'r');
info = fread(fid, 5, 'uint32');
width = info(1); height = info(2); numOfChannels = info(3);

depth = fread(fid, width * height * numOfChannels, 'float32');
depth = reshape(depth, width, height);
depth = depth';
fclose(fid);

if(isShow)
    figure(); imagesc(depth); colorbar; colormap(gray); 
    axis equal; axis tight;
end

