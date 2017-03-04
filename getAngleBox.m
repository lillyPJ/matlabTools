function [angleBox, anglePoly] = getAngleBox(poly)
% input: bb-[x1, x2, x3, x4; y1, y2, y3, y4]
% output: angleBox-[x, y, w, h, angle]
% output: angleBB-[x1, x2, x3, x4; y1, y2, y3, y4] of angleBox
% theta = the angle from box to poly, 
% theta > 0 = clockwise, < 0 = anti


% find the longest side
diffs = diff(poly'); % x2-x1, y2-y1; x3-x2, y3-y2; x4-x3, y4-y3;
dis12 = norm(diffs(1, :));
dis23 = norm(diffs(2, :));
if dis12 > dis23
    % p1-p2: longer side
    lp1 = poly(:, 1);
    lp2 = poly(:, 2);
else
    % p2-p3: longer side
    lp1 = poly(:, 2);
    lp2 = poly(:, 3);
end
% plot(lp1(1), lp1(2), 'ro');
% plot(lp2(1), lp2(2), 'bo');

% calculate the tanValue
tagValue = (lp2(2) - lp1(2))/(lp2(1) - lp1(1));
theta = atan(abs(tagValue));
% decide rotate to horizontal or vertical
tanAngleThre = 45 / 180 * pi; % 75
if abs(tagValue) < abs(tan(tanAngleThre)) % rotate to horizontal
    % clockwise
    if tagValue < 0
        theta = -theta;
    end
else % rotate to vertical 
    theta = pi/2 - theta;
    if tagValue > 0
        theta = -theta;
    end
end
% rotate the poly
anglePoly = rotateBoxPoly(poly, -theta);
xmin = min(anglePoly(1,:));
xmax = max(anglePoly(1,:));
ymin = min(anglePoly(2,:));
ymax = max(anglePoly(2,:));
width = xmax - xmin + 1;
height = ymax - ymin + 1;
angleBox = [xmin, ymin, width, height, theta];
 