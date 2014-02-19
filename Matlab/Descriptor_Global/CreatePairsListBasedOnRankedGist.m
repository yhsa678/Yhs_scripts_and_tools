function imglist = CreatePairsListBasedOnRankedGist(filename, imgfolder, topK)

    imglist = ReadImages(imgfolder, '.JPG');
    imglist = RankNeighborBasedOnGist(imglist);

    fout = fopen(filename, 'w');
    for k = 1:numel(imglist)
        for k2 = 1:topK
            fprintf(fout, '%s %s\r\n', imglist(k).filepath, imglist(imglist(k).rankUsingGist(k2+1)).filepath);
%             fprintf(fout, '%d %d\r\n', k-1, imglist(k).rankUsingGist(k2+1)-1);
        end
    end
    fclose(fout);
end