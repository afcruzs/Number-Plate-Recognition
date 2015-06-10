function I = preprocessing(img)
    
    I = imresize(img,[400 nan]);% Resizing the image keeping aspect ratio same.
    I = rgb2gray(I); %Lo pasa a blanco y negro
    
    %Esto funciona para cuando el color de las letras de las placas NO
    %Es negro, sin embargo genera ruido.
    %I = imsharpen(I,'Radius',2,'Amount',10); %Resalta los edges
    %I = medfilt2(I,[3 2]); %Limpia un poco de ruido
    
    I = fix_ilumination(I); %Ajusta la luz
    I = otsu(I);   %Thresholding con Otsu    
    %I=bwmorph(I,'thin',1); %Thining algoritm (Morphological transfrom)
    %I=imerode(I,strel('line',3,90)); %erode image (Morphological transfrom)
    %I = bwareaopen(I,100); %ignora componentes conectados < 100 pixeles para evitar ruido :)
    
end
