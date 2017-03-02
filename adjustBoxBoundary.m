function newbox = adjustBoxBoundary( box, boundSize )
newbox = box;
if isempty(box)
    return;
end
newbox(:, 1) = max(1, newbox(:, 1) - boundSize );
newbox(:, 2) = max(1, newbox(:, 2) - boundSize );
newbox(:, 3) = newbox(:, 3) + 2* boundSize;
newbox(:, 4) = newbox(:, 4) + 2* boundSize;