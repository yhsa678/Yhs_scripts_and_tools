function [camera, points3D] = ReadNVM(nvmFileName)

    % credit: https://github.com/ezheng/script
    % Input: nvm files
    % Output: cameras and 3d points

    fid = fopen(nvmFileName);
    assert(fid>0, sprintf('Read %s file error!\n', nvmFileName));

    str = fgets(fid);
    assert(all(strtrim(str) == 'NVM_V3'), 'Not valid NVM_V3 file\n');

    % skip empty line?
    str = fgets(fid);

    % read cameras
    numOfImages = str2num(fgets(fid));
    for i = 1:numOfImages
        str = fgets(fid);
        [imgFileName, pos] = textscan(str, '%s', 1);
        data = textscan(str(pos+1 : end), '%f');
        assert(numel(data{1}) == 10, 'Camera format is not correct!\n');
        camera(i).name = imgFileName{1}{1};
        camera(i).focalLength = data{1}(1);
        camera(i).quaternion = [data{1}(2),data{1}(3), data{1}(4), data{1}(5)];

    %      R = quaternion2matrix(camera(i).quaternion);
    %     assert(abs(norm(camera(i).quaternion) - 1)<0.0001)
        % make sure quaternion to have unit norm
        camera(i).quaternion = camera(i).quaternion./norm(camera(i).quaternion);
        camera(i).pos = [data{1}(6),data{1}(7), data{1}(8)];
        
        % camera(i).distortion = [data{1}(9),data{1}(10)];
        % [change by yhs]
        camera(i).distortion = data{1}(9);
        assert(data{1}(10) == 0, 'Camera last value should be 0!\n');
    end

    % skip empty line?
    str = fgets(fid);

    % read 3d points
    numOf3DPoints = str2num(fgets(fid));

    fprintf(1, 'reading points...\n');
    if(numOf3DPoints == 0)
        points3D = [];
    end
    for i = 1:numOf3DPoints 
        if mod(i, 100) == 0
           fprintf( '%f%% percent is finished\n', i/numOf3DPoints * 100 );
        end
        str = fgets(fid);
        data = textscan(str, '%f');
        points3D(i).pos = data{1}(1:3)' ;
        points3D(i).rgb = data{1}(4:6)';   
        numOfMeasure = data{1}(7);   
        measure = zeros(numOfMeasure, 4);

        for j = 1:numOfMeasure
            measure(j,:) = data{1}( (j-1) * 4 +1 + 7: (j-1) * 4 +4 + 7);   
            %        imageIdx, featureIdx, x, y
            imageIdx = measure(j,1);
            assert( imageIdx >= 0 && imageIdx <= numOfImages-1, ...
                sprintf('Point should be lie in [0-%d] images!\n', numOfImages-1));
        end
        points3D(i).measure = measure;   
        %    a = [a; measure];
    end

    fclose(fid);
end



