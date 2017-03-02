function newBox = checkBoxBound(box, imgW, imgH)
% box:[x, y, w, h]
% imgSize: [imgH, imgW]
% newBox: [x, y, w, h]

if isempty(box)
    newBox = [];
    return;
end

nBox = size(box, 1);
maxX = box(:, 1) + box(:, 3);
maxY = box(:, 2) + box(:, 4);
for i = 1:nBox
    box(i, 1) = max(box(i, 1), 1);
    box(i, 2) = max(box(i, 2), 1);
    box(i, 3) = min(maxX(i), imgW) - box(i, 1);
    box(i, 4) = min(maxY(i), imgH) - box(i, 2);
end
newBox = box;