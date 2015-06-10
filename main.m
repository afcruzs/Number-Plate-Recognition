img = imread('Placa1.jpg');
figure, imshow(img);
tic;
img = preprocessing(img);
figure, imshow(img);
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
      
      
      rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],'EdgeColor','g','LineWidth',2 )
      if length(charBounds) < 4; continue; end
      
      
      width = thisBB(4);
      height = thisBB(3);
      area = (width*height);
      ratio = area/areabig;
      %if abs(ratio-1) < 0.1 && length(st) > 1; continue; end %Evita evualuar toda la imagen
      % se supone que siemrpe esta el rectangulo de la placa recubriendo...
            
      plate = '';
      numbers = 0;
      %figure, imshow(potentialPlate);
      
      c = 1;
      for k = 1 : length(charBounds);
            
          charBB = charBounds(k).BoundingBox;
          rectangle('Position', [charBB(1),charBB(2),charBB(3),charBB(4)],'EdgeColor','b','LineWidth',2 )
          char = imcrop(potentialPlate,charBB);
          h2 = charBB(3); w2 = charBB(4);
          ratio = (h2*w2)/(area);
          delta = abs(ratio-0.08);
          
          if delta > 0.06;  continue;end;%Descarta las cosas pequenas que estorban
          if (w2 < h2 || w2/3 > h2 ); continue; end;
          
          %rectangle('Position', [charBB(1),charBB(2),charBB(3),charBB(4)],'EdgeColor','r','LineWidth',2 )
          
          %disp(strcat('pos : ',num2str(charBB(1))))
         if ( c>3 && c<=6);
              [flag,val] = recognize(char,'0':'9');
              disp('number')
         else
              [flag,val] = recognize(char,'A':'Z');
         end
          %[flag,val] = recognize(char,horzcat('0':'9','A':'Z'));
          %[flag,val] = recognize(char,horzcat('A':'Z', '0':'9'));
          %disp(strcat('val : ',num2str(val)))
          %figure, imshow(char)
          if val >= 0.5;                
              c = c + 1
              plate = strcat(plate,flag);
              if '0' <= flag && flag <= '9';
                  numbers = numbers + 1;
              end
              
          end
      end
    
      disp(arr);
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

