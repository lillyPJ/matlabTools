function angleBox = getPolyFromBox(box, polyAngle)
% [input] box(n*4): x, y, w, h
% [input] polyAngle(n*1): theta
% [output] angleBox(n*5): x, y, w', h', theta
angleBox = [];
nBox = size(box, 1);
if nBox < 1
    return;
end
cosP = abs(cos(polyAngle));
sinP = abs(sin(polyAngle));
denom =  (cosP.^2 - sinP.^2);
width = (box(:, 3).*cosP - box(:, 4).*sinP)./denom;
height = (box(:, 4).*cosP - box(:, 3).*sinP)./denom;
angleBox = box;
angleBox(:, 3) = width;
angleBox(:, 4) = height;
angleBox(:, 1) = box(:, 1) + (box(:, 3) - width)./2;
angleBox(:, 2) = box(:, 2) + (box(:, 4) - height)./2;
angleBox(:, 5) = polyAngle;

    