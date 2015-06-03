img = imread('fake.png');
img = preprocessing(img);
sz = size(img);
height = sz(1);
width = sz(2);
%Division por regiones:
st = regionprops(img, 'BoundingBox' );
for i = 1 : length(st)
    
      thisBB = st(i).BoundingBox;
      potentialPlate = imcrop(img, thisBB); %Is one candidate to be a plate
      charBounds = segment_characters(potentialPlate);  
      if length(charBounds) < 4; continue; end
      for k = 1 : length(charBounds);
          
          charBB = charBounds(k).BoundingBox;
          char = imcrop(potentialPlate,charBB);
          sz = size(char); h = sz(1); w = sz(2);
          if (h*w)/(height*width) > 0.1274666; continue; end
          
          flag = recognize(char);
          if flag ~= -1;
                figure, imshow(char);
              disp(flag);
          end
          
      end
      
end