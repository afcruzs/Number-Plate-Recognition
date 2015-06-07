
nameImage = '3.png';

img = imread(nameImage);
row = 60;
col = 40;
dx = 3;

image = preprocessing(img,row,col);
figure, imshow(image);


letter = '0';
max = -1;

for i='A':'Z';
    name = strcat('temp',i,'.png');
    template = imread(name);
    template = preprocessing(template,row,col);
    mx = TemplateMatching(image,template,dx); 
    if (mx > max);
        max = mx;
        letter = i;
        %figure, imshow(template);
    end
end
    disp('porcentaje de correlación :')
    disp(max);
    disp('caracter reconocido : ');
    disp(letter)
