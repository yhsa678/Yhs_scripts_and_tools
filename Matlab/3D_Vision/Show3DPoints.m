function Show3DPoints(points3d, axisRange, sampleRate)

    if nargin < 3
        sampleRate = 0.01; % show 1%'s points
    end
    
    if nargin < 2
        axisRange = [];
    end
    
    numPoints = size(points3d, 1);
    step = floor(size(numPoints * sampleRate));
    points = points3d(1:step:end, :);

    fprintf(1, 'Number = %d points are showed!\n', size(points, 1));
    
    figure(1);
    % subplot(3,1,1);
    plot3(points(:,1), points(:,2), points(:,3), '*');
    axis equal;
    if ~isempty(axisRange)
        axis(axisRange);
    end
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title('3d points');
    view(0,90);

    % subplot(3,1,2);
    figure(2);
    plot3(points(:,1), points(:,2), points(:,3), '*');
    axis equal;
    if ~isempty(axisRange)
        axis(axisRange);
    end
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title('3d points');
    view(90,0);

    figure(3)
    % subplot(3,1,3);
    plot3(points(:,1), points(:,2), points(:,3), '*');
    axis equal;
    if ~isempty(axisRange)
        axis(axisRange);
    end
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title('3d points');
    view(0,0);

    % figure(4);
    % subplot(3,1,1);
    % plot(points(:,1), ones(size(points,1),1), '*');
    % title('x axis');
    % 
    % subplot(3,1,2);
    % plot(points(:,2), ones(size(points,1),1), '*');
    % title('y axis');
    % 
    % subplot(3,1,3);
    % plot(points(:,2), ones(size(points,1),1), '*');
    % title('z axis');

end