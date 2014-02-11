function ShowCamerasAndPointsIn3D(modelfile)

%%
[cam, p3d] = ReadNVM(modelfile);
%%
fig = figure, clf, hold on

set(fig,'Position',[0 0 1280 720]);
% grid on;
hax = gca;
view(hax, [-30 50]);
title('Cameras and 3D Points');
xlabel('x'); ylabel('y'); zlabel('z');
axis([-1.5 0.1 -1 0.3 -0.1 0.5]);
ct = 0;

for k = 1:numel(cam)
    plot3(hax, cam(k).pos(1), cam(k).pos(2), cam(k).pos(3), 'r^', 'MarkerSize', 15);
    pause(0.03)
    drawnow
end

for k = 1:5:numel(p3d)
    plot3(hax, p3d(k).pos(1), p3d(k).pos(2), p3d(k).pos(3), 'MarkerSize', 5, 'color', p3d(k).rgb/255.0);
    ct = ct+1;
    if mod(ct, 1000) == 0
        drawnow
    end
end

for k = 1:20
    view(hax, [-30+k*2, 50]);
    pause(0.5);
end