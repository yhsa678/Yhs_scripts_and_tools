%%
tic
[cam, p3d] = ReadNVM('bi.nvm');
toc

tic
[cam2, pts, ptsinfo] = read_nvm_and_image_dimensions('bi.nvm', [pwd '\image']);
toc
%%
cam = AddCameraImageProperty(cam, [pwd '\image']);
cam = CalcKRTfromNVMCamera(cam);
%%
pw1 = p3d(1).pos;

% pc1 = pw1

pw2 = pts.xyzs(:, 1);
