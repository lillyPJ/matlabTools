function displayEightBox(box, color)
% box: [x1, x2, x3, x4; y1, y2, y3, y4]
if nargin < 2
    color = 'g';
end
if isempty(box)
    return;
end
hold on
patch('XData', box(1,:), 'YData', box(2,:), ...
    'EdgeColor', color,'FaceColor','none','LineWidth',2);  