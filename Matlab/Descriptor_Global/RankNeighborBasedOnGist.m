function imglist = RankNeighborBasedOnGist(imglist)

    for k = 1:numel(imglist)
        fprintf(1, 'Calculating gist of no. %d of %d...\n', k, numel(imglist));
        imglist(k).gist = GetImageGist(imglist(k).img);
    end
    
    for k1 = 1:numel(imglist)
        fprintf(1, 'Ranking no. %d of %d...\n', k1, numel(imglist));
        dist = zeros(1, numel(imglist));
        gi = imglist(k1).gist;
        for k2 = 1:numel(imglist)
            dist(k2) = sum((gi-imglist(k2).gist).^2);
        end
        [~, sortedId] = sort(dist);
        imglist(k1).rankUsingGist = sortedId;
    end
end