function num = OutputColorCodedGeoMat(folder, imgFMT)

COLOR_CODE = jet(3);

d = dir(folder);
d(1:2) = [];

num = 0;
for k = 1:length(d)
    if isempty(strfind(d(k).name, '.mat'))
        continue;
    end
    geo = load(fullfile(folder, d(k).name));
    
    im = double(zeros([size(geo.L), 3]));
%     labelList = geo.labelList;
%     numGeo = length(labelList);
    for iy = 1:size(im, 1)
        for ix = 1:size(im, 2)
            im(iy, ix, :) = COLOR_CODE(geo.L(iy, ix), :);
        end
    end
    
    pos = strfind(d(k).name, '.');
    imwrite(im, fullfile(folder, [d(k).name(1:pos(end)), imgFMT]));
    disp(d(k).name)
    num = num+1;
end

return