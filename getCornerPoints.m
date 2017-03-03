function cornerPoints = getCornerPoints(box)
% box(n*4): [x, y, w, h]
% cornerPoints(2*4n): [x1~x4n; y1~y4n]
nBox = size(box, 1);
%% check input
if nBox < 1
    cornerPoints = [];
    return;
end
cornerPoints = [];
%% process each box
for i = 1:nBox
    x1 = box(i, 1);
    y1 = box(i, 2);
    w = box(i, 3); 
    h = box(i, 4);
    x2 = x1 + w -1;
    y2 = y1 + h -1;
    xs = [x1, x1, x2, x2];
    ys = [y1, y2, y2, y1];
    cornerPoints = [cornerPoints, [xs; ys]];
end
