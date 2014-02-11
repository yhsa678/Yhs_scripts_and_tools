%%
list = ListCertainFormatFilesInAFolder([pwd '\image'], 'jpg');
%%
newfolder = 'img_matches';
mkdir(newfolder);

for k1 = 1:numel(list)
    for k2 = 1:numel(list)
        if k1==k2, continue, end;
        
        [~, fname1, ~] = fileparts(list(k1).filepath);
        [~, fname2, ~] = fileparts(list(k2).filepath);
        imga = imread(list(k1).filepath);
        imgb = imread(list(k2).filepath);
        Ia = single(rgb2gray(imga));
        Ib = single(rgb2gray(imgb));
        [fa, da] = vl_sift(Ia) ;
        [fb, db] = vl_sift(Ib) ;
        [matches, scores] = vl_ubcmatch(da, db) ;
        
        dh1 = max(size(imgb,1)-size(imga,1),0) ;
        dh2 = max(size(imga,1)-size(imgb,1),0) ;
        
        fig = figure(1) ; clf ;
        showimg = [padarray(imga,dh1,'post') padarray(imgb,dh2,'post')];
        imagesc(showimg) ;
        o = size(imga,2) ;
        if size(matches, 2) > 50;
            sel = 1:50;
        else
            sel = 1:size(matches, 2);
        end
        
        h1 = vl_plotframe(fa(:,matches(1, sel))) ;
        h2 = vl_plotframe(fa(:,matches(1, sel))) ;
        %
        set(h1,'color','k','linewidth',3) ;
        set(h2,'color','y','linewidth',4) ;
        
        drawb = fb(:, matches(2, sel));
        drawb(1, :) = drawb(1, :)+o;
        h1 = vl_plotframe(drawb) ;
        h2 = vl_plotframe(drawb) ;
        %
        set(h1,'color','k','linewidth',3) ;
        set(h2,'color','y','linewidth',4) ;
        h = line([fa(1,matches(1,sel));fb(1,matches(2,sel))+o], ...
            [fa(2,matches(1,sel));fb(2,matches(2,sel))]) ;
        set(h, 'color', 'g', 'linewidth', 2)
        
        
        
        [rows, columns, ~] = size(showimg);
    posX = 100; posY = 100; %you can set any value for posX and posY - try to keep it on screen

    set(gcf,'Position',[posX posY columns rows]);
        set(gca,'units','pixels');
        set(gca,'units','normalized','position',[0 0 1 1]);
        axis image off ;
        
        axis off;
    axis tight;
    
    print(fig, '-dpng', fullfile(newfolder, [fname1 '-' fname2]));
    end
end