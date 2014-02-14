function imglist = RankNeighborBasedOnGist(imglist, selRankList)
    % rank images based on gist descriptor
    % selRankList:
    % image id that need to selectively ranked respective to others, avoid all
    % pair-wise computation, by default: all pair-wise

    for k = 1:numel(imglist)
        fprintf(1, 'Calculating gist of no. %d of %d...\n', k, numel(imglist));
        if isfield(imglist(k), 'gist')
            fprintf(1, 'Gist descriptor existed, skipped!\n');
            continue;
        end
        imglist(k).gist = GetImageGist(imglist(k).img);
    end
    
    if ~exist('selRankList', 'var')
        selRankList = 1:numel(imglist);
    end
    
    for k1 = selRankList
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