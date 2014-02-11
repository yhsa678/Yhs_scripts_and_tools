%%
list = ListCertainFormatFilesInAFolder([pwd '\image'], 'sift');
imglist = ListCertainFormatFilesInAFolder([pwd '\image'], 'jpg');
%%
newfolder = 'img_sift';
mkdir(newfolder);
for k = 1:numel(list)
    [~, fname, ~] = fileparts(list(k).filepath);
    img = imread(imglist(k).filepath);
%     img = rgb2gray(img);
% %     figure, imagesc(I);
     fig = figure(1); clf;
    imagesc(img) , colormap(gray);
%     I = single(img);
%     [f,d] = vl_sift(I) ;
    [f, d] = parse_binary_sift_v4(list(k).filepath);
    perm = randperm(size(f,2)) ;
    sel = perm(1:50) ;
    h1 = vl_plotframe(f(:,sel)) ;
    h2 = vl_plotframe(f(:,sel)) ;
    
    set(h1,'color','k','linewidth',3) ;
    set(h2,'color','y','linewidth',2) ;
    
    h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
    set(h3,'color','g') ;
    
    [rows columns, ~] = size(img);
    posX = 100; posY = 100; %you can set any value for posX and posY - try to keep it on screen

    set(gcf,'Position',[posX posY columns rows]);
    set(gca,'units','pixels');
    set(gca,'units','normalized','position',[0 0 1 1]);
    axis manual
    axis([0 columns 0 rows]);
    axis off;
    axis tight;
    
    print(fig, '-dpng', fullfile(newfolder, fname));
end