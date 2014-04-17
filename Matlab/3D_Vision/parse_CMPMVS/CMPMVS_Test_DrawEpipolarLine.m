%%
f1no = '00001';
f2no = '00009';

im1 = imread([f1no '._c.png']);
im2 = imread([f2no '._c.png']);

figure, imshowpair(im1, im2, 'montage');
%%
P1 = load([f1no '_P.txt']);
P2 = load([f2no '_P.txt']);

F12 = fundfromcameras(P1, P2);

%%
x = [628 500 1]';
F12*x
lines = epipolarLine(F12, x(1:2)');

p = lineToBorderPoints(lines, size(im2));


figure, subplot(1, 2, 1), hold on;
imshow(im1), plot(x(1), x(2), 'ro', 'MarkerSize', 10);
subplot(1, 2, 2), hold on;
imshow(im2), line(p([1,3])', p([2,4])');