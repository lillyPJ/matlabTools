function displayAngleBox(box, color)
% box: [x, y, w, h, theta]
m = size(box,  1);
if nargin == 1
    color = 'g';
end
hold on;
for i = 1:m
    rotateBox = rotateBoxPoly(box(i, 1:4), box(i, 5));
    %displayBox(box);
    patch('XData', rotateBox(1,:), 'YData', rotateBox(2,:), ...
    'EdgeColor', color,'FaceColor','none','LineWidth',2);   
end
