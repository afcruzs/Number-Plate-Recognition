img = imread('Placa6.jpg');
%imshow(img);
tic;
img = preprocessing(img);

%Division por regiones:
st = regionprops(img, 'BoundingBox' );

sz = size(img);
h = sz(1);
w = sz(2);
areabig = h*w;
plate = '';

for i = 1 : length(st);
       
      thisBB = st(i).BoundingBox;
      
      potentialPlate = imcrop(img, thisBB); %Is one candidate to be a plate
      charBounds = segment_characters(potentialPlate);  
      
      if length(charBounds) < 4; continue; end
      
      
      width = thisBB(4);
      height = thisBB(3);
      area = (width*height);
      ratio = area/areabig;
      if abs(ratio-1) < 0.1 && length(st) > 1; continue; end %Evita evualuar toda la imagen
      % se supone que siemrpe esta el rectangulo de la placa recubriendo...
            
      plate = '';
      numbers = 0;
      figure, imshow(potentialPlate);
      for k = 1 : length(charBounds);
            
          charBB = charBounds(k).BoundingBox;
          rectangle('Position', [charBB(1),charBB(2),charBB(3),charBB(4)],'EdgeColor','b','LineWidth',2 )
          char = imcrop(potentialPlate,charBB);
          h2 = charBB(3); w2 = charBB(4);
          ratio = (h2*w2)/(area);
          delta = abs(ratio-0.08);
          if delta > 0.05;  continue; end %Descarta las cosas pequenas que estorban
          
          
          rectangle('Position', [charBB(1),charBB(2),charBB(3),charBB(4)],'EdgeColor','r','LineWidth',2 )
          [flag,val] = recognize(char,horzcat('A':'Z','0':'9'));
          
          if val >= 0.6; 
              plate = strcat(plate,flag);
              if '0' <= flag && flag <= '9';
                  numbers = numbers + 1;
              end
              
          end
      end
    
      disp(plate);
      if length(plate) == 6 && numbers == 3; 
          break;
      end
end

toc
if length(plate) ~= 6;
    disp('No es una placa valida j3j3j3j3j3');
else
    disp(strcat('La puta placa es: ',plate));
end

