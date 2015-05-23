bw2 = ~rgb2gray(imread('plates/8.png'));
th = 1;
YProj = sum(bw2,1);
XProj = sum(bw2,2); 

idyt = find(YProj < th);
idxt = find(XProj < th);

idy = []; idx = [];
th2 = 1;
for i=1:length(idyt)-1;
    if idyt(i+1)-idyt(i) > th2;
        idy(end+1) = idyt(i);
        idy(end+1) = idyt(i+1);
    end
end


for i=1:length(idxt)-1;
    if idxt(i+1)-idxt(i) > th2;
        idx(end+1) = idxt(i);
        idx(end+1) = idxt(i+1);
    end
    
end

figure, imshow(~bw2); hold on;

[X,Y] = meshgrid(idy,idx);
result = [X(:) Y(:)]';
plot(result(1,:),result(2,:),'r.');

