function displayEightPoly(box, color)
% box: [x1, y1, x2, y2, x3, y3, x4, y4]
if nargin < 2
    color = 'g';
end
if isempty(box)
    return;
end
hold on
nBox = size(box, 1);
for i = 1:nBox
    patch('XData', box(i, 1:2:8), 'YData', box(i, 2:2:8), ...
        'EdgeColor', color,'FaceColor','none','LineWidth',2);
end