function imgMarked = DrawCircleOnImage(img, pos, markSize, color)
if nargin < 4
    color = [255 0 0];
end

if nargin < 3
    markSize = 10;
end

imgMarked = img;
markDis = markSize.^2;
color = uint8(color);
height = size(img, 1);
width = size(img, 2);
for ky = 1:height
    for kx = 1:width
        if ((ky-pos(2)).^2+(kx-pos(1)).^2) < markDis
            imgMarked(ky, kx, :) = color;
        end
    end
end