function cam = CalcKRTfromNVMCamera(camera)
% calculate camera calibration matrix in K, R, T format from standard NVM
% format, which are using focal length, quaternion, pos
% NOTE: should call AddCameraImageProperty first, which will get image
% width and height from camera images

    for i = 1:numel(camera)
        if mod(i, 100) == 0
            fprintf( '%f%% calculating K,R,T is finished, total = %d\n', i/numel(camera)*100, numel(camera));
        end
        % intrinsic
        camera(i).K = [camera(i).focalLength, 0, camera(i).width/2.0;
            0, camera(i).focalLength, camera(i).height/2.0;
            0, 0, 1];

        % extrinsic
        TR = quaternion2matrix(camera(i).quaternion);
        camera(i).R = TR(1:3, 1:3);

        camera(i).T = -camera(i).R * camera(i).pos';
    end
    cam = camera;
end






