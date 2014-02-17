function pm = ReadPairMatchFile(filename)
% read pair match file that is exported by VisualSFM -> pairwise match ->
% export F-matrix match

fin = fopen(filename, 'r');

% ignore the comments
while 1
    tline = fgetl(fin);
    if isempty(tline), break, end;
    if tline(1) ~= '#', break, end;
end

pm = [];
kid = 1;
while 1
    data = textscan(fin, '%d%s', 2);
    if isempty(data) | isempty(data{1})
        break;
    end
    
    pm(kid).img1Ind = data{1}(1);
    pm(kid).img2Ind = data{1}(2);
    pm(kid).img1Path = char(data{2}(1));
    pm(kid).img2Path = char(data{2}(2));
    
    num = textscan(fin, '%d', 1);
    num = double(num{1});
    data = textscan(fin, '%d %f %f %d %f %f', num);
    
    % add feature match to list
    for fm = 1:num
        pm(kid).img1FeatureMatch = [double(data{1}) data{2} data{3}];
        pm(kid).img2FeatureMatch = [double(data{4}) data{5} data{6}];
    end
    if mod(kid, 100) == 0
        fprintf(1, 'Reading %d matched pairs...\r\n', kid);
    end
    kid = kid+1;
end

fclose(fin);
