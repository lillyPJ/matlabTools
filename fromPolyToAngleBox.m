function angleBoxes = fromPolyToAngleBox(polys, refPoint)
% [input] polys(n*8): [x1, y1, x2, y2, x3, y3, x4, y4]
% [input] refPoint = [refX, refY] (default: refPoint = center)
% [output] angleBox(n*5): [x, y, w, h, theta]
if nargin < 2
    refPoint = [];
end
nPoly = size(polys, 1);
angleBoxes = [];
if nPoly < 1
    return;
end

for i = 1:nPoly
    poly = [polys(i,1:2:8); polys(i,2:2:8)];
    angleBoxes = [angleBoxes; getAngleBox(poly, refPoint)];
end