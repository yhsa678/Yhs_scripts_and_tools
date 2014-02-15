% [cam, p3d] = ReadNVM('realNotreDame_larger.nvm');
[cam, p3d] = ReadNVM('herzjesu_small.nvm');

cam = AddCameraImageProperty(cam, 'image');
cam = CalcKRTfromNVMCamera(cam);

%%
folder = '3d-ply';
mkdir(folder);
num = 6;
startid = 13;
colorcode = uint8(jet(num)*255);
total_p3d = [];
total_rgb = [];
for k = 1:numel(cam)
% for k = startid+1:startid+num
    fprintf(1, 'generating no. %d...\n', k);
    [pts3d, rgb] = GeneratePointCloudsFromOneDepthmapGlobal(cam(k), LoadFLTFile(sprintf('results\\depthMap%03d.txt', k-1)));
%     rgb = repmat(colorcode(k-startid, :), size(pts3d, 2), 1);
    Write3DPointsToPlyFile(fullfile(folder, sprintf('cam%03d.ply', k)), pts3d, rgb);
    total_p3d = [total_p3d; pts3d'];
    total_rgb = [total_rgb; rgb];
end

%%
Write3DPointsToPlyBin(fullfile(folder, 'cam_total.ply'), total_p3d, total_rgb);
    