function ret = IsEqualEps(x1, x2, eps)
%ISEQUALEPS check two float, double values if they are equal under certain precision
%   See also isequal

if ~exist('eps', 'var')
    eps = 1e-6;
end

ret = false;
if abs(x1-x2) < eps
    ret = true;
end
