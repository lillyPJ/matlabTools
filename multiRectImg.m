function newImg=multiRectImg(im,box,linewidth,color)
% box=[x y w h];
        % aa---------------bb
        %  |                |
        %  |                |
        %  |                |
        %  cc--------------dd
        
% if ~nargin
%     im=imread('Set9/Butterfly.jpg');
%     box=[32 45 32 55;56 43 67 56];
%     linewidth=2;
%     color='r';
% end
if nargin<2
    disp('Error in multiRectImg.m');
else
    if nargin<4
        color='r';
    end
    if nargin<3
        linewidth=2;
    end    
end


switch color
    case 'r'
        colorvector=[1 0 0];
    case 'g'
        colorvector=[0 1 0];
    case 'b'
        colorvector=[0 0 1];
    case 'w'
        colorvector=[1 1 1];
    case 'k'
        colorvector=[0 0 0];
    case 'y'
        colorvector=[1 1 0];
    case 'm'
        colorvector=[1 0 1];
    case 'c'
        colorvector=[0 1 1];
    otherwise
        colorvector=[1 0 0];
end
colorvector=colorvector*255;    
[height, width] = size(im);
[m n]=size(box);
for i=1:m
    x = box(i,1);
    y = box(i,2);
    w = box(i,3);
    h = box(i,4);

    line=ceil(linewidth/2);
    aa = [max(y,1),max(x,1)];
    bb = [max(y,1), min(x+w, width)];
    cc = [min(y+h, height), max(x,1)];
    dd = [min(y+h, height), min(x+w, width)];
    
    im( max(1,aa(1)-line): min(height,cc(1)+line), max(1,aa(2)-line): min(width,aa(2)+line), 1)  =  colorvector(1);
    im( max(1,aa(1)-line): min(height,cc(1)+line), max(1,aa(2)-line): min(width,aa(2)+line), 2)  =  colorvector(2);
    im( max(1,aa(1)-line): min(height,cc(1)+line), max(1,aa(2)-line): min(width,aa(2)+line), 3)  =  colorvector(3);
    im( max(1,bb(1)-line): min(height,dd(1)+line), max(1,bb(2)-line): min(width,bb(2)+line), 1)  =  colorvector(1);
    im( max(1,bb(1)-line): min(height,dd(1)+line), max(1,bb(2)-line): min(width,bb(2)+line), 2)  =  colorvector(2);
    im( max(1,bb(1)-line): min(height,dd(1)+line), max(1,bb(2)-line): min(width,bb(2)+line), 3)  =  colorvector(3);
    im( max(1,aa(1)-line): min(height,aa(1)+line), max(1,aa(2)-line): min(width,bb(2)+line), 1)  =  colorvector(1);
    im( max(1,aa(1)-line): min(height,aa(1)+line), max(1,aa(2)-line): min(width,bb(2)+line), 2)  =  colorvector(2);
    im( max(1,aa(1)-line): min(height,aa(1)+line), max(1,aa(2)-line): min(width,bb(2)+line), 3)  =  colorvector(3);
    im( max(1,cc(1)-line): min(height,cc(1)+line), max(1,cc(2)-line): min(width,dd(2)+line), 1)  =  colorvector(1);
    im( max(1,cc(1)-line): min(height,cc(1)+line), max(1,cc(2)-line): min(width,dd(2)+line), 2)  =  colorvector(2);
    im( max(1,cc(1)-line): min(height,cc(1)+line), max(1,cc(2)-line): min(width,dd(2)+line), 3)  =  colorvector(3);
end   
%imshow(im);
newImg=im;
end