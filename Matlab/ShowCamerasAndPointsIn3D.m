function ShowCamerasAndPointsIn3D(modelfile, option)

if nargin < 2
    option = 1;
end
%%
if option == 1
    [cam, p3d] = ReadNVM(modelfile);
else option == 2
    % load as .mat file
    load(modelfile);
end
%%
fig = figure, clf, hold on

set(fig,'Position',[200 200 960 800]);
grid on;
hax = gca;
view(hax, [-16 20]);
title('Cameras and 3D Points');
xlabel('x'); ylabel('y'); zlabel('z');
axis vis3d
axis([-1.5 0.1 -1 0.3 -0.1 0.5]);

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