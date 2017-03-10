function displayAngleBox(box, color, refPoint)
% box: [x, y, w, h, theta]
% color: 'g'
if nargin < 3
    refPoint = [];
end
m = size(box,  1);
if nargin == 1
    color = 'g';
end
hold on;
for i = 1:m
    rotateBox = rotateBoxPoly(box(i, 1:4), box(i, 5), refPoint);
    %displayBox(box);
    patch('XData', rotateBox(1,:), 'YData', rotateBox(2,:), ...
    'EdgeColor', color,'FaceColor','none','LineWidth',1);   
end
hold off;
