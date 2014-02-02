function dist = CalcTwoImagesDistancePixelWise(im1, im2, option)

    assert(isempty(find(~(size(im1) == size(im2)))), 'the images should have same size');
    if nargin < 3
        option = 'L2';
    end
    
    diff = double(im1) - double(im2);
   
    t = 0;
    if option == 'L2'
        % L2-distance
        t = (sum(diff.^2, 3)).^(0.5);
    end

    if option == 'L1'
        % L1-distance
        t = sum(abs(diff), 3);
    end
    
    dist = mean(mean(t));
    
end