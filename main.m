img = imread('fake.png');
img = preprocessing(img);

%Division por regiones:
st = regionprops(img, 'BoundingBox' );

sz = size(img);
h = sz(1);
w = sz(2);
areabig = h*w;


for i = 1 : length(st)
       
      thisBB = st(i).BoundingBox;
      
      potentialPlate = imcrop(img, thisBB); %Is one candidate to be a plate
      charBounds = segment_characters(potentialPlate);  
      
      if length(charBounds) < 4; continue; end
      
      
      width = thisBB(4);
      height = thisBB(3);
      area = abs(width*height);
      ratio = area/areabig;
      if abs(ratio-1) < 0.1 && length(st) > 1; continue; end %Evita evualuar toda la imagen
      % se supone que siemrpe esta el rectangulo de la placa recubriendo...
      
      
      %figure, imshow(potentialPlate); hold on;
      i
      for k = 1 : length(charBounds);
            
          charBB = charBounds(k).BoundingBox;
          char = imcrop(potentialPlate,charBB);
          sz = size(char); h2 = sz(1); w2 = sz(2);
          if (h2*w2)/(h*w) > 0.1274666; continue; end
          if w2 > h2; continue; end
          %rectangle('Position', [charBB(1),charBB(2),charBB(3),charBB(4)],'EdgeColor','r','LineWidth',2 )
          figure, imshow(char);
          
          
          [flag,val] = recognize(char,horzcat('A':'Z','0':'9'));
          
          if flag ~= -1;              
              disp(flag);
          end
          
          
      end
      
end