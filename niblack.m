function I= niblack(origin)
  %  origin = imread(name);%lectura de la imagen

    %gray_origin = rgb2gray(origin);%convertimos la imagen a escala de grises para poder realizar el algoritmo
    gray_origin = double(origin);%pasamos los datos a double para poder ser computada


    rows = size(origin,1);
    cols = size(origin,2);
    dim  = size(origin,3);
    x = 25;
    y = 25;
    k = 0.2;

    mean = imfilter(gray_origin,fspecial('average', [x,y]));%se calcula de avg teniendo en cuenta los vecinos de un cuadrante x,y
    desv = stdfilt(gray_origin, ones(3, 3));

    threshold = (mean +k.* desv);

    binary_image = threshold> gray_origin;
    %binary_image = imcomplement(binary_image);
    %figure(1)
    %imshow(origin)
    %title('Origin image');
    %figure(2)
    %imshow(gray_origin)
    %title('gray Image');
    %figure(3)
    %imshow(binary_image)
    %title('result by niblack');


    %figure; ax = zeros(3,1);
    %ax(1) = subplot(2,2,1); imshow(origin); title('original image');
    %ax(3) = subplot(2,2,2); imshow(binary_image); title('result by niblack');
    %ax(4) = subplot(2,2,3); imshow(imcomplement(binary_image)); title('result by niblack complement');
    I = imcomplement(binary_image);
end




