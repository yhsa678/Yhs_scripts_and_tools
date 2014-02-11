function [features, descriptors] = parse_binary_sift_v4(filepath, max_num_sift)

    % features    = 4   x N, single, (x, y, scale, orientation)
    % descriptors = 128 x N, single
    
    if ~exist('max_num_sift', 'var')
        max_num_sift = 0;
    end
    
    features = [];
    descriptors = [];
    
    file = fopen(filepath, 'rb');
    if file == -1
        disp(['ERROR: failed to open file: ' filepath])
        return
    end
    
    header = 'SIFTV4.0';
    data = fread(file, [1, length(header)], '*char');
    if ~strcmp(header, data)
        disp('ERROR: expected valid header, received:')
        disp(data)
        return
    end
    
    num_features = fread(file, 1, 'int');
    num_feature_dim = fread(file, 1, 'int');
    num_descriptor_dim = fread(file, 1, 'int');
    
    if num_features <= 0
        disp(['ERROR: expected positive, non-zero number of features: ' num2str(num_features)])
        return
    end
    
    if num_feature_dim ~= 5
        disp(['ERROR: expected 5 feature dimensions: ' num2str(num_feature_dim)])
        return
    end
    
    if num_descriptor_dim ~= 128
        disp(['ERROR: expected 128 descriptor dimensions: ' num2str(num_feature_dim)])
        return
    end
    
    features = fread(file, [5, num_features], '*single');
    features = [features(1:2,:); features(4:5,:)];
    
    descriptors = fread(file, [128, num_features], 'uint8=>single');
    
    if max_num_sift > 0
        if num_features > max_num_sift
            features = features(:,1:max_num_sift);
            descriptors = descriptors(:,1:max_num_sift);
        end
    end
    
    lengths = descriptors .^ 2;
    lengths = sum(lengths, 1);
    lengths = sqrt(lengths);
    lengths = repmat(lengths, 128, 1);
    descriptors = descriptors ./ lengths;
    
    fclose(file);

end % function
