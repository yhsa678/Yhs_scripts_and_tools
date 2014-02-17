function ShowCamerasAndPointsIn3D(modelfile, option)
% option == 1, show '.nvm' file
% option == 2, show pre-saved mat, which contains variable 'cam' and 'p3d'
if ~exist('option', 'var')
    option = 1;
end
%%
if option == 1
    [cam, p3d] = ReadNVM(modelfile);
    cam = AddVisible3DPointsToCamera(cam, p3d);
else option == 2
    % load as .mat file
    load(modelfile);
end
%%
pts3d = [];
for k = 1:numel(p3d)
     pts3d = [pts3d; p3d(k).pos];
end
xmin = min(pts3d(:, 1)); xmax = max(pts3d(:, 1));
ymin = min(pts3d(:, 2)); ymax = max(pts3d(:, 2));
zmin = min(pts3d(:, 3)); zmax = max(pts3d(:, 3));
    

%%
fig = figure; clf, hold on;

set(fig,'Position', [100 20 900 500]);
set(gca,'LooseInset', get(gca,'TightInset'));
grid on;
hax = gca;
view(hax, [-16 20]);
title('Cameras and 3D Points');
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
axis vis3d;

axis([xmin-0.03 xmax+0.03 ymin-0.03 ymax+0.03 zmin-0.03 zmax+0.03]);

% only draw a subset of 3d points
ptsShowFlag = zeros(numel(p3d), 1);
ptsShowFlag(1:5:end) = 1;

timeout = 0.08;
for k = 1:numel(cam)
    plot3(hax, cam(k).pos(1), cam(k).pos(2), cam(k).pos(3), 'k^', 'MarkerSize', 15, 'MarkerFaceColor', [209 255 209]./255);
    pause(timeout);
    if k > 30
        timeout = 0.02;
    end
    ct = 0;
    for k2 = 1:numel(cam(k).visPtsIndex)
        ind = cam(k).visPtsIndex(k2);
        if ptsShowFlag(ind) == 1
            ptsShowFlag(ind) = 2; % only draw the points in the first time
            plot3(hax, p3d(ind).pos(1), p3d(ind).pos(2), p3d(ind).pos(3), '.', 'MarkerSize', 3, 'color', p3d(k).rgb/255.0);
            ct = ct+1;
            if mod(ct, 1000) == 0
                drawnow
            end
        else
            continue;
        end
    end
end
% 
% for k = 1:numel(cam)
%     plot3(hax, cam(k).pos(1), cam(k).pos(2), cam(k).pos(3), 'r^', 'MarkerSize', 15);
%     pause(0.03)
%     drawnow
% end
% 
% for k = 1:5:numel(p3d)
%     plot3(hax, p3d(k).pos(1), p3d(k).pos(2), p3d(k).pos(3), 'MarkerSize', 5, 'color', p3d(k).rgb/255.0);
%     ct = ct+1;
%     if mod(ct, 1000) == 0
%         drawnow
%     end
% end
% 
for k = 1:50
    vp = [-16+k*2, 20];
    view(hax, vp);
    pause(0.1);
end