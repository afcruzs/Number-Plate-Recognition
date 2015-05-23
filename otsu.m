function img = otsu(imgname)
    %I = fix_ilumination(rgb2gray(imread(imgname))); %Se lee la imagen en escala de grises
    I = imgname;
    dim = size(I);
    height = dim(1); width = dim(2);
    histogram = imhist(I); %Se calcula el histograma de la imagen

    T = find_optimal_threshold(histogram,height*width); %Se calcula el Threshold con algoritmo de Otsu.
    img = im2bw(I,T); %Se calcula la imagen binaria 
end

