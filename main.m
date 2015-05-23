img = imread('BOSA-RSP.jpg');
img = preprocessing(img);
%Division por regiones:
st = regionprops(img, 'BoundingBox' );
for i = 1 : length(st)
      thisBB = st(i).BoundingBox;
      potentialPlate = imcrop(img, thisBB); %Is one candidate to be a plate
      charBounds = segment_characters(potentialPlate);  
      for k = 1 : length(charBounds);
          charBB = charBounds(k).BoundingBox;
          char = imcrop(potentialPlate,charBB);
          %characters = char_recognition(char);
           figure, imshow(char);
      end
      
end