nrOfPoints = 50;

x = linspace(0, 1, nrOfPoints);
u = zeros(size(x));

S = 0.2*sin(2*pi*x);
SN = S+randn(size(S))*0.05;

dx = x(2)-x(1);
nrIter = 1000;
