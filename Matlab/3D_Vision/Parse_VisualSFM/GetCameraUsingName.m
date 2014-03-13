function cam = GetCameraUsingName(camList, camName)
%GETCAMERAUSINGNAME Get camera structure from camera list using name
% See also ReadNVM

cam = [];
for k = 1:numel(camList)
    if strcmpi(camName, camList(k).name) || ~isempty(strfind(camList(k).name, camName))
        cam = camList(k);
        return
    end
end
end