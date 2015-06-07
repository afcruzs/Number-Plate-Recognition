
nameImage = 'num23.png';

img = imread(nameImage);
row = 50;
col = 50;
dx = 3;

image = preprocessing(img,row,col);
figure, imshow(image);


letter = 'A';
max = -1;

for i='0':'9';
    name = strcat('num',i,'1.png');
    template = imread(name);
    template = preprocessing(template,row,col);
    mx = TemplateMatching(image,template,dx); 
    if (mx > max);
        max = mx;
        letter = i;
        figure, imshow(template);
    end
end
    disp(max);
    disp(letter);
