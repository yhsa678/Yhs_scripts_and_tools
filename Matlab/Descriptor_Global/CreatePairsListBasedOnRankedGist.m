function imglist = CreatePairsListBasedOnRankedGist(filename, imgfolder, topK)
%CREATEPAIRSLISTBASEDONRANKEDGIST generate top pairs list using gist score
%   used for input to visualSFM specified match pairs 
%
%   See also RankNeighborBasedOnGist, ReadNVM
    imglist = ReadImages(imgfolder, '.JPG');
    imglist = RankNeighborBasedOnGist(imglist);

    fout = fopen(filename, 'w');
    for k = 1:numel(imglist)
        for k2 = 1:topK
            [~, fname1, fext1] = fileparts(imglist(k).filepath);
            [~, fname2, fext2] = fileparts(imglist(imglist(k).rankUsingGist(k2+1)).filepath);
            fprintf(fout, '%s %s\r\n', [fname1 fext1], [fname2 fext2]);
%             fprintf(fout, '%s %s\r\n', imglist(k).filepath, imglist(imglist(k).rankUsingGist(k2+1)).filepath);
%             fprintf(fout, '%d %d\r\n', k-1, imglist(k).rankUsingGist(k2+1)-1);
        end
    end
    fclose(fout);
end