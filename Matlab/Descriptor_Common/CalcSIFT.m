function [f, d] = CalcSIFT(img, showFlag)
    % a simple wrapper for vl_sift
    % f is keypoints, 4 * N - x, y, scale, orientation
    % d is descriptor, 128 * N
    
    if ~exist('showFlag', 'var')
        showFlag = 0;
    end
    
    imsz = size(img);
    if imsz(3) == 3
        % color -> gray
        img = rgb2gray(img);
    end
    
    im = single(img);
    [f, d] = vl_sift(im);
    
    if showFlag == 1
        % random 50 or less sift points
        figure, imshow(img), drawnow;
        perm = randperm(size(f,2)) ;
        if size(f, 2)<50
            sel = perm;
        else
            sel = perm(1:50);
        end
        h1 = vl_plotframe(f(:,sel)) ;
        h2 = vl_plotframe(f(:,sel)) ;
        set(h1,'color','k','linewidth',3) ;
        set(h2,'color','y','linewidth',2) ;

        h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
        set(h3,'color','g') ;
    end
    
    if showFlag == 2
        % show all the keypoints positions
        figure, imshow(img), drawnow;
        fprintf(1, '%d number of keypoints are showing...\n', size(f, 2));
        h1 = vl_plotframe(f) ;
        h2 = vl_plotframe(f) ;
        set(h1,'color','k','linewidth',3) ;
        set(h2,'color','y','linewidth',2) ;       
    end
end
