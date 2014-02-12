function num = OutputColorCodedSemMat(folder, imgFMT)

% LABEL_ME_TRAINING = 1;
COLOR_CODE = round(jet(34)*255);
% manully define color coded semantic label
% 5 classes:
% sky -> deep blue [0 0 1]
% building -> deep red [1 0 0.5]
% vegetation -> deep green [0 1 0]
% road, ground -> gray 
% other -> black
% 
C_sky = [0 0 255];
C_building = [155 0 28];
C_vege = [0 128 0];
C_ground = [102 102 102];
COLOR_CODE = [...
% 0 0 0; % other for blank 0
0 0 0; % awning
C_building; % balcony
0 0 0; % bird
0 0 0; % boat
0 0 0; % bridge
C_building; % building
C_ground; % bus
C_ground; % car
0 0 0; % cow
C_ground; % crosswalk
0 0 0; % desert
C_building; % door
0 0 0; % fence
0 0 0; % field
C_vege; % grass
0 0 0; % moon
C_building; % mountain
0 0 0; % person
C_vege; % plant
0 0 0; % pole
C_ground; % river
C_ground; % road
0 0 0; % rock
0 0 0; % sand
0 0 0; % sea
C_ground; % sidewalk
0 0 0; % sign
C_sky; % sky
0 0 0; % staircase
0 0 0; % streetlight
0 0 0; % sun
C_vege; % tree
C_building; % window
];

d = dir(folder);
d(1:2) = [];

num = 0;
for k = 1:length(d)
    if isempty(strfind(d(k).name, '.mat'))
        continue;
    end
    sem = load(fullfile(folder, d(k).name));
    
    im = double(zeros([size(sem.L), 3]));
%     im = double(zeros([size(sem.S), 3]));
%     labelList = geo.labelList;
%     numGeo = length(labelList);
    for iy = 1:size(im, 1)
        for ix = 1:size(im, 2)
            im(iy, ix, :) = COLOR_CODE(sem.L(iy, ix), :);
%             tmpId = sem.S(iy, ix);
%             if tmpId ~= 0
%                 im(iy, ix, :) = COLOR_CODE(tmpId, :);
%             end
        end
    end
%     tmp = COLOR_CODE(sem.S+1, :);
%     im = cat(3, reshape(tmp(:, 1), size(sem.S)), reshape(tmp(:, 2), size(sem.S)), reshape(tmp(:, 3), size(sem.S))); 
    
    pos = strfind(d(k).name, '.');
    imwrite(uint8(im), fullfile(folder, [d(k).name(1:pos(end)), imgFMT]));
    disp(d(k).name)
    num = num+1;
end


% write out color coded 
% sem = load(fullfile(folder, d(1).name));
fout = fopen('Color_Code.txt', 'w');
for k = 2:size(COLOR_CODE, 1)
    if sum(COLOR_CODE(k, :)) >= 1
        fprintf(fout, '%s\t\t\t%d %d %d\n', char(sem.names(k-1)), ...
        COLOR_CODE(k, 1), COLOR_CODE(k, 2), COLOR_CODE(k, 3));
    end
end
fclose(fout);

return