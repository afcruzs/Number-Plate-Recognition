
nameImage = 'CapturaC1.png';

img = imread(nameImage);
row = 50;
col = 50;


image = preprocessing(img,row,col);
figure, imshow(image);
max = -1;
letter = 'A';

for i='A':'Z';
    name = strcat('temp',i,'.png');
    template = imresize( rgb2gray(imread(name)), [row col] );
    mx = TemplateMatching(image,template); 
    if (mx > max);
        max = mx;
        letter = i;
        figure, imshow(template);
    end
end
    disp(max);
    disp(letter);
