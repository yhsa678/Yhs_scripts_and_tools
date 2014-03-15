function num = ShowSIFT(img, f, d)
%SHOWSIFT function to show sifts on image   
%	f is keypoints, 4 * N - x, y, scale, orientation
% 	d is descriptor, 128 * N
%
%	See also CalcSIFT, vl_sift, parse_binary_sift_v4
    
    figure, imshow(img), drawnow;
	h1 = vl_plotframe(f) ;
	h2 = vl_plotframe(f) ;
	set(h1,'color','k','linewidth',3) ;
	set(h2,'color','y','linewidth',2) ;

	h3 = vl_plotsiftdescriptor(d, f) ;
	set(h3,'color','g') ;
	
	
    num = size(f, 2);
end
