sumD = [];
for k = 0:23
    if isempty(sumD)
        sumD = showSPM(['_SPMap' num2str(k) '.txt']);
    else
        sumD = sumD+showSPM(['_SPMap' num2str(k) '.txt']);
    end
        
    pause(0.5)
    % Create a new figure
% figure (fig_ct)
% Plot your figure

% save the figure to your working directory
% eval(['print -djpeg99 '  num2str(k+1)]);
% eval(['print -dpng '  ['SPM_' num2str(k+1)]]);
% increment the counter for the next figure
%fig_ct = fig_ct+1;
end

figure, imagesc(sumD)