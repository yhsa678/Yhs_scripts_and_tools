function cam = AddCameraImageProperty(camera, camImgFolder)
% add camera image full path and basic property, e.g. width, height into
% camera structure
% input is camera structure that extracted using ReadNVM function

    for k = 1:numel(camera)
         if mod(k, 30) == 0
            fprintf( '%f%% add camera images is finished, total = %d\n', k/numel(camera)*100, numel(camera));
        end
        
        filename = camera(k).name;
        
        % temporarily the camImgFolder is given by user
        [fileFolder, fname, fileExt] = fileparts(filename);
        
        % if not specify folder, use default 
        if ~exist('camImgFolder', 'var')
            camImgFolder = fileFolder;
        end
        
        if isempty(fileExt)
            % temporarily add the file extension due to not using pcdb file
            camera(k).filepath = fullfile(camImgFolder, [fname '.jpg']);
        else
            camera(k).filepath = fullfile(camImgFolder, [fname fileExt]);
        end
        
        img = imread(camera(k).filepath);
        camera(k).height = size(img, 1);
        camera(k).width = size(img, 2);
        camera(k).channel = size(img, 3);
    end
    cam = camera;
end