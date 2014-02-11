function cam = AddVisible3DPointsToCamera(cam, p3d)
% add the 3D point that is visible in certain camera
% camera index start from 1
% point index start from 1

for k = 1:numel(cam)
    cam(k).visPtsIndex = [];
end
for k = 1:numel(p3d)
    for k2 = 1:size(p3d(k).measure, 1)
        camid = int32(p3d(k).measure(k2, 1))+1;
        cam(camid).visPtsIndex = [cam(camid).visPtsIndex, k];
    end
end