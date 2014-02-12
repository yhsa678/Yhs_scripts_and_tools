function ShowTwoImages(im1, im2)
wid12 = size(im1, 2)+size(im2, 2);
hei12 = max(size(im1, 1), size(im2, 1));
figure, 
[0 0 size(im1, 2)/wid12 1]
hax = axes('position', [0 0 size(im1, 2)/wid12 1]), 
imagesc(im1, 'Parent', hax),
axis('off');  axis('tight')
drawnow

axes('position', [size(im1, 2)/wid12 0 size(im2, 2)/wid12 1]),
axis('off');  axis('tight')
image(im2)
drawnow