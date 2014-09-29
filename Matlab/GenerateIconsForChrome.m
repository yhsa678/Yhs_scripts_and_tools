function GenerateIconsForChrome(imgIn)

img = imread(imgIn);
imwrite(imresize(img, [16 16]), 'icon_16.png');
imwrite(imresize(img, [19 19]), 'icon_19.png');
imwrite(imresize(img, [38 38]), 'icon_38.png');
imwrite(imresize(img, [48 48]), 'icon_48.png');
imwrite(imresize(img, [128 128]), 'icon_128.png');