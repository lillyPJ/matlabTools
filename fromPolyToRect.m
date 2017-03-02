function box = fromPolyToRect(poly)
% poly: 2*4 matrix
% poly(1,:) = x1, x2, x3, x4
% poly(2,:) = y1, y2, y3, y4
% left-up, left-down, right-down, right-up
if isempty(poly)
    box = [];
    return;
end
assert(size(poly, 1) == 2);
assert(size(poly, 2) == 4);
xmin = min(poly(1, :));
ymin = min(poly(2,:));
xmax = max(poly(1, :));
ymax = max(poly(2,:));
box = [xmin, ymin, xmax - xmin + 1, ymax - ymin + 1];
