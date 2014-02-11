d = dir('.');
d(1:2) = [];

kid = 123;
img1 = imread(d(kid).name);
g1 = GetImageGist(img1);

dist = zeros(numel(d), 1);
dist2 = zeros(numel(d), 1);
for k = 1:numel(d)
    fprintf(1, 'Processing %d...\n', k);
    tic
    dist2(k) = CalcTwoImagesDistancePixelWise(img1, imread(d(k).name), 'L2');
    toc
    tic
    dist(k) = sum((g1-GetImageGist(imread(d(k).name))).^2);
    toc
end

[Y, id] = sort(dist);
[Y2, id2] = sort(dist2);


%%
for k = 1:numel(id)
    figure(1), clf, 
    imshowpair(img1, imread(d(id(k)).name), 'montage');
    fprintf(1, 'distance = %f\n', dist(id(k)));
    fprintf(1, 'distance_pixelwise = %f\n', dist2(id(k)));
    
    figure(2), clf,
    plot(dist), hold on
    plot(id(k), dist(id(k)), 'ro', 'MarkerSize', 5);
    figure(3), clf,
    plot(dist2), hold on
    plot(id(k), dist2(id(k)), 'ro', 'MarkerSize', 5);
    pause
end