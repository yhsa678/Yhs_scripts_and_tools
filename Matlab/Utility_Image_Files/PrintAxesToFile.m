function PrintAxesToFile(filename, hAxes)
    % e.g. PrintAxesToFile('xxx.jpg', gca)
    if ~exist('hAxes', 'var')
        hAxes = gca;
    end
    f = getframe(hAxes);
    imwrite(f.cdata, filename);
end