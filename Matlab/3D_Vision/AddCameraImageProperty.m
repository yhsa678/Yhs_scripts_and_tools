function cam = AddCameraImageProperty(camera, camImgFolder)
% add camera image full path and basic property, e.g. width, height into
% camera structure
% input is camera structure that extracted using ReadNVM function

    for k = 1:numel(camera)
         if mod(k, 100) == 0
            fprintf( '%f%% percent is finished\n', k/numel(camera)*100 );
        end
        
        filename = camera(k).name;
        
        % temporarily the camImgFolder is given by user
        camera(k).imgpath = fullfile(camImgFolder, filename);
        
        img = imread(camera(k).imgpath);
        camera(k).height = size(img, 1);
        camera(k).width = size(img, 2);
        camera(k).channel = size(img, 3);
    end
    cam = camera;
end