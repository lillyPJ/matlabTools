function polys = fromAngleBoxToPoly(box, refPoint)
% [input] angleBox(n*5): [x, y, w, h, theta]
% [output] polys(n*8): [x1, y1, x2, y2, x3, y3, x4, y4]

if nargin < 2
    refPoint = [];
end
nBox = size(box, 1);
polys = [];
if nBox < 1
    return;
end

for i = 1:nBox
    poly = rotateBoxPoly(box(i, 1:4), box(i, 5), refPoint);
    polys = [polys; poly(:)'];
end