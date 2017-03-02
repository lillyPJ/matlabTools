function displayBoxAndTag ( words,  color,  pos)

m = size(words,  1);
if m < 1
    return;
end
if nargin <2,
    color='g';
end
if nargin <3,
    pos='u';
end
box = {words.box};
tag = {words.tag};


for i=1:m
    rectangle('position', box{i}(1:4), 'edgecolor', color, 'linewidth', 2);
    
    switch(pos)
        case 'u'
            text(box{i}(1)+ box{i}(3)/2.0,  box{i}(2)-10,  tag{i},  'BackgroundColor', 'w', 'Color', 'm', 'FontWeight', 'demi');
        case 'm'
            text(box{i}(1)+box{i}(3)/2.0-10, box{i}(2)+box{i}(4)/2.0,  tag{i},  'BackgroundColor', 'w', 'Color', 'm', 'FontWeight', 'demi');
        case 'd'
            text(box{i}(1)+box{i}(3)-10,  box{i}(2)+box{i}(4)-10,  tag{i},  'BackgroundColor', 'w', 'Color', 'm', 'FontWeight', 'demi');
        otherwise
    end
end
end
