function C = rectA(box, theta, refPoint)
% box = [x, y, w, h] or [x1, x2, x3, x4; y1, y2, y3, y4]
% theta: radian
% refPoint = [refX, refY]
% default: refPoint = center
if ~nargin
    box = [256, 564, 1032, 104];
    theta = -0.680267;
  
%     box = [256, 1288, 1288, 256; 564, 564, 668, 668];
%     box = [370, 1173, 1107, 305; 239, 888, 969, 320];
    
end
if nargin < 3
    if size(box, 1) == 1
        refPoint(1) = box(1) + box(3) / 2;
        refPoint(2) = box(2) + box(4) / 2;
    else
        refPoint(1) = (box(1, 1) + box(1, 3)) / 2;
        refPoint(2) = (box(2, 1) + box(2, 3)) / 2;
    end
end
%theta = - theta; % reverse ?(image)
if size(box, 1) == 1
    X = [box(1), box(1) + box(3), box(1) + box(3), box(1)];
    Y = [box(2), box(2), box(2) + box(4), box(2) + box(4)];
else
    X = box(1, 1:4);
    Y = box(2, 1:4);
end
Z = [cos(theta), sin(theta); -sin(theta), cos(theta)];
C = Z * [X;Y];
C(1, :) = floor(C(1, :) + (1 - cos(theta)) * refPoint(1) - sin(theta) * refPoint(2));
C(2, :) = floor(C(2, :) + (1 - cos(theta)) * refPoint(2) + sin(theta) * refPoint(1));


patch('XData', X, 'YData', Y, ...
    'EdgeColor', 'm','FaceColor','none','LineWidth',2);
hold on;
plot(X, Y, 'yo');
patch('XData', C(1,:), 'YData', C(2,:), ...
    'EdgeColor', 'b','FaceColor','none','LineWidth',2);
axis equal;

end