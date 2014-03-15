%%
fname = 'IMG_2784.jpg';
img = imread(fname);
%%
[cam, ~] = ReadNVM('cmp.nvm', 1);
cam = AddCameraImageProperty(cam, pwd);
cam = CalcKRTfromNVMCamera(cam);
%%
c1 = GetCameraUsingName(cam, fname);

%%
r = c1.distortion;
% r2 = r * (mx * mx + my * my)
%   The undistorted measurement is (1 + r2) * (mx, my)

cx = c1.K(1, 3);
cy = c1.K(2, 3);
for k1 = 1:1 %c1.height
    for k2 = 1:1 %c1.width
        mx = k2-cx
        my = k1-cy
        r2 = r * (mx * mx + my * my)
        (1+r2)*mx
        (1+r2)*my
    end
end