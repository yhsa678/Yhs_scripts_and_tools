nvmfile = 'iconic_CC0.nvm';
% [cam, points3d] = readNVM(nvmfile);
% 
% for k = 1:length(cam)
%     writeMiddleburry(cam, ['cam_' num2str(k) '.ini']);
% end

mbFile = 'test_nvm2middlebury.txt';
[cam, p3d] = convertNVM2Middleburry(nvmfile, mbFile);

%%
% [folder, file, ~] = fileparts(nvmfile)
timg = read_middleBurry(fullfile(fileparts(nvmfile), mbFile));

%%
rseq = randperm(length(p3d));

%%

lenImg = length(timg);

for k = 1:lenImg
    timg(k).img = imread(timg(k).imageName);
    timg(k).width = size(timg(k).img, 2);
    timg(k).height = size(timg(k).img, 1);
end

%%

pid = rseq(4124);
pWorld = p3d(pid).pos';

pTimg = [];
for k = 1:lenImg
    pTar = timg(k).K * [timg(k).R, timg(k).T] * [pWorld; ones(1, size(pWorld, 2))];
    pTar2D = pTar(1:2)./pTar(3);
    pTimg = [pTimg round(pTar2D)];
end

%%
% markerInserter = vision.MarkerInserter('Shape','X-mark','BorderColor','Custom','CustomBorderColor',uint8([0 0 255]));
for k = 1:lenImg
    p = pTimg(:, k);
    if p(1)<=0 || p(2)<=0 || p(1)>timg(k).width || p(2)>timg(k).height
        continue;
    end
    figure(1), clf, hold on
%     img = timg(k).img;
%     J = step(markerInserter, img, int32([p(2) p(1)]));
% Pts = int32([20 20; 40 40; 60 60]);
% J = step(markerInserter, RGB, Pts);
% imshow(J);
% imshow(img, 'InitialMagnification', 100);
% image(img), hold on 
%      plot(p(2), p(1), 'ro', 'MarkerSize', 10);
    [~, name, ~] = fileparts(timg(k).imageName);
    img = imread(fullfile('image_1', [name, '.jpg']));
    mImg = DrawCircleOnImage(img, p, 10);
    imshow(mImg);
    pause
end
%%
pColor = [];
for k = 1:lenImg
    p = pTimg(:, k);
    if p(1)<=0 || p(2)<=0 || p(1)>timg(k).width || p(2)>timg(k).height
        continue;
    end 
%     img = imread(timg(k).imageName);
    pColor = [pColor; timg(k).img(p(2), p(1), :)];
end
pColor

%%
rseq = randperm(length(p3d));
for rp = 1:100
    pid = rseq(rp);
pWorld = p3d(pid).pos';

pTimg = [];
for k = 1:lenImg
    pTar = timg(k).K * [timg(k).R, timg(k).T] * [pWorld; ones(1, size(pWorld, 2))];
    pTar2D = pTar(1:2)./pTar(3);
    pTimg = [pTimg round(pTar2D)];
end

pColor = [];
for k = 1:lenImg
    p = pTimg(:, k);
    if p(1)<=0 || p(2)<=0 || p(1)>timg(k).width || p(2)>timg(k).height
        continue;
    end 
%     img = imread(timg(k).imageName);
    pColor = [pColor; timg(k).img(p(2), p(1), :)];
end
pColor


figure(1), clf, hold on
for k = 1:size(pColor, 1)
    plot3(pColor(k, :, 1), pColor(k, :, 2), pColor(k, :, 3), 'o', 'MarkerFaceColor', pColor(k, :, :)./255.0);
end
size(pColor, 1)
xlim([0 255]), ylim([0 255]), zlim([0 255])
xlabel('r'), ylabel('g'), zlabel('b');
grid on 
view([50 50])

%
figure(2), clf, hold on
k = 1;
% subplot(1, 3, k),
hist(pColor(:, :, k), [0:255]);
xlim([-5 260]), ylim([0 size(timg, 2)])
text(155, size(timg, 2)/2, 'building');
text(102, size(timg, 2)/2, 'ground');
text(0, size(timg, 2)/2, 'vege');
xlabel('label distribution');
% k = 2;
% subplot(1, 3, k), hist(pColor(:, :, k), [0:255]);
% xlim([-5 260]), ylim([0 size(timg, 2)])
% text(128, size(timg, 2)/2, 'vege');
% xlabel('g');
% k = 3;
% subplot(1, 3, k), hist(pColor(:, :, k), [0:255]);
% xlim([-5 260]), ylim([0 size(timg, 2)])
% text(255, size(timg, 2)/2, 'sky');
% text(102, size(timg, 2)/2, 'ground');
% xlabel('b');
cnt = 1;
rk = randperm(lenImg);
for kid = 1:lenImg
    k = rk(kid);
    p = pTimg(:, k);
    if p(1)<=0 || p(2)<=0 || p(1)>timg(k).width || p(2)>timg(k).height
        continue;
    end

    figure(cnt+2), clf, hold on
    labelimg = timg(k).img;
%     J = step(markerInserter, img, int32([p(2) p(1)]));
% Pts = int32([20 20; 40 40; 60 60]);
% J = step(markerInserter, RGB, Pts);
% imshow(J);
% imshow(img, 'InitialMagnification', 100);
% image(img), hold on 
%      plot(p(2), p(1), 'ro', 'MarkerSize', 10);
    [~, name, ~] = fileparts(timg(k).imageName);
    img = imread(fullfile('image_1', [name, '.jpg']));
    mImg = DrawCircleOnImage(img, p, 20);
    subplot(1, 2, 1), imshow(mImg);
    mlabelimg = DrawCircleOnImage(labelimg, p, 20);
    subplot(1, 2, 2), imshow(mlabelimg);
%     pause

    if cnt < 2
        cnt = cnt+1;
    else
        break;
    end
end
tf = 'tmp_distrb';
mkdir(tf);
for xid = 1:4
    hFig = figure(xid);
     print(hFig, '-dpng', fullfile(tf, ['point_' num2str(pid) '_' num2str(xid) '.' 'jpg']));
end
end