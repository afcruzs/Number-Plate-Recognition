img = rgb2gray(imread('plates/4.png'));
st = CCA(img);
figure, imshow(img); hold on;
for k = 1 : length(st)
  thisBB = st(k).BoundingBox;
  rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
  'EdgeColor','r','LineWidth',2 );
end


for k = 1 : length(st)
  thisBB = st(k).BoundingBox;
  subImage = imcrop(img, thisBB);
  figure, imshow(subImage);
end

hold off;
