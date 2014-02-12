%% Batch show image, geolabel, semlabel

imFolder = 'Test_notre_dame2\\';
geoFolder = 'geo\\Test_notre_dame2\\';
semFolder = 'sem\\Test_notre_dame2\\';

spFolder = 'sp\\Test_notre_dame2\\';

dstFolder = 'notre_dame2_showResult\\';
mkdir(dstFolder);

d = dir(imFolder);
for k = 1:length(d)
    if d(k).name(1) == '.'
        continue;
    end
    
    
    im = imread([imFolder d(k).name]);
    pos = strfind(d(k).name, '.');
    sem = load([semFolder d(k).name(1:pos(end)) 'mat']);
    geo = load([geoFolder d(k).name(1:pos(end)) 'mat']);
    
    sp = load([spFolder d(k).name(1:pos(end)) 'mat']);
    
    semLoc = [];
    geoLoc = [];
    % label semantic label
    L = sem.L;
    labelList = sem.labelList;
    numSem = length(labelList);
    [X Y] = meshgrid([1:size(L, 2)], [1:size(L, 1)]);
  
    for id = 1:numSem
        mask = (id == L);
        totalNum = sum(sum(mask));
        indMask = find(mask == 1);
        if totalNum == 0
            py = -1; px = -1;
        else
%             py = sum(sum(mask.*Y))./totalNum;
%             px = sum(sum(mask.*X))./totalNum;
%             [py px] = ind2sub(size(L), indMask(floor(end/2)));
            [py px] = ind2sub(size(L), indMask(randi([1 length(indMask)])));
        end
        semLoc = [semLoc; px py];
    end
    
    % label geometry location
    L = geo.L;
    labelList = geo.labelList;
    numGeo = length(labelList);
    [X Y] = meshgrid([1:size(L, 2)], [1:size(L, 1)]);
  
    for id = 1:numGeo
        mask = (id == L);
        totalNum = sum(sum(mask));
        indMask = find(mask == 1);
        if totalNum == 0
            py = -1; px = -1;
        else
%             py = sum(sum(mask.*Y))./totalNum;
%             px = sum(sum(mask.*X))./totalNum;

%             [py px] = ind2sub(size(L), indMask(floor(end/2)));
            [py px] = ind2sub(size(L), indMask(randi([1 length(indMask)])));
        end
        geoLoc = [geoLoc; px py];
    end
        
   
    hFig = figure(1); clf, hold on
    colormap('jet')

    subplot(2, 2, 1), imshow(im), title(d(k).name)
    subplot(2, 2, 2), imagesc(sp.superPixels)
    subplot(2, 2, 3), imagesc(geo.L, [1 numGeo]), axis equal, axis off, hold on
    for id = 1:numGeo
        if geoLoc(id, 1) ~= -1 
            text(geoLoc(id, 1), geoLoc(id, 2), geo.labelList(id), 'FontSize', 15, 'Color', [1 0 0]);
        end
    end
    subplot(2, 2, 4), imagesc(sem.L, [1 numSem]), axis equal, axis off, hold on
    for id = 1:numSem
        if semLoc(id, 1) ~= -1 
            text(semLoc(id, 1), semLoc(id, 2), sem.labelList(id), 'FontSize', 15, 'Color', [0 0.0 0]);
        end
    end
    print(hFig, '-dpng', [dstFolder d(k).name(1:pos(end)) 'png']);
%     pause
    disp([dstFolder d(k).name(1:pos(end)) 'png'])
    pause(0.001)
end

   