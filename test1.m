%img = imread('P1010006.jpg');
function show_regions(img)
    img = preprocessing(img);
    st = regionprops(img, 'BoundingBox' );
    imshow(img); hold on;
    for k = 1 : length(st)
      thisBB = st(k).BoundingBox;
      rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
      'EdgeColor','r','LineWidth',2 )
    end
    hold off;
end