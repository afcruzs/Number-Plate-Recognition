
nameImage = 'tempZ1.png';

img = imread(nameImage);
row = 60;
col = 40;
dx = 3;

image = preprocessing(img);
figure, imshow(image);
recognize(image,'0':'9')
