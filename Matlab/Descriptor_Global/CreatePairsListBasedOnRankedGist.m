function imglist = CreatePairsListBasedOnRankedGist(filename, imgfolder, topK)

    imglist = ReadImages(imgfolder, '.JPG');
    imglist = RankNeighborBasedOnGist(imglist);

    fout = fopen(filename, 'w');
    for k = 1:numel(imglist)
        for k2 = 1:topK
            fprintf(fout, '%s %s\r\n', imglist(k).imgpath, imglist(imglist(k).rankUsingGist(k2+1)).imgpath);
        end
    end
    fclose(fout);
end