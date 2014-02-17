[cam, p3d] = ReadNVM('realNotreDame_larger.nvm');
% [cam, p3d] = ReadNVM('herzjesu_small.nvm');

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
total_faces = [];
% for k = 1:numel(cam)
for k = startid+1:startid+num
    fprintf(1, 'generating no. %d...\n', k);
%     [pts3d, rgb] = GeneratePointCloudsFromOneDepthmapGlobal(cam(k), LoadFLTFile(sprintf('results\\depthMap%03d.txt', k-1)));
    [pts3d, rgb, faces] = GeneratePointCloudsFromOneDepthmapGlobal(cam(k), LoadFLTFile(sprintf('results\\depthMap%03d.txt', k-1)), 1, 1);
%     rgb = repmat(colorcode(k-startid, :), size(pts3d, 2), 1);
%     Write3DPointsToPlyFile(fullfile(folder, sprintf('cam%03d.ply', k)), pts3d, rgb);
    
    faces(:, 2:end) = faces(:, 2:end)++size(total_p3d, 1);
    
    total_p3d = [total_p3d; pts3d'];
    total_rgb = [total_rgb; rgb];
    total_faces = [total_faces; faces];
end

%%

Write3DPointsAndFacesToPlyFile(fullfile(folder, sprintf('cam%03d_%d.ply', startid, num)), total_p3d, total_rgb, total_faces);
%%
kid = 20;
% [pts3d, rgb] = GeneratePointCloudsFromOneDepthmap(cam(kid), LoadFLTFile(sprintf('results\\depthMap%03d.txt', kid-1)));
[pts3d, rgb, faces] = GeneratePointCloudsFromOneDepthmapGlobal(cam(kid), LoadFLTFile(sprintf('results\\depthMap%03d.txt', kid-1)), 1, 1);
% Write3DPointsToPlyFile(sprintf('cam%03d.ply', kid), pts3d, rgb);
Write3DPointsAndFacesToPlyFile(sprintf('cam%03d.ply', kid), pts3d, rgb, faces);
%%
Write3DPointsToPlyBin(fullfile(folder, 'cam_total.ply'), total_p3d, total_rgb);

%%
[pts3d, rgb, faces] = GeneratePointCloudsFromOneDepthmapGlobal(cam(1), imresize(dep, [2304 3072], 'Method', 'nearest'), 1, 1);
% Write3DPointsToPlyFile(sprintf('cam%03d.ply', kid), pts3d, rgb);
Write3DPointsAndFacesToPlyFile('cam-001.ply', pts3d, rgb, faces);

%%
[pts3d, rgb] = GeneratePointCloudsFromOneDepthmapGlobal(cam(1), imresize(dep, [2304 3072], 'Method', 'nearest'), 1, 1);
Write3DPointsToPlyBin('cam-001-bin.ply', pts3d, rgb);

    