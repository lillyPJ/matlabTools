function polys = fromAngleBoxToPoly(box)
% [input] angleBox(n*5): [x, y, w, h, theta]
% [output] polys(n*8): [x1, y1, x2, y2, x3, y3, x4, y4]


nBox = size(box, 1);
polys = [];
if nBox < 1
    return;
end

for i = 1:nBox
    poly = rotateBoxPoly(box(i, 1:4), box(i, 5));
    polys = [polys; poly(:)'];
end